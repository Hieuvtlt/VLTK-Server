PERSONAL_EXP_TASK = 5998
-- V5.41: exact personal EXP x1..x1000 using three private additive EXP states.
-- Each state stays at a low level to avoid relying on very high SkillState levels.
PERSONAL_EXP_SKILL_PLUS_100 = 1910
PERSONAL_EXP_SKILL_PLUS_10 = 1925
PERSONAL_EXP_SKILL_PLUS_1 = 1926
PERSONAL_EXP_MAX_RATE = 1000
PERSONAL_EXP_DURATION = 18 * 60 * 60 * 24 * 365

function PersonalExp_GetSavedRate()
    local nRate=GetTask(PERSONAL_EXP_TASK)
    nRate=tonumber(nRate)
    if (nRate==nil or nRate<1 or nRate>PERSONAL_EXP_MAX_RATE) then nRate=1 end
    nRate=floor(nRate)
    if (GetTask(PERSONAL_EXP_TASK)~=nRate) then SetTask(PERSONAL_EXP_TASK,nRate) end
    return nRate
end

function PersonalExp_GetStateLevel(nSkill,nMaxLevel)
    local nLevel=GetSkillState(nSkill)
    if (nLevel==nil or nLevel<1) then return 0 end
    nLevel=floor(nLevel)
    if (nLevel<1 or nLevel>nMaxLevel) then return -1 end
    return nLevel
end

function PersonalExp_ClearExpStates()
    RemoveSkillState(PERSONAL_EXP_SKILL_PLUS_100)
    RemoveSkillState(PERSONAL_EXP_SKILL_PLUS_10)
    RemoveSkillState(PERSONAL_EXP_SKILL_PLUS_1)
    return 1
end

function PersonalExp_GetEffectiveRate()
    local n100=PersonalExp_GetStateLevel(PERSONAL_EXP_SKILL_PLUS_100,9)
    local n10=PersonalExp_GetStateLevel(PERSONAL_EXP_SKILL_PLUS_10,9)
    local n1=PersonalExp_GetStateLevel(PERSONAL_EXP_SKILL_PLUS_1,9)
    if (n100<0 or n10<0 or n1<0) then return 1 end
    local nRate=1+n100*100+n10*10+n1
    if (nRate<1) then nRate=1 end
    if (nRate>PERSONAL_EXP_MAX_RATE) then nRate=PERSONAL_EXP_MAX_RATE end
    return nRate
end

function PersonalExp_BuildLevels(nRate)
    local nBonus=nRate-1
    local n100=floor(nBonus/100)
    local nRemain=nBonus-n100*100
    local n10=floor(nRemain/10)
    local n1=nRemain-n10*10
    return n100,n10,n1
end

function PersonalExp_AddOne(nSkill,nLevel,nMaxLevel)
    if (nLevel==nil or nLevel<=0) then return 1 end
    nLevel=floor(nLevel)
    if (nLevel<1 or nLevel>nMaxLevel) then return nil end
    local nRet=AddSkillState(nSkill,nLevel,1,PERSONAL_EXP_DURATION,1)
    if (nRet==nil or nRet==-1) then RemoveSkillState(nSkill); return nil end
    local nActual=GetSkillState(nSkill)
    if (nActual==nil or floor(nActual)~=nLevel) then RemoveSkillState(nSkill); return nil end
    return 1
end

function PersonalExp_ApplyRate(nRate,bSave)
    nRate=tonumber(nRate); if (nRate==nil) then return -1 end
    nRate=floor(nRate)
    if (nRate<1) then nRate=1 end
    if (nRate>PERSONAL_EXP_MAX_RATE) then nRate=PERSONAL_EXP_MAX_RATE end
    local n100,n10,n1=PersonalExp_BuildLevels(nRate)
    PersonalExp_ClearExpStates()
    if (nRate>1) then
        if (PersonalExp_AddOne(PERSONAL_EXP_SKILL_PLUS_100,n100,9)==nil) then PersonalExp_ClearExpStates(); return -2 end
        if (PersonalExp_AddOne(PERSONAL_EXP_SKILL_PLUS_10,n10,9)==nil) then PersonalExp_ClearExpStates(); return -3 end
        if (PersonalExp_AddOne(PERSONAL_EXP_SKILL_PLUS_1,n1,9)==nil) then PersonalExp_ClearExpStates(); return -4 end
    end
    local nActual=PersonalExp_GetEffectiveRate()
    if (nActual~=nRate) then PersonalExp_ClearExpStates(); return -5 end
    if (bSave~=0) then SetTask(PERSONAL_EXP_TASK,nRate) end
    return nRate
end

function PersonalExp_SetRate(nRate) return PersonalExp_ApplyRate(nRate,1) end
function PersonalExp_ReapplySaved() return PersonalExp_ApplyRate(PersonalExp_GetSavedRate(),0) end
function PersonalExp_Pause() PersonalExp_ClearExpStates(); return PersonalExp_GetSavedRate() end
function PersonalExp_TurnOff() return PersonalExp_Pause() end
function PersonalExp_ResetSaved() PersonalExp_ClearExpStates(); SetTask(PERSONAL_EXP_TASK,1); return 1 end
function PersonalExp_OnLogin()
    if (PlayerIndex==nil or PlayerIndex<=0) then return 0 end
    local nRet=PersonalExp_ReapplySaved()
    if (nRet==nil or nRet<1) then PersonalExp_ClearExpStates(); return 0 end
    return 1
end
