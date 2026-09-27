IncludeLib("NPCINFO")

-- V5.31 - MODE 3: damage-triggered + Vietnamese UI + persistent config/state.
--
-- Source-grounded behavior:
--   * GetAroundNpcList(60): proven player-centered NPC scan in this server source.
--   * NPCINFO_GetNpcCurrentLife + previous HP snapshot: exact damage-change pattern used by SimCity.
--   * GetNpcLastAttacker(npc) == PIdx2NpcIdx(player): exact source pattern for the real attacker.
--   * AddNpcEx(..., no_revive=1): generated extras do not engine-respawn.
--   * GetCurServerTime(): source-native seconds for the 300-second inactivity timeout.
--   * GetNpcId + NpcIdx2PIdx + DelNpc: safe cleanup of only instances created by this mode.
--
-- V5.28 adds owner-configurable Mode3 spacing and random extra range without changing the V5.27 trigger core:
--   1) Enabling creates nothing. The owner must actually damage a normal monster.
--   2) ANY positive owner-caused HP loss (even 1 HP) is enough; exact LastAttacker must still be the owner.
--   3) New-batch spacing is configurable per owner at runtime. Default=13 cells; accepted range=3..40.
--   4) Extra count is configurable per owner as MIN/MAX. Default=6..10; accepted values=1..50.
--   5) Configuration is copied into the active map manager and may be changed while Mode3 is running.
--      Changes affect NEW damage decisions / NEW batches only; already-created monsters are not rewritten.
--   6) Every batch is tracked independently. A batch is deleted only when the owner is >40 cells
--      from that batch center, after 300 seconds without owner damage for that batch, or on stop/map-leave.
--   7) Extras use no_revive=1. Dead extras stay dead; there is NO refill and NO active-batch count cap.
--   8) Mode 3 uses the existing HP polling damage path only and does not use a death bridge.
--   9) HP polling remains 9 frames (~0.5s). The damage detector itself is unchanged from V5.27.
--  10) V5.31 persists Mode 3 configuration/state with source-audited free Task slots 5983/5984.
--
-- V5.29 hardens the SEED/template path: a seed must also exist in settings/npcs.txt as Kind=0 with ReviveFrame>0.
-- This strict catalog guard remains unchanged in V5.30.
--
-- V5.30 fixes map-specific monster names without weakening that guard:
--  11) AddNpcEx receives the exact live GetNpcName(seed) string, matching Mode2 and the native SimCity copy pattern.
--      Map scripts may give a live NPC a different display name than settings/npcs.txt, so the catalog Name is not forced.
--  12) The settings/npcs.txt Name remains diagnostic/fallback metadata only. If the live name is unexpectedly blank,
--      V5.30 falls back to the catalog name rather than creating a blank-name NPC.
--  13) No Tong/Camp/player property is copied, guessed, cleared, or rewritten. Only the AddNpcEx name argument changes.

VSD_TRAIN3_NPC_FILE = "\\settings\\npcs.txt"
VSD_TRAIN3_TAB_KEY = "VSD_TRAIN_MODE3_NPCS_V531"
VSD_TRAIN3_SCAN_RADIUS = 60
VSD_TRAIN3_NEW_BATCH_DISTANCE = 13 -- default/compatibility value
VSD_TRAIN3_SAME_SPOT_RADIUS = VSD_TRAIN3_NEW_BATCH_DISTANCE -- default/compatibility alias
VSD_TRAIN3_LEAVE_DISTANCE = 40
VSD_TRAIN3_EXTRA_MIN = 6 -- default/compatibility value
VSD_TRAIN3_EXTRA_MAX = 10 -- default/compatibility value
VSD_TRAIN3_SPAWN_OFFSET = 5
VSD_TRAIN3_ADD_TRY_FACTOR = 5
VSD_TRAIN3_SCAN_INTERVAL = 9 -- 9 frames ~= 0.5 second; source uses 9-frame TimerList timers
VSD_TRAIN3_IDLE_TIMEOUT_SECONDS = 5 * 60

-- V5.28 safety bounds for the runtime menu. 3-cell minimum avoids near-zero spacing spam while still
-- allowing the requested 7/10/15 style tuning. 50 is the menu safety cap; packed Task byte storage still supports this value.
VSD_TRAIN3_CONFIG_DISTANCE_MIN = 3
VSD_TRAIN3_CONFIG_DISTANCE_MAX = 40
VSD_TRAIN3_CONFIG_EXTRA_MIN = 1
VSD_TRAIN3_CONFIG_EXTRA_MAX = 50

-- V5.31 persistent per-character storage. Full-source audit of the supplied server found no GetTask/SetTask
-- use and no symbolic constants for Task 5983 or 5984. Existing cumulative controls use 5986..5998.
-- Task 5983 packs: byte1=distance, byte2=min, byte3=max, byte4=magic.
-- Task 5984 stores desired enabled map as mapId+1; 0 means manually OFF.
VSD_TRAIN3_TASK_CONFIG = 5983
VSD_TRAIN3_TASK_STATE = 5984
VSD_TRAIN3_TASK_MAGIC = 31
VSD_TRAIN3_CTRL_FILE = "\\script\\item\\vsd\\adaptive_train_density_mode3_control.lua"

g_tbVSDTrain3UserConfig = g_tbVSDTrain3UserConfig or {}
g_tbVSDTrain3MapManager = g_tbVSDTrain3MapManager or {}
g_tbVSDTrain3OwnerMap = g_tbVSDTrain3OwnerMap or {}
g_tbVSDTrain3Generated = g_tbVSDTrain3Generated or {}
g_nVSDTrain3ManagerSeed = g_nVSDTrain3ManagerSeed or 0
g_nVSDTrain3BatchSeed = g_nVSDTrain3BatchSeed or 0
g_nVSDTrain3LiveExtra = g_nVSDTrain3LiveExtra or 0
g_szVSDTrain3LastError = g_szVSDTrain3LastError or ""

function VSDTrain3_Log(szMsg)
    if WriteLog then
        WriteLog("VSD_TRAIN_MODE3: "..szMsg)
    elseif print then
        print("VSD_TRAIN_MODE3: "..szMsg)
    end
end

function VSDTrain3_SetError(szMsg)
    g_szVSDTrain3LastError = szMsg or ""
    if g_szVSDTrain3LastError ~= "" then VSDTrain3_Log("ERROR "..g_szVSDTrain3LastError) end
end

function VSDTrain3_TrimAsciiSpace(szName)
    if not szName then return "" end
    local sz = gsub(szName, "^ +", "")
    sz = gsub(sz, " +$", "")
    return sz
end

-- V5.30: snapshot only native respawning monster templates. The file is loaded once per enable/diagnose
-- and immediately unloaded; the manager keeps only the small metadata table indexed by SettingIdx.
function VSDTrain3_LoadCatalogSnapshot()
    if TabFile_Load(VSD_TRAIN3_NPC_FILE, VSD_TRAIN3_TAB_KEY) == 0 then
        VSDTrain3_SetError("TabFile_Load fail: "..VSD_TRAIN3_NPC_FILE)
        return nil
    end

    local nRows = TabFile_GetRowCount(VSD_TRAIN3_TAB_KEY)
    if not nRows or nRows < 2 then
        TabFile_UnLoad(VSD_TRAIN3_TAB_KEY)
        VSDTrain3_SetError("npcs.txt row count invalid")
        return nil
    end

    local tbMeta = {}
    local nEligibleRows = 0
    local nTrimmedRows = 0
    local nRow
    for nRow = 2, nRows do
        local nSettingIdx = nRow - 1
        local nKind = tonumber(TabFile_GetCell(VSD_TRAIN3_TAB_KEY, nRow, "Kind")) or -1
        local nReviveFrame = tonumber(TabFile_GetCell(VSD_TRAIN3_TAB_KEY, nRow, "ReviveFrame")) or 0
        local szSettingName = TabFile_GetCell(VSD_TRAIN3_TAB_KEY, nRow, "Name")
        if nKind == 0 and nReviveFrame > 0 and szSettingName and szSettingName ~= "" then
            local szSpawnName = VSDTrain3_TrimAsciiSpace(szSettingName)
            if szSpawnName == "" then szSpawnName = szSettingName end
            if szSpawnName ~= szSettingName then nTrimmedRows = nTrimmedRows + 1 end
            nEligibleRows = nEligibleRows + 1
            tbMeta[nSettingIdx] = {
                nKind = nKind,
                nReviveFrame = nReviveFrame,
                szSettingName = szSettingName,
                szSpawnName = szSpawnName,
            }
        end
    end
    TabFile_UnLoad(VSD_TRAIN3_TAB_KEY)

    return {
        tbMeta = tbMeta,
        nRows = nRows - 1,
        nEligibleRows = nEligibleRows,
        nTrimmedRows = nTrimmedRows,
    }
end

function VSDTrain3_Distance2(x1, y1, x2, y2)
    local dx = x1 - x2
    local dy = y1 - y2
    return dx * dx + dy * dy
end

function VSDTrain3_GetOwnerKey()
    return GetAccount().."|"..GetName()
end

function VSDTrain3_ClampInt(nValue, nMin, nMax, nDefault)
    local n = tonumber(nValue)
    if n == nil then n = nDefault end
    n = floor(n)
    if n < nMin then n = nMin end
    if n > nMax then n = nMax end
    return n
end

function VSDTrain3_DefaultConfig()
    return {
        nNewBatchDistance = VSD_TRAIN3_NEW_BATCH_DISTANCE,
        nExtraMin = VSD_TRAIN3_EXTRA_MIN,
        nExtraMax = VSD_TRAIN3_EXTRA_MAX,
    }
end

function VSDTrain3_NormalizeConfig(c)
    if not c then c = VSDTrain3_DefaultConfig() end
    c.nNewBatchDistance = VSDTrain3_ClampInt(c.nNewBatchDistance, VSD_TRAIN3_CONFIG_DISTANCE_MIN, VSD_TRAIN3_CONFIG_DISTANCE_MAX, VSD_TRAIN3_NEW_BATCH_DISTANCE)
    c.nExtraMin = VSDTrain3_ClampInt(c.nExtraMin, VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, VSD_TRAIN3_EXTRA_MIN)
    c.nExtraMax = VSDTrain3_ClampInt(c.nExtraMax, VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, VSD_TRAIN3_EXTRA_MAX)
    if c.nExtraMin > c.nExtraMax then c.nExtraMax = c.nExtraMin end
    return c
end

function VSDTrain3_ReadPersistedConfig()
    if not PlayerIndex or PlayerIndex <= 0 or not GetTask or not GetByte then return nil end
    local nRaw = GetTask(VSD_TRAIN3_TASK_CONFIG) or 0
    if GetByte(nRaw, 4) ~= VSD_TRAIN3_TASK_MAGIC then return nil end
    local c = {
        nNewBatchDistance = GetByte(nRaw, 1),
        nExtraMin = GetByte(nRaw, 2),
        nExtraMax = GetByte(nRaw, 3),
    }
    return VSDTrain3_NormalizeConfig(c)
end

function VSDTrain3_SavePersistedConfig(c)
    if not PlayerIndex or PlayerIndex <= 0 or not SetTask or not SetByte then return 0 end
    c = VSDTrain3_NormalizeConfig(c)
    local nRaw = 0
    nRaw = SetByte(nRaw, 1, c.nNewBatchDistance)
    nRaw = SetByte(nRaw, 2, c.nExtraMin)
    nRaw = SetByte(nRaw, 3, c.nExtraMax)
    nRaw = SetByte(nRaw, 4, VSD_TRAIN3_TASK_MAGIC)
    SetTask(VSD_TRAIN3_TASK_CONFIG, nRaw)
    return 1
end

function VSDTrain3_GetSavedEnabledMap()
    if not PlayerIndex or PlayerIndex <= 0 or not GetTask then return -1 end
    local nRaw = tonumber(GetTask(VSD_TRAIN3_TASK_STATE)) or 0
    if nRaw <= 0 then return -1 end
    return floor(nRaw - 1)
end

function VSDTrain3_SaveEnabledMap(nWorld)
    if not PlayerIndex or PlayerIndex <= 0 or not SetTask then return 0 end
    nWorld = tonumber(nWorld) or -1
    if nWorld < 0 then
        SetTask(VSD_TRAIN3_TASK_STATE, 0)
        return 1
    end
    SetTask(VSD_TRAIN3_TASK_STATE, floor(nWorld) + 1)
    return 1
end

function VSDTrain3_GetConfigByKey(szKey)
    if not szKey or szKey == "" then return nil end
    local c = g_tbVSDTrain3UserConfig[szKey]
    if not c then
        if PlayerIndex and PlayerIndex > 0 and szKey == VSDTrain3_GetOwnerKey() then
            c = VSDTrain3_ReadPersistedConfig()
        end
        if not c then c = VSDTrain3_DefaultConfig() end
        g_tbVSDTrain3UserConfig[szKey] = c
    end
    return VSDTrain3_NormalizeConfig(c)
end

function VSDTrain3_GetOwnerConfig()
    if not PlayerIndex or PlayerIndex <= 0 then return nil end
    return VSDTrain3_GetConfigByKey(VSDTrain3_GetOwnerKey())
end

function VSDTrain3_GetManagerDistance(tbManager)
    local n = tbManager and tbManager.nNewBatchDistance or VSD_TRAIN3_NEW_BATCH_DISTANCE
    return VSDTrain3_ClampInt(n, VSD_TRAIN3_CONFIG_DISTANCE_MIN, VSD_TRAIN3_CONFIG_DISTANCE_MAX, VSD_TRAIN3_NEW_BATCH_DISTANCE)
end

function VSDTrain3_GetManagerExtraRange(tbManager)
    local nMin = tbManager and tbManager.nExtraMin or VSD_TRAIN3_EXTRA_MIN
    local nMax = tbManager and tbManager.nExtraMax or VSD_TRAIN3_EXTRA_MAX
    nMin = VSDTrain3_ClampInt(nMin, VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, VSD_TRAIN3_EXTRA_MIN)
    nMax = VSDTrain3_ClampInt(nMax, VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, VSD_TRAIN3_EXTRA_MAX)
    if nMin > nMax then nMax = nMin end
    return nMin, nMax
end

function VSDTrain3_ApplyOwnerConfigToActive(c)
    if not c or not PlayerIndex or PlayerIndex <= 0 then return 0 end
    local pW = GetWorldPos()
    local t = g_tbVSDTrain3MapManager[pW]
    if not t then return 0 end
    if t.szOwnerName ~= GetName() or t.szOwnerAccount ~= GetAccount() then return 0 end
    t.nNewBatchDistance = c.nNewBatchDistance
    t.nExtraMin = c.nExtraMin
    t.nExtraMax = c.nExtraMax
    return 1
end

function VSDTrain3_SetNewBatchDistance(nValue)
    local c = VSDTrain3_GetOwnerConfig()
    if not c then return nil end
    c.nNewBatchDistance = VSDTrain3_ClampInt(nValue, VSD_TRAIN3_CONFIG_DISTANCE_MIN, VSD_TRAIN3_CONFIG_DISTANCE_MAX, VSD_TRAIN3_NEW_BATCH_DISTANCE)
    VSDTrain3_SavePersistedConfig(c)
    VSDTrain3_ApplyOwnerConfigToActive(c)
    return c.nNewBatchDistance
end

function VSDTrain3_SetExtraRange(nMinValue, nMaxValue)
    local c = VSDTrain3_GetOwnerConfig()
    if not c then return nil, nil end
    local nMin = VSDTrain3_ClampInt(nMinValue, VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, c.nExtraMin)
    local nMax = VSDTrain3_ClampInt(nMaxValue, VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, c.nExtraMax)
    if nMin > nMax then
        local nSwap = nMin
        nMin = nMax
        nMax = nSwap
    end
    c.nExtraMin = nMin
    c.nExtraMax = nMax
    VSDTrain3_SavePersistedConfig(c)
    VSDTrain3_ApplyOwnerConfigToActive(c)
    return c.nExtraMin, c.nExtraMax
end

function VSDTrain3_SetExtraMin(nValue)
    local c = VSDTrain3_GetOwnerConfig()
    if not c then return nil, nil end
    c.nExtraMin = VSDTrain3_ClampInt(nValue, VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, c.nExtraMin)
    if c.nExtraMin > c.nExtraMax then c.nExtraMax = c.nExtraMin end
    VSDTrain3_SavePersistedConfig(c)
    VSDTrain3_ApplyOwnerConfigToActive(c)
    return c.nExtraMin, c.nExtraMax
end

function VSDTrain3_SetExtraMax(nValue)
    local c = VSDTrain3_GetOwnerConfig()
    if not c then return nil, nil end
    c.nExtraMax = VSDTrain3_ClampInt(nValue, VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, c.nExtraMax)
    if c.nExtraMax < c.nExtraMin then c.nExtraMin = c.nExtraMax end
    VSDTrain3_SavePersistedConfig(c)
    VSDTrain3_ApplyOwnerConfigToActive(c)
    return c.nExtraMin, c.nExtraMax
end

function VSDTrain3_ResetOwnerConfig()
    local c = VSDTrain3_GetOwnerConfig()
    if not c then return nil end
    c.nNewBatchDistance = VSD_TRAIN3_NEW_BATCH_DISTANCE
    c.nExtraMin = VSD_TRAIN3_EXTRA_MIN
    c.nExtraMax = VSD_TRAIN3_EXTRA_MAX
    VSDTrain3_SavePersistedConfig(c)
    VSDTrain3_ApplyOwnerConfigToActive(c)
    return c
end

function VSDTrain3_GetConfigText()
    local c = VSDTrain3_GetOwnerConfig()
    if not c then return "cÊu h×nh chÕ ®é 3: kh«ng ®äc ®­îc nh©n vËt" end
    local pW = GetWorldPos()
    local t = g_tbVSDTrain3MapManager[pW]
    if t and t.szOwnerName == GetName() and t.szOwnerAccount == GetAccount() then
        local nDist = VSDTrain3_GetManagerDistance(t)
        local nMin, nMax = VSDTrain3_GetManagerExtraRange(t)
        return format("cÊu h×nh ®ang ¸p: b·i míi >=%d « | ngÉu nhiªn %d-%d qu¸i | xãa >%d «", nDist, nMin, nMax, VSD_TRAIN3_LEAVE_DISTANCE)
    end
    return format("cÊu h×nh s½n sµng: b·i míi >=%d « | ngÉu nhiªn %d-%d qu¸i | xãa >%d «", c.nNewBatchDistance, c.nExtraMin, c.nExtraMax, VSD_TRAIN3_LEAVE_DISTANCE)
end

function VSDTrain3_NewManagerId()
    g_nVSDTrain3ManagerSeed = g_nVSDTrain3ManagerSeed + 1
    return g_nVSDTrain3ManagerSeed
end

function VSDTrain3_NewBatchId()
    g_nVSDTrain3BatchSeed = g_nVSDTrain3BatchSeed + 1
    return g_nVSDTrain3BatchSeed
end

function VSDTrain3_CheckApi()
    local tbNeed = {
        {"TabFile_Load", TabFile_Load},
        {"TabFile_GetRowCount", TabFile_GetRowCount},
        {"TabFile_GetCell", TabFile_GetCell},
        {"TabFile_UnLoad", TabFile_UnLoad},
        {"GetAroundNpcList", GetAroundNpcList},
        {"GetNpcPos", GetNpcPos},
        {"GetNpcSettingIdx", GetNpcSettingIdx},
        {"GetNpcKind", GetNpcKind},
        {"GetNpcPowerType", GetNpcPowerType},
        {"GetNpcParam", GetNpcParam},
        {"NPCINFO_GetLevel", NPCINFO_GetLevel},
        {"NPCINFO_GetNpcCurrentLife", NPCINFO_GetNpcCurrentLife},
        {"GetNpcSeries", GetNpcSeries},
        {"GetNpcName", GetNpcName},
        {"GetNpcId", GetNpcId},
        {"GetNpcLastAttacker", GetNpcLastAttacker},
        {"PIdx2NpcIdx", PIdx2NpcIdx},
        {"NpcIdx2PIdx", NpcIdx2PIdx},
        {"GetWorldPos", GetWorldPos},
        {"SubWorldID2Idx", SubWorldID2Idx},
        {"GetCurServerTime", GetCurServerTime},
        {"GetAccount", GetAccount},
        {"GetName", GetName},
        {"GetTask", GetTask},
        {"SetTask", SetTask},
        {"GetByte", GetByte},
        {"SetByte", SetByte},
        {"SearchPlayer", SearchPlayer},
        {"AddNpcEx", AddNpcEx},
        {"DelNpc", DelNpc},
        {"AddTimer", AddTimer},
        {"DelTimer", DelTimer},
    }
    local i
    for i = 1, getn(tbNeed) do
        if tbNeed[i][2] == nil then return 0, tbNeed[i][1] end
    end
    return 1, ""
end

function VSDTrain3_IsMode1Generated(nNpcIndex)
    if not g_tbVSDTrainGenerated then return 0 end
    local r = g_tbVSDTrainGenerated[nNpcIndex]
    if not r then return 0 end
    local dwNow = GetNpcId(nNpcIndex)
    if dwNow and dwNow > 0 and dwNow == r.dwNpcId then return 1 end
    return 0
end

function VSDTrain3_IsMode2Generated(nNpcIndex)
    if not g_tbVSDTrain2Generated then return 0 end
    local r = g_tbVSDTrain2Generated[nNpcIndex]
    if not r then return 0 end
    local dwNow = GetNpcId(nNpcIndex)
    if dwNow and dwNow > 0 and dwNow == r.dwNpcId then return 1 end
    return 0
end

function VSDTrain3_ClearGenerated(nNpcIndex, dwNpcId)
    local r = g_tbVSDTrain3Generated[nNpcIndex]
    if not r then return 0 end
    if dwNpcId and r.dwNpcId ~= dwNpcId then return 0 end
    g_tbVSDTrain3Generated[nNpcIndex] = nil
    if g_nVSDTrain3LiveExtra > 0 then g_nVSDTrain3LiveExtra = g_nVSDTrain3LiveExtra - 1 end
    return 1
end

function VSDTrain3_GetGenerated(nNpcIndex)
    if not nNpcIndex or nNpcIndex <= 0 then return nil end
    local r = g_tbVSDTrain3Generated[nNpcIndex]
    if not r then return nil end
    local dwNow = GetNpcId(nNpcIndex)
    if not dwNow or dwNow <= 0 or dwNow ~= r.dwNpcId then
        VSDTrain3_ClearGenerated(nNpcIndex, r.dwNpcId)
        return nil
    end
    return r
end

function VSDTrain3_RegisterGenerated(tbManager, tbBatch, nNpcIndex, dwNpcId)
    if not tbBatch then return 0 end
    local e = {nIndex=nNpcIndex, dwNpcId=dwNpcId, nBatchId=tbBatch.nBatchId}
    tinsert(tbManager.tbGenerated, e)
    tinsert(tbBatch.tbGenerated, e)
    g_tbVSDTrain3Generated[nNpcIndex] = {
        dwNpcId = dwNpcId,
        nWorld = tbManager.nWorld,
        nManagerId = tbManager.nManagerId,
        nBatchId = tbBatch.nBatchId,
    }
    g_nVSDTrain3LiveExtra = g_nVSDTrain3LiveExtra + 1
    return 1
end

function VSDTrain3_SafeDeleteEntry(e)
    if not e or not e.nIndex or e.nIndex <= 0 then return 0 end
    local r = VSDTrain3_GetGenerated(e.nIndex)
    if not r or r.dwNpcId ~= e.dwNpcId then return 0 end
    local nPlayer = NpcIdx2PIdx(e.nIndex)
    if nPlayer and nPlayer > 0 then
        VSDTrain3_Log("SAFE_DELETE_BLOCK idx="..e.nIndex)
        return 0
    end
    DelNpc(e.nIndex)
    VSDTrain3_ClearGenerated(e.nIndex, e.dwNpcId)
    return 1
end

function VSDTrain3_PruneGenerated(tbManager)
    local tbKeep = {}
    local i
    for i = 1, getn(tbManager.tbGenerated) do
        local e = tbManager.tbGenerated[i]
        if e then
            local r = VSDTrain3_GetGenerated(e.nIndex)
            if r and r.dwNpcId == e.dwNpcId then
                -- no_revive=1 means a dead extra is final. Drop it from our live registry as soon as HP<=0;
                -- do not wait for index recycling and never create a replacement.
                local nLife = NPCINFO_GetNpcCurrentLife(e.nIndex)
                if nLife and nLife > 0 then
                    tinsert(tbKeep, e)
                else
                    VSDTrain3_ClearGenerated(e.nIndex, e.dwNpcId)
                end
            end
        end
    end
    tbManager.tbGenerated = tbKeep

    -- Keep each batch list synchronized with the global live registry. Empty batches stay open
    -- until their own >40/300-second reset so killing a full batch never causes an immediate refill.
    if tbManager.tbBatches then
        local b
        for b = 1, getn(tbManager.tbBatches) do
            local tbBatch = tbManager.tbBatches[b]
            local tbBatchKeep = {}
            local j
            for j = 1, getn(tbBatch.tbGenerated or {}) do
                local e = tbBatch.tbGenerated[j]
                local r = e and VSDTrain3_GetGenerated(e.nIndex) or nil
                if r and r.dwNpcId == e.dwNpcId and r.nBatchId == tbBatch.nBatchId then
                    tinsert(tbBatchKeep, e)
                end
            end
            tbBatch.tbGenerated = tbBatchKeep
        end
    end
    return getn(tbKeep)
end

function VSDTrain3_FindBatchById(tbManager, nBatchId)
    if not tbManager or not tbManager.tbBatches or not nBatchId then return nil end
    local i
    for i = 1, getn(tbManager.tbBatches) do
        local b = tbManager.tbBatches[i]
        if b and b.nBatchId == nBatchId then return b end
    end
    return nil
end

function VSDTrain3_FindBatchNear(tbManager, pX, pY)
    if not tbManager or not tbManager.tbBatches then return nil end
    local nDistance = VSDTrain3_GetManagerDistance(tbManager)
    local nLimit2 = nDistance * nDistance
    local tbBest = nil
    local nBest2 = 0
    local i
    for i = 1, getn(tbManager.tbBatches) do
        local b = tbManager.tbBatches[i]
        if b then
            local d2 = VSDTrain3_Distance2(pX, pY, b.nSpotX, b.nSpotY)
            -- At configured distance or more, this is a new train position. Below it is the same batch.
            if d2 < nLimit2 and (not tbBest or d2 < nBest2) then
                tbBest = b
                nBest2 = d2
            end
        end
    end
    return tbBest
end

function VSDTrain3_SyncLegacyActive(tbManager)
    local n = tbManager.tbBatches and getn(tbManager.tbBatches) or 0
    if n <= 0 then
        tbManager.nActive = 0
        tbManager.nBatchId = 0
        tbManager.nSpotX = 0
        tbManager.nSpotY = 0
        tbManager.nExtraTarget = 0
        tbManager.nCreatedThisBatch = 0
        tbManager.nLastDamageTime = 0
        tbManager.szTriggerSource = ""
        tbManager.szSeedName = ""
        tbManager.szSeedRuntimeName = ""
        tbManager.szSeedSettingName = ""
        tbManager.nSeedSettingIdx = 0
        tbManager.nSeedReviveFrame = 0
        return 0
    end
    local b = tbManager.tbBatches[n]
    tbManager.nActive = 1
    tbManager.nBatchId = b.nBatchId
    tbManager.nSpotX = b.nSpotX
    tbManager.nSpotY = b.nSpotY
    tbManager.nExtraTarget = b.nExtraTarget
    tbManager.nCreatedThisBatch = b.nCreatedThisBatch
    tbManager.nLastDamageTime = b.nLastDamageTime
    tbManager.szTriggerSource = b.szTriggerSource
    tbManager.szSeedName = b.szSeedName
    tbManager.szSeedRuntimeName = b.szSeedRuntimeName or ""
    tbManager.szSeedSettingName = b.szSeedSettingName or ""
    tbManager.nSeedSettingIdx = b.nSeedSettingIdx or 0
    tbManager.nSeedReviveFrame = b.nSeedReviveFrame or 0
    return n
end

function VSDTrain3_RemoveBatchRecord(tbManager, nBatchId)
    if not tbManager or not tbManager.tbBatches then return 0 end
    local i
    for i = getn(tbManager.tbBatches), 1, -1 do
        local b = tbManager.tbBatches[i]
        if b and b.nBatchId == nBatchId then
            tremove(tbManager.tbBatches, i)
            return 1
        end
    end
    return 0
end

function VSDTrain3_CleanupOneBatch(tbManager, tbBatch, szReason)
    if not tbManager or not tbBatch then return 0 end
    VSDTrain3_PruneGenerated(tbManager)
    local nDeleted = 0
    local i
    for i = 1, getn(tbBatch.tbGenerated or {}) do
        nDeleted = nDeleted + VSDTrain3_SafeDeleteEntry(tbBatch.tbGenerated[i])
    end
    tbBatch.tbGenerated = {}
    tbManager.nDeletedTotal = (tbManager.nDeletedTotal or 0) + nDeleted
    VSDTrain3_Log(format("RESET_ONE map=%d batch=%d reason=%s deleted=%d", tbManager.nWorld, tbBatch.nBatchId or 0, szReason or "reset", nDeleted))
    VSDTrain3_RemoveBatchRecord(tbManager, tbBatch.nBatchId)
    VSDTrain3_PruneGenerated(tbManager)
    VSDTrain3_SyncLegacyActive(tbManager)
    return nDeleted
end

-- Compatibility/all-stop helper: cleanup every active/preserved batch.
function VSDTrain3_CleanupBatch(tbManager, szReason)
    if not tbManager then return 0 end
    local nDeleted = 0
    while tbManager.tbBatches and getn(tbManager.tbBatches) > 0 do
        local b = tbManager.tbBatches[getn(tbManager.tbBatches)]
        nDeleted = nDeleted + VSDTrain3_CleanupOneBatch(tbManager, b, szReason or "reset-all")
    end
    tbManager.tbGenerated = {}
    VSDTrain3_SyncLegacyActive(tbManager)
    tbManager.tbSnapshot = {}
    return nDeleted
end

function VSDTrain3_StopMap(nWorld, szReason, bFromTimer)
    local tbManager = g_tbVSDTrain3MapManager[nWorld]
    if not tbManager then return 0 end
    if tbManager.nTimerId and tbManager.nTimerId > 0 and bFromTimer ~= 1 then DelTimer(tbManager.nTimerId) end
    tbManager.nTimerId = 0
    local nDeleted = VSDTrain3_CleanupBatch(tbManager, szReason or "stop")
    if tbManager.szOwnerKey and g_tbVSDTrain3OwnerMap[tbManager.szOwnerKey] == nWorld then
        g_tbVSDTrain3OwnerMap[tbManager.szOwnerKey] = nil
    end
    g_tbVSDTrain3MapManager[nWorld] = nil
    VSDTrain3_Log(format("STOP map=%d reason=%s deleted=%d", nWorld, szReason or "manual", nDeleted))
    return nDeleted
end

-- Same normal-monster core used by the train-density system: real NPC, Kind=0, PowerType=1,
-- not a SimCity/special bot. Mode 1/2 generated NPCs are never accepted as a fresh trigger template.
-- Own Mode 3 generated NPCs may be returned only to refresh the five-minute activity clock.
function VSDTrain3_GetNpcInfo(tbManager, nNpcIndex, bAllowOwnGenerated)
    if not nNpcIndex or nNpcIndex <= 0 then return nil, "bad-index" end
    local nPlayer = NpcIdx2PIdx(nNpcIndex)
    if nPlayer and nPlayer > 0 then return nil, "player" end

    local rOwn = VSDTrain3_GetGenerated(nNpcIndex)
    if rOwn then
        if bAllowOwnGenerated ~= 1 then return nil, "own-generated" end
    else
        if VSDTrain3_IsMode1Generated(nNpcIndex) == 1 or VSDTrain3_IsMode2Generated(nNpcIndex) == 1 then return nil, "other-mode-generated" end
    end

    local nSettingIdx = GetNpcSettingIdx(nNpcIndex)
    local nKind = GetNpcKind(nNpcIndex)
    local nPower = GetNpcPowerType(nNpcIndex)
    local nParam4 = GetNpcParam(nNpcIndex, 4) or 0
    if not nSettingIdx or nSettingIdx <= 0 or nKind ~= 0 or nPower ~= 1 then return nil, "not-normal-monster" end
    if nParam4 == 1 or nParam4 == 2 then return nil, "sim-param4" end

    -- V5.29: do not trust only the live NPC facade. The exact SettingIdx must map back to a native
    -- Kind=0 + ReviveFrame>0 row in settings/npcs.txt, matching the strict Mode2 template guard.
    local meta = tbManager and tbManager.tbCatalogMeta and tbManager.tbCatalogMeta[nSettingIdx] or nil
    if not meta or meta.nKind ~= 0 or not meta.nReviveFrame or meta.nReviveFrame <= 0 then
        return nil, "catalog-reject"
    end

    local x32, y32 = GetNpcPos(nNpcIndex)
    local nLevel = NPCINFO_GetLevel(nNpcIndex)
    local nSeries = GetNpcSeries(nNpcIndex)
    local szRuntimeName = GetNpcName(nNpcIndex)
    local szCatalogName = meta.szSpawnName or meta.szSettingName
    local dwNpcId = GetNpcId(nNpcIndex)
    if not x32 or not y32 or not nLevel or nLevel <= 0 or nSeries == nil then return nil, "runtime-fields" end
    if not szCatalogName or szCatalogName == "" then return nil, "catalog-name" end
    if not dwNpcId or dwNpcId <= 0 then return nil, "npc-id" end

    -- V5.30: exact live map name is authoritative for display. This is the same field Mode2
    -- forwards to AddNpcEx and the same GetNpcName -> AddNpcEx copy pattern used by SimCity.
    -- The native catalog is still required for eligibility; its Name is only fallback/diagnostic.
    local szSpawnName = szRuntimeName
    if not szSpawnName or szSpawnName == "" then szSpawnName = szCatalogName end
    if not szSpawnName or szSpawnName == "" then return nil, "spawn-name" end

    local szRuntimeTrim = VSDTrain3_TrimAsciiSpace(szRuntimeName or "")
    local szSettingTrim = VSDTrain3_TrimAsciiSpace(meta.szSettingName or "")
    local bNameMismatch = 0
    if szRuntimeTrim ~= "" and szSettingTrim ~= "" and szRuntimeTrim ~= szSettingTrim then bNameMismatch = 1 end

    return {
        nIndex = nNpcIndex,
        dwNpcId = dwNpcId,
        nX = floor(x32 / 32),
        nY = floor(y32 / 32),
        nSettingIdx = nSettingIdx,
        nLevel = nLevel,
        nSeries = nSeries,
        nParam4 = nParam4,
        nReviveFrame = meta.nReviveFrame,
        szName = szSpawnName, -- exact live map name used by AddNpcEx; catalog fallback only if blank
        szRuntimeName = szRuntimeName or "",
        szSettingName = meta.szSettingName,
        szCatalogName = szCatalogName,
        bRuntimeNameMismatch = bNameMismatch,
        bOwnGenerated = rOwn and 1 or 0,
        nOwnBatchId = rOwn and rOwn.nBatchId or 0,
    }, "ok"
end

function VSDTrain3_CollectCurrent(tbManager)
    local tbNpc, nEngineCount = GetAroundNpcList(VSD_TRAIN3_SCAN_RADIUS)
    if type(tbNpc) ~= "table" then tbNpc = {} end
    local tbCurrent = {}
    local tbSeen = {}
    local nCatalogReject = 0
    local nNameMismatch = 0
    local i
    for i = 1, getn(tbNpc) do
        local idx = tbNpc[i]
        if idx and idx > 0 and not tbSeen[idx] then
            tbSeen[idx] = 1
            local info, szReason = VSDTrain3_GetNpcInfo(tbManager, idx, 1)
            if info then
                local nLife = NPCINFO_GetNpcCurrentLife(idx)
                if nLife and nLife > 0 then
                    info.nLife = nLife
                    if info.bRuntimeNameMismatch == 1 then nNameMismatch = nNameMismatch + 1 end
                    tinsert(tbCurrent, info)
                end
            elseif szReason == "catalog-reject" or szReason == "catalog-name" then
                nCatalogReject = nCatalogReject + 1
            end
        end
    end
    tbManager.nLastAroundRaw = nEngineCount or getn(tbNpc)
    tbManager.nLastEligible = getn(tbCurrent)
    tbManager.nLastCatalogReject = nCatalogReject
    tbManager.nLastRuntimeNameMismatch = nNameMismatch
    return tbCurrent
end

function VSDTrain3_IsOwnerLastAttacker(nNpcIndex, nOwnerPlayerIndex)
    local nOwnerNpc = PIdx2NpcIdx(nOwnerPlayerIndex)
    if not nOwnerNpc or nOwnerNpc <= 0 then return 0 end
    local nAttackerNpc = GetNpcLastAttacker(nNpcIndex)
    if nAttackerNpc and nAttackerNpc > 0 and nAttackerNpc == nOwnerNpc then return 1 end
    return 0
end

function VSDTrain3_SpawnBatch(tbManager, tbBatch, tbSeed, nExtra)
    if not tbBatch or not tbSeed or nExtra <= 0 then return 0 end
    local nMapIdx = SubWorldID2Idx(tbManager.nWorld)
    if not nMapIdx or nMapIdx < 0 then return 0 end
    local nCfgMin, nCfgMax = VSDTrain3_GetManagerExtraRange(tbManager)
    if nExtra < nCfgMin then nExtra = nCfgMin end
    if nExtra > nCfgMax then nExtra = nCfgMax end

    local nCreated = 0
    local nTry = 0
    local nMaxTry = nExtra * VSD_TRAIN3_ADD_TRY_FACTOR
    while nCreated < nExtra and nTry < nMaxTry do
        nTry = nTry + 1
        -- V5.28: center remains the OWNER PLAYER position captured when the batch opens.
        -- AddNpcEx still receives x32/y32 exactly as the original V5.24/source conventions require.
        local nNpcIndex = AddNpcEx(
            tbSeed.nSettingIdx,
            tbSeed.nLevel,
            tbSeed.nSeries,
            nMapIdx,
            (tbBatch.nSpotX + random(-VSD_TRAIN3_SPAWN_OFFSET, VSD_TRAIN3_SPAWN_OFFSET)) * 32,
            (tbBatch.nSpotY + random(-VSD_TRAIN3_SPAWN_OFFSET, VSD_TRAIN3_SPAWN_OFFSET)) * 32,
            1, -- no_revive=1: dead is final; Mode 3 never refills this batch.
            tbSeed.szName,
            0
        )
        if nNpcIndex and nNpcIndex > 0 then
            local dwNpcId = GetNpcId(nNpcIndex)
            if dwNpcId and dwNpcId > 0 then
                local nAIResult = 0
                if VSDTrainAI_Apply then nAIResult = VSDTrainAI_Apply(nNpcIndex, tbSeed.nSettingIdx, tbSeed.nLevel) end
                if nAIResult == 1 then
                    tbManager.nSmartAIApplied = (tbManager.nSmartAIApplied or 0) + 1
                elseif nAIResult == 2 then
                    tbManager.nSmartAINativeHigh = (tbManager.nSmartAINativeHigh or 0) + 1
                else
                    tbManager.nSmartAIFail = (tbManager.nSmartAIFail or 0) + 1
                end
                VSDTrain3_RegisterGenerated(tbManager, tbBatch, nNpcIndex, dwNpcId)
                nCreated = nCreated + 1
                tbManager.nCreatedTotal = tbManager.nCreatedTotal + 1
            else
                if NpcIdx2PIdx(nNpcIndex) <= 0 then DelNpc(nNpcIndex) end
                tbManager.nAddFailTotal = tbManager.nAddFailTotal + 1
            end
        else
            tbManager.nAddFailTotal = tbManager.nAddFailTotal + 1
        end
    end
    return nCreated
end

function VSDTrain3_OpenBatch(tbManager, tbSeed, szSource, pX, pY)
    if not tbManager or not tbSeed or tbSeed.bOwnGenerated == 1 then return 0 end
    if pX == nil or pY == nil then
        local pW
        pW, pX, pY = GetWorldPos()
        if pW ~= tbManager.nWorld then return 0 end
    end
    local nExtraMin, nExtraMax = VSDTrain3_GetManagerExtraRange(tbManager)
    local nExtra = random(nExtraMin, nExtraMax)
    local nNow = GetCurServerTime()
    local tbBatch = {
        nBatchId = VSDTrain3_NewBatchId(),
        nSpotX = pX,
        nSpotY = pY,
        nExtraTarget = nExtra,
        nCreatedThisBatch = 0,
        nLastDamageTime = nNow or 0,
        szTriggerSource = szSource or "hp-drop",
        szSeedName = tbSeed.szName or "",
        szSeedRuntimeName = tbSeed.szRuntimeName or "",
        szSeedSettingName = tbSeed.szSettingName or "",
        nSeedSettingIdx = tbSeed.nSettingIdx or 0,
        nSeedReviveFrame = tbSeed.nReviveFrame or 0,
        tbGenerated = {},
    }
    tinsert(tbManager.tbBatches, tbBatch)
    tbManager.nTriggerTotal = tbManager.nTriggerTotal + 1

    local nCreated = VSDTrain3_SpawnBatch(tbManager, tbBatch, tbSeed, nExtra)
    tbBatch.nCreatedThisBatch = nCreated
    VSDTrain3_SyncLegacyActive(tbManager)
    VSDTrain3_Log(format("SEED map=%d batch=%d idx=%d id=%d setting=%d revive=%d param4=%d spawn=%s runtime=%s catalog=%s mismatch=%d", tbManager.nWorld, tbBatch.nBatchId, tbSeed.nIndex or 0, tbSeed.dwNpcId or 0, tbSeed.nSettingIdx or 0, tbSeed.nReviveFrame or 0, tbSeed.nParam4 or 0, tbSeed.szName or "", tbSeed.szRuntimeName or "", tbSeed.szSettingName or "", tbSeed.bRuntimeNameMismatch or 0))
    VSDTrain3_Log(format("OPEN map=%d batch=%d source=%s playerCenter=[%d,%d] extraTarget=%d created=%d seed=%s activeBatches=%d", tbManager.nWorld, tbBatch.nBatchId, tbBatch.szTriggerSource, tbBatch.nSpotX, tbBatch.nSpotY, nExtra, nCreated, tbBatch.szSeedName, getn(tbManager.tbBatches)))
    return 1
end

function VSDTrain3_HandleOwnerDamage(tbManager, tbInfo, szSource, pX, pY)
    if not tbManager or not tbInfo then return 0 end
    if pX == nil or pY == nil then
        local pW
        pW, pX, pY = GetWorldPos()
        if pW ~= tbManager.nWorld then return 0 end
    end
    local nNow = GetCurServerTime()
    tbManager.nDamageEvents = (tbManager.nDamageEvents or 0) + 1

    -- Damage to an own Mode3 extra refreshes only the batch that owns that extra; never refill/spawn.
    if tbInfo.bOwnGenerated == 1 then
        local tbOwnBatch = VSDTrain3_FindBatchById(tbManager, tbInfo.nOwnBatchId)
        if tbOwnBatch then
            tbOwnBatch.nLastDamageTime = nNow or tbOwnBatch.nLastDamageTime or 0
            VSDTrain3_SyncLegacyActive(tbManager)
        end
        return 1
    end

    -- V5.28: position grouping is player-centered and uses the OWNER CONFIG stored in this manager.
    -- A natural hit below the configured spacing refreshes the nearby batch; at/above it opens another.
    local tbNear = VSDTrain3_FindBatchNear(tbManager, pX, pY)
    if tbNear then
        tbNear.nLastDamageTime = nNow or tbNear.nLastDamageTime or 0
        VSDTrain3_SyncLegacyActive(tbManager)
        return 1
    end

    return VSDTrain3_OpenBatch(tbManager, tbInfo, szSource or "new-player-spot", pX, pY)
end

function VSDTrain3_BuildSnapshot(tbCurrent)
    local tbSnapshot = {}
    local i
    for i = 1, getn(tbCurrent) do
        local n = tbCurrent[i]
        tbSnapshot[n.nIndex] = {dwNpcId=n.dwNpcId, nLife=n.nLife}
    end
    return tbSnapshot
end

-- Detect ANY owner-caused positive HP loss: current HP < previous HP is enough, even by 1 point.
-- No 50%/percent/absolute-damage threshold exists. For AoE, nearest damaged NATURAL monster is the trigger.
function VSDTrain3_ProcessDamageScan(tbManager, nOwnerPlayerIndex, pX, pY, tbCurrent)
    local tbOld = tbManager.tbSnapshot or {}
    local tbNew = {}
    local tbBestNatural = nil
    local nBestDistance2 = 0
    local tbBestOwn = nil
    local nOwnBestDistance2 = 0
    local nDamageCount = 0
    local i
    for i = 1, getn(tbCurrent) do
        local n = tbCurrent[i]
        local old = tbOld[n.nIndex]
        if old and old.dwNpcId == n.dwNpcId and old.nLife and n.nLife < old.nLife then
            if VSDTrain3_IsOwnerLastAttacker(n.nIndex, nOwnerPlayerIndex) == 1 then
                nDamageCount = nDamageCount + 1
                local d2 = VSDTrain3_Distance2(n.nX, n.nY, pX, pY)
                if n.bOwnGenerated == 1 then
                    if not tbBestOwn or d2 < nOwnBestDistance2 then
                        tbBestOwn = n
                        nOwnBestDistance2 = d2
                    end
                else
                    if not tbBestNatural or d2 < nBestDistance2 then
                        tbBestNatural = n
                        nBestDistance2 = d2
                    end
                end
            end
        end
        tbNew[n.nIndex] = {dwNpcId=n.dwNpcId, nLife=n.nLife}
    end
    tbManager.tbSnapshot = tbNew

    if nDamageCount > 0 then
        -- Natural damage determines whether a new player-centered train batch is needed.
        -- If only an own extra was damaged, refresh exactly that extra's batch.
        if tbBestNatural then
            VSDTrain3_HandleOwnerDamage(tbManager, tbBestNatural, "hp-drop", pX, pY)
        elseif tbBestOwn then
            VSDTrain3_HandleOwnerDamage(tbManager, tbBestOwn, "own-extra-hp-drop", pX, pY)
        end
    end
    return nDamageCount
end

function VSDTrain3_OnTimer(nWorld)
    local tbManager = g_tbVSDTrain3MapManager[nWorld]
    if not tbManager then return 0, nWorld end

    local nOldPlayer = PlayerIndex
    local nOwner = SearchPlayer(tbManager.szOwnerName)
    if not nOwner or nOwner <= 0 then
        VSDTrain3_StopMap(nWorld, "owner-offline", 1)
        return 0, nWorld
    end

    PlayerIndex = nOwner
    if GetName() ~= tbManager.szOwnerName or GetAccount() ~= tbManager.szOwnerAccount then
        PlayerIndex = nOldPlayer
        VSDTrain3_StopMap(nWorld, "owner-identity-mismatch", 1)
        return 0, nWorld
    end

    local pW, pX, pY = GetWorldPos()
    if pW ~= nWorld then
        PlayerIndex = nOldPlayer
        VSDTrain3_StopMap(nWorld, "owner-left-map", 1)
        return 0, nWorld
    end

    -- V5.28: cleanup remains PER BATCH and FIXED at >40 cells, independent of configurable spacing.
    -- Old survivors may remain while the player opens new batches at the configured minimum distance.
    local nLeave2 = VSD_TRAIN3_LEAVE_DISTANCE * VSD_TRAIN3_LEAVE_DISTANCE
    local i
    for i = getn(tbManager.tbBatches or {}), 1, -1 do
        local b = tbManager.tbBatches[i]
        if b and VSDTrain3_Distance2(pX, pY, b.nSpotX, b.nSpotY) > nLeave2 then
            VSDTrain3_CleanupOneBatch(tbManager, b, "owner-left-batch-over40")
        end
    end

    local tbCurrent = VSDTrain3_CollectCurrent(tbManager)
    VSDTrain3_ProcessDamageScan(tbManager, nOwner, pX, pY, tbCurrent)

    -- Preserve the V5.24 300-second rule, but independently for every preserved batch.
    local nNow = GetCurServerTime()
    if nNow then
        for i = getn(tbManager.tbBatches or {}), 1, -1 do
            local b = tbManager.tbBatches[i]
            local nLast = b and (b.nLastDamageTime or 0) or 0
            if b and nLast > 0 and nNow - nLast >= VSD_TRAIN3_IDLE_TIMEOUT_SECONDS then
                VSDTrain3_CleanupOneBatch(tbManager, b, "no-owner-damage-5min")
            end
        end
    end

    VSDTrain3_PruneGenerated(tbManager)
    VSDTrain3_SyncLegacyActive(tbManager)
    tbManager.nScanCount = tbManager.nScanCount + 1
    PlayerIndex = nOldPlayer
    return VSD_TRAIN3_SCAN_INTERVAL, nWorld
end

function VSDTrain3_Enable()
    if not PlayerIndex or PlayerIndex <= 0 then return -1 end
    local nApi, szMissing = VSDTrain3_CheckApi()
    if nApi ~= 1 then
        VSDTrain3_SetError("missing API: "..(szMissing or "unknown"))
        return -10
    end

    local pW = GetWorldPos()
    local nMapIdx = SubWorldID2Idx(pW)
    if not nMapIdx or nMapIdx < 0 then
        VSDTrain3_SetError("SubWorldID2Idx fail map="..tostring(pW))
        return -3
    end

    if g_tbVSDTrainMapManager and g_tbVSDTrainMapManager[pW] then
        VSDTrain3_SetError("Mode 1 is active on this map")
        return -20
    end
    if g_tbVSDTrain2MapManager and g_tbVSDTrain2MapManager[pW] then
        VSDTrain3_SetError("Mode 2 is active/building on this map")
        return -21
    end

    local tbExisting = g_tbVSDTrain3MapManager[pW]
    if tbExisting then
        if tbExisting.szOwnerName == GetName() and tbExisting.szOwnerAccount == GetAccount() then
            local cExisting = VSDTrain3_GetOwnerConfig()
            if cExisting then VSDTrain3_SavePersistedConfig(cExisting) end
            VSDTrain3_SaveEnabledMap(pW)
            VSDTrain3_SetError("")
            return 2
        end
        VSDTrain3_SetError("Mode 3 is already owned by another player on this map")
        return -22
    end

    local szKey = VSDTrain3_GetOwnerKey()
    local nOldWorld = g_tbVSDTrain3OwnerMap[szKey]
    if nOldWorld and nOldWorld ~= pW and g_tbVSDTrain3MapManager[nOldWorld] then
        VSDTrain3_StopMap(nOldWorld, "owner-enable-new-map", 0)
    end

    local tbConfig = VSDTrain3_GetOwnerConfig()
    if not tbConfig then
        VSDTrain3_SetError("cannot resolve owner runtime config")
        return -11
    end

    local tbCatalog = VSDTrain3_LoadCatalogSnapshot()
    if not tbCatalog then
        if g_szVSDTrain3LastError == "" then VSDTrain3_SetError("cannot load native NPC catalog") end
        return -12
    end

    local tbManager = {
        nManagerId = VSDTrain3_NewManagerId(),
        nWorld = pW,
        nNewBatchDistance = tbConfig.nNewBatchDistance,
        nExtraMin = tbConfig.nExtraMin,
        nExtraMax = tbConfig.nExtraMax,
        szOwnerKey = szKey,
        szOwnerName = GetName(),
        szOwnerAccount = GetAccount(),
        nTimerId = 0,
        nActive = 0,
        nBatchId = 0,
        nSpotX = 0,
        nSpotY = 0,
        nExtraTarget = 0,
        nCreatedThisBatch = 0,
        nLastDamageTime = 0,
        szTriggerSource = "",
        szSeedName = "",
        szSeedRuntimeName = "",
        szSeedSettingName = "",
        nSeedSettingIdx = 0,
        nSeedReviveFrame = 0,
        tbCatalogMeta = tbCatalog.tbMeta,
        nCatalogRows = tbCatalog.nRows or 0,
        nCatalogEligible = tbCatalog.nEligibleRows or 0,
        nCatalogTrimmed = tbCatalog.nTrimmedRows or 0,
        tbGenerated = {},
        tbBatches = {},
        tbSnapshot = {},
        nScanCount = 0,
        nDamageEvents = 0,
        nTriggerTotal = 0,
        nCreatedTotal = 0,
        nDeletedTotal = 0,
        nAddFailTotal = 0,
        nSmartAIApplied = 0,
        nSmartAINativeHigh = 0,
        nSmartAIFail = 0,
        nLastAroundRaw = 0,
        nLastEligible = 0,
        nLastCatalogReject = 0,
        nLastRuntimeNameMismatch = 0,
    }
    g_tbVSDTrain3MapManager[pW] = tbManager
    g_tbVSDTrain3OwnerMap[szKey] = pW

    -- Baseline only. Enabling alone must never create a monster.
    local tbCurrent = VSDTrain3_CollectCurrent(tbManager)
    tbManager.tbSnapshot = VSDTrain3_BuildSnapshot(tbCurrent)

    local nTimerId = AddTimer(VSD_TRAIN3_SCAN_INTERVAL, "VSDTrain3_OnTimer", pW)
    if not nTimerId or nTimerId <= 0 then
        g_tbVSDTrain3OwnerMap[szKey] = nil
        g_tbVSDTrain3MapManager[pW] = nil
        VSDTrain3_SetError("AddTimer failed for Mode3 damage monitor")
        return -4
    end
    tbManager.nTimerId = nTimerId
    VSDTrain3_SavePersistedConfig(tbConfig)
    VSDTrain3_SaveEnabledMap(pW)
    VSDTrain3_SetError("")
    VSDTrain3_Log(format("ENABLE map=%d manager=%d owner=%s|%s baseline=%d catalogEligible=%d/%d trimmedNames=%d", pW, tbManager.nManagerId, tbManager.szOwnerAccount, tbManager.szOwnerName, tbManager.nLastEligible, tbManager.nCatalogEligible, tbManager.nCatalogRows, tbManager.nCatalogTrimmed))
    return 1
end

function VSDTrain3_Disable()
    if not PlayerIndex or PlayerIndex <= 0 then return 0 end
    local pW = GetWorldPos()
    VSDTrain3_SaveEnabledMap(-1)
    return VSDTrain3_StopMap(pW, "manual", 0)
end

function VSDTrain3_TryRestoreSavedOnCurrentMap()
    if not PlayerIndex or PlayerIndex <= 0 then return 0 end
    local nSavedMap = VSDTrain3_GetSavedEnabledMap()
    if not nSavedMap or nSavedMap < 0 then return 0 end
    local pW = GetWorldPos()
    if pW ~= nSavedMap then return 2 end
    local t = g_tbVSDTrain3MapManager and g_tbVSDTrain3MapManager[pW] or nil
    if t and t.szOwnerName == GetName() and t.szOwnerAccount == GetAccount() then return 1 end
    local nRet = VSDTrain3_Enable()
    if nRet == 1 or nRet == 2 then
        VSDTrain3_Log(format("RESTORE_OK map=%d owner=%s|%s", pW, GetAccount(), GetName()))
        return 1
    end
    VSDTrain3_Log(format("RESTORE_WAIT map=%d ret=%s", pW, tostring(nRet)))
    return nRet or -99
end

function VSDTrain3_OnLogin()
    if not PlayerIndex or PlayerIndex <= 0 then return 0 end
    if DynamicExecuteByPlayer then
        return DynamicExecuteByPlayer(PlayerIndex, VSD_TRAIN3_CTRL_FILE, "VSDTrain3_OnLoginInternal")
    end
    return VSDTrain3_OnLoginInternal()
end

function VSDTrain3_OnLoginInternal()
    if not PlayerIndex or PlayerIndex <= 0 then return 0 end
    local szKey = VSDTrain3_GetOwnerKey()
    g_tbVSDTrain3UserConfig[szKey] = VSDTrain3_ReadPersistedConfig() or VSDTrain3_DefaultConfig()
    return VSDTrain3_TryRestoreSavedOnCurrentMap()
end

function VSDTrain3_CountLive(tbManager)
    if not tbManager then return 0 end
    return VSDTrain3_PruneGenerated(tbManager)
end

function VSDTrain3_GetMenuSummaryText()
    if not PlayerIndex or PlayerIndex <= 0 then return "chÕ ®é 3 - kh«ng ®äc ®­îc nh©n vËt." end
    local pW = GetWorldPos()
    local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
    local t = g_tbVSDTrain3MapManager[pW]
    local nSavedMap = VSDTrain3_GetSavedEnabledMap()
    if not t then
        local szSave = "t¾t"
        if nSavedMap and nSavedMap >= 0 then szSave = "®· l­u bËt b¶n ®å "..nSavedMap end
        return format("chÕ ®é bï qu¸i 3 - t¾t - b¶n ®å %d\nb·i míi >=%d « | ngÉu nhiªn %d-%d qu¸i | xãa >%d «\nl­u tù ®éng: %s", pW, c.nNewBatchDistance, c.nExtraMin, c.nExtraMax, VSD_TRAIN3_LEAVE_DISTANCE, szSave)
    end
    local nBatch = t.tbBatches and getn(t.tbBatches) or 0
    local nLive = VSDTrain3_CountLive(t)
    local szRun = "chê s¸t th­¬ng"
    if nBatch > 0 then szRun = "®ang gi÷ "..nBatch.." b·i" end
    return format("chÕ ®é bï qu¸i 3 - %s\nb¶n ®å %d | qu¸i bï sèng: %d\nb·i míi >=%d « | ngÉu nhiªn %d-%d | xãa >%d «", szRun, pW, nLive, VSDTrain3_GetManagerDistance(t), t.nExtraMin or c.nExtraMin, t.nExtraMax or c.nExtraMax, VSD_TRAIN3_LEAVE_DISTANCE)
end

function VSDTrain3_GetStatusPage1()
    if not PlayerIndex or PlayerIndex <= 0 then return "kh«ng ®äc ®­îc nh©n vËt." end
    local pW = GetWorldPos()
    local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
    local t = g_tbVSDTrain3MapManager[pW]
    local nSavedMap = VSDTrain3_GetSavedEnabledMap()
    if not t then
        local szSaved = "t¾t"
        if nSavedMap and nSavedMap >= 0 then szSaved = "bËt b¶n ®å "..nSavedMap end
        return format("tr¹ng th¸i chÕ ®é 3\nb¶n ®å %d: t¾t | ®· l­u: %s\nb·i míi >=%d « | ngÉu nhiªn %d-%d qu¸i\nmçi b·i tù xãa khi c¸ch nh©n vËt >%d «.", pW, szSaved, c.nNewBatchDistance, c.nExtraMin, c.nExtraMax, VSD_TRAIN3_LEAVE_DISTANCE)
    end
    local nBatch = t.tbBatches and getn(t.tbBatches) or 0
    local nLive = VSDTrain3_CountLive(t)
    return format("tr¹ng th¸i chÕ ®é 3\nb¶n ®å %d | b·i ®ang gi÷: %d | qu¸i bï sèng: %d\ntæng b·i ®· më: %d | sè qu¸i ®· t¹o: %d\ncÊu h×nh: >=%d « | %d-%d qu¸i | xãa >%d «", pW, nBatch, nLive, t.nTriggerTotal or 0, t.nCreatedTotal or 0, VSDTrain3_GetManagerDistance(t), t.nExtraMin or c.nExtraMin, t.nExtraMax or c.nExtraMax, VSD_TRAIN3_LEAVE_DISTANCE)
end

function VSDTrain3_GetStatusPage2()
    if not PlayerIndex or PlayerIndex <= 0 then return "kh«ng ®äc ®­îc nh©n vËt" end
    local pW = GetWorldPos()
    local t = g_tbVSDTrain3MapManager[pW]
    if not t then return "chi tiÕt chÕ ®é 3\nchÕ ®é ®ang t¾t\nkh«ng cã d÷ liÖu ®ang ch¹y" end
    return format("chi tiÕt chÕ ®é 3\nquÐt s¸t th­¬ng mçi %d nhÞp\nqu¸i hîp lÖ gÇn nhÊt: %d\nlÇn g©y s¸t th­¬ng: %d\nsè qu¸i ®· dän: %d\nlçi t¹o qu¸i: %d", VSD_TRAIN3_SCAN_INTERVAL, t.nLastEligible or 0, t.nDamageEvents or 0, t.nDeletedTotal or 0, t.nAddFailTotal or 0)
end

function VSDTrain3_GetGuideText()
    return format("h­íng dÉn chÕ ®é 3\nbËt chÕ ®é 3 ch­a t¹o qu¸i ngay\nnh©n vËt g©y s¸t th­¬ng qu¸i ®Ó kÝch ho¹t\nkhi ®ñ kho¶ng c¸ch th× më b·i míi\nqu¸i bï chÕt lµ hÕt\nmçi b·i tù dän khi nh©n vËt ®i qu¸ %d «\ncÊu h×nh vµ tr¹ng th¸i bËt ®­îc l­u tù ®éng", VSD_TRAIN3_LEAVE_DISTANCE)
end

function VSDTrain3_GetPersistenceText()
    local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
    local nSavedMap = VSDTrain3_GetSavedEnabledMap()
    local szState = "t¾t"
    if nSavedMap and nSavedMap >= 0 then szState = "bËt b¶n ®å "..nSavedMap end
    return format("l­u chÕ ®é 3\ncÊu h×nh: >=%d « | ngÉu nhiªn %d-%d qu¸i\ntr¹ng th¸i ®· l­u: %s\nkhi m¸y chñ khëi ®éng l¹i: tù n¹p khi ®¨ng nhËp ®óng b¶n ®å ®· l­u.\nqu¸i cò tr­íc khi khëi ®éng l¹i kh«ng ®­îc håi sinh l¹i.", c.nNewBatchDistance, c.nExtraMin, c.nExtraMax, szState)
end

function VSDTrain3_GetDiagnosePage()
    if not PlayerIndex or PlayerIndex <= 0 then return "chÈn ®o¸n chÕ ®é 3\nkh«ng ®äc ®­îc nh©n vËt." end
    local nApi, szMissing = VSDTrain3_CheckApi()
    if nApi ~= 1 then return "chÈn ®o¸n chÕ ®é 3\nthiÕu hµm: "..(szMissing or "kh«ng râ") end
    local pW = GetWorldPos()
    local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
    local t = g_tbVSDTrain3MapManager[pW]
    local tbCatalog
    if t and t.tbCatalogMeta then
        tbCatalog = {tbMeta=t.tbCatalogMeta, nRows=t.nCatalogRows or 0, nEligibleRows=t.nCatalogEligible or 0}
    else
        tbCatalog = VSDTrain3_LoadCatalogSnapshot()
        if not tbCatalog then return "chÈn ®o¸n chÕ ®é 3\nkh«ng ®äc ®­îc danh môc qu¸i." end
    end
    local tbTemp = {nLastAroundRaw=0, nLastEligible=0, nLastCatalogReject=0, nLastRuntimeNameMismatch=0, tbCatalogMeta=tbCatalog.tbMeta}
    local tbCurrent = VSDTrain3_CollectCurrent(tbTemp)
    local nDist = t and VSDTrain3_GetManagerDistance(t) or c.nNewBatchDistance
    local nMin, nMax
    if t then nMin, nMax = VSDTrain3_GetManagerExtraRange(t) else nMin, nMax = c.nExtraMin, c.nExtraMax end
    return format("chÈn ®o¸n chÕ ®é 3 - b¶n ®å %d\nqu¸i quanh: %d | hîp lÖ: %d | bÞ lo¹i: %d\ndanh môc qu¸i gèc: %d/%d\nquÐt sinh lùc: %d nhÞp | b·i míi >=%d «\nngÉu nhiªn %d-%d | tõng b·i xãa >%d «", pW, tbTemp.nLastAroundRaw or 0, getn(tbCurrent), tbTemp.nLastCatalogReject or 0, tbCatalog.nEligibleRows or 0, tbCatalog.nRows or 0, VSD_TRAIN3_SCAN_INTERVAL, nDist, nMin, nMax, VSD_TRAIN3_LEAVE_DISTANCE)
end

function VSDTrain3_GetStatusText()
    if not PlayerIndex or PlayerIndex <= 0 then return "chÕ ®é 3 kh«ng ®äc ®­îc nh©n vËt" end
    local pW = GetWorldPos()
    local t = g_tbVSDTrain3MapManager[pW]
    if not t then
        local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
        return format("chÕ ®é 3 ®ang t¾t\nb¶n ®å %d\nkho¶ng c¸ch më b·i %d\nsè qu¸i tõ %d ®Õn %d", pW, c.nNewBatchDistance, c.nExtraMin, c.nExtraMax)
    end
    local nDist = VSDTrain3_GetManagerDistance(t)
    local nMin, nMax = VSDTrain3_GetManagerExtraRange(t)
    local nLive = VSDTrain3_CountLive(t)
    local nBatchCount = t.tbBatches and getn(t.tbBatches) or 0
    return format("chÕ ®é 3 ®ang bËt\nb¶n ®å %d\nsè b·i ®ang gi÷ %d\nqu¸i bï ®ang sèng %d\nkho¶ng c¸ch më b·i %d\nsè qu¸i tõ %d ®Õn %d\nlÇn g©y s¸t th­¬ng %d\ntæng b·i ®· më %d", pW, nBatchCount, nLive, nDist, nMin, nMax, t.nDamageEvents or 0, t.nTriggerTotal or 0)
end

function VSDTrain3_Diagnose()
    if not PlayerIndex or PlayerIndex <= 0 then return "chÈn ®o¸n chÕ ®é 3 kh«ng ®äc ®­îc nh©n vËt" end
    local nApi, szMissing = VSDTrain3_CheckApi()
    if nApi ~= 1 then return "chÈn ®o¸n chÕ ®é 3 thiÕu hµm "..(szMissing or "kh«ng râ") end
    local pW = GetWorldPos()
    local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
    local t = g_tbVSDTrain3MapManager[pW]
    local tbCatalog = nil
    if t and t.tbCatalogMeta then
        tbCatalog = {tbMeta=t.tbCatalogMeta, nRows=t.nCatalogRows or 0, nEligibleRows=t.nCatalogEligible or 0, nTrimmedRows=t.nCatalogTrimmed or 0}
    else
        tbCatalog = VSDTrain3_LoadCatalogSnapshot()
        if not tbCatalog then return "chÈn ®o¸n chÕ ®é 3 kh«ng ®äc ®­îc danh s¸ch qu¸i gèc" end
    end
    local tbTemp = {nLastAroundRaw=0, nLastEligible=0, nLastCatalogReject=0, nLastRuntimeNameMismatch=0, tbCatalogMeta=tbCatalog.tbMeta}
    local tbCurrent = VSDTrain3_CollectCurrent(tbTemp)
    local nDist = t and VSDTrain3_GetManagerDistance(t) or c.nNewBatchDistance
    local nMin, nMax
    if t then nMin, nMax = VSDTrain3_GetManagerExtraRange(t) else nMin, nMax = c.nExtraMin, c.nExtraMax end
    return format("chÈn ®o¸n chÕ ®é 3\nb¶n ®å %d\nqu¸i quanh nh©n vËt %d\nqu¸i hîp lÖ %d\nmÉu qu¸i gèc hîp lÖ %d\nquÐt s¸t th­¬ng mçi %d nhÞp\nkho¶ng c¸ch më b·i %d\nsè qu¸i tõ %d ®Õn %d", pW, tbTemp.nLastAroundRaw or 0, getn(tbCurrent), tbCatalog.nEligibleRows or 0, VSD_TRAIN3_SCAN_INTERVAL, nDist, nMin, nMax)
end

