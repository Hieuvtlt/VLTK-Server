PERSONAL_MOVE_SPEED_CTRL_FILE = "\\script\\item\\vsd\\personal_move_speed_control.lua"
PERSONAL_MOVE_SPEED_TASK = 5995

-- V5.32 MANUAL-PERSIST SAFE:
-- Task 5995 is the long-term saved setting. Runtime SkillState is separate.
-- Login only clears this private runtime state and keeps the Task value.
-- The player must use the Vision token and choose reapply/enable to activate it again.
-- One-year runtime duration at the server-native 18 ticks/second; no polling timer.
PERSONAL_MOVE_SPEED_MAX = 200
PERSONAL_MOVE_SPEED_STEP = 10
PERSONAL_MOVE_SPEED_DURATION = 18 * 60 * 60 * 24 * 365
PERSONAL_MOVE_SPEED_SKILL = 1906
PERSONAL_MOVE_SPEED_OLD_STATES = {1907, 1908}

function PersonalMoveSpeed_NormalizeRequest(nValue)
    nValue = tonumber(nValue)
    if (nValue == nil) then return nil end
    nValue = floor(nValue)
    if (nValue < 0) then nValue = 0 end
    if (nValue > PERSONAL_MOVE_SPEED_MAX) then nValue = PERSONAL_MOVE_SPEED_MAX end
    nValue = floor(nValue / PERSONAL_MOVE_SPEED_STEP) * PERSONAL_MOVE_SPEED_STEP
    return nValue
end

function PersonalMoveSpeed_GetSaved()
    local nValue = GetTask(PERSONAL_MOVE_SPEED_TASK)
    if (nValue == nil or nValue < 0) then nValue = 0 end
    local nSafe = PersonalMoveSpeed_NormalizeRequest(nValue)
    if (nSafe == nil) then nSafe = 0 end
    if (nSafe ~= nValue) then SetTask(PERSONAL_MOVE_SPEED_TASK, nSafe) end
    return nSafe
end

function PersonalMoveSpeed_GetApplied()
    local nLevel = GetSkillState(PERSONAL_MOVE_SPEED_SKILL)
    if (nLevel == nil or nLevel < 1) then return 0 end
    nLevel = floor(nLevel)
    if (nLevel > 20) then return 0 end
    return nLevel * PERSONAL_MOVE_SPEED_STEP
end

function PersonalMoveSpeed_ClearOldStates()
    for i = 1, getn(PERSONAL_MOVE_SPEED_OLD_STATES) do
        RemoveSkillState(PERSONAL_MOVE_SPEED_OLD_STATES[i])
    end
end

function PersonalMoveSpeed_ApplyContribution(nValue)
    nValue = PersonalMoveSpeed_NormalizeRequest(nValue)
    if (nValue == nil) then return -1 end
    RemoveSkillState(PERSONAL_MOVE_SPEED_SKILL)
    PersonalMoveSpeed_ClearOldStates()
    if (nValue <= 0) then return 0 end

    local nLevel = floor(nValue / PERSONAL_MOVE_SPEED_STEP)
    if (nLevel < 1 or nLevel > 20) then return -2 end
    local nRet = AddSkillState(PERSONAL_MOVE_SPEED_SKILL, nLevel, 0, PERSONAL_MOVE_SPEED_DURATION, 1)
    if (nRet == nil or nRet == -1) then
        RemoveSkillState(PERSONAL_MOVE_SPEED_SKILL)
        return -3
    end
    local nActual = PersonalMoveSpeed_GetApplied()
    if (nActual ~= nValue) then
        RemoveSkillState(PERSONAL_MOVE_SPEED_SKILL)
        return -4
    end
    return nActual
end

function PersonalMoveSpeed_Set(nValue)
    local nNew = PersonalMoveSpeed_NormalizeRequest(nValue)
    if (nNew == nil) then return -1 end
    local nOldSaved = PersonalMoveSpeed_GetSaved()
    local nOldApplied = PersonalMoveSpeed_GetApplied()
    local nRet = PersonalMoveSpeed_ApplyContribution(nNew)
    if (nRet == nil or nRet < 0) then
        if (nOldApplied > 0) then PersonalMoveSpeed_ApplyContribution(nOldApplied) end
        SetTask(PERSONAL_MOVE_SPEED_TASK, nOldSaved)
        return -2
    end
    SetTask(PERSONAL_MOVE_SPEED_TASK, nNew)
    return nRet
end

-- Pause removes only the private runtime state. Saved Task is intentionally kept.
function PersonalMoveSpeed_Pause()
    RemoveSkillState(PERSONAL_MOVE_SPEED_SKILL)
    PersonalMoveSpeed_ClearOldStates()
    return PersonalMoveSpeed_GetSaved()
end

-- Backward-compatible name: old menus/callers now pause instead of erasing memory.
function PersonalMoveSpeed_TurnOff()
    return PersonalMoveSpeed_Pause()
end

function PersonalMoveSpeed_ResetSaved()
    PersonalMoveSpeed_Pause()
    SetTask(PERSONAL_MOVE_SPEED_TASK, 0)
    return 0
end

function PersonalMoveSpeed_ReapplySaved()
    return PersonalMoveSpeed_ApplyContribution(PersonalMoveSpeed_GetSaved())
end

function PersonalMoveSpeed_RefreshNow() return PersonalMoveSpeed_ReapplySaved() end
function PersonalMoveSpeed_GetExternalEffective() return 0 end
function PersonalMoveSpeed_GetTotalEnhance() return PersonalMoveSpeed_GetApplied() end
function PersonalMoveSpeed_GetProtocolRunSpeed() return 0 end
function PersonalMoveSpeed_GetSafeOwnMax() return PERSONAL_MOVE_SPEED_MAX end
function PersonalMoveSpeed_GetUnsafeExternalSource() return 0 end
function PersonalMoveSpeed_StopMonitorForCurrentPlayer() return 1 end
function PersonalMoveSpeed_StartMonitorForCurrentPlayer() return 0 end
function PersonalMoveSpeed_MonitorTimer(nPacked, nTimerId) return 0 end
function PersonalMoveSpeed_MonitorTick(nToken) return 0 end

function PersonalMoveSpeed_OnLogin()
    if (PlayerIndex == nil or PlayerIndex <= 0) then return 0 end
    return DynamicExecuteByPlayer(PlayerIndex, PERSONAL_MOVE_SPEED_CTRL_FILE, "PersonalMoveSpeed_OnLoginInternal")
end

function PersonalMoveSpeed_OnLoginInternal()
    if (PlayerIndex == nil or PlayerIndex <= 0) then return 0 end
    local nRet = PersonalMoveSpeed_ReapplySaved()
    if (nRet == nil or nRet < 0) then return 0 end
    return 1
end
