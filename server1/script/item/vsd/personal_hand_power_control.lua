PERSONAL_HAND_POWER_CTRL_FILE = "\\script\\item\\vsd\\personal_hand_power_control.lua"
PERSONAL_HAND_POWER_TASK = 5986

-- V5.32: four independent private states encode signed add_damage_p.
-- skills.txt sets StateSpecialId=0 for these private states so the components can coexist.
PERSONAL_HAND_POWER_DURATION = 18 * 60 * 60 * 24 * 365
PERSONAL_HAND_POWER_SKILL_PLUS_50 = 1921
PERSONAL_HAND_POWER_SKILL_PLUS_10 = 1922
PERSONAL_HAND_POWER_SKILL_MINUS_10 = 1923
PERSONAL_HAND_POWER_SKILL_MINUS_1 = 1924
PERSONAL_HAND_POWER_MAX_PLUS = 1000
PERSONAL_HAND_POWER_MIN_PLUS = 10
PERSONAL_HAND_POWER_PLUS_STEP = 10
PERSONAL_HAND_POWER_MIN_MINUS = 10
PERSONAL_HAND_POWER_MAX_MINUS = 99

function PersonalHandPower_NormalizeSavedValue(nValue)
    nValue = tonumber(nValue)
    if (nValue == nil) then return 0 end
    nValue = floor(nValue)
    if (nValue == 0) then return 0 end
    if (nValue > 0) then
        if (nValue < PERSONAL_HAND_POWER_MIN_PLUS) then return 0 end
        if (nValue > PERSONAL_HAND_POWER_MAX_PLUS) then nValue = PERSONAL_HAND_POWER_MAX_PLUS end
        nValue = floor(nValue / PERSONAL_HAND_POWER_PLUS_STEP) * PERSONAL_HAND_POWER_PLUS_STEP
        return nValue
    end
    local nAbs = -nValue
    if (nAbs < PERSONAL_HAND_POWER_MIN_MINUS) then return 0 end
    if (nAbs > PERSONAL_HAND_POWER_MAX_MINUS) then nAbs = PERSONAL_HAND_POWER_MAX_MINUS end
    return -nAbs
end
function PersonalHandPower_NormalizeIncreaseRequest(nValue)
    nValue=tonumber(nValue); if (nValue==nil) then return nil end; nValue=floor(nValue)
    if (nValue<PERSONAL_HAND_POWER_MIN_PLUS or nValue>PERSONAL_HAND_POWER_MAX_PLUS) then return nil end
    nValue=floor(nValue/PERSONAL_HAND_POWER_PLUS_STEP)*PERSONAL_HAND_POWER_PLUS_STEP
    if (nValue<PERSONAL_HAND_POWER_MIN_PLUS) then return nil end
    return nValue
end
function PersonalHandPower_NormalizeDecreaseRequest(nValue)
    nValue=tonumber(nValue); if (nValue==nil) then return nil end; nValue=floor(nValue)
    if (nValue<PERSONAL_HAND_POWER_MIN_MINUS or nValue>PERSONAL_HAND_POWER_MAX_MINUS) then return nil end
    return nValue
end
function PersonalHandPower_GetSaved()
    local nRaw=GetTask(PERSONAL_HAND_POWER_TASK)
    local nSafe=PersonalHandPower_NormalizeSavedValue(nRaw)
    if (nRaw==nil or nRaw~=nSafe) then SetTask(PERSONAL_HAND_POWER_TASK,nSafe) end
    return nSafe
end
function PersonalHandPower_GetStateLevel(nSkill,nMaxLevel)
    local nLevel=GetSkillState(nSkill)
    if (nLevel==nil or nLevel<1) then return 0 end
    nLevel=floor(nLevel); if (nLevel<1 or nLevel>nMaxLevel) then return -1 end
    return nLevel
end
function PersonalHandPower_GetApplied()
    local nPlus50=PersonalHandPower_GetStateLevel(PERSONAL_HAND_POWER_SKILL_PLUS_50,20)
    local nPlus10=PersonalHandPower_GetStateLevel(PERSONAL_HAND_POWER_SKILL_PLUS_10,4)
    local nMinus10=PersonalHandPower_GetStateLevel(PERSONAL_HAND_POWER_SKILL_MINUS_10,9)
    local nMinus1=PersonalHandPower_GetStateLevel(PERSONAL_HAND_POWER_SKILL_MINUS_1,9)
    if (nPlus50<0 or nPlus10<0 or nMinus10<0 or nMinus1<0) then return nil end
    local nPositive=nPlus50*50+nPlus10*10
    local nNegative=nMinus10*10+nMinus1
    if (nPositive>0 and nNegative>0) then return nil end
    if (nPositive>PERSONAL_HAND_POWER_MAX_PLUS or nNegative>PERSONAL_HAND_POWER_MAX_MINUS) then return nil end
    if (nPositive>0) then return nPositive end
    if (nNegative>0) then return -nNegative end
    return 0
end
function PersonalHandPower_ClearStates()
    RemoveSkillState(PERSONAL_HAND_POWER_SKILL_PLUS_50); RemoveSkillState(PERSONAL_HAND_POWER_SKILL_PLUS_10)
    RemoveSkillState(PERSONAL_HAND_POWER_SKILL_MINUS_10); RemoveSkillState(PERSONAL_HAND_POWER_SKILL_MINUS_1)
    return 1
end
function PersonalHandPower_BuildLevels(nValue)
    nValue=PersonalHandPower_NormalizeSavedValue(nValue)
    local nPlus50=0; local nPlus10=0; local nMinus10=0; local nMinus1=0
    if (nValue>0) then nPlus50=floor(nValue/50); nPlus10=floor((nValue-nPlus50*50)/10)
    elseif (nValue<0) then local nAbs=-nValue; nMinus10=floor(nAbs/10); nMinus1=nAbs-nMinus10*10 end
    return nPlus50,nPlus10,nMinus10,nMinus1
end
function PersonalHandPower_AddOne(nSkill,nLevel,nMaxLevel)
    if (nLevel==nil or nLevel<=0) then return 1 end
    nLevel=floor(nLevel); if (nLevel<1 or nLevel>nMaxLevel) then return nil end
    local nRet=AddSkillState(nSkill,nLevel,0,PERSONAL_HAND_POWER_DURATION,1)
    if (nRet==nil or nRet==-1) then RemoveSkillState(nSkill); return nil end
    local nActual=GetSkillState(nSkill)
    if (nActual==nil or floor(nActual)~=nLevel) then RemoveSkillState(nSkill); return nil end
    return 1
end
function PersonalHandPower_ApplyValue(nValue)
    local nSafe=PersonalHandPower_NormalizeSavedValue(nValue)
    local nPlus50,nPlus10,nMinus10,nMinus1=PersonalHandPower_BuildLevels(nSafe)
    PersonalHandPower_ClearStates(); if (nSafe==0) then return 0 end
    if (PersonalHandPower_AddOne(PERSONAL_HAND_POWER_SKILL_PLUS_50,nPlus50,20)==nil) then PersonalHandPower_ClearStates(); return nil end
    if (PersonalHandPower_AddOne(PERSONAL_HAND_POWER_SKILL_PLUS_10,nPlus10,4)==nil) then PersonalHandPower_ClearStates(); return nil end
    if (PersonalHandPower_AddOne(PERSONAL_HAND_POWER_SKILL_MINUS_10,nMinus10,9)==nil) then PersonalHandPower_ClearStates(); return nil end
    if (PersonalHandPower_AddOne(PERSONAL_HAND_POWER_SKILL_MINUS_1,nMinus1,9)==nil) then PersonalHandPower_ClearStates(); return nil end
    local nActual=PersonalHandPower_GetApplied()
    if (nActual==nil or nActual~=nSafe) then PersonalHandPower_ClearStates(); return nil end
    return nActual
end
function PersonalHandPower_SetSigned(nValue)
    local nNew=PersonalHandPower_NormalizeSavedValue(nValue)
    local nOldSaved=PersonalHandPower_GetSaved(); local nOldApplied=PersonalHandPower_GetApplied()
    if (nOldApplied==nil) then nOldApplied=0 end
    local nRet=PersonalHandPower_ApplyValue(nNew)
    if (nRet==nil) then
        PersonalHandPower_ClearStates(); if (nOldApplied~=0) then PersonalHandPower_ApplyValue(nOldApplied) end
        SetTask(PERSONAL_HAND_POWER_TASK,nOldSaved); return nil
    end
    SetTask(PERSONAL_HAND_POWER_TASK,nNew); return nRet
end
function PersonalHandPower_SetIncrease(nValue) local nSafe=PersonalHandPower_NormalizeIncreaseRequest(nValue); if (nSafe==nil) then return nil end; return PersonalHandPower_SetSigned(nSafe) end
function PersonalHandPower_SetDecrease(nValue) local nSafe=PersonalHandPower_NormalizeDecreaseRequest(nValue); if (nSafe==nil) then return nil end; return PersonalHandPower_SetSigned(-nSafe) end
function PersonalHandPower_Pause() PersonalHandPower_ClearStates(); return PersonalHandPower_GetSaved() end
function PersonalHandPower_TurnOff() return PersonalHandPower_Pause() end
function PersonalHandPower_ResetSaved() PersonalHandPower_ClearStates(); SetTask(PERSONAL_HAND_POWER_TASK,0); return 0 end
function PersonalHandPower_ReapplySaved() return PersonalHandPower_ApplyValue(PersonalHandPower_GetSaved()) end
function PersonalHandPower_OnLogin()
    if (PlayerIndex==nil or PlayerIndex<=0) then return 0 end
    return DynamicExecuteByPlayer(PlayerIndex,PERSONAL_HAND_POWER_CTRL_FILE,"PersonalHandPower_OnLoginInternal")
end
function PersonalHandPower_OnLoginInternal()
    if (PlayerIndex==nil or PlayerIndex<=0) then return 0 end
    local nRet=PersonalHandPower_ReapplySaved()
    if (nRet==nil) then return 0 end
    return 1
end
