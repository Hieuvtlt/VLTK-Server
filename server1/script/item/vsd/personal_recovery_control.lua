PERSONAL_RECOVERY_TASK_LIFE = 5993
PERSONAL_RECOVERY_TASK_MANA = 5994
PERSONAL_RECOVERY_LIFE_SKILL_1000 = 1909
PERSONAL_RECOVERY_LIFE_SKILL_100 = 1929
PERSONAL_RECOVERY_LIFE_SKILL_10 = 1930
PERSONAL_RECOVERY_LIFE_SKILL_1 = 1933
PERSONAL_RECOVERY_MANA_SKILL_1000 = 1912
PERSONAL_RECOVERY_MANA_SKILL_100 = 1931
PERSONAL_RECOVERY_MANA_SKILL_10 = 1932
PERSONAL_RECOVERY_MANA_SKILL_1 = 1934
PERSONAL_RECOVERY_MIN = 10
PERSONAL_RECOVERY_MAX = 10000
PERSONAL_RECOVERY_DURATION = 18 * 60 * 60 * 24 * 365

function PersonalRecovery_NormalizeSaved(nValue)
    nValue=tonumber(nValue); if (nValue==nil) then return 0 end; nValue=floor(nValue)
    if (nValue<=0) then return 0 end
    if (nValue<PERSONAL_RECOVERY_MIN) then nValue=PERSONAL_RECOVERY_MIN end
    if (nValue>PERSONAL_RECOVERY_MAX) then nValue=PERSONAL_RECOVERY_MAX end
    return nValue
end
function PersonalRecovery_GetSavedByTask(nTask)
    local nRaw=GetTask(nTask); local nSafe=PersonalRecovery_NormalizeSaved(nRaw)
    if (nRaw==nil or nRaw~=nSafe) then SetTask(nTask,nSafe) end
    return nSafe
end
function PersonalRecovery_GetSavedLife() return PersonalRecovery_GetSavedByTask(PERSONAL_RECOVERY_TASK_LIFE) end
function PersonalRecovery_GetSavedMana() return PersonalRecovery_GetSavedByTask(PERSONAL_RECOVERY_TASK_MANA) end
function PersonalRecovery_GetStateLevel(nSkill,nMaxLevel)
    local nLevel=GetSkillState(nSkill); if (nLevel==nil or nLevel<1) then return 0 end
    nLevel=floor(nLevel); if (nLevel<1 or nLevel>nMaxLevel) then return -1 end
    return nLevel
end
function PersonalRecovery_GetAppliedBySkills(nSkill1000,nSkill100,nSkill10,nSkill1)
    local n1000=PersonalRecovery_GetStateLevel(nSkill1000,10)
    local n100=PersonalRecovery_GetStateLevel(nSkill100,9)
    local n10=PersonalRecovery_GetStateLevel(nSkill10,9)
    local n1=PersonalRecovery_GetStateLevel(nSkill1,9)
    if (n1000<0 or n100<0 or n10<0 or n1<0) then return -1 end
    local nValue=n1000*1000+n100*100+n10*10+n1
    if (nValue>PERSONAL_RECOVERY_MAX) then return -1 end
    return nValue
end
function PersonalRecovery_GetAppliedLife() return PersonalRecovery_GetAppliedBySkills(PERSONAL_RECOVERY_LIFE_SKILL_1000,PERSONAL_RECOVERY_LIFE_SKILL_100,PERSONAL_RECOVERY_LIFE_SKILL_10,PERSONAL_RECOVERY_LIFE_SKILL_1) end
function PersonalRecovery_GetAppliedMana() return PersonalRecovery_GetAppliedBySkills(PERSONAL_RECOVERY_MANA_SKILL_1000,PERSONAL_RECOVERY_MANA_SKILL_100,PERSONAL_RECOVERY_MANA_SKILL_10,PERSONAL_RECOVERY_MANA_SKILL_1) end
function PersonalRecovery_ClearLifeStates()
    RemoveSkillState(PERSONAL_RECOVERY_LIFE_SKILL_1000); RemoveSkillState(PERSONAL_RECOVERY_LIFE_SKILL_100); RemoveSkillState(PERSONAL_RECOVERY_LIFE_SKILL_10); RemoveSkillState(PERSONAL_RECOVERY_LIFE_SKILL_1); return 1
end
function PersonalRecovery_ClearManaStates()
    RemoveSkillState(PERSONAL_RECOVERY_MANA_SKILL_1000); RemoveSkillState(PERSONAL_RECOVERY_MANA_SKILL_100); RemoveSkillState(PERSONAL_RECOVERY_MANA_SKILL_10); RemoveSkillState(PERSONAL_RECOVERY_MANA_SKILL_1); return 1
end
function PersonalRecovery_BuildLevels(nValue)
    nValue=PersonalRecovery_NormalizeSaved(nValue)
    local n1000=floor(nValue/1000)
    local nRemain=nValue-n1000*1000
    local n100=floor(nRemain/100); nRemain=nRemain-n100*100
    local n10=floor(nRemain/10); nRemain=nRemain-n10*10
    local n1=nRemain
    return n1000,n100,n10,n1
end
function PersonalRecovery_AddOne(nSkill,nLevel,nMaxLevel)
    if (nLevel==nil or nLevel<=0) then return 1 end
    nLevel=floor(nLevel); if (nLevel<1 or nLevel>nMaxLevel) then return nil end
    local nRet=AddSkillState(nSkill,nLevel,0,PERSONAL_RECOVERY_DURATION,1)
    if (nRet==nil or nRet==-1) then RemoveSkillState(nSkill); return nil end
    local nActual=GetSkillState(nSkill)
    if (nActual==nil or floor(nActual)~=nLevel) then RemoveSkillState(nSkill); return nil end
    return 1
end
function PersonalRecovery_ApplyBySkills(nSkill1000,nSkill100,nSkill10,nSkill1,nValue)
    local nSafe=PersonalRecovery_NormalizeSaved(nValue)
    local n1000,n100,n10,n1=PersonalRecovery_BuildLevels(nSafe)
    RemoveSkillState(nSkill1000); RemoveSkillState(nSkill100); RemoveSkillState(nSkill10); RemoveSkillState(nSkill1)
    if (nSafe<=0) then return 0 end
    if (PersonalRecovery_AddOne(nSkill1000,n1000,10)==nil) then RemoveSkillState(nSkill1000); RemoveSkillState(nSkill100); RemoveSkillState(nSkill10); RemoveSkillState(nSkill1); return -1 end
    if (PersonalRecovery_AddOne(nSkill100,n100,9)==nil) then RemoveSkillState(nSkill1000); RemoveSkillState(nSkill100); RemoveSkillState(nSkill10); RemoveSkillState(nSkill1); return -2 end
    if (PersonalRecovery_AddOne(nSkill10,n10,9)==nil) then RemoveSkillState(nSkill1000); RemoveSkillState(nSkill100); RemoveSkillState(nSkill10); RemoveSkillState(nSkill1); return -3 end
    if (PersonalRecovery_AddOne(nSkill1,n1,9)==nil) then RemoveSkillState(nSkill1000); RemoveSkillState(nSkill100); RemoveSkillState(nSkill10); RemoveSkillState(nSkill1); return -4 end
    local nActual=PersonalRecovery_GetAppliedBySkills(nSkill1000,nSkill100,nSkill10,nSkill1)
    if (nActual~=nSafe) then RemoveSkillState(nSkill1000); RemoveSkillState(nSkill100); RemoveSkillState(nSkill10); RemoveSkillState(nSkill1); return -5 end
    return nSafe
end
function PersonalRecovery_ApplyLifeRaw(nValue) return PersonalRecovery_ApplyBySkills(PERSONAL_RECOVERY_LIFE_SKILL_1000,PERSONAL_RECOVERY_LIFE_SKILL_100,PERSONAL_RECOVERY_LIFE_SKILL_10,PERSONAL_RECOVERY_LIFE_SKILL_1,nValue) end
function PersonalRecovery_ApplyManaRaw(nValue) return PersonalRecovery_ApplyBySkills(PERSONAL_RECOVERY_MANA_SKILL_1000,PERSONAL_RECOVERY_MANA_SKILL_100,PERSONAL_RECOVERY_MANA_SKILL_10,PERSONAL_RECOVERY_MANA_SKILL_1,nValue) end
function PersonalRecovery_SetLife(nValue)
    local nOldSaved=PersonalRecovery_GetSavedLife(); local nOldApplied=PersonalRecovery_GetAppliedLife(); if (nOldApplied<0) then nOldApplied=0 end
    local nNew=PersonalRecovery_NormalizeSaved(nValue); local nRet=PersonalRecovery_ApplyLifeRaw(nNew)
    if (nRet==nil or nRet<0) then PersonalRecovery_ClearLifeStates(); if (nOldApplied>0) then PersonalRecovery_ApplyLifeRaw(nOldApplied) end; SetTask(PERSONAL_RECOVERY_TASK_LIFE,nOldSaved); return -1 end
    SetTask(PERSONAL_RECOVERY_TASK_LIFE,nNew); return nNew
end
function PersonalRecovery_SetMana(nValue)
    local nOldSaved=PersonalRecovery_GetSavedMana(); local nOldApplied=PersonalRecovery_GetAppliedMana(); if (nOldApplied<0) then nOldApplied=0 end
    local nNew=PersonalRecovery_NormalizeSaved(nValue); local nRet=PersonalRecovery_ApplyManaRaw(nNew)
    if (nRet==nil or nRet<0) then PersonalRecovery_ClearManaStates(); if (nOldApplied>0) then PersonalRecovery_ApplyManaRaw(nOldApplied) end; SetTask(PERSONAL_RECOVERY_TASK_MANA,nOldSaved); return -1 end
    SetTask(PERSONAL_RECOVERY_TASK_MANA,nNew); return nNew
end
function PersonalRecovery_ReapplySaved()
    local nLife=PersonalRecovery_GetSavedLife(); local nMana=PersonalRecovery_GetSavedMana()
    PersonalRecovery_PauseAll()
    if (PersonalRecovery_ApplyLifeRaw(nLife)<0) then PersonalRecovery_PauseAll(); return -1 end
    if (PersonalRecovery_ApplyManaRaw(nMana)<0) then PersonalRecovery_PauseAll(); return -2 end
    if (PersonalRecovery_GetAppliedLife()~=nLife) then PersonalRecovery_PauseAll(); return -3 end
    if (PersonalRecovery_GetAppliedMana()~=nMana) then PersonalRecovery_PauseAll(); return -4 end
    return 1
end
function PersonalRecovery_PauseLife() PersonalRecovery_ClearLifeStates(); return PersonalRecovery_GetSavedLife() end
function PersonalRecovery_PauseMana() PersonalRecovery_ClearManaStates(); return PersonalRecovery_GetSavedMana() end
function PersonalRecovery_PauseAll() PersonalRecovery_ClearLifeStates(); PersonalRecovery_ClearManaStates(); return 1 end
function PersonalRecovery_TurnOffLife() return PersonalRecovery_PauseLife() end
function PersonalRecovery_TurnOffMana() return PersonalRecovery_PauseMana() end
function PersonalRecovery_TurnOffAll() return PersonalRecovery_PauseAll() end
function PersonalRecovery_ResetLife() PersonalRecovery_ClearLifeStates(); SetTask(PERSONAL_RECOVERY_TASK_LIFE,0); return 0 end
function PersonalRecovery_ResetMana() PersonalRecovery_ClearManaStates(); SetTask(PERSONAL_RECOVERY_TASK_MANA,0); return 0 end
function PersonalRecovery_ResetAll() PersonalRecovery_PauseAll(); SetTask(PERSONAL_RECOVERY_TASK_LIFE,0); SetTask(PERSONAL_RECOVERY_TASK_MANA,0); return 1 end
function PersonalRecovery_OnLogin()
    if (PlayerIndex==nil or PlayerIndex<=0) then return 0 end
    local nRet=PersonalRecovery_ReapplySaved()
    if (nRet==nil or nRet<0) then return 0 end
    return 1
end
