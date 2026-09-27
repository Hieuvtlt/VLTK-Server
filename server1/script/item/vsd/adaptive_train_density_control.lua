IncludeLib("NPCINFO")

-- V5.24 - Adaptive train density for the whole ACTIVE map; Mode1 logic preserved, Mode3 conflict added.
-- Source-native design:
--   * GetMapPlayerList(-1, 1): exact server pattern to enumerate players in the current map.
--   * GetAroundNpcList(radius): exact server pattern to inspect NPCs around each real player.
--   * GetNpcSettingIdx + GetNpcKind == 0 + NPCINFO_GetLevel: exact pthanhthi.lua classifier base.
--   * GetNpcPowerType == 1 is preferred when available; Kind=0 remains compatibility fallback.
--   * AddNpcEx(..., revive=1, boss=0): spawned extras do not engine-respawn and are never bosses.
--   * GetNpcId + NpcIdx2PIdx + DelNpc: safe cleanup of only NPC instances created by this module.
--
-- IMPORTANT: "whole map" here means every train spot around players who are actually present on the map.
-- Empty/off-screen sectors are intentionally not scanned or populated. This keeps load bounded and follows
-- the APIs actually proven in this server source.

VSD_TRAIN_SCAN_RADIUS = 60
VSD_TRAIN_CLUSTER_RADIUS = 20
VSD_TRAIN_EDGE_EXPAND_RADIUS = 15 -- exact server source uses GetNpcAroundNpcList(nNpcIndex, 15)
VSD_TRAIN_EDGE_START_DISTANCE = 40 -- only expand seeds near the outer part of the player scan
VSD_TRAIN_EFFECTIVE_DISTANCE_FALLBACK = 60 -- GetAroundNpcList(60) is the largest proven player-centered radius
VSD_TRAIN_EFFECTIVE_DISTANCE_EXPANDED = 75 -- 60 player scan + one source-proven 15 NPC-centered expansion
VSD_TRAIN_MAX_EXPAND_CALLS_PER_PLAYER = 24 -- load guard; expansion is optional and bounded
VSD_TRAIN_SPOT_MATCH_RADIUS = 20
VSD_TRAIN_MIN_NATURAL = 3
VSD_TRAIN_TARGET_MIN = 8
VSD_TRAIN_TARGET_MAX = 10
VSD_TRAIN_SCAN_INTERVAL = 10 * 18
VSD_TRAIN_SPAWN_OFFSET = 5
VSD_TRAIN_MAX_SPOTS_PER_MAP = 24
VSD_TRAIN_MAX_EXTRA_PER_SPOT = 50
VSD_TRAIN_CONFIG_TARGET_MIN = 3
VSD_TRAIN_CONFIG_TARGET_MAX = 50
VSD_TRAIN_MAX_GLOBAL_EXTRA = 160
VSD_TRAIN_ADD_TRY_FACTOR = 5

-- Runtime only. Nothing is persisted in Task/login.
g_tbVSDTrainMapManager = g_tbVSDTrainMapManager or {}
g_tbVSDTrainOwnerMap = g_tbVSDTrainOwnerMap or {}
g_tbVSDTrainGenerated = g_tbVSDTrainGenerated or {}
g_nVSDTrainManagerSeed = g_nVSDTrainManagerSeed or 0
g_nVSDTrainSpotSeed = g_nVSDTrainSpotSeed or 0
g_nVSDTrainLiveExtra = g_nVSDTrainLiveExtra or 0
g_szVSDTrainLastError = g_szVSDTrainLastError or ""
g_tbVSDTrainUserConfig = g_tbVSDTrainUserConfig or {}

function VSDTrain_Log(szMsg)
    if WriteLog then
        WriteLog("VSD_TRAIN_MAP: "..szMsg)
    elseif print then
        print("VSD_TRAIN_MAP: "..szMsg)
    end
end

function VSDTrain_SetError(szMsg)
    g_szVSDTrainLastError = szMsg or ""
    if g_szVSDTrainLastError ~= "" then
        VSDTrain_Log("ERROR "..g_szVSDTrainLastError)
    end
end

function VSDTrain_Distance2(x1, y1, x2, y2)
    local dx = x1 - x2
    local dy = y1 - y2
    return dx * dx + dy * dy
end

function VSDTrain_GetOwnerKey()
    return GetAccount().."|"..GetName()
end

function VSDTrain_ClampTarget(nValue, nDefault)
    local n = tonumber(nValue)
    if n == nil then n = nDefault end
    n = floor(n)
    if n < VSD_TRAIN_CONFIG_TARGET_MIN then n = VSD_TRAIN_CONFIG_TARGET_MIN end
    if n > VSD_TRAIN_CONFIG_TARGET_MAX then n = VSD_TRAIN_CONFIG_TARGET_MAX end
    return n
end

function VSDTrain_DefaultConfig()
    return {
        nTargetMin = VSD_TRAIN_TARGET_MIN,
        nTargetMax = VSD_TRAIN_TARGET_MAX,
    }
end

function VSDTrain_NormalizeConfig(c)
    if not c then c = VSDTrain_DefaultConfig() end
    c.nTargetMin = VSDTrain_ClampTarget(c.nTargetMin, VSD_TRAIN_TARGET_MIN)
    c.nTargetMax = VSDTrain_ClampTarget(c.nTargetMax, VSD_TRAIN_TARGET_MAX)
    if c.nTargetMin > c.nTargetMax then c.nTargetMax = c.nTargetMin end
    return c
end

function VSDTrain_GetOwnerConfig()
    if not PlayerIndex or PlayerIndex <= 0 then return nil end
    local szKey = VSDTrain_GetOwnerKey()
    local c = g_tbVSDTrainUserConfig[szKey]
    if not c then
        c = VSDTrain_DefaultConfig()
        g_tbVSDTrainUserConfig[szKey] = c
    end
    return VSDTrain_NormalizeConfig(c)
end

function VSDTrain_ApplyOwnerTargetToActive(c)
    if not c or not PlayerIndex or PlayerIndex <= 0 then return 0 end
    local pW = GetWorldPos()
    local t = g_tbVSDTrainMapManager[pW]
    if not t then return 0 end
    if t.szOwnerName ~= GetName() or t.szOwnerAccount ~= GetAccount() then return 0 end
    t.nTargetMin = c.nTargetMin
    t.nTargetMax = c.nTargetMax
    local i
    for i = 1, getn(t.tbSpots or {}) do
        local s = t.tbSpots[i]
        if s then s.nTarget = random(c.nTargetMin, c.nTargetMax) end
    end
    return 1
end

function VSDTrain_SetTargetMin(nValue)
    local c = VSDTrain_GetOwnerConfig()
    if not c then return nil, nil end
    c.nTargetMin = VSDTrain_ClampTarget(nValue, c.nTargetMin)
    if c.nTargetMin > c.nTargetMax then c.nTargetMax = c.nTargetMin end
    VSDTrain_ApplyOwnerTargetToActive(c)
    return c.nTargetMin, c.nTargetMax
end

function VSDTrain_SetTargetMax(nValue)
    local c = VSDTrain_GetOwnerConfig()
    if not c then return nil, nil end
    c.nTargetMax = VSDTrain_ClampTarget(nValue, c.nTargetMax)
    if c.nTargetMax < c.nTargetMin then c.nTargetMin = c.nTargetMax end
    VSDTrain_ApplyOwnerTargetToActive(c)
    return c.nTargetMin, c.nTargetMax
end

function VSDTrain_ResetOwnerConfig()
    if not PlayerIndex or PlayerIndex <= 0 then return nil end
    local szKey = VSDTrain_GetOwnerKey()
    local c = VSDTrain_DefaultConfig()
    g_tbVSDTrainUserConfig[szKey] = c
    VSDTrain_ApplyOwnerTargetToActive(c)
    return c
end

function VSDTrain_NewManagerId()
    g_nVSDTrainManagerSeed = g_nVSDTrainManagerSeed + 1
    return g_nVSDTrainManagerSeed
end

function VSDTrain_NewSpotId()
    g_nVSDTrainSpotSeed = g_nVSDTrainSpotSeed + 1
    return g_nVSDTrainSpotSeed
end

function VSDTrain_CheckApi()
    local tbNeed = {
        {"GetMapPlayerList", GetMapPlayerList},
        {"GetAroundNpcList", GetAroundNpcList},
        {"GetNpcPos", GetNpcPos},
        {"GetNpcSettingIdx", GetNpcSettingIdx},
        {"GetNpcKind", GetNpcKind},
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

function VSDTrain_ClearGenerated(nNpcIndex, dwNpcId)
    local tbRec = g_tbVSDTrainGenerated[nNpcIndex]
    if not tbRec then return 0 end
    if dwNpcId and tbRec.dwNpcId ~= dwNpcId then return 0 end
    g_tbVSDTrainGenerated[nNpcIndex] = nil
    if g_nVSDTrainLiveExtra > 0 then
        g_nVSDTrainLiveExtra = g_nVSDTrainLiveExtra - 1
    end
    return 1
end

function VSDTrain_GetGenerated(nNpcIndex)
    if not nNpcIndex or nNpcIndex <= 0 then return nil end
    local tbRec = g_tbVSDTrainGenerated[nNpcIndex]
    if not tbRec then return nil end
    local dwNow = GetNpcId(nNpcIndex)
    if not dwNow or dwNow <= 0 or dwNow ~= tbRec.dwNpcId then
        VSDTrain_ClearGenerated(nNpcIndex, tbRec.dwNpcId)
        return nil
    end
    return tbRec
end

function VSDTrain_SafeDeleteEntry(tbEntry)
    if not tbEntry or not tbEntry.nIndex or tbEntry.nIndex <= 0 then return 0 end
    local tbRec = VSDTrain_GetGenerated(tbEntry.nIndex)
    if not tbRec or tbRec.dwNpcId ~= tbEntry.dwNpcId then return 0 end
    local nPlayer = NpcIdx2PIdx(tbEntry.nIndex)
    if nPlayer and nPlayer > 0 then
        VSDTrain_Log("SAFE_DELETE_BLOCK idx="..tbEntry.nIndex)
        return 0
    end
    DelNpc(tbEntry.nIndex)
    VSDTrain_ClearGenerated(tbEntry.nIndex, tbEntry.dwNpcId)
    return 1
end

function VSDTrain_PruneSpot(tbSpot)
    local tbKeep = {}
    local i
    for i = 1, getn(tbSpot.tbGenerated) do
        local e = tbSpot.tbGenerated[i]
        if e and VSDTrain_GetGenerated(e.nIndex) then
            tinsert(tbKeep, e)
        end
    end
    tbSpot.tbGenerated = tbKeep
    return getn(tbKeep)
end

function VSDTrain_DeleteSpotExtra(tbSpot, nNeed)
    if nNeed <= 0 then return 0 end
    VSDTrain_PruneSpot(tbSpot)
    local tbKeep = {}
    local nDeleted = 0
    local i
    for i = 1, getn(tbSpot.tbGenerated) do
        local e = tbSpot.tbGenerated[i]
        if nDeleted < nNeed then
            if VSDTrain_SafeDeleteEntry(e) == 1 then
                nDeleted = nDeleted + 1
            else
                if VSDTrain_GetGenerated(e.nIndex) then tinsert(tbKeep, e) end
            end
        else
            tinsert(tbKeep, e)
        end
    end
    tbSpot.tbGenerated = tbKeep
    tbSpot.nDeletedTotal = tbSpot.nDeletedTotal + nDeleted
    return nDeleted
end

function VSDTrain_CleanupSpot(tbSpot)
    if not tbSpot then return 0 end
    VSDTrain_PruneSpot(tbSpot)
    return VSDTrain_DeleteSpotExtra(tbSpot, getn(tbSpot.tbGenerated))
end

function VSDTrain_CleanupManager(tbManager)
    if not tbManager then return 0 end
    local nDeleted = 0
    local i
    for i = 1, getn(tbManager.tbSpots) do
        nDeleted = nDeleted + VSDTrain_CleanupSpot(tbManager.tbSpots[i])
    end
    tbManager.tbSpots = {}
    return nDeleted
end

function VSDTrain_StopMap(nWorld, szReason, bFromTimer)
    local tbManager = g_tbVSDTrainMapManager[nWorld]
    if not tbManager then return 0 end
    if tbManager.nTimerId and tbManager.nTimerId > 0 and bFromTimer ~= 1 then
        DelTimer(tbManager.nTimerId)
    end
    tbManager.nTimerId = 0
    local nDeleted = VSDTrain_CleanupManager(tbManager)
    if tbManager.szOwnerKey and g_tbVSDTrainOwnerMap[tbManager.szOwnerKey] == nWorld then
        g_tbVSDTrainOwnerMap[tbManager.szOwnerKey] = nil
    end
    g_tbVSDTrainMapManager[nWorld] = nil
    VSDTrain_Log("STOP map="..nWorld.." reason="..(szReason or "manual").." deleted="..nDeleted)
    return nDeleted
end

-- Classify one NPC index using the same source-native filters as the direct scan.
-- Returns the natural-NPC info table only when a NEW eligible NPC was appended.
function VSDTrain_TryCollectNaturalIndex(idx, tbNatural, tbNaturalSeen, tbGeneratedSeen, tbStats, bExpanded)
    if not idx or idx <= 0 then return nil end

    local tbGen = VSDTrain_GetGenerated(idx)
    if tbGen then
        if not tbGeneratedSeen[idx] then
            tbGeneratedSeen[idx] = 1
            tbStats.nGeneratedSeen = tbStats.nGeneratedSeen + 1
        end
        return nil
    end

    local nPlayer = NpcIdx2PIdx(idx)
    if nPlayer and nPlayer > 0 then return nil end
    if tbNaturalSeen[idx] then return nil end

    local nSetting = GetNpcSettingIdx(idx)
    local nKind = GetNpcKind(idx)
    if not nSetting or nSetting <= 0 or nKind ~= 0 then return nil end

    local x32, y32 = GetNpcPos(idx)
    local nLevel = NPCINFO_GetLevel(idx)
    local nSeries = GetNpcSeries(idx)
    local szName = GetNpcName(idx)
    if not x32 or not y32 or not nLevel or nLevel <= 0 or nSeries == nil or not szName then return nil end

    local nPower = -1
    if GetNpcPowerType then nPower = GetNpcPowerType(idx) end
    local nParam4 = 0
    if GetNpcParam then nParam4 = GetNpcParam(idx, 4) or 0 end
    local bSimLike = 0
    if nParam4 == 1 or nParam4 == 2 then bSimLike = 1 end
    local bStrict = 0
    if nPower == 1 then bStrict = 1 end

    tbNaturalSeen[idx] = 1
    if bSimLike == 1 then
        tbStats.nSimLike = tbStats.nSimLike + 1
        return nil
    end

    local info = {
        nIndex = idx,
        nX = floor(x32 / 32),
        nY = floor(y32 / 32),
        nSettingIdx = nSetting,
        nLevel = nLevel,
        nSeries = nSeries,
        szName = szName,
        nPower = nPower,
        bStrict = bStrict,
    }
    tinsert(tbNatural, info)
    tbStats.nCompat = tbStats.nCompat + 1
    if bStrict == 1 then tbStats.nStrict = tbStats.nStrict + 1 end
    if bExpanded == 1 then tbStats.nExpandAdded = tbStats.nExpandAdded + 1 end
    return info
end

-- Direct player scan remains exactly GetAroundNpcList(60), because 60 is the largest literal radius
-- proven in this server source. V5.23 optionally expands from EDGE monster seeds with the separate
-- source-proven GetNpcAroundNpcList(nNpcIndex, 15), bounded by a strict per-player call cap.
function VSDTrain_ReadAroundCurrentPlayer(nRadius, tbNatural, tbNaturalSeen, tbGeneratedSeen, tbStats, pX, pY)
    local tbNpc, nEngineCount = GetAroundNpcList(nRadius)
    if not tbNpc then tbNpc = {} end

    local tbFrontier = {}
    local nEdge2 = VSD_TRAIN_EDGE_START_DISTANCE * VSD_TRAIN_EDGE_START_DISTANCE
    local i
    for i = 1, getn(tbNpc) do
        local idx = tbNpc[i]
        if idx and idx > 0 then
            tbStats.nRawCalls = tbStats.nRawCalls + 1
            local info = VSDTrain_TryCollectNaturalIndex(idx, tbNatural, tbNaturalSeen, tbGeneratedSeen, tbStats, 0)
            if info and pX and pY and VSDTrain_Distance2(info.nX, info.nY, pX, pY) >= nEdge2 then
                tinsert(tbFrontier, info.nIndex)
            end
        end
    end

    if nEngineCount and nEngineCount > tbStats.nMaxRawOnePlayer then
        tbStats.nMaxRawOnePlayer = nEngineCount
    end

    if not GetNpcAroundNpcList or getn(tbFrontier) <= 0 then return end
    tbStats.nExpandApi = 1

    local nCalls = 0
    -- One bounded edge hop only: proven player scan 60 + proven NPC-centered radius 15 = effective 75.
    -- Do not chain another hop, because that would silently extend beyond the source-grounded 75 design.
    for i = 1, getn(tbFrontier) do
        if nCalls >= VSD_TRAIN_MAX_EXPAND_CALLS_PER_PLAYER then break end
        local nSeed = tbFrontier[i]
        local tbNear, nNearCount = GetNpcAroundNpcList(nSeed, VSD_TRAIN_EDGE_EXPAND_RADIUS)
        nCalls = nCalls + 1
        tbStats.nExpandCalls = tbStats.nExpandCalls + 1
        if type(tbNear) == "table" then
            local j
            for j = 1, getn(tbNear) do
                local idx = tbNear[j]
                tbStats.nExpandRaw = tbStats.nExpandRaw + 1
                -- GetNpcAroundNpcList(seed,15) is the only expansion call. Any returned monster can
                -- therefore be at most about 75 from the player when the seed came from radius60.
                VSDTrain_TryCollectNaturalIndex(idx, tbNatural, tbNaturalSeen, tbGeneratedSeen, tbStats, 1)
            end
        end
    end
end

-- Exact-server whole-map collection: GetMapPlayerList(-1,1), then proximity scan around every real player.
function VSDTrain_CollectMapView(nWorld)
    local nOldPlayer = PlayerIndex
    local tbPlayers = GetMapPlayerList(-1, 1)
    if type(tbPlayers) ~= "table" then tbPlayers = {} end

    local tbNatural = {}
    local tbNaturalSeen = {}
    local tbGeneratedSeen = {}
    local tbPlayerPos = {}
    local tbStats = {
        nPlayers = 0,
        nRawCalls = 0,
        nMaxRawOnePlayer = 0,
        nStrict = 0,
        nCompat = 0,
        nSimLike = 0,
        nGeneratedSeen = 0,
        nExpandApi = 0,
        nExpandCalls = 0,
        nExpandRaw = 0,
        nExpandAdded = 0,
    }

    local i
    for i = 1, getn(tbPlayers) do
        local nP = tbPlayers[i]
        if nP and nP > 0 then
            PlayerIndex = nP
            local pW, pX, pY = GetWorldPos()
            if pW == nWorld then
                tbStats.nPlayers = tbStats.nPlayers + 1
                tinsert(tbPlayerPos, {nIndex=nP, nX=pX, nY=pY})
                VSDTrain_ReadAroundCurrentPlayer(VSD_TRAIN_SCAN_RADIUS, tbNatural, tbNaturalSeen, tbGeneratedSeen, tbStats, pX, pY)
            end
        end
    end
    PlayerIndex = nOldPlayer
    return tbNatural, tbPlayerPos, tbStats
end

function VSDTrain_IsCenterManageable(nX, nY, tbPlayerPos, nManageDistance)
    local nMax = nManageDistance or VSD_TRAIN_EFFECTIVE_DISTANCE_FALLBACK
    local nMax2 = nMax * nMax
    local i
    for i = 1, getn(tbPlayerPos) do
        local p = tbPlayerPos[i]
        if VSDTrain_Distance2(nX, nY, p.nX, p.nY) <= nMax2 then return 1 end
    end
    return 0
end

function VSDTrain_FindBestUnusedMembers(tbNatural, tbUsed, nMode)
    local nRadius2 = VSD_TRAIN_CLUSTER_RADIUS * VSD_TRAIN_CLUSTER_RADIUS
    local nBestCount = 0
    local tbBest = nil
    local i, j
    for i = 1, getn(tbNatural) do
        local seed = tbNatural[i]
        if not tbUsed[seed.nIndex] and (nMode ~= 1 or seed.bStrict == 1) then
            local tbMembers = {}
            for j = 1, getn(tbNatural) do
                local n = tbNatural[j]
                if not tbUsed[n.nIndex] and (nMode ~= 1 or n.bStrict == 1) then
                    if VSDTrain_Distance2(seed.nX, seed.nY, n.nX, n.nY) <= nRadius2 then
                        tinsert(tbMembers, n)
                    end
                end
            end
            if getn(tbMembers) >= VSD_TRAIN_MIN_NATURAL and getn(tbMembers) > nBestCount then
                nBestCount = getn(tbMembers)
                tbBest = tbMembers
            end
        end
    end
    return tbBest
end

function VSDTrain_MakeCandidate(tbMembers, nMode)
    if not tbMembers or getn(tbMembers) < VSD_TRAIN_MIN_NATURAL then return nil end
    local nSumX = 0
    local nSumY = 0
    local tbSamples = {}
    local i
    for i = 1, getn(tbMembers) do
        local n = tbMembers[i]
        nSumX = nSumX + n.nX
        nSumY = nSumY + n.nY
        tinsert(tbSamples, {
            nX = n.nX,
            nY = n.nY,
            nSettingIdx = n.nSettingIdx,
            nLevel = n.nLevel,
            nSeries = n.nSeries,
            szName = n.szName,
        })
    end
    return {
        nX = floor(nSumX / getn(tbMembers)),
        nY = floor(nSumY / getn(tbMembers)),
        nNatural = getn(tbMembers),
        nMode = nMode,
        tbSamples = tbSamples,
        tbMembers = tbMembers,
    }
end

-- Partition the currently observed natural monsters into independent train spots.
-- Strict PowerType=1 groups are extracted first; Kind=0 groups are only a fallback for remaining NPCs.
function VSDTrain_BuildCandidates(tbNatural, tbPlayerPos, nManageDistance)
    local tbCandidates = {}
    local tbUsed = {}
    local nGuard = 0
    while nGuard < VSD_TRAIN_MAX_SPOTS_PER_MAP * 2 do
        nGuard = nGuard + 1
        local tbMembers = VSDTrain_FindBestUnusedMembers(tbNatural, tbUsed, 1)
        local nMode = 1
        if not tbMembers then
            tbMembers = VSDTrain_FindBestUnusedMembers(tbNatural, tbUsed, 2)
            nMode = 2
        end
        if not tbMembers then break end

        local i
        for i = 1, getn(tbMembers) do tbUsed[tbMembers[i].nIndex] = 1 end
        local c = VSDTrain_MakeCandidate(tbMembers, nMode)
        if c and VSDTrain_IsCenterManageable(c.nX, c.nY, tbPlayerPos, nManageDistance) == 1 then
            tinsert(tbCandidates, c)
            if getn(tbCandidates) >= VSD_TRAIN_MAX_SPOTS_PER_MAP then break end
        end
    end
    return tbCandidates
end

function VSDTrain_ModeText(nMode)
    if nMode == 1 then return "Chuan PowerType=1" end
    if nMode == 2 then return "Tuong thich Kind=0" end
    return "Chua xac dinh"
end

function VSDTrain_NewSpot(tbManager, tbCandidate)
    local tbSpot = {
        nSpotId = VSDTrain_NewSpotId(),
        nX = tbCandidate.nX,
        nY = tbCandidate.nY,
        nMode = tbCandidate.nMode,
        nTarget = random(tbManager.nTargetMin or VSD_TRAIN_TARGET_MIN, tbManager.nTargetMax or VSD_TRAIN_TARGET_MAX),
        tbSamples = tbCandidate.tbSamples,
        tbGenerated = {},
        nCreatedTotal = 0,
        nDeletedTotal = 0,
        nAddFailTotal = 0,
        nLastNatural = tbCandidate.nNatural,
        nLastOwnExtra = 0,
        nLastCurrent = tbCandidate.nNatural,
        nLastAdded = 0,
        nLastDeleted = 0,
        nMatchedScan = tbManager.nScanCount,
    }
    VSDTrain_Log("DISCOVER map="..tbManager.nWorld.." spot="..tbSpot.nSpotId.." x="..tbSpot.nX.." y="..tbSpot.nY.." mode="..tbSpot.nMode.." natural="..tbSpot.nLastNatural.." target="..tbSpot.nTarget)
    return tbSpot
end

function VSDTrain_UpdateSpotFromCandidate(tbManager, tbSpot, tbCandidate)
    tbSpot.nX = tbCandidate.nX
    tbSpot.nY = tbCandidate.nY
    tbSpot.nMode = tbCandidate.nMode
    tbSpot.tbSamples = tbCandidate.tbSamples
    tbSpot.nMatchedScan = tbManager.nScanCount
end

function VSDTrain_MatchCandidates(tbManager, tbCandidates)
    local tbMatchedSpot = {}
    local i, j
    local nMatch2 = VSD_TRAIN_SPOT_MATCH_RADIUS * VSD_TRAIN_SPOT_MATCH_RADIUS

    for i = 1, getn(tbCandidates) do
        local c = tbCandidates[i]
        local nBest = 0
        local nBestD2 = nil
        for j = 1, getn(tbManager.tbSpots) do
            local s = tbManager.tbSpots[j]
            if not tbMatchedSpot[j] and s.nMode == c.nMode then
                local d2 = VSDTrain_Distance2(s.nX, s.nY, c.nX, c.nY)
                if d2 <= nMatch2 and (nBestD2 == nil or d2 < nBestD2) then
                    nBest = j
                    nBestD2 = d2
                end
            end
        end
        if nBest > 0 then
            tbMatchedSpot[nBest] = 1
            VSDTrain_UpdateSpotFromCandidate(tbManager, tbManager.tbSpots[nBest], c)
        elseif getn(tbManager.tbSpots) < VSD_TRAIN_MAX_SPOTS_PER_MAP then
            tinsert(tbManager.tbSpots, VSDTrain_NewSpot(tbManager, c))
            tbMatchedSpot[getn(tbManager.tbSpots)] = 1
        else
            tbManager.nSpotCapHits = tbManager.nSpotCapHits + 1
        end
    end
end

function VSDTrain_CountNaturalAtSpot(tbSpot, tbNatural)
    local nRadius2 = VSD_TRAIN_CLUSTER_RADIUS * VSD_TRAIN_CLUSTER_RADIUS
    local nCount = 0
    local i
    for i = 1, getn(tbNatural) do
        local n = tbNatural[i]
        if (tbSpot.nMode ~= 1 or n.bStrict == 1) and VSDTrain_Distance2(tbSpot.nX, tbSpot.nY, n.nX, n.nY) <= nRadius2 then
            nCount = nCount + 1
        end
    end
    return nCount
end

function VSDTrain_AddMissing(tbManager, tbSpot, nNeed)
    if nNeed <= 0 then return 0 end
    if not tbSpot.tbSamples or getn(tbSpot.tbSamples) <= 0 then return 0 end
    local nMapIdx = SubWorldID2Idx(tbManager.nWorld)
    if not nMapIdx or nMapIdx < 0 then return 0 end

    local nOwn = VSDTrain_PruneSpot(tbSpot)
    local nAllowSpot = VSD_TRAIN_MAX_EXTRA_PER_SPOT - nOwn
    local nAllowGlobal = VSD_TRAIN_MAX_GLOBAL_EXTRA - g_nVSDTrainLiveExtra
    if nNeed > nAllowSpot then nNeed = nAllowSpot end
    if nNeed > nAllowGlobal then nNeed = nAllowGlobal end
    if nNeed <= 0 then
        tbManager.nExtraCapHits = tbManager.nExtraCapHits + 1
        return 0
    end

    local nCreated = 0
    local nTry = 0
    local nMaxTry = nNeed * VSD_TRAIN_ADD_TRY_FACTOR
    while nCreated < nNeed and nTry < nMaxTry do
        nTry = nTry + 1
        local s = tbSpot.tbSamples[random(1, getn(tbSpot.tbSamples))]
        local nNpcIndex = AddNpcEx(
            s.nSettingIdx,
            s.nLevel,
            s.nSeries,
            nMapIdx,
            (s.nX + random(-VSD_TRAIN_SPAWN_OFFSET, VSD_TRAIN_SPAWN_OFFSET)) * 32,
            (s.nY + random(-VSD_TRAIN_SPAWN_OFFSET, VSD_TRAIN_SPAWN_OFFSET)) * 32,
            1,
            s.szName,
            0
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
                local e = {nIndex=nNpcIndex, dwNpcId=dwNpcId}
                tinsert(tbSpot.tbGenerated, e)
                g_tbVSDTrainGenerated[nNpcIndex] = {
                    dwNpcId = dwNpcId,
                    nManagerId = tbManager.nManagerId,
                    nWorld = tbManager.nWorld,
                    nSpotId = tbSpot.nSpotId,
                }
                g_nVSDTrainLiveExtra = g_nVSDTrainLiveExtra + 1
                tbSpot.nCreatedTotal = tbSpot.nCreatedTotal + 1
                tbManager.nCreatedTotal = tbManager.nCreatedTotal + 1
                nCreated = nCreated + 1
            else
                if NpcIdx2PIdx(nNpcIndex) <= 0 then DelNpc(nNpcIndex) end
                tbSpot.nAddFailTotal = tbSpot.nAddFailTotal + 1
                tbManager.nAddFailTotal = tbManager.nAddFailTotal + 1
            end
        else
            tbSpot.nAddFailTotal = tbSpot.nAddFailTotal + 1
            tbManager.nAddFailTotal = tbManager.nAddFailTotal + 1
        end
    end
    return nCreated
end

function VSDTrain_BalanceSpot(tbManager, tbSpot, tbNatural)
    local nNatural = VSDTrain_CountNaturalAtSpot(tbSpot, tbNatural)
    local nOwn = VSDTrain_PruneSpot(tbSpot)
    local nCurrent = nNatural + nOwn
    local nAdded = 0
    local nDeleted = 0

    if nCurrent < tbSpot.nTarget then
        nAdded = VSDTrain_AddMissing(tbManager, tbSpot, tbSpot.nTarget - nCurrent)
        nOwn = nOwn + nAdded
        nCurrent = nNatural + nOwn
    elseif nCurrent > tbSpot.nTarget and nOwn > 0 then
        local nNeedDelete = nCurrent - tbSpot.nTarget
        if nNeedDelete > nOwn then nNeedDelete = nOwn end
        nDeleted = VSDTrain_DeleteSpotExtra(tbSpot, nNeedDelete)
        tbManager.nDeletedTotal = tbManager.nDeletedTotal + nDeleted
        nOwn = nOwn - nDeleted
        nCurrent = nNatural + nOwn
    end

    tbSpot.nLastNatural = nNatural
    tbSpot.nLastOwnExtra = VSDTrain_PruneSpot(tbSpot)
    tbSpot.nLastCurrent = nNatural + tbSpot.nLastOwnExtra
    tbSpot.nLastAdded = nAdded
    tbSpot.nLastDeleted = nDeleted
    if nAdded > 0 or nDeleted > 0 then
        VSDTrain_Log("BALANCE map="..tbManager.nWorld.." spot="..tbSpot.nSpotId.." target="..tbSpot.nTarget.." natural="..nNatural.." own="..tbSpot.nLastOwnExtra.." add="..nAdded.." del="..nDeleted)
    end
end

function VSDTrain_ScanMap(tbManager)
    local tbNatural, tbPlayerPos, tbStats = VSDTrain_CollectMapView(tbManager.nWorld)
    tbManager.nScanCount = tbManager.nScanCount + 1
    tbManager.nLastPlayers = tbStats.nPlayers
    tbManager.nLastNaturalSeen = getn(tbNatural)
    tbManager.nLastStrict = tbStats.nStrict
    tbManager.nLastCompat = tbStats.nCompat
    tbManager.nLastSimLike = tbStats.nSimLike
    tbManager.nLastRawCalls = tbStats.nRawCalls
    tbManager.nLastMaxRawOnePlayer = tbStats.nMaxRawOnePlayer
    tbManager.nLastExpandApi = tbStats.nExpandApi
    tbManager.nLastExpandCalls = tbStats.nExpandCalls
    tbManager.nLastExpandAdded = tbStats.nExpandAdded
    local nManageDistance = VSD_TRAIN_EFFECTIVE_DISTANCE_FALLBACK
    if tbStats.nExpandApi == 1 then nManageDistance = VSD_TRAIN_EFFECTIVE_DISTANCE_EXPANDED end
    tbManager.nLastManageDistance = nManageDistance

    local tbCandidates = VSDTrain_BuildCandidates(tbNatural, tbPlayerPos, nManageDistance)
    tbManager.nLastCandidates = getn(tbCandidates)
    VSDTrain_MatchCandidates(tbManager, tbCandidates)

    -- Keep spots inside the proven player scan, extended only when the optional NPC-centered source API is present.
    -- A previously discovered spot remains valid even if its natural monsters are temporarily killed.
    local tbKeep = {}
    local i
    for i = 1, getn(tbManager.tbSpots) do
        local s = tbManager.tbSpots[i]
        if VSDTrain_IsCenterManageable(s.nX, s.nY, tbPlayerPos, nManageDistance) == 1 then
            VSDTrain_BalanceSpot(tbManager, s, tbNatural)
            tinsert(tbKeep, s)
        else
            local nDeleted = VSDTrain_CleanupSpot(s)
            tbManager.nDeletedTotal = tbManager.nDeletedTotal + nDeleted
            VSDTrain_Log("SLEEP_REMOVE map="..tbManager.nWorld.." spot="..s.nSpotId.." deleted="..nDeleted)
        end
    end
    tbManager.tbSpots = tbKeep
    tbManager.nLastActiveSpots = getn(tbKeep)
    return 1
end

function VSDTrain_Enable()
    if not PlayerIndex or PlayerIndex <= 0 then return -1 end
    local nApi, szMissing = VSDTrain_CheckApi()
    if nApi ~= 1 then
        VSDTrain_SetError("missing API: "..(szMissing or "unknown"))
        return -10
    end

    local pW = GetWorldPos()
    local nMapIdx = SubWorldID2Idx(pW)
    if not nMapIdx or nMapIdx < 0 then
        VSDTrain_SetError("SubWorldID2Idx fail map="..tostring(pW))
        return -3
    end

    -- V5.21: Mode 1 va Mode 2 tuyet doi khong chay chong tren cung map.
    -- Mode 2 la co che co dinh + engine respawn, nen neu dang bat thi Mode 1 phai dung o day.
    if g_tbVSDTrain2MapManager and g_tbVSDTrain2MapManager[pW] then
        VSDTrain_SetError("Mode 2 dang bat tren map nay")
        return -20
    end
    if g_tbVSDTrain3MapManager and g_tbVSDTrain3MapManager[pW] then
        VSDTrain_SetError("Mode 3 dang bat tren map nay")
        return -21
    end

    -- If this same account previously enabled another map, stop that map first.
    local szKey = VSDTrain_GetOwnerKey()
    local nOldWorld = g_tbVSDTrainOwnerMap[szKey]
    if nOldWorld and nOldWorld ~= pW and g_tbVSDTrainMapManager[nOldWorld] then
        VSDTrain_StopMap(nOldWorld, "owner-enable-new-map", 0)
    end

    local tbExisting = g_tbVSDTrainMapManager[pW]
    if tbExisting then
        VSDTrain_ScanMap(tbExisting)
        VSDTrain_SetError("")
        return 2
    end

    local tbConfig = VSDTrain_GetOwnerConfig() or VSDTrain_DefaultConfig()
    local tbManager = {
        nManagerId = VSDTrain_NewManagerId(),
        nWorld = pW,
        nTargetMin = tbConfig.nTargetMin,
        nTargetMax = tbConfig.nTargetMax,
        szOwnerKey = szKey,
        szOwnerName = GetName(),
        szOwnerAccount = GetAccount(),
        nTimerId = 0,
        tbSpots = {},
        nScanCount = 0,
        nCreatedTotal = 0,
        nDeletedTotal = 0,
        nAddFailTotal = 0,
        nSpotCapHits = 0,
        nExtraCapHits = 0,
        nSmartAIApplied = 0,
        nSmartAINativeHigh = 0,
        nSmartAIFail = 0,
        nLastPlayers = 0,
        nLastNaturalSeen = 0,
        nLastStrict = 0,
        nLastCompat = 0,
        nLastSimLike = 0,
        nLastRawCalls = 0,
        nLastMaxRawOnePlayer = 0,
        nLastExpandApi = 0,
        nLastExpandCalls = 0,
        nLastExpandAdded = 0,
        nLastManageDistance = VSD_TRAIN_EFFECTIVE_DISTANCE_FALLBACK,
        nLastCandidates = 0,
        nLastActiveSpots = 0,
    }
    g_tbVSDTrainMapManager[pW] = tbManager
    g_tbVSDTrainOwnerMap[szKey] = pW

    local nScan = VSDTrain_ScanMap(tbManager)
    if nScan ~= 1 then
        VSDTrain_StopMap(pW, "initial-scan-fail", 1)
        VSDTrain_SetError("initial map scan fail")
        return -6
    end

    local nTimerId = AddTimer(VSD_TRAIN_SCAN_INTERVAL, "VSDTrain_OnTimer", pW)
    if not nTimerId or nTimerId <= 0 then
        VSDTrain_StopMap(pW, "timer-fail", 1)
        VSDTrain_SetError("AddTimer returned invalid id")
        return -4
    end
    tbManager.nTimerId = nTimerId
    VSDTrain_SetError("")
    VSDTrain_Log("ENABLE map="..pW.." manager="..tbManager.nManagerId.." owner="..tbManager.szOwnerAccount.."|"..tbManager.szOwnerName.." players="..tbManager.nLastPlayers.." spots="..tbManager.nLastActiveSpots)
    return 1
end

function VSDTrain_OnTimer(nWorld)
    local tbManager = g_tbVSDTrainMapManager[nWorld]
    if not tbManager then return 0, 0 end

    local nOldPlayer = PlayerIndex
    local nOwner = SearchPlayer(tbManager.szOwnerName)
    if not nOwner or nOwner <= 0 then
        VSDTrain_StopMap(nWorld, "owner-offline", 1)
        return 0, 0
    end

    PlayerIndex = nOwner
    if GetName() ~= tbManager.szOwnerName or GetAccount() ~= tbManager.szOwnerAccount then
        PlayerIndex = nOldPlayer
        VSDTrain_StopMap(nWorld, "owner-identity-mismatch", 1)
        return 0, 0
    end

    local pW = GetWorldPos()
    if pW ~= nWorld then
        PlayerIndex = nOldPlayer
        VSDTrain_StopMap(nWorld, "owner-left-map", 1)
        return 0, 0
    end

    VSDTrain_ScanMap(tbManager)
    PlayerIndex = nOldPlayer
    return VSD_TRAIN_SCAN_INTERVAL, nWorld
end

function VSDTrain_Disable()
    if not PlayerIndex or PlayerIndex <= 0 then return 0 end
    local pW = GetWorldPos()
    return VSDTrain_StopMap(pW, "manual", 0)
end

function VSDTrain_ForceScan()
    if not PlayerIndex or PlayerIndex <= 0 then return -1 end
    local pW = GetWorldPos()
    local tbManager = g_tbVSDTrainMapManager[pW]
    if not tbManager then return -1 end
    return VSDTrain_ScanMap(tbManager)
end

function VSDTrain_SpotSummary(tbSpot)
    return format("#%d [%d,%d] %s target=%d | natural=%d extra=%d total=%d", tbSpot.nSpotId, tbSpot.nX, tbSpot.nY, VSDTrain_ModeText(tbSpot.nMode), tbSpot.nTarget, tbSpot.nLastNatural, tbSpot.nLastOwnExtra, tbSpot.nLastCurrent)
end

function VSDTrain_GetStatusText()
    if not PlayerIndex or PlayerIndex <= 0 then return "BU QUAI TRAIN TOAN MAP\nLoi PlayerIndex." end
    local pW = GetWorldPos()
    local t = g_tbVSDTrainMapManager[pW]
    if not t then
        local szErr = g_szVSDTrainLastError or ""
        if szErr ~= "" then szErr = "\nLoi gan nhat: "..szErr end
        return format("BU QUAI TRAIN TOAN MAP\nTrang thai: TAT%s\nQuy tac: moi bai co >=%d quai that trong cluster %d se giu tong random %d-%d. Quet quanh tat ca player tren map moi %d giay; vung khong co nguoi khong sinh quai.", szErr, VSD_TRAIN_MIN_NATURAL, VSD_TRAIN_CLUSTER_RADIUS, VSD_TRAIN_TARGET_MIN, VSD_TRAIN_TARGET_MAX, floor(VSD_TRAIN_SCAN_INTERVAL/18))
    end

    local szExpand = "OFF"
    if (t.nLastExpandApi or 0) == 1 then szExpand = "ON" end
    local sz = format("BU QUAI TRAIN TOAN MAP - DANG BAT\nMap %d | chu bat: %s\nPlayer=%d | bai active=%d | candidate=%d\nNatural=%d | Power1=%d | Kind0=%d | SimCity/dac biet=%d\nDa tao=%d | da don=%d | loi AddNpc=%d | extra song=%d\nScan player=%d | NPC-edge expand=%s radius=%d | manage<=%d\nExpand calls=%d | natural mo rong them=%d\nCluster=%d | target=%d-%d | chu ky=%d giay", t.nWorld, t.szOwnerName, t.nLastPlayers, t.nLastActiveSpots, t.nLastCandidates, t.nLastNaturalSeen, t.nLastStrict, t.nLastCompat, t.nLastSimLike, t.nCreatedTotal, t.nDeletedTotal, t.nAddFailTotal, g_nVSDTrainLiveExtra, VSD_TRAIN_SCAN_RADIUS, szExpand, VSD_TRAIN_EDGE_EXPAND_RADIUS, t.nLastManageDistance or VSD_TRAIN_EFFECTIVE_DISTANCE_FALLBACK, t.nLastExpandCalls or 0, t.nLastExpandAdded or 0, VSD_TRAIN_CLUSTER_RADIUS, VSD_TRAIN_TARGET_MIN, VSD_TRAIN_TARGET_MAX, floor(VSD_TRAIN_SCAN_INTERVAL/18))
    sz = sz..format("\nSmartAI extra: applied=%d | nativeHigh=%d | fail=%d", t.nSmartAIApplied or 0, t.nSmartAINativeHigh or 0, t.nSmartAIFail or 0)
    local i
    local nShow = getn(t.tbSpots)
    if nShow > 5 then nShow = 5 end
    for i = 1, nShow do
        sz = sz.."\n"..VSDTrain_SpotSummary(t.tbSpots[i])
    end
    if getn(t.tbSpots) > nShow then sz = sz.."\n... con "..(getn(t.tbSpots)-nShow).." bai" end
    if t.nSpotCapHits > 0 or t.nExtraCapHits > 0 then
        sz = sz..format("\nSafety cap: spotHit=%d extraHit=%d", t.nSpotCapHits, t.nExtraCapHits)
    end
    return sz
end

-- Read-only diagnosis. Does not AddNpcEx, DelNpc, or AddTimer.
function VSDTrain_Diagnose()
    if not PlayerIndex or PlayerIndex <= 0 then return "DIAG: PlayerIndex invalid" end
    local nApi, szMissing = VSDTrain_CheckApi()
    if nApi ~= 1 then return "DIAG: thieu API: "..(szMissing or "unknown") end
    local pW, pX, pY = GetWorldPos()
    local tbNatural, tbPlayerPos, tbStats = VSDTrain_CollectMapView(pW)
    local nManageDistance = VSD_TRAIN_EFFECTIVE_DISTANCE_FALLBACK
    if tbStats.nExpandApi == 1 then nManageDistance = VSD_TRAIN_EFFECTIVE_DISTANCE_EXPANDED end
    local tbCandidates = VSDTrain_BuildCandidates(tbNatural, tbPlayerPos, nManageDistance)
    local sz = format("MODE1 DIAG MAP %d [%d,%d]\nPlayer=%d | direct scan radius=%d\nNatural unique=%d | Power1=%d | Kind0=%d | SimCity/dac biet=%d\nNPC-edge expand API=%d | calls=%d | added=%d | expand radius=%d\nBai du dieu kien=%d | cluster=%d | min=%d | target=%d-%d\nKhoang cach tam bai duoc quan ly <=%d.", pW, pX, pY, tbStats.nPlayers, VSD_TRAIN_SCAN_RADIUS, getn(tbNatural), tbStats.nStrict, tbStats.nCompat, tbStats.nSimLike, tbStats.nExpandApi or 0, tbStats.nExpandCalls or 0, tbStats.nExpandAdded or 0, VSD_TRAIN_EDGE_EXPAND_RADIUS, getn(tbCandidates), VSD_TRAIN_CLUSTER_RADIUS, VSD_TRAIN_MIN_NATURAL, VSD_TRAIN_TARGET_MIN, VSD_TRAIN_TARGET_MAX, nManageDistance)
    local i
    local nShow = getn(tbCandidates)
    if nShow > 6 then nShow = 6 end
    for i = 1, nShow do
        local c = tbCandidates[i]
        sz = sz..format("\nBai %d [%d,%d] %s natural=%d", i, c.nX, c.nY, VSDTrain_ModeText(c.nMode), c.nNatural)
    end
    if getn(tbCandidates) > nShow then sz = sz.."\n... con "..(getn(tbCandidates)-nShow).." bai" end
    return sz
end
