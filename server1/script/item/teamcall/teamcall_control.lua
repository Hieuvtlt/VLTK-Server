-- TeamCall + AllCall FINAL FIX3 - SESSION ONLY / FIXED 3S / MIN 10 O
-- Safety rules:
--   * PT permanent and ALL permanent are mutually exclusive for the same anchor.
--   * Enabling one permanent mode cleanly deletes the previous timer/session first.
--   * ANY one-shot call stops the anchor's current permanent mode before teleporting.
--   * PT mode uses GetTeamSize/GetTeamMember only.
--   * ALL mode snapshots GetFirstPlayerAtServer/GetNextPlayerAtServer before teleporting.
--   * Timer callback never assigns global PlayerIndex and never uses SearchPlayer().
--   * No SetTask/GetTask/TaskTemp. Nothing persists after logout/restart.
--   * Anchor logout ends the session. PT mode also ends when anchor no longer has PT members.

TEAM_CALL_DEFAULT_DISTANCE = 10
TEAM_CALL_MIN_DISTANCE = 10
TEAM_CALL_MAX_DISTANCE = 100
TEAM_CALL_INTERVAL_FRAMES = 54  -- 18 FPS * 3 seconds
TEAM_CALL_MAX_SERVER_SCAN = 4096

TEAM_CALL_MODE_PT = 1
TEAM_CALL_MODE_ALL = 2

-- ====== Chi Doi truong moi duoc dung Goi Dong Doi (che do PT) ======
-- Dat ngay trong teamcall_control de MOI cua vao deu bi chan,
-- ke ca cac menu sau nay co them.
function TeamCall_IsLeader()
	if (IsCaptain() ~= 1) then return 0; end;
	local n = GetTeamSize();
	if (n == nil or n < 2) then return 0; end;
	return 1;
end;

if (TEAM_CALL_FINAL_SESSIONS == nil) then TEAM_CALL_FINAL_SESSIONS = {}; end;
if (TEAM_CALL_FINAL_PLAYER_TOKEN == nil) then TEAM_CALL_FINAL_PLAYER_TOKEN = {}; end;
if (TEAM_CALL_FINAL_NEXT_TOKEN == nil) then TEAM_CALL_FINAL_NEXT_TOKEN = 7000; end;

function TeamCall_NormalizeDistance(nValue)
    nValue = tonumber(nValue);
    if (nValue == nil or nValue < TEAM_CALL_MIN_DISTANCE or nValue > TEAM_CALL_MAX_DISTANCE) then
        return TEAM_CALL_DEFAULT_DISTANCE;
    end;
    return floor(nValue);
end;

function TeamCall_Final_GetLoginStamp()
    if (GetLoginTime == nil) then return 0; end;
    local nStamp = GetLoginTime();
    if (nStamp == nil) then return 0; end;
    return nStamp;
end;

function TeamCall_Final_DeleteSession(nToken, nDeleteTimer)
    local tb = TEAM_CALL_FINAL_SESSIONS[nToken];
    if (tb == nil) then return 0; end;

    tb.active = 0;
    local nTimerId = tb.timerId;
    tb.timerId = 0;

    if (tb.anchorIndex ~= nil and TEAM_CALL_FINAL_PLAYER_TOKEN[tb.anchorIndex] == nToken) then
        TEAM_CALL_FINAL_PLAYER_TOKEN[tb.anchorIndex] = nil;
    end;
    TEAM_CALL_FINAL_SESSIONS[nToken] = nil;

    if (nDeleteTimer == 1 and nTimerId ~= nil and nTimerId > 0) then
        DelTimer(nTimerId);
    end;
    return 1;
end;

function TeamCall_GetCurrentSession()
    if (PlayerIndex == nil or PlayerIndex <= 0) then return nil; end;
    local nToken = TEAM_CALL_FINAL_PLAYER_TOKEN[PlayerIndex];
    if (nToken == nil) then return nil; end;
    local tb = TEAM_CALL_FINAL_SESSIONS[nToken];
    if (tb == nil or tb.active ~= 1) then return nil; end;
    if (tb.anchorIndex ~= PlayerIndex) then return nil; end;
    if (tb.anchorName ~= GetName()) then return nil; end;
    if (tb.loginStamp ~= TeamCall_Final_GetLoginStamp()) then
        TeamCall_Final_DeleteSession(nToken, 1);
        return nil;
    end;
    return tb;
end;

function TeamCall_GetMode()
    local tb = TeamCall_GetCurrentSession();
    if (tb == nil or tb.mode == nil) then return 0; end;
    return tb.mode;
end;

function TeamCall_GetEnabled()
    if (TeamCall_GetMode() == TEAM_CALL_MODE_PT) then return 1; end;
    return 0;
end;

function AllCall_GetEnabled()
    if (TeamCall_GetMode() == TEAM_CALL_MODE_ALL) then return 1; end;
    return 0;
end;

function TeamCall_GetDistance()
    local tb = TeamCall_GetCurrentSession();
    if (tb == nil) then return TEAM_CALL_DEFAULT_DISTANCE; end;
    return TeamCall_NormalizeDistance(tb.distance);
end;

function AllCall_GetDistance()
    return TeamCall_GetDistance();
end;

-- Compatibility only. Time is fixed internally and is not shown/configurable.
function TeamCall_GetInterval()
    return 3;
end;

function TeamCall_GetRemainDays()
    return 0;
end;

function TeamCall_GetAnchorState()
    return TeamCall_GetEnabled();
end;

function TeamCall_GetTimerState()
    local tb = TeamCall_GetCurrentSession();
    if (tb ~= nil and tb.timerId ~= nil and tb.timerId > 0) then return 1; end;
    return 0;
end;

function TeamCall_IsFar(nAnchorMap, nAnchorX, nAnchorY, nMemberMap, nMemberX, nMemberY, nDistance)
    if (nMemberMap == nil or nMemberX == nil or nMemberY == nil) then return 0; end;
    if (nMemberMap ~= nAnchorMap) then return 1; end;
    nDistance = TeamCall_NormalizeDistance(nDistance);
    local nDX = nMemberX - nAnchorX;
    local nDY = nMemberY - nAnchorY;
    if ((nDX * nDX + nDY * nDY) >= (nDistance * nDistance)) then return 1; end;
    return 0;
end;

-- Runs in anchor context. PT member indexes are snapshotted before any teleport.
function TeamCall_PullMembers(nDistance, nCallAll)
    if (PlayerIndex == nil or PlayerIndex <= 0) then return -10; end;

    local nAnchorIndex = PlayerIndex;
    local nTeamSize = GetTeamSize();
    if (nTeamSize == nil or nTeamSize <= 1) then return -1; end;

    local nAnchorMap, nAnchorX, nAnchorY = GetWorldPos();
    if (nAnchorMap == nil or nAnchorMap <= 0 or nAnchorX == nil or nAnchorY == nil) then return -2; end;

    local nAnchorFight = GetFightState();
    nDistance = TeamCall_NormalizeDistance(nDistance);

    local tbMember = {};
    for i = 1, nTeamSize do
        tbMember[i] = GetTeamMember(i);
    end;

    local nPulled = 0;
    for i = 1, nTeamSize do
        local nMember = tbMember[i];
        if (nMember ~= nil and nMember > 0 and nMember ~= nAnchorIndex) then
            local nDoPull = nCallAll;
            if (nCallAll ~= 1) then
                local nMemberMap, nMemberX, nMemberY = CallPlayerFunction(nMember, GetWorldPos);
                nDoPull = TeamCall_IsFar(nAnchorMap, nAnchorX, nAnchorY,
                                         nMemberMap, nMemberX, nMemberY, nDistance);
            end;

            if (nDoPull == 1) then
                CallPlayerFunction(nMember, SetFightState, nAnchorFight);
                local nRet = CallPlayerFunction(nMember, NewWorld, nAnchorMap, nAnchorX, nAnchorY);
                if (nRet ~= nil and nRet ~= 0) then
                    nPulled = nPulled + 1;
                end;
            end;
        end;
    end;
    return nPulled;
end;

-- Snapshot ALL online player indexes BEFORE any teleport. This protects the server iterator.
function AllCall_Final_SnapshotPlayers()
    if (GetFirstPlayerAtServer == nil or GetNextPlayerAtServer == nil) then return nil, -11; end;

    local tbPlayer = {};
    local tbSeen = {};
    local nCount = 0;
    local nGuard = 0;
    local nPlayer = GetFirstPlayerAtServer();

    while (nPlayer ~= nil and nPlayer > 0 and nGuard < TEAM_CALL_MAX_SERVER_SCAN) do
        nGuard = nGuard + 1;
        if (tbSeen[nPlayer] == 1) then
            break;
        end;
        tbSeen[nPlayer] = 1;
        nCount = nCount + 1;
        tbPlayer[nCount] = nPlayer;
        nPlayer = GetNextPlayerAtServer();
    end;

    return tbPlayer, nCount;
end;

-- Runs in anchor context. ALL means every online player on this GameServer, regardless of PT/map.
function AllCall_PullPlayers(nDistance, nCallAll)
    if (PlayerIndex == nil or PlayerIndex <= 0) then return -10; end;

    local nAnchorIndex = PlayerIndex;
    local nAnchorMap, nAnchorX, nAnchorY = GetWorldPos();
    if (nAnchorMap == nil or nAnchorMap <= 0 or nAnchorX == nil or nAnchorY == nil) then return -2; end;

    local nAnchorFight = GetFightState();
    nDistance = TeamCall_NormalizeDistance(nDistance);

    local tbPlayer, nCount = AllCall_Final_SnapshotPlayers();
    if (tbPlayer == nil) then return nCount or -11; end;

    local nPulled = 0;
    for i = 1, nCount do
        local nMember = tbPlayer[i];
        if (nMember ~= nil and nMember > 0 and nMember ~= nAnchorIndex) then
            -- Validate that the snapshotted index is still an in-world player before teleport.
            local nMemberMap, nMemberX, nMemberY = CallPlayerFunction(nMember, GetWorldPos);
            if (nMemberMap ~= nil and nMemberMap > 0 and nMemberX ~= nil and nMemberY ~= nil) then
                local nDoPull = nCallAll;
                if (nCallAll ~= 1) then
                    nDoPull = TeamCall_IsFar(nAnchorMap, nAnchorX, nAnchorY,
                                             nMemberMap, nMemberX, nMemberY, nDistance);
                end;

                if (nDoPull == 1) then
                    CallPlayerFunction(nMember, SetFightState, nAnchorFight);
                    local nRet = CallPlayerFunction(nMember, NewWorld, nAnchorMap, nAnchorX, nAnchorY);
                    if (nRet ~= nil and nRet ~= 0) then
                        nPulled = nPulled + 1;
                    end;
                end;
            end;
        end;
    end;
    return nPulled;
end;

-- ANY one-shot action cancels whatever permanent mode this anchor currently has.
function TeamCall_CallNow()
    if (TeamCall_IsLeader() ~= 1) then return -20; end;
    TeamCall_StopTimer();
    return TeamCall_PullMembers(TEAM_CALL_DEFAULT_DISTANCE, 1);
end;

function AllCall_CallNow()
    TeamCall_StopTimer();
    return AllCall_PullPlayers(TEAM_CALL_DEFAULT_DISTANCE, 1);
end;

-- Called through CallPlayerFunction(anchorIndex,...), so the engine supplies anchor context.
function TeamCall_Final_TickAsAnchor(nToken)
    local tb = TEAM_CALL_FINAL_SESSIONS[nToken];
    if (tb == nil or tb.active ~= 1) then return 0; end;
    if (PlayerIndex == nil or PlayerIndex <= 0 or PlayerIndex ~= tb.anchorIndex) then return 0; end;
    if (GetName() ~= tb.anchorName) then return 0; end;
    if (TeamCall_Final_GetLoginStamp() ~= tb.loginStamp) then return 0; end;

    if (tb.mode == TEAM_CALL_MODE_PT) then
        local nTeamSize = GetTeamSize();
        if (nTeamSize == nil or nTeamSize <= 1) then return 0; end;
        -- Mat chuc Doi truong -> tra ve 0, phien bi xoa ngay o vong tick ke tiep.
        if (TeamCall_IsLeader() ~= 1) then
            Msg2Player("<color=red>Kh«ng cßn lµ §éi tr­ëng: Gäi §ång §éi ®· t¾t.<color>");
            return 0;
        end;
        local nRet = TeamCall_PullMembers(tb.distance, 0);
        if (nRet == nil or nRet < 0) then return 0; end;
        return 1;
    end;

    if (tb.mode == TEAM_CALL_MODE_ALL) then
        local nRet = AllCall_PullPlayers(tb.distance, 0);
        if (nRet == nil or nRet < 0) then return 0; end;
        return 1;
    end;

    return 0;
end;

function TeamCall_Final_Schedule(nToken)
    local tb = TEAM_CALL_FINAL_SESSIONS[nToken];
    if (tb == nil or tb.active ~= 1) then return 0; end;
    local nTimerId = AddTimer(TEAM_CALL_INTERVAL_FRAMES, "TeamCall_Final_Timer", nToken);
    if (nTimerId == nil or nTimerId <= 0) then return 0; end;
    tb.timerId = nTimerId;
    return 1;
end;

-- One-shot callback. It never changes PlayerIndex and never SearchPlayer().
function TeamCall_Final_Timer(nToken, nIgnoredTimerId)
    local tb = TEAM_CALL_FINAL_SESSIONS[nToken];
    if (tb == nil or tb.active ~= 1) then return 0; end;

    tb.timerId = 0;

    local szName = CallPlayerFunction(tb.anchorIndex, GetName);
    local nLoginStamp = CallPlayerFunction(tb.anchorIndex, GetLoginTime);
    if (szName == nil or szName ~= tb.anchorName or nLoginStamp == nil or nLoginStamp ~= tb.loginStamp) then
        TeamCall_Final_DeleteSession(nToken, 0);
        return 0;
    end;

    local nKeep = CallPlayerFunction(tb.anchorIndex, TeamCall_Final_TickAsAnchor, nToken);
    if (nKeep ~= 1) then
        TeamCall_Final_DeleteSession(nToken, 0);
        return 0;
    end;

    if (TeamCall_Final_Schedule(nToken) ~= 1) then
        TeamCall_Final_DeleteSession(nToken, 0);
    end;
    return 0;
end;

function TeamCall_StopTimer()
    if (PlayerIndex == nil or PlayerIndex <= 0) then return 0; end;
    local nToken = TEAM_CALL_FINAL_PLAYER_TOKEN[PlayerIndex];
    if (nToken ~= nil) then
        TeamCall_Final_DeleteSession(nToken, 1);
    end;
    return 1;
end;

function TeamCall_DisablePermanent()
    return TeamCall_StopTimer();
end;

function AllCall_DisablePermanent()
    return TeamCall_StopTimer();
end;

function TeamCall_Final_EnableMode(nMode, nDistance)
    -- Old PT or ALL mode is deleted only after the new mode has passed validation.
    TeamCall_StopTimer();

    TEAM_CALL_FINAL_NEXT_TOKEN = TEAM_CALL_FINAL_NEXT_TOKEN + 1;
    if (TEAM_CALL_FINAL_NEXT_TOKEN > 2000000000) then TEAM_CALL_FINAL_NEXT_TOKEN = 7001; end;
    local nToken = TEAM_CALL_FINAL_NEXT_TOKEN;

    local tb = {
        active = 1,
        mode = nMode,
        token = nToken,
        anchorIndex = PlayerIndex,
        anchorName = GetName(),
        loginStamp = TeamCall_Final_GetLoginStamp(),
        distance = nDistance,
        timerId = 0,
    };
    TEAM_CALL_FINAL_SESSIONS[nToken] = tb;
    TEAM_CALL_FINAL_PLAYER_TOKEN[PlayerIndex] = nToken;

    -- Immediate check, then fixed 3-second chain.
    local nKeep = TeamCall_Final_TickAsAnchor(nToken);
    if (nKeep ~= 1) then
        TeamCall_Final_DeleteSession(nToken, 0);
        return -5;
    end;

    if (TeamCall_Final_Schedule(nToken) ~= 1) then
        TeamCall_Final_DeleteSession(nToken, 0);
        return -4;
    end;
    return 1;
end;

function TeamCall_EnablePermanent(nDistance, nIgnoredInterval)
    if (PlayerIndex == nil or PlayerIndex <= 0) then return -10; end;
    if (GetTeamSize() == nil or GetTeamSize() <= 1) then return -1; end;
    if (TeamCall_IsLeader() ~= 1) then return -20; end;

    nDistance = tonumber(nDistance);
    if (nDistance == nil or nDistance < TEAM_CALL_MIN_DISTANCE or nDistance > TEAM_CALL_MAX_DISTANCE) then return -2; end;
    nDistance = floor(nDistance);

    return TeamCall_Final_EnableMode(TEAM_CALL_MODE_PT, nDistance);
end;

function AllCall_EnablePermanent(nDistance, nIgnoredInterval)
    if (PlayerIndex == nil or PlayerIndex <= 0) then return -10; end;
    if (GetFirstPlayerAtServer == nil or GetNextPlayerAtServer == nil) then return -11; end;

    nDistance = tonumber(nDistance);
    if (nDistance == nil or nDistance < TEAM_CALL_MIN_DISTANCE or nDistance > TEAM_CALL_MAX_DISTANCE) then return -2; end;
    nDistance = floor(nDistance);

    return TeamCall_Final_EnableMode(TEAM_CALL_MODE_ALL, nDistance);
end;

-- Compatibility only; both modes intentionally have no login persistence.
function TeamCall_OnLogin()
    return 0;
end;
