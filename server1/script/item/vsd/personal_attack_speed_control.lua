PERSONAL_ATTACK_SPEED_CTRL_FILE = "\\script\\item\\vsd\\personal_attack_speed_control.lua"
PERSONAL_ATTACK_SPEED_TASK_EXTERNAL = 5996
PERSONAL_ATTACK_SPEED_TASK_INTERNAL = 5997

-- V5.32 MANUAL-PERSIST SAFE. Tasks store settings; runtime states are activated manually.
PERSONAL_ATTACK_SPEED_MAX = 200
PERSONAL_ATTACK_SPEED_STEP = 10
PERSONAL_ATTACK_SPEED_DURATION = 18 * 60 * 60 * 24 * 365
PERSONAL_ATTACK_SPEED_EXT_SKILL = 1900
PERSONAL_ATTACK_SPEED_INT_SKILL = 1902
PERSONAL_ATTACK_SPEED_OLD_STATES = {1901, 1903, 1904, 1905}

function PersonalAttackSpeed_Normalize(nValue)
    nValue = tonumber(nValue)
    if (nValue == nil) then return nil end
    nValue = floor(nValue)
    if (nValue < 0) then nValue = 0 end
    if (nValue > PERSONAL_ATTACK_SPEED_MAX) then nValue = PERSONAL_ATTACK_SPEED_MAX end
    nValue = floor(nValue / PERSONAL_ATTACK_SPEED_STEP) * PERSONAL_ATTACK_SPEED_STEP
    return nValue
end

function PersonalAttackSpeed_GetSavedByTask(nTask)
    local nValue = GetTask(nTask)
    if (nValue == nil or nValue < 0) then nValue = 0 end
    local nSafe = PersonalAttackSpeed_Normalize(nValue)
    if (nSafe == nil) then nSafe = 0 end
    if (nSafe ~= nValue) then SetTask(nTask, nSafe) end
    return nSafe
end
function PersonalAttackSpeed_GetSavedExternal() return PersonalAttackSpeed_GetSavedByTask(PERSONAL_ATTACK_SPEED_TASK_EXTERNAL) end
function PersonalAttackSpeed_GetSavedInternal() return PersonalAttackSpeed_GetSavedByTask(PERSONAL_ATTACK_SPEED_TASK_INTERNAL) end

function PersonalAttackSpeed_GetAppliedBySkill(nSkill)
    local nLevel = GetSkillState(nSkill)
    if (nLevel == nil or nLevel < 1) then return 0 end
    nLevel = floor(nLevel)
    if (nLevel > 20) then return 0 end
    return nLevel * PERSONAL_ATTACK_SPEED_STEP
end
function PersonalAttackSpeed_GetAppliedExternal() return PersonalAttackSpeed_GetAppliedBySkill(PERSONAL_ATTACK_SPEED_EXT_SKILL) end
function PersonalAttackSpeed_GetAppliedInternal() return PersonalAttackSpeed_GetAppliedBySkill(PERSONAL_ATTACK_SPEED_INT_SKILL) end

function PersonalAttackSpeed_ClearOldStates()
    for i = 1, getn(PERSONAL_ATTACK_SPEED_OLD_STATES) do RemoveSkillState(PERSONAL_ATTACK_SPEED_OLD_STATES[i]) end
end

function PersonalAttackSpeed_ApplyOne(nSkill, nValue)
    nValue = PersonalAttackSpeed_Normalize(nValue)
    if (nValue == nil) then return -1 end
    RemoveSkillState(nSkill)
    if (nValue <= 0) then return 0 end
    local nLevel = floor(nValue / PERSONAL_ATTACK_SPEED_STEP)
    if (nLevel < 1 or nLevel > 20) then return -2 end
    local nRet = AddSkillState(nSkill, nLevel, 0, PERSONAL_ATTACK_SPEED_DURATION, 1)
    if (nRet == nil or nRet == -1) then RemoveSkillState(nSkill); return -3 end
    local nActual = PersonalAttackSpeed_GetAppliedBySkill(nSkill)
    if (nActual ~= nValue) then RemoveSkillState(nSkill); return -4 end
    return nActual
end

function PersonalAttackSpeed_SetOne(nTask, nSkill, nValue)
    local nNew = PersonalAttackSpeed_Normalize(nValue)
    if (nNew == nil) then return -1 end
    local nOldSaved = PersonalAttackSpeed_GetSavedByTask(nTask)
    local nOldApplied = PersonalAttackSpeed_GetAppliedBySkill(nSkill)
    local nRet = PersonalAttackSpeed_ApplyOne(nSkill, nNew)
    if (nRet == nil or nRet < 0) then
        RemoveSkillState(nSkill)
        if (nOldApplied > 0) then PersonalAttackSpeed_ApplyOne(nSkill, nOldApplied) end
        SetTask(nTask, nOldSaved)
        return -2
    end
    SetTask(nTask, nNew)
    return nRet
end
function PersonalAttackSpeed_SetExternal(nValue) PersonalAttackSpeed_ClearOldStates(); return PersonalAttackSpeed_SetOne(PERSONAL_ATTACK_SPEED_TASK_EXTERNAL, PERSONAL_ATTACK_SPEED_EXT_SKILL, nValue) end
function PersonalAttackSpeed_SetInternal(nValue) PersonalAttackSpeed_ClearOldStates(); return PersonalAttackSpeed_SetOne(PERSONAL_ATTACK_SPEED_TASK_INTERNAL, PERSONAL_ATTACK_SPEED_INT_SKILL, nValue) end

function PersonalAttackSpeed_PauseExternal() RemoveSkillState(PERSONAL_ATTACK_SPEED_EXT_SKILL); return PersonalAttackSpeed_GetSavedExternal() end
function PersonalAttackSpeed_PauseInternal() RemoveSkillState(PERSONAL_ATTACK_SPEED_INT_SKILL); return PersonalAttackSpeed_GetSavedInternal() end
function PersonalAttackSpeed_PauseAll()
    RemoveSkillState(PERSONAL_ATTACK_SPEED_EXT_SKILL)
    RemoveSkillState(PERSONAL_ATTACK_SPEED_INT_SKILL)
    PersonalAttackSpeed_ClearOldStates()
    return 1
end
function PersonalAttackSpeed_TurnOffExternal() return PersonalAttackSpeed_PauseExternal() end
function PersonalAttackSpeed_TurnOffInternal() return PersonalAttackSpeed_PauseInternal() end
function PersonalAttackSpeed_TurnOffAll() return PersonalAttackSpeed_PauseAll() end

function PersonalAttackSpeed_ResetExternal() PersonalAttackSpeed_PauseExternal(); SetTask(PERSONAL_ATTACK_SPEED_TASK_EXTERNAL, 0); return 0 end
function PersonalAttackSpeed_ResetInternal() PersonalAttackSpeed_PauseInternal(); SetTask(PERSONAL_ATTACK_SPEED_TASK_INTERNAL, 0); return 0 end
function PersonalAttackSpeed_ResetAll()
    PersonalAttackSpeed_PauseAll()
    SetTask(PERSONAL_ATTACK_SPEED_TASK_EXTERNAL, 0)
    SetTask(PERSONAL_ATTACK_SPEED_TASK_INTERNAL, 0)
    return 1
end

function PersonalAttackSpeed_ReapplySaved()
    local nExt = PersonalAttackSpeed_GetSavedExternal()
    local nInt = PersonalAttackSpeed_GetSavedInternal()
    PersonalAttackSpeed_PauseAll()
    if (PersonalAttackSpeed_ApplyOne(PERSONAL_ATTACK_SPEED_EXT_SKILL, nExt) < 0) then PersonalAttackSpeed_PauseAll(); return -1 end
    if (PersonalAttackSpeed_ApplyOne(PERSONAL_ATTACK_SPEED_INT_SKILL, nInt) < 0) then PersonalAttackSpeed_PauseAll(); return -2 end
    if (PersonalAttackSpeed_GetAppliedExternal() ~= nExt) then PersonalAttackSpeed_PauseAll(); return -3 end
    if (PersonalAttackSpeed_GetAppliedInternal() ~= nInt) then PersonalAttackSpeed_PauseAll(); return -4 end
    return 1
end

function PersonalAttackSpeed_RefreshNow() return PersonalAttackSpeed_ReapplySaved() end
function PersonalAttackSpeed_GetEffectiveExternal() return PersonalAttackSpeed_GetAppliedExternal() end
function PersonalAttackSpeed_GetEffectiveInternal() return PersonalAttackSpeed_GetAppliedInternal() end
function PersonalAttackSpeed_GetTotalExternal() return PersonalAttackSpeed_GetAppliedExternal() end
function PersonalAttackSpeed_GetTotalInternal() return PersonalAttackSpeed_GetAppliedInternal() end
function PersonalAttackSpeed_GetSafeOwnMaxExternal() return PERSONAL_ATTACK_SPEED_MAX end
function PersonalAttackSpeed_GetSafeOwnMaxInternal() return PERSONAL_ATTACK_SPEED_MAX end
function PersonalAttackSpeed_GetUnsafeExternalSource() return 0 end
function PersonalAttackSpeed_GetUnsafeInternalSource() return 0 end
function PersonalAttackSpeed_StopMonitorForCurrentPlayer() return 1 end
function PersonalAttackSpeed_StartMonitorForCurrentPlayer() return 0 end
function PersonalAttackSpeed_MonitorTimer(nPacked, nTimerId) return 0 end
function PersonalAttackSpeed_MonitorTick(nToken) return 0 end

function PersonalAttackSpeed_OnLogin()
    if (PlayerIndex == nil or PlayerIndex <= 0) then return 0 end
    return DynamicExecuteByPlayer(PlayerIndex, PERSONAL_ATTACK_SPEED_CTRL_FILE, "PersonalAttackSpeed_OnLoginInternal")
end
function PersonalAttackSpeed_OnLoginInternal()
    if (PlayerIndex == nil or PlayerIndex <= 0) then return 0 end
    local nRet = PersonalAttackSpeed_ReapplySaved()
    if (nRet == nil or nRet < 0) then return 0 end
    return 1
end
