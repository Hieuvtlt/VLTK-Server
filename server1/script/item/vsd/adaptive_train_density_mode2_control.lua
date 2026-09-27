IncludeLib("FILESYS")
IncludeLib("NPCINFO")

-- V5.24 - MODE 2: FIXED WHOLE-MAP DENSITY + ENGINE RESPAWN, with source-grounded discovery fixes.
-- V5.24 keeps Mode2 semantics unchanged (fixed deficit, no module refill, no_revive=0) and only repairs
-- discovery/owner safety: raw+trimmed catalog names, exact runtime names from active player views,
-- NPC-index reuse guarded by GetNpcId, and owner context verified on every temporary builder tick.
--
-- Day la mode doc lap voi Mode 1.
-- Mode 1: quet/can bang dong theo timer quanh vung co player.
-- Mode 2: quet TOAN MAP dung MOT LAN khi bat, tinh bai, tao so quai bu co dinh,
--         sau do KHONG co timer refill/can bang. Quai bu duoc AddNpcEx voi no_revive=0
--         de engine quan ly hoi sinh.
--
-- Co so source dung server:
--   * GetMapNpcWithName(mapId, name): source findboss/shenxingfu dung de lay NPC tren toan map.
--   * TabFile_Load/GetCell: source dung truc tiep de doc cac file settings dang tab.
--   * settings/npcs.txt co cot ReviveFrame.
--   * fightnpc_list.lua + dragonboat/npc.lua ghi ro AddNpcEx param 7 = no_revive,
--     gia tri 1 = "khong hoi sinh". Mode 2 dung 0.
--   * GetNpcPowerType == 1: npcfunlib.lua dung de nhan quai thuong.
--
-- GIOI HAN BANG CHUNG:
-- Source Lua khong mo ta noi bo engine noi no_revive=0 voi ReviveFrame nhu the nao.
-- Mode 2 KHONG tu dat 45/60 giay va KHONG co timer respawn rieng; no dung cung NPC setting,
-- no_revive=0 va hien thi ReviveFrame cua template de kiem chung runtime tren GameServer.

VSD_TRAIN2_NPC_FILE = "\\settings\\npcs.txt"
VSD_TRAIN2_TAB_KEY = "VSD_TRAIN_MODE2_NPCS_V524"
VSD_TRAIN2_CLUSTER_RADIUS = 20
VSD_TRAIN2_MIN_NATURAL = 3
VSD_TRAIN2_TARGET_MIN = 8
VSD_TRAIN2_TARGET_MAX = 10
VSD_TRAIN2_SPAWN_OFFSET = 5
VSD_TRAIN2_MAX_SPOTS_PER_MAP = 128
VSD_TRAIN2_MAX_EXTRA_PER_SPOT = 50
VSD_TRAIN2_CONFIG_TARGET_MIN = 3
VSD_TRAIN2_CONFIG_TARGET_MAX = 50
VSD_TRAIN2_MAX_TOTAL_EXTRA = 512
VSD_TRAIN2_ADD_TRY_FACTOR = 5
VSD_TRAIN2_FRAMES_PER_SECOND = 18
VSD_TRAIN2_BUILD_INTERVAL = 1 * 18
VSD_TRAIN2_NAMES_PER_TICK = 40
VSD_TRAIN2_SPOTS_PER_TICK = 8
VSD_TRAIN2_RUNTIME_SCAN_RADIUS = 60

-- Runtime only. Mode 2 khong dung Task/login va khong tu chay sang map khac.
g_tbVSDTrain2MapManager = g_tbVSDTrain2MapManager or {}
g_tbVSDTrain2OwnerMap = g_tbVSDTrain2OwnerMap or {}
g_tbVSDTrain2Generated = g_tbVSDTrain2Generated or {}
g_nVSDTrain2ManagerSeed = g_nVSDTrain2ManagerSeed or 0
g_nVSDTrain2SpotSeed = g_nVSDTrain2SpotSeed or 0
g_nVSDTrain2TrackedExtra = g_nVSDTrain2TrackedExtra or 0
g_szVSDTrain2LastError = g_szVSDTrain2LastError or ""
g_tbVSDTrain2UserConfig = g_tbVSDTrain2UserConfig or {}

function VSDTrain2_Log(szMsg)
    if WriteLog then
        WriteLog("VSD_TRAIN_MODE2: "..szMsg)
    elseif print then
        print("VSD_TRAIN_MODE2: "..szMsg)
    end
end

function VSDTrain2_SetError(szMsg)
    g_szVSDTrain2LastError = szMsg or ""
    if g_szVSDTrain2LastError ~= "" then
        VSDTrain2_Log("ERROR "..g_szVSDTrain2LastError)
    end
end

function VSDTrain2_Distance2(x1, y1, x2, y2)
    local dx = x1 - x2
    local dy = y1 - y2
    return dx * dx + dy * dy
end

function VSDTrain2_GetOwnerKey()
    return GetAccount().."|"..GetName()
end

function VSDTrain2_ClampTarget(nValue, nDefault)
    local n = tonumber(nValue)
    if n == nil then n = nDefault end
    n = floor(n)
    if n < VSD_TRAIN2_CONFIG_TARGET_MIN then n = VSD_TRAIN2_CONFIG_TARGET_MIN end
    if n > VSD_TRAIN2_CONFIG_TARGET_MAX then n = VSD_TRAIN2_CONFIG_TARGET_MAX end
    return n
end

function VSDTrain2_DefaultConfig()
    return {
        nTargetMin = VSD_TRAIN2_TARGET_MIN,
        nTargetMax = VSD_TRAIN2_TARGET_MAX,
    }
end

function VSDTrain2_NormalizeConfig(c)
    if not c then c = VSDTrain2_DefaultConfig() end
    c.nTargetMin = VSDTrain2_ClampTarget(c.nTargetMin, VSD_TRAIN2_TARGET_MIN)
    c.nTargetMax = VSDTrain2_ClampTarget(c.nTargetMax, VSD_TRAIN2_TARGET_MAX)
    if c.nTargetMin > c.nTargetMax then c.nTargetMax = c.nTargetMin end
    return c
end

function VSDTrain2_GetOwnerConfig()
    if not PlayerIndex or PlayerIndex <= 0 then return nil end
    local szKey = VSDTrain2_GetOwnerKey()
    local c = g_tbVSDTrain2UserConfig[szKey]
    if not c then
        c = VSDTrain2_DefaultConfig()
        g_tbVSDTrain2UserConfig[szKey] = c
    end
    return VSDTrain2_NormalizeConfig(c)
end

function VSDTrain2_SetTargetMin(nValue)
    local c = VSDTrain2_GetOwnerConfig()
    if not c then return nil, nil end
    c.nTargetMin = VSDTrain2_ClampTarget(nValue, c.nTargetMin)
    if c.nTargetMin > c.nTargetMax then c.nTargetMax = c.nTargetMin end
    return c.nTargetMin, c.nTargetMax
end

function VSDTrain2_SetTargetMax(nValue)
    local c = VSDTrain2_GetOwnerConfig()
    if not c then return nil, nil end
    c.nTargetMax = VSDTrain2_ClampTarget(nValue, c.nTargetMax)
    if c.nTargetMax < c.nTargetMin then c.nTargetMin = c.nTargetMax end
    return c.nTargetMin, c.nTargetMax
end

function VSDTrain2_ResetOwnerConfig()
    if not PlayerIndex or PlayerIndex <= 0 then return nil end
    local szKey = VSDTrain2_GetOwnerKey()
    local c = VSDTrain2_DefaultConfig()
    g_tbVSDTrain2UserConfig[szKey] = c
    return c
end

function VSDTrain2_NewManagerId()
    g_nVSDTrain2ManagerSeed = g_nVSDTrain2ManagerSeed + 1
    return g_nVSDTrain2ManagerSeed
end

function VSDTrain2_NewSpotId()
    g_nVSDTrain2SpotSeed = g_nVSDTrain2SpotSeed + 1
    return g_nVSDTrain2SpotSeed
end

function VSDTrain2_CheckApi()
    local tbNeed = {
        {"TabFile_Load", TabFile_Load},
        {"TabFile_GetRowCount", TabFile_GetRowCount},
        {"TabFile_GetCell", TabFile_GetCell},
        {"TabFile_UnLoad", TabFile_UnLoad},
        {"GetMapNpcWithName", GetMapNpcWithName},
        {"GetMapPlayerList", GetMapPlayerList},
        {"GetAroundNpcList", GetAroundNpcList},
        {"GetNpcSettingIdx", GetNpcSettingIdx},
        {"GetNpcKind", GetNpcKind},
        {"GetNpcPowerType", GetNpcPowerType},
        {"GetNpcParam", GetNpcParam},
        {"GetNpcPos", GetNpcPos},
        {"NPCINFO_GetLevel", NPCINFO_GetLevel},
        {"GetNpcSeries", GetNpcSeries},
        {"GetNpcName", GetNpcName},
        {"GetNpcId", GetNpcId},
        {"NpcIdx2PIdx", NpcIdx2PIdx},
        {"GetWorldPos", GetWorldPos},
        {"SubWorldID2Idx", SubWorldID2Idx},
        {"GetAccount", GetAccount},
        {"GetName", GetName},
        {"SearchPlayer", SearchPlayer},
        {"AddNpcEx", AddNpcEx},
        {"DelNpc", DelNpc},
        {"AddTimer", AddTimer},
        {"DelTimer", DelTimer},
    }
    local i
    for i = 1, getn(tbNeed) do
        if tbNeed[i][2] == nil then
            return 0, tbNeed[i][1]
        end
    end
    return 1, ""
end

function VSDTrain2_IsMode1Generated(nNpcIndex)
    if not g_tbVSDTrainGenerated then return 0 end
    local r = g_tbVSDTrainGenerated[nNpcIndex]
    if not r then return 0 end
    local dwNow = GetNpcId(nNpcIndex)
    if dwNow and dwNow > 0 and dwNow == r.dwNpcId then return 1 end
    return 0
end

function VSDTrain2_IsGenerated(nNpcIndex)
    local r = g_tbVSDTrain2Generated[nNpcIndex]
    if not r then return 0 end
    local dwNow = GetNpcId(nNpcIndex)
    if dwNow and dwNow > 0 and dwNow == r.dwNpcId then return 1 end
    return 0
end

function VSDTrain2_IsMode3Generated(nNpcIndex)
    if not g_tbVSDTrain3Generated then return 0 end
    local r = g_tbVSDTrain3Generated[nNpcIndex]
    if not r then return 0 end
    local dwNow = GetNpcId(nNpcIndex)
    if dwNow and dwNow > 0 and dwNow == r.dwNpcId then return 1 end
    return 0
end

function VSDTrain2_TrimAsciiSpace(szName)
    if not szName then return "" end
    local sz = gsub(szName, "^ +", "")
    sz = gsub(sz, " +$", "")
    return sz
end

function VSDTrain2_AddQueryName(tbNames, tbSeen, szName)
    if not szName or szName == "" then return 0 end
    if tbSeen[szName] then return 0 end
    tbSeen[szName] = 1
    tinsert(tbNames, szName)
    return 1
end

function VSDTrain2_LoadCatalogSnapshot()
    if TabFile_Load(VSD_TRAIN2_NPC_FILE, VSD_TRAIN2_TAB_KEY) == 0 then
        VSDTrain2_SetError("TabFile_Load fail: "..VSD_TRAIN2_NPC_FILE)
        return nil
    end

    local nRows = TabFile_GetRowCount(VSD_TRAIN2_TAB_KEY)
    if not nRows or nRows < 2 then
        TabFile_UnLoad(VSD_TRAIN2_TAB_KEY)
        VSDTrain2_SetError("npcs.txt row count invalid")
        return nil
    end

    local tbNames = {}
    local tbSeenQuery = {}
    local tbSeenRaw = {}
    local tbMeta = {}
    local nEligibleRows = 0
    local nRawUniqueNames = 0
    local nTrimAliasNames = 0
    local nTrimmedRows = 0
    local nRow
    for nRow = 2, nRows do
        local nSettingIdx = nRow - 1
        local nKind = tonumber(TabFile_GetCell(VSD_TRAIN2_TAB_KEY, nRow, "Kind")) or -1
        local nReviveFrame = tonumber(TabFile_GetCell(VSD_TRAIN2_TAB_KEY, nRow, "ReviveFrame")) or 0
        local szName = TabFile_GetCell(VSD_TRAIN2_TAB_KEY, nRow, "Name")
        if nKind == 0 and nReviveFrame > 0 and szName and szName ~= "" then
            nEligibleRows = nEligibleRows + 1
            tbMeta[nSettingIdx] = {
                nKind = nKind,
                nReviveFrame = nReviveFrame,
                szSettingName = szName,
            }
            if not tbSeenRaw[szName] then
                tbSeenRaw[szName] = 1
                nRawUniqueNames = nRawUniqueNames + 1
            end
            VSDTrain2_AddQueryName(tbNames, tbSeenQuery, szName)
            local szTrim = VSDTrain2_TrimAsciiSpace(szName)
            if szTrim ~= szName then nTrimmedRows = nTrimmedRows + 1 end
            if szTrim ~= "" and szTrim ~= szName then
                nTrimAliasNames = nTrimAliasNames + VSDTrain2_AddQueryName(tbNames, tbSeenQuery, szTrim)
            end
        end
    end

    TabFile_UnLoad(VSD_TRAIN2_TAB_KEY)
    return {
        tbNames = tbNames,
        tbNameSeen = tbSeenQuery,
        tbMeta = tbMeta,
        nEligibleRows = nEligibleRows,
        nRawUniqueNames = nRawUniqueNames,
        nTrimAliasNames = nTrimAliasNames,
        nTrimmedRows = nTrimmedRows,
    }
end

function VSDTrain2_NewScanStats(tbCatalog)
    return {
        nCatalogRows = tbCatalog.nEligibleRows or 0,
        nRawUniqueNames = tbCatalog.nRawUniqueNames or 0,
        nTrimAliasNames = tbCatalog.nTrimAliasNames or 0,
        nTrimmedRows = tbCatalog.nTrimmedRows or 0,
        nUniqueNames = getn(tbCatalog.tbNames or {}),
        nNameQueries = 0,
        nRawIndexes = 0,
        nUniqueIndexes = 0,
        nKind0 = 0,
        nPower1 = 0,
        nReviveOk = 0,
        nSimLike = 0,
        nModeGeneratedSkipped = 0,
        nRuntimePlayers = 0,
        nRuntimeRaw = 0,
        nRuntimeNaturalAdded = 0,
        nRuntimeNamesAdded = 0,
        nIndexReuseSeen = 0,
    }
end

function VSDTrain2_AddRuntimeQueryName(tbManager, szName)
    if not szName or szName == "" then return 0 end
    local nAdded = VSDTrain2_AddQueryName(tbManager.tbCatalogNames, tbManager.tbCatalogNameSeen, szName)
    local szTrim = VSDTrain2_TrimAsciiSpace(szName)
    if szTrim ~= "" and szTrim ~= szName then
        nAdded = nAdded + VSDTrain2_AddQueryName(tbManager.tbCatalogNames, tbManager.tbCatalogNameSeen, szTrim)
    end
    if nAdded > 0 then
        tbManager.tbScanStats.nRuntimeNamesAdded = tbManager.tbScanStats.nRuntimeNamesAdded + nAdded
        tbManager.tbScanStats.nUniqueNames = getn(tbManager.tbCatalogNames)
    end
    return nAdded
end

-- One concrete NPC classifier shared by exact-name queries and runtime player-view discovery.
-- tbNpcSeen stores the real GetNpcId, not a boolean: if the engine reuses an NPC index while the
-- multi-tick build is running, a new instance at the same index is still evaluated safely.
function VSDTrain2_TryCollectIndex(tbManager, idx, bRuntime)
    if not idx or idx <= 0 then return 0 end
    local st = tbManager.tbScanStats
    local dwNpcId = GetNpcId(idx)
    if not dwNpcId or dwNpcId <= 0 then return 0 end
    local dwSeen = tbManager.tbNpcSeen[idx]
    if dwSeen and dwSeen == dwNpcId then return 0 end
    if dwSeen and dwSeen ~= dwNpcId then
        st.nIndexReuseSeen = st.nIndexReuseSeen + 1
        local nOldSlot = tbManager.tbNaturalSlot[idx]
        if nOldSlot and tbManager.tbNatural[nOldSlot] then tbManager.tbNatural[nOldSlot].bInvalid = 1 end
        tbManager.tbNaturalSlot[idx] = nil
    end
    tbManager.tbNpcSeen[idx] = dwNpcId
    st.nUniqueIndexes = st.nUniqueIndexes + 1

    if VSDTrain2_IsMode1Generated(idx) == 1 or VSDTrain2_IsGenerated(idx) == 1 or VSDTrain2_IsMode3Generated(idx) == 1 then
        st.nModeGeneratedSkipped = st.nModeGeneratedSkipped + 1
        return 0
    end

    local nPlayer = NpcIdx2PIdx(idx)
    if nPlayer and nPlayer > 0 then return 0 end
    local nSettingIdx = GetNpcSettingIdx(idx)
    local nKind = GetNpcKind(idx)
    if not nSettingIdx or nSettingIdx <= 0 or nKind ~= 0 then return 0 end
    st.nKind0 = st.nKind0 + 1

    local nPower = GetNpcPowerType(idx)
    if nPower ~= 1 then return 0 end
    st.nPower1 = st.nPower1 + 1

    local nParam4 = GetNpcParam(idx, 4) or 0
    if nParam4 == 1 or nParam4 == 2 then
        st.nSimLike = st.nSimLike + 1
        return 0
    end

    local meta = tbManager.tbCatalogMeta[nSettingIdx]
    if not meta or meta.nKind ~= 0 or meta.nReviveFrame <= 0 then return 0 end
    local x32, y32 = GetNpcPos(idx)
    local nLevel = NPCINFO_GetLevel(idx)
    local nSeries = GetNpcSeries(idx)
    local szName = GetNpcName(idx)
    if not x32 or not y32 or not nLevel or nLevel <= 0 or nSeries == nil or not szName then return 0 end

    st.nReviveOk = st.nReviveOk + 1
    tinsert(tbManager.tbNatural, {
        nIndex = idx,
        dwNpcId = dwNpcId,
        nX = floor(x32 / 32),
        nY = floor(y32 / 32),
        nSettingIdx = nSettingIdx,
        nLevel = nLevel,
        nSeries = nSeries,
        szName = szName,
        nReviveFrame = meta.nReviveFrame,
        bInvalid = 0,
    })
    tbManager.tbNaturalSlot[idx] = getn(tbManager.tbNatural)
    if bRuntime == 1 then
        st.nRuntimeNaturalAdded = st.nRuntimeNaturalAdded + 1
        VSDTrain2_AddRuntimeQueryName(tbManager, szName)
    end
    return 1
end

-- Process ONE catalog/runtime name. Queries stay bounded by VSD_TRAIN2_NAMES_PER_TICK.
function VSDTrain2_ProcessCatalogName(tbManager, szFindName)
    local st = tbManager.tbScanStats
    st.nNameQueries = st.nNameQueries + 1
    local tbNpc = GetMapNpcWithName(tbManager.nWorld, szFindName)
    if type(tbNpc) ~= "table" then return 0 end

    local nAdded = 0
    local j
    for j = 1, getn(tbNpc) do
        local idx = tbNpc[j]
        if idx and idx > 0 then
            st.nRawIndexes = st.nRawIndexes + 1
            nAdded = nAdded + VSDTrain2_TryCollectIndex(tbManager, idx, 0)
        end
    end
    return nAdded
end

-- Exact Mode1-style source pattern: enumerate real players on the active map, inspect radius60 around
-- each player, directly merge eligible natural monsters, and add their exact runtime GetNpcName strings
-- to the later whole-map name-query list. This is a fallback for legacy name spacing/normalization only;
-- it does not spawn anything and does not turn Mode2 into a refill timer mode.
function VSDTrain2_DiscoverRuntimeNames(tbManager)
    local nOldPlayer = PlayerIndex
    local tbPlayers = GetMapPlayerList(-1, 1)
    if type(tbPlayers) ~= "table" then tbPlayers = {} end
    local nAdded = 0
    local i, j
    for i = 1, getn(tbPlayers) do
        local nP = tbPlayers[i]
        if nP and nP > 0 then
            PlayerIndex = nP
            local pW = GetWorldPos()
            if pW == tbManager.nWorld then
                tbManager.tbScanStats.nRuntimePlayers = tbManager.tbScanStats.nRuntimePlayers + 1
                local tbNpc = GetAroundNpcList(VSD_TRAIN2_RUNTIME_SCAN_RADIUS)
                if type(tbNpc) ~= "table" then tbNpc = {} end
                for j = 1, getn(tbNpc) do
                    tbManager.tbScanStats.nRuntimeRaw = tbManager.tbScanStats.nRuntimeRaw + 1
                    nAdded = nAdded + VSDTrain2_TryCollectIndex(tbManager, tbNpc[j], 1)
                end
            end
        end
    end
    PlayerIndex = nOldPlayer
    tbManager.tbScanStats.nUniqueNames = getn(tbManager.tbCatalogNames or {})
    return nAdded
end

function VSDTrain2_FindBestUnusedMembers(tbNatural, tbUsed)
    local nRadius2 = VSD_TRAIN2_CLUSTER_RADIUS * VSD_TRAIN2_CLUSTER_RADIUS
    local nBestCount = 0
    local tbBest = nil
    local i, j
    for i = 1, getn(tbNatural) do
        local seed = tbNatural[i]
        if seed and seed.bInvalid ~= 1 and not tbUsed[seed.nIndex] then
            local tbMembers = {}
            for j = 1, getn(tbNatural) do
                local n = tbNatural[j]
                if n and n.bInvalid ~= 1 and not tbUsed[n.nIndex] then
                    if VSDTrain2_Distance2(seed.nX, seed.nY, n.nX, n.nY) <= nRadius2 then
                        tinsert(tbMembers, n)
                    end
                end
            end
            if getn(tbMembers) >= VSD_TRAIN2_MIN_NATURAL and getn(tbMembers) > nBestCount then
                nBestCount = getn(tbMembers)
                tbBest = tbMembers
            end
        end
    end
    return tbBest
end

function VSDTrain2_MakeCandidate(tbMembers)
    if not tbMembers or getn(tbMembers) < VSD_TRAIN2_MIN_NATURAL then return nil end
    local nSumX = 0
    local nSumY = 0
    local i
    for i = 1, getn(tbMembers) do
        nSumX = nSumX + tbMembers[i].nX
        nSumY = nSumY + tbMembers[i].nY
    end
    return {
        nX = floor(nSumX / getn(tbMembers)),
        nY = floor(nSumY / getn(tbMembers)),
        nNatural = getn(tbMembers),
        tbSamples = tbMembers,
    }
end

function VSDTrain2_BuildCandidates(tbNatural)
    local tbCandidates = {}
    local tbUsed = {}
    local nGuard = 0
    while nGuard < VSD_TRAIN2_MAX_SPOTS_PER_MAP * 2 do
        nGuard = nGuard + 1
        local tbMembers = VSDTrain2_FindBestUnusedMembers(tbNatural, tbUsed)
        if not tbMembers then break end
        local i
        for i = 1, getn(tbMembers) do tbUsed[tbMembers[i].nIndex] = 1 end
        local c = VSDTrain2_MakeCandidate(tbMembers)
        if c then
            tinsert(tbCandidates, c)
            if getn(tbCandidates) >= VSD_TRAIN2_MAX_SPOTS_PER_MAP then break end
        end
    end
    return tbCandidates
end

function VSDTrain2_NewSpot(tbManager, tbCandidate)
    local nTarget = random(tbManager.nTargetMin or VSD_TRAIN2_TARGET_MIN, tbManager.nTargetMax or VSD_TRAIN2_TARGET_MAX)
    local nNeed = nTarget - tbCandidate.nNatural
    if nNeed < 0 then nNeed = 0 end
    if nNeed > VSD_TRAIN2_MAX_EXTRA_PER_SPOT then nNeed = VSD_TRAIN2_MAX_EXTRA_PER_SPOT end
    return {
        nSpotId = VSDTrain2_NewSpotId(),
        nX = tbCandidate.nX,
        nY = tbCandidate.nY,
        nNaturalAtOpen = tbCandidate.nNatural,
        nTarget = nTarget,
        nNeed = nNeed,
        tbSamples = tbCandidate.tbSamples,
        tbGenerated = {},
        nCreated = 0,
        nAddFail = 0,
        nReviveMinFrame = 0,
        nReviveMaxFrame = 0,
    }
end

function VSDTrain2_RegisterGenerated(tbManager, tbSpot, nNpcIndex, dwNpcId, nReviveFrame)
    local e = {
        nIndex = nNpcIndex,
        dwNpcId = dwNpcId,
        nReviveFrame = nReviveFrame or 0,
    }
    tinsert(tbSpot.tbGenerated, e)
    g_tbVSDTrain2Generated[nNpcIndex] = {
        dwNpcId = dwNpcId,
        nWorld = tbManager.nWorld,
        nManagerId = tbManager.nManagerId,
        nSpotId = tbSpot.nSpotId,
        nReviveFrame = nReviveFrame or 0,
    }
    g_nVSDTrain2TrackedExtra = g_nVSDTrain2TrackedExtra + 1

    if nReviveFrame and nReviveFrame > 0 then
        if tbSpot.nReviveMinFrame <= 0 or nReviveFrame < tbSpot.nReviveMinFrame then
            tbSpot.nReviveMinFrame = nReviveFrame
        end
        if nReviveFrame > tbSpot.nReviveMaxFrame then
            tbSpot.nReviveMaxFrame = nReviveFrame
        end
        if tbManager.nReviveMinFrame <= 0 or nReviveFrame < tbManager.nReviveMinFrame then
            tbManager.nReviveMinFrame = nReviveFrame
        end
        if nReviveFrame > tbManager.nReviveMaxFrame then
            tbManager.nReviveMaxFrame = nReviveFrame
        end
    end
end

function VSDTrain2_SpawnSpot(tbManager, tbSpot)
    if tbSpot.nNeed <= 0 then return 0 end
    if not tbSpot.tbSamples or getn(tbSpot.tbSamples) <= 0 then return 0 end
    local nMapIdx = SubWorldID2Idx(tbManager.nWorld)
    if not nMapIdx or nMapIdx < 0 then return 0 end

    local nAllowGlobal = VSD_TRAIN2_MAX_TOTAL_EXTRA - tbManager.nCreatedTotal
    local nNeed = tbSpot.nNeed
    if nNeed > nAllowGlobal then nNeed = nAllowGlobal end
    if nNeed <= 0 then
        tbManager.nCapHits = tbManager.nCapHits + 1
        return 0
    end

    local nCreated = 0
    local nTry = 0
    local nMaxTry = nNeed * VSD_TRAIN2_ADD_TRY_FACTOR
    while nCreated < nNeed and nTry < nMaxTry do
        nTry = nTry + 1
        local s = tbSpot.tbSamples[random(1, getn(tbSpot.tbSamples))]
        local nNpcIndex = AddNpcEx(
            s.nSettingIdx,
            s.nLevel,
            s.nSeries,
            nMapIdx,
            (s.nX + random(-VSD_TRAIN2_SPAWN_OFFSET, VSD_TRAIN2_SPAWN_OFFSET)) * 32,
            (s.nY + random(-VSD_TRAIN2_SPAWN_OFFSET, VSD_TRAIN2_SPAWN_OFFSET)) * 32,
            0, -- no_revive=0: bat co che hoi sinh cua engine; KHONG timer refill cua module.
            s.szName,
            0  -- khong phai Boss
        )
        if nNpcIndex and nNpcIndex > 0 then
            local dwNpcId = GetNpcId(nNpcIndex)
            if dwNpcId and dwNpcId > 0 then
                local nAIResult = 0
                if VSDTrainAI_Apply then nAIResult = VSDTrainAI_Apply(nNpcIndex, s.nSettingIdx, s.nLevel) end
                if nAIResult == 1 then
                    tbManager.nSmartAIApplied = (tbManager.nSmartAIApplied or 0) + 1
                elseif nAIResult == 2 then
                    tbManager.nSmartAINativeHigh = (tbManager.nSmartAINativeHigh or 0) + 1
                else
                    tbManager.nSmartAIFail = (tbManager.nSmartAIFail or 0) + 1
                end
                VSDTrain2_RegisterGenerated(tbManager, tbSpot, nNpcIndex, dwNpcId, s.nReviveFrame)
                nCreated = nCreated + 1
                tbSpot.nCreated = tbSpot.nCreated + 1
                tbManager.nCreatedTotal = tbManager.nCreatedTotal + 1
            else
                if NpcIdx2PIdx(nNpcIndex) <= 0 then DelNpc(nNpcIndex) end
                tbSpot.nAddFail = tbSpot.nAddFail + 1
                tbManager.nAddFailTotal = tbManager.nAddFailTotal + 1
            end
        else
            tbSpot.nAddFail = tbSpot.nAddFail + 1
            tbManager.nAddFailTotal = tbManager.nAddFailTotal + 1
        end
    end
    return nCreated
end

function VSDTrain2_PrepareSpots(tbManager)
    local tbCandidates = VSDTrain2_BuildCandidates(tbManager.tbNatural)
    local nValidNatural = 0
    local i
    for i = 1, getn(tbManager.tbNatural) do
        local n = tbManager.tbNatural[i]
        if n and n.bInvalid ~= 1 then nValidNatural = nValidNatural + 1 end
    end
    tbManager.nNaturalFound = nValidNatural
    tbManager.nSpotCount = getn(tbCandidates)
    tbManager.tbSpots = {}
    tbManager.nExpectedExtra = 0

    for i = 1, getn(tbCandidates) do
        local s = VSDTrain2_NewSpot(tbManager, tbCandidates[i])
        tinsert(tbManager.tbSpots, s)
        tbManager.nExpectedExtra = tbManager.nExpectedExtra + s.nNeed
    end
    tbManager.nSpawnSpotIndex = 1
    return getn(tbCandidates)
end

function VSDTrain2_ClearManagerRuntime(tbManager)
    if not tbManager then return end
    tbManager.tbCatalogNames = nil
    tbManager.tbCatalogNameSeen = nil
    tbManager.tbCatalogMeta = nil
    tbManager.tbNpcSeen = nil
    tbManager.tbNaturalSlot = nil
    tbManager.tbNatural = nil
end

function VSDTrain2_RemoveManager(tbManager)
    if not tbManager then return end
    local nWorld = tbManager.nWorld
    if tbManager.szOwnerKey and g_tbVSDTrain2OwnerMap[tbManager.szOwnerKey] == nWorld then
        g_tbVSDTrain2OwnerMap[tbManager.szOwnerKey] = nil
    end
    if g_tbVSDTrain2MapManager[nWorld] == tbManager then
        g_tbVSDTrain2MapManager[nWorld] = nil
    end
end

function VSDTrain2_FailBuild(tbManager, szError)
    if not tbManager then return 0, 0 end
    if tbManager.nBuildTimerId and tbManager.nBuildTimerId > 0 then tbManager.nBuildTimerId = 0 end
    local nDeleted = 0
    local nPending = 0
    if tbManager.tbSpots and getn(tbManager.tbSpots) > 0 then
        nDeleted, nPending = VSDTrain2_CleanupManager(tbManager)
    end
    VSDTrain2_SetError(szError or "Mode2 build failed")
    VSDTrain2_Log(format("BUILD_FAIL map=%d state=%d deleted=%d pending=%d error=%s", tbManager.nWorld or -1, tbManager.nState or -1, nDeleted or 0, nPending or 0, g_szVSDTrain2LastError or ""))
    VSDTrain2_ClearManagerRuntime(tbManager)
    VSDTrain2_RemoveManager(tbManager)
    return nDeleted or 0, nPending or 0
end

function VSDTrain2_OnBuildTimer(nWorld)
    local tbManager = g_tbVSDTrain2MapManager[nWorld]
    if not tbManager then return 0, nWorld end

    -- Match Mode1's timer ownership pattern: every temporary build tick is executed in the exact
    -- owner's context, then PlayerIndex is restored before return.
    local nOldPlayer = PlayerIndex
    local nOwner = SearchPlayer(tbManager.szOwnerName)
    if not nOwner or nOwner <= 0 then
        VSDTrain2_FailBuild(tbManager, "owner offline during Mode2 build")
        return 0, nWorld
    end
    PlayerIndex = nOwner
    if GetName() ~= tbManager.szOwnerName or GetAccount() ~= tbManager.szOwnerAccount then
        PlayerIndex = nOldPlayer
        VSDTrain2_FailBuild(tbManager, "owner identity mismatch during Mode2 build")
        return 0, nWorld
    end
    local pW = GetWorldPos()
    if pW ~= nWorld then
        PlayerIndex = nOldPlayer
        VSDTrain2_FailBuild(tbManager, "owner left map during Mode2 build")
        return 0, nWorld
    end

    if tbManager.nState == 1 then
        if tbManager.bRuntimeDiscoveryDone ~= 1 then
            local nRuntimeAdded = VSDTrain2_DiscoverRuntimeNames(tbManager)
            tbManager.bRuntimeDiscoveryDone = 1
            VSDTrain2_Log(format("RUNTIME_DISCOVERY map=%d players=%d raw=%d naturalAdded=%d namesAdded=%d totalQuery=%d", nWorld, tbManager.tbScanStats.nRuntimePlayers or 0, tbManager.tbScanStats.nRuntimeRaw or 0, nRuntimeAdded or 0, tbManager.tbScanStats.nRuntimeNamesAdded or 0, getn(tbManager.tbCatalogNames or {})))
        end

        local nTotal = getn(tbManager.tbCatalogNames or {})
        local nFrom = tbManager.nCatalogIndex or 1
        local nTo = nFrom + VSD_TRAIN2_NAMES_PER_TICK - 1
        if nTo > nTotal then nTo = nTotal end

        local i
        for i = nFrom, nTo do
            VSDTrain2_ProcessCatalogName(tbManager, tbManager.tbCatalogNames[i])
        end
        tbManager.nCatalogIndex = nTo + 1

        if tbManager.nCatalogIndex <= nTotal then
            PlayerIndex = nOldPlayer
            return VSD_TRAIN2_BUILD_INTERVAL, nWorld
        end

        local nSpots = VSDTrain2_PrepareSpots(tbManager)
        if nSpots <= 0 then
            PlayerIndex = nOldPlayer
            VSDTrain2_FailBuild(tbManager, "no eligible fixed-density train spot found on map")
            return 0, nWorld
        end

        tbManager.nState = 2
        tbManager.tbCatalogNames = nil
        tbManager.tbCatalogNameSeen = nil
        tbManager.tbCatalogMeta = nil
        tbManager.tbNpcSeen = nil
        tbManager.tbNaturalSlot = nil
        tbManager.tbNatural = nil
        VSDTrain2_Log(format("SCAN_DONE map=%d queries=%d runtimeNatural=%d runtimeNames=%d natural=%d spots=%d expected=%d", nWorld, tbManager.tbScanStats.nNameQueries or 0, tbManager.tbScanStats.nRuntimeNaturalAdded or 0, tbManager.tbScanStats.nRuntimeNamesAdded or 0, tbManager.nNaturalFound or 0, tbManager.nSpotCount or 0, tbManager.nExpectedExtra or 0))
        PlayerIndex = nOldPlayer
        return VSD_TRAIN2_BUILD_INTERVAL, nWorld
    end

    if tbManager.nState == 2 then
        local nFrom = tbManager.nSpawnSpotIndex or 1
        local nTo = nFrom + VSD_TRAIN2_SPOTS_PER_TICK - 1
        if nTo > getn(tbManager.tbSpots) then nTo = getn(tbManager.tbSpots) end
        local i
        for i = nFrom, nTo do
            local s = tbManager.tbSpots[i]
            VSDTrain2_SpawnSpot(tbManager, s)
            VSDTrain2_Log(format("OPEN map=%d spot=%d x=%d y=%d natural=%d target=%d need=%d created=%d", tbManager.nWorld, s.nSpotId, s.nX, s.nY, s.nNaturalAtOpen, s.nTarget, s.nNeed, s.nCreated))
        end
        tbManager.nSpawnSpotIndex = nTo + 1

        if tbManager.nSpawnSpotIndex <= getn(tbManager.tbSpots) then
            PlayerIndex = nOldPlayer
            return VSD_TRAIN2_BUILD_INTERVAL, nWorld
        end

        if tbManager.nExpectedExtra > 0 and tbManager.nCreatedTotal <= 0 then
            PlayerIndex = nOldPlayer
            VSDTrain2_FailBuild(tbManager, "spots need extra monsters but AddNpcEx created none")
            return 0, nWorld
        end

        tbManager.nState = 3
        tbManager.nBuildTimerId = 0
        VSDTrain2_SetError("")
        VSDTrain2_Log(format("ENABLE_FIXED_DONE map=%d manager=%d spots=%d natural=%d expected=%d created=%d queries=%d", tbManager.nWorld, tbManager.nManagerId, tbManager.nSpotCount, tbManager.nNaturalFound, tbManager.nExpectedExtra, tbManager.nCreatedTotal, tbManager.tbScanStats.nNameQueries or 0))
        PlayerIndex = nOldPlayer
        return 0, nWorld
    end

    tbManager.nBuildTimerId = 0
    PlayerIndex = nOldPlayer
    return 0, nWorld
end

function VSDTrain2_Enable()
    if not PlayerIndex or PlayerIndex <= 0 then return -1 end
    local nApi, szMissing = VSDTrain2_CheckApi()
    if nApi ~= 1 then
        VSDTrain2_SetError("missing API: "..(szMissing or "unknown"))
        return -10
    end

    local pW = GetWorldPos()
    local nMapIdx = SubWorldID2Idx(pW)
    if not nMapIdx or nMapIdx < 0 then
        VSDTrain2_SetError("SubWorldID2Idx fail map="..tostring(pW))
        return -3
    end

    if g_tbVSDTrainMapManager and g_tbVSDTrainMapManager[pW] then
        VSDTrain2_SetError("Mode 1 is active on this map")
        return -20
    end
    if g_tbVSDTrain3MapManager and g_tbVSDTrain3MapManager[pW] then
        VSDTrain2_SetError("Mode 3 is active on this map")
        return -22
    end

    local tbExisting = g_tbVSDTrain2MapManager[pW]
    if tbExisting then
        VSDTrain2_SetError("")
        if tbExisting.nState == 3 then return 3 end
        return 2
    end

    local szKey = VSDTrain2_GetOwnerKey()
    local nOldWorld = g_tbVSDTrain2OwnerMap[szKey]
    if nOldWorld and nOldWorld ~= pW and g_tbVSDTrain2MapManager[nOldWorld] then
        VSDTrain2_SetError("Mode 2 is already active/building on map "..nOldWorld)
        return -21
    end

    local tbCatalog = VSDTrain2_LoadCatalogSnapshot()
    if not tbCatalog then return -6 end
    if not tbCatalog.tbNames or getn(tbCatalog.tbNames) <= 0 then
        VSDTrain2_SetError("npcs.txt has no eligible Kind0+ReviveFrame catalog rows")
        return -7
    end

    local tbConfig = VSDTrain2_GetOwnerConfig() or VSDTrain2_DefaultConfig()
    local tbManager = {
        nManagerId = VSDTrain2_NewManagerId(),
        nWorld = pW,
        nTargetMin = tbConfig.nTargetMin,
        nTargetMax = tbConfig.nTargetMax,
        szOwnerKey = szKey,
        szOwnerName = GetName(),
        szOwnerAccount = GetAccount(),
        nState = 1, -- 1=scanning names, 2=spawning fixed extras, 3=active fixed mode
        nBuildTimerId = 0,
        nCatalogIndex = 1,
        bRuntimeDiscoveryDone = 0,
        tbCatalogNames = tbCatalog.tbNames,
        tbCatalogNameSeen = tbCatalog.tbNameSeen,
        tbCatalogMeta = tbCatalog.tbMeta,
        tbNpcSeen = {},
        tbNaturalSlot = {},
        tbNatural = {},
        tbSpots = {},
        nNaturalFound = 0,
        nSpotCount = 0,
        nExpectedExtra = 0,
        nCreatedTotal = 0,
        nAddFailTotal = 0,
        nCapHits = 0,
        nReviveMinFrame = 0,
        nReviveMaxFrame = 0,
        nSmartAIApplied = 0,
        nSmartAINativeHigh = 0,
        nSmartAIFail = 0,
        tbScanStats = VSDTrain2_NewScanStats(tbCatalog),
    }

    g_tbVSDTrain2MapManager[pW] = tbManager
    g_tbVSDTrain2OwnerMap[szKey] = pW

    local nTimerId = AddTimer(VSD_TRAIN2_BUILD_INTERVAL, "VSDTrain2_OnBuildTimer", pW)
    if not nTimerId or nTimerId <= 0 then
        VSDTrain2_RemoveManager(tbManager)
        VSDTrain2_SetError("AddTimer failed for Mode2 temporary builder")
        return -4
    end
    tbManager.nBuildTimerId = nTimerId
    VSDTrain2_SetError("")
    VSDTrain2_Log(format("BUILD_START map=%d manager=%d names=%d batch=%d", pW, tbManager.nManagerId, getn(tbManager.tbCatalogNames), VSD_TRAIN2_NAMES_PER_TICK))
    return 1
end

function VSDTrain2_TryDeleteEntry(e)
    if not e or not e.nIndex or e.nIndex <= 0 then return 0, 0 end
    local rec = g_tbVSDTrain2Generated[e.nIndex]
    if not rec or rec.dwNpcId ~= e.dwNpcId then return 0, 0 end

    local dwNow = GetNpcId(e.nIndex)
    if dwNow and dwNow > 0 then
        if dwNow ~= e.dwNpcId then
            -- Index da bi engine tai su dung: khong xoa NPC moi.
            g_tbVSDTrain2Generated[e.nIndex] = nil
            if g_nVSDTrain2TrackedExtra > 0 then g_nVSDTrain2TrackedExtra = g_nVSDTrain2TrackedExtra - 1 end
            return 0, 0
        end
        local nPlayer = NpcIdx2PIdx(e.nIndex)
        if nPlayer and nPlayer > 0 then return 0, 1 end
        DelNpc(e.nIndex)
        g_tbVSDTrain2Generated[e.nIndex] = nil
        if g_nVSDTrain2TrackedExtra > 0 then g_nVSDTrain2TrackedExtra = g_nVSDTrain2TrackedExtra - 1 end
        return 1, 0
    end

    -- Co the NPC dang o trang thai chet/cho engine hoi sinh. Khong xoa mu index.
    return 0, 1
end

function VSDTrain2_CleanupManager(tbManager)
    local nDeleted = 0
    local nPending = 0
    local i, j
    for i = 1, getn(tbManager.tbSpots) do
        local s = tbManager.tbSpots[i]
        local tbKeep = {}
        for j = 1, getn(s.tbGenerated) do
            local e = s.tbGenerated[j]
            local nDel, nPend = VSDTrain2_TryDeleteEntry(e)
            nDeleted = nDeleted + nDel
            if nPend == 1 then
                nPending = nPending + 1
                tinsert(tbKeep, e)
            end
        end
        s.tbGenerated = tbKeep
    end
    return nDeleted, nPending
end

function VSDTrain2_Disable()
    if not PlayerIndex or PlayerIndex <= 0 then return 0, 0, 0 end
    local pW = GetWorldPos()
    local tbManager = g_tbVSDTrain2MapManager[pW]
    if not tbManager then return 0, 0, 0 end

    if tbManager.nBuildTimerId and tbManager.nBuildTimerId > 0 then
        DelTimer(tbManager.nBuildTimerId)
        tbManager.nBuildTimerId = 0
    end

    local nDeleted, nPending = VSDTrain2_CleanupManager(tbManager)
    if nPending > 0 then
        VSDTrain2_Log(format("DISABLE_PENDING map=%d deleted=%d pending=%d", pW, nDeleted, nPending))
        return nDeleted, nPending, 2
    end

    if tbManager.szOwnerKey and g_tbVSDTrain2OwnerMap[tbManager.szOwnerKey] == pW then
        g_tbVSDTrain2OwnerMap[tbManager.szOwnerKey] = nil
    end
    VSDTrain2_ClearManagerRuntime(tbManager)
    g_tbVSDTrain2MapManager[pW] = nil
    VSDTrain2_Log(format("DISABLE map=%d deleted=%d", pW, nDeleted))
    return nDeleted, 0, 1
end

function VSDTrain2_FrameToSecond(nFrame)
    if not nFrame or nFrame <= 0 then return 0 end
    return floor(nFrame / VSD_TRAIN2_FRAMES_PER_SECOND)
end

function VSDTrain2_SpotSummary(s)
    local nMinSec = VSDTrain2_FrameToSecond(s.nReviveMinFrame)
    local nMaxSec = VSDTrain2_FrameToSecond(s.nReviveMaxFrame)
    local szRespawn = "-"
    if nMinSec > 0 and nMaxSec > 0 then
        if nMinSec == nMaxSec then szRespawn = nMinSec.."s" else szRespawn = nMinSec.."-"..nMaxSec.."s" end
    end
    return format("#%d [%d,%d] natural=%d target=%d | bu=%d/%d | ReviveFrame~%s", s.nSpotId, s.nX, s.nY, s.nNaturalAtOpen, s.nTarget, s.nCreated, s.nNeed, szRespawn)
end

function VSDTrain2_GetStatusText()
    if not PlayerIndex or PlayerIndex <= 0 then return "MODE 2 - PlayerIndex invalid" end
    local pW = GetWorldPos()
    local t = g_tbVSDTrain2MapManager[pW]
    if not t then
        local szExtra = ""
        local szKey = VSDTrain2_GetOwnerKey()
        local nOther = g_tbVSDTrain2OwnerMap[szKey]
        if nOther and nOther ~= pW and g_tbVSDTrain2MapManager[nOther] then szExtra = "\nMode 2 cua ban dang o map "..nOther.."." end
        local szErr = g_szVSDTrain2LastError or ""
        if szErr ~= "" then szExtra = szExtra.."\nLoi gan nhat: "..szErr end
        return format("MODE BU QUAI 2 - CO DINH + HOI SINH GOC\nMap %d: TAT%s\nV5.24 giu dung Mode2: quet toan map theo name, bai >=%d, tong random %d-%d, no_revive=0. Fix discovery: raw+trim name + runtime name radius%d quanh player; timer chi dung luc khoi tao.", pW, szExtra, VSD_TRAIN2_MIN_NATURAL, VSD_TRAIN2_TARGET_MIN, VSD_TRAIN2_TARGET_MAX, VSD_TRAIN2_RUNTIME_SCAN_RADIUS)
    end

    local st = t.tbScanStats or {}
    if t.nState == 1 then
        local nTotal = getn(t.tbCatalogNames or {})
        local nDone = st.nNameQueries or 0
        local nPct = 0
        if nTotal > 0 then nPct = floor(nDone * 100 / nTotal) end
        return format("MODE BU QUAI 2 - DANG QUET TOAN MAP\nMap %d | query=%d/%d (%d%%) | batch=%d ten/giay\nCatalog rawName=%d | trimAlias=%d | rowsTrim=%d\nRuntime players=%d | raw=%d | naturalAdded=%d | runtimeNameAdded=%d\nNPC unique=%d | Power1=%d | ReviveOK=%d | indexReuse=%d", t.nWorld, nDone, nTotal, nPct, VSD_TRAIN2_NAMES_PER_TICK, st.nRawUniqueNames or 0, st.nTrimAliasNames or 0, st.nTrimmedRows or 0, st.nRuntimePlayers or 0, st.nRuntimeRaw or 0, st.nRuntimeNaturalAdded or 0, st.nRuntimeNamesAdded or 0, st.nUniqueIndexes or 0, st.nPower1 or 0, st.nReviveOk or 0, st.nIndexReuseSeen or 0)
    end

    if t.nState == 2 then
        local nDoneSpot = (t.nSpawnSpotIndex or 1) - 1
        if nDoneSpot < 0 then nDoneSpot = 0 end
        return format("MODE BU QUAI 2 - DANG TAO CO DINH\nMap %d | bai da xu ly=%d/%d | natural=%d\nRuntime fallback: naturalAdded=%d | nameAdded=%d\nCan bu=%d | da tao=%d | loi AddNpc=%d\nSau khi xong, timer khoi tao dung; chi con engine respawn theo template.", t.nWorld, nDoneSpot, t.nSpotCount or 0, t.nNaturalFound or 0, st.nRuntimeNaturalAdded or 0, st.nRuntimeNamesAdded or 0, t.nExpectedExtra or 0, t.nCreatedTotal or 0, t.nAddFailTotal or 0)
    end

    local nMinSec = VSDTrain2_FrameToSecond(t.nReviveMinFrame)
    local nMaxSec = VSDTrain2_FrameToSecond(t.nReviveMaxFrame)
    local szRespawn = "chua co quai bu"
    if nMinSec > 0 and nMaxSec > 0 then
        if nMinSec == nMaxSec then szRespawn = nMinSec.." giay" else szRespawn = nMinSec.."-"..nMaxSec.." giay theo template" end
    end

    local sz = format("MODE BU QUAI 2 - DANG BAT CO DINH\nMap %d | chu bat: %s\nName query=%d | raw=%d | trimAlias=%d | runtimeName=%d\nRuntime view: players=%d | raw=%d | naturalAdded=%d\nNatural=%d | bai=%d | can bu=%d | tao=%d | loi=%d\nTimer khoi tao: DA DUNG. Engine respawn: %s\nSmartAI extra: applied=%d | nativeHigh=%d | fail=%d", t.nWorld, t.szOwnerName, st.nNameQueries or 0, st.nRawUniqueNames or 0, st.nTrimAliasNames or 0, st.nRuntimeNamesAdded or 0, st.nRuntimePlayers or 0, st.nRuntimeRaw or 0, st.nRuntimeNaturalAdded or 0, t.nNaturalFound or 0, t.nSpotCount or 0, t.nExpectedExtra or 0, t.nCreatedTotal or 0, t.nAddFailTotal or 0, szRespawn, t.nSmartAIApplied or 0, t.nSmartAINativeHigh or 0, t.nSmartAIFail or 0)
    local i
    local nShow = getn(t.tbSpots)
    if nShow > 6 then nShow = 6 end
    for i = 1, nShow do sz = sz.."\n"..VSDTrain2_SpotSummary(t.tbSpots[i]) end
    if getn(t.tbSpots) > nShow then sz = sz.."\n... con "..(getn(t.tbSpots)-nShow).." bai" end
    return sz
end

-- Diagnosis is read-only: catalog + local radius count only; no AddNpcEx, DelNpc, or timer creation.
function VSDTrain2_Diagnose()
    if not PlayerIndex or PlayerIndex <= 0 then return "MODE2 DIAG: PlayerIndex invalid" end
    local nApi, szMissing = VSDTrain2_CheckApi()
    if nApi ~= 1 then return "MODE2 DIAG: missing API: "..(szMissing or "unknown") end
    local pW = GetWorldPos()
    local tbCatalog = VSDTrain2_LoadCatalogSnapshot()
    if not tbCatalog then return "MODE2 DIAG: catalog fail: "..(g_szVSDTrain2LastError or "") end
    local tbAround = GetAroundNpcList(VSD_TRAIN2_RUNTIME_SCAN_RADIUS)
    if type(tbAround) ~= "table" then tbAround = {} end
    return format("MODE2 DIAG - MAP %d\nnpcs.txt eligible=%d | rawName=%d | rowsTrim=%d | trimAlias=%d | initialQuery=%d\nBuild=%d query/tick | tick=%d giay\nRuntime fallback radius=%d | raw quanh owner=%d\nV5.24 van la fixed Mode2: fallback chi them exact runtime name/NPC dang train vao discovery, KHONG refill sau build.", pW, tbCatalog.nEligibleRows or 0, tbCatalog.nRawUniqueNames or 0, tbCatalog.nTrimmedRows or 0, tbCatalog.nTrimAliasNames or 0, getn(tbCatalog.tbNames or {}), VSD_TRAIN2_NAMES_PER_TICK, floor(VSD_TRAIN2_BUILD_INTERVAL/18), VSD_TRAIN2_RUNTIME_SCAN_RADIUS, getn(tbAround))
end
