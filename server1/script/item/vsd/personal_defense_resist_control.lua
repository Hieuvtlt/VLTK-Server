PERSONAL_DEFRES_CTRL_FILE = "\\script\\item\\vsd\\personal_defense_resist_control.lua"
PERSONAL_DEFRES_TASK_DEFENSE = 5992
PERSONAL_DEFRES_TASK_POISON = 5991
PERSONAL_DEFRES_TASK_COLD = 5990
PERSONAL_DEFRES_TASK_FIRE = 5989
PERSONAL_DEFRES_TASK_LIGHT = 5988
PERSONAL_DEFRES_TASK_ALL = 5987
PERSONAL_DEFRES_SKILL_DEFENSE = 1915
PERSONAL_DEFRES_SKILL_POISON = 1916
PERSONAL_DEFRES_SKILL_COLD = 1917
PERSONAL_DEFRES_SKILL_FIRE = 1918
PERSONAL_DEFRES_SKILL_LIGHT = 1919
PERSONAL_DEFRES_SKILL_ALL = 1920
PERSONAL_DEFRES_SKILL_POISON_1 = 1935
PERSONAL_DEFRES_SKILL_COLD_1 = 1936
PERSONAL_DEFRES_SKILL_FIRE_1 = 1937
PERSONAL_DEFRES_SKILL_LIGHT_1 = 1938
PERSONAL_DEFRES_SKILL_ALL_1 = 1939
PERSONAL_DEFRES_STEP_DEFENSE = 10
PERSONAL_DEFRES_MAX_DEFENSE = 200
PERSONAL_DEFRES_MAX_SPECIFIC = 75
PERSONAL_DEFRES_MAX_ALL = 75
PERSONAL_DEFRES_DURATION = 18 * 60 * 60 * 24 * 365

function PersonalDefenseResist_Normalize(nValue,nMax,nStep)
    nValue=tonumber(nValue); if (nValue==nil) then return nil end; nValue=floor(nValue)
    if (nValue<0) then nValue=0 end; if (nValue>nMax) then nValue=nMax end
    if (nStep and nStep>1) then nValue=floor(nValue/nStep)*nStep end
    return nValue
end
function PersonalDefenseResist_GetSavedByTask(nTask,nMax,nStep)
    local nRaw=GetTask(nTask); if (nRaw==nil) then nRaw=0 end
    local nValue=PersonalDefenseResist_Normalize(nRaw,nMax,nStep); if (nValue==nil) then nValue=0 end
    if (nValue~=nRaw) then SetTask(nTask,nValue) end; return nValue
end
function PersonalDefenseResist_GetSavedDefense() return PersonalDefenseResist_GetSavedByTask(PERSONAL_DEFRES_TASK_DEFENSE,PERSONAL_DEFRES_MAX_DEFENSE,PERSONAL_DEFRES_STEP_DEFENSE) end
function PersonalDefenseResist_GetSavedPoison() return PersonalDefenseResist_GetSavedByTask(PERSONAL_DEFRES_TASK_POISON,PERSONAL_DEFRES_MAX_SPECIFIC,1) end
function PersonalDefenseResist_GetSavedCold() return PersonalDefenseResist_GetSavedByTask(PERSONAL_DEFRES_TASK_COLD,PERSONAL_DEFRES_MAX_SPECIFIC,1) end
function PersonalDefenseResist_GetSavedFire() return PersonalDefenseResist_GetSavedByTask(PERSONAL_DEFRES_TASK_FIRE,PERSONAL_DEFRES_MAX_SPECIFIC,1) end
function PersonalDefenseResist_GetSavedLight() return PersonalDefenseResist_GetSavedByTask(PERSONAL_DEFRES_TASK_LIGHT,PERSONAL_DEFRES_MAX_SPECIFIC,1) end
function PersonalDefenseResist_GetSavedAll() return PersonalDefenseResist_GetSavedByTask(PERSONAL_DEFRES_TASK_ALL,PERSONAL_DEFRES_MAX_ALL,1) end
function PersonalDefenseResist_GetStateLevel(nSkill,nMaxLevel)
    local nLevel=GetSkillState(nSkill); if (nLevel==nil or nLevel<1) then return 0 end
    nLevel=floor(nLevel); if (nLevel>nMaxLevel) then return -1 end; return nLevel
end
function PersonalDefenseResist_GetAppliedDefense()
    local nLevel=PersonalDefenseResist_GetStateLevel(PERSONAL_DEFRES_SKILL_DEFENSE,20); if (nLevel<0) then return -1 end
    local nValue=nLevel*PERSONAL_DEFRES_STEP_DEFENSE; if (nValue>PERSONAL_DEFRES_MAX_DEFENSE) then return -1 end; return nValue
end
function PersonalDefenseResist_GetAppliedResist(nSkill5,nSkill1,nMax)
    local n5=PersonalDefenseResist_GetStateLevel(nSkill5,15); local n1=PersonalDefenseResist_GetStateLevel(nSkill1,4)
    if (n5<0 or n1<0) then return -1 end
    local nValue=n5*5+n1; if (nValue>nMax) then return -1 end; return nValue
end
function PersonalDefenseResist_GetAppliedPoison() return PersonalDefenseResist_GetAppliedResist(PERSONAL_DEFRES_SKILL_POISON,PERSONAL_DEFRES_SKILL_POISON_1,PERSONAL_DEFRES_MAX_SPECIFIC) end
function PersonalDefenseResist_GetAppliedCold() return PersonalDefenseResist_GetAppliedResist(PERSONAL_DEFRES_SKILL_COLD,PERSONAL_DEFRES_SKILL_COLD_1,PERSONAL_DEFRES_MAX_SPECIFIC) end
function PersonalDefenseResist_GetAppliedFire() return PersonalDefenseResist_GetAppliedResist(PERSONAL_DEFRES_SKILL_FIRE,PERSONAL_DEFRES_SKILL_FIRE_1,PERSONAL_DEFRES_MAX_SPECIFIC) end
function PersonalDefenseResist_GetAppliedLight() return PersonalDefenseResist_GetAppliedResist(PERSONAL_DEFRES_SKILL_LIGHT,PERSONAL_DEFRES_SKILL_LIGHT_1,PERSONAL_DEFRES_MAX_SPECIFIC) end
function PersonalDefenseResist_GetAppliedAll() return PersonalDefenseResist_GetAppliedResist(PERSONAL_DEFRES_SKILL_ALL,PERSONAL_DEFRES_SKILL_ALL_1,PERSONAL_DEFRES_MAX_ALL) end
function PersonalDefenseResist_AddState(nSkill,nLevel,nMaxLevel)
    if (nLevel==nil or nLevel<=0) then return 1 end
    nLevel=floor(nLevel); if (nLevel<1 or nLevel>nMaxLevel) then return nil end
    local nRet=AddSkillState(nSkill,nLevel,0,PERSONAL_DEFRES_DURATION,1)
    if (nRet==nil or nRet==-1) then RemoveSkillState(nSkill); return nil end
    local nActual=GetSkillState(nSkill); if (nActual==nil or floor(nActual)~=nLevel) then RemoveSkillState(nSkill); return nil end
    return 1
end
function PersonalDefenseResist_ApplyDefense(nValue)
    local nSafe=PersonalDefenseResist_Normalize(nValue,PERSONAL_DEFRES_MAX_DEFENSE,PERSONAL_DEFRES_STEP_DEFENSE); if (nSafe==nil) then return -1 end
    RemoveSkillState(PERSONAL_DEFRES_SKILL_DEFENSE); if (nSafe<=0) then return 0 end
    local nLevel=floor(nSafe/PERSONAL_DEFRES_STEP_DEFENSE)
    if (PersonalDefenseResist_AddState(PERSONAL_DEFRES_SKILL_DEFENSE,nLevel,20)==nil) then RemoveSkillState(PERSONAL_DEFRES_SKILL_DEFENSE); return -2 end
    if (PersonalDefenseResist_GetAppliedDefense()~=nSafe) then RemoveSkillState(PERSONAL_DEFRES_SKILL_DEFENSE); return -3 end
    return nSafe
end
function PersonalDefenseResist_ApplyResist(nSkill5,nSkill1,nValue,nMax)
    local nSafe=PersonalDefenseResist_Normalize(nValue,nMax,1); if (nSafe==nil) then return -1 end
    RemoveSkillState(nSkill5); RemoveSkillState(nSkill1); if (nSafe<=0) then return 0 end
    local n5=floor(nSafe/5); local n1=nSafe-n5*5
    if (PersonalDefenseResist_AddState(nSkill5,n5,15)==nil) then RemoveSkillState(nSkill5); RemoveSkillState(nSkill1); return -2 end
    if (PersonalDefenseResist_AddState(nSkill1,n1,4)==nil) then RemoveSkillState(nSkill5); RemoveSkillState(nSkill1); return -3 end
    if (PersonalDefenseResist_GetAppliedResist(nSkill5,nSkill1,nMax)~=nSafe) then RemoveSkillState(nSkill5); RemoveSkillState(nSkill1); return -4 end
    return nSafe
end
function PersonalDefenseResist_SetDefense(nValue)
    local nOldSaved=PersonalDefenseResist_GetSavedDefense(); local nOldApplied=PersonalDefenseResist_GetAppliedDefense(); if (nOldApplied<0) then nOldApplied=0 end
    local nNew=PersonalDefenseResist_Normalize(nValue,PERSONAL_DEFRES_MAX_DEFENSE,PERSONAL_DEFRES_STEP_DEFENSE); if (nNew==nil) then return -1 end
    local nRet=PersonalDefenseResist_ApplyDefense(nNew)
    if (nRet<0) then RemoveSkillState(PERSONAL_DEFRES_SKILL_DEFENSE); if (nOldApplied>0) then PersonalDefenseResist_ApplyDefense(nOldApplied) end; SetTask(PERSONAL_DEFRES_TASK_DEFENSE,nOldSaved); return -2 end
    SetTask(PERSONAL_DEFRES_TASK_DEFENSE,nNew); return nNew
end
function PersonalDefenseResist_SetResist(nTask,nSkill5,nSkill1,nValue,nMax)
    local nOldSaved=PersonalDefenseResist_GetSavedByTask(nTask,nMax,1); local nOldApplied=PersonalDefenseResist_GetAppliedResist(nSkill5,nSkill1,nMax); if (nOldApplied<0) then nOldApplied=0 end
    local nNew=PersonalDefenseResist_Normalize(nValue,nMax,1); if (nNew==nil) then return -1 end
    local nRet=PersonalDefenseResist_ApplyResist(nSkill5,nSkill1,nNew,nMax)
    if (nRet<0) then RemoveSkillState(nSkill5); RemoveSkillState(nSkill1); if (nOldApplied>0) then PersonalDefenseResist_ApplyResist(nSkill5,nSkill1,nOldApplied,nMax) end; SetTask(nTask,nOldSaved); return -2 end
    SetTask(nTask,nNew); return nNew
end
function PersonalDefenseResist_SetPoison(nValue) return PersonalDefenseResist_SetResist(PERSONAL_DEFRES_TASK_POISON,PERSONAL_DEFRES_SKILL_POISON,PERSONAL_DEFRES_SKILL_POISON_1,nValue,PERSONAL_DEFRES_MAX_SPECIFIC) end
function PersonalDefenseResist_SetCold(nValue) return PersonalDefenseResist_SetResist(PERSONAL_DEFRES_TASK_COLD,PERSONAL_DEFRES_SKILL_COLD,PERSONAL_DEFRES_SKILL_COLD_1,nValue,PERSONAL_DEFRES_MAX_SPECIFIC) end
function PersonalDefenseResist_SetFire(nValue) return PersonalDefenseResist_SetResist(PERSONAL_DEFRES_TASK_FIRE,PERSONAL_DEFRES_SKILL_FIRE,PERSONAL_DEFRES_SKILL_FIRE_1,nValue,PERSONAL_DEFRES_MAX_SPECIFIC) end
function PersonalDefenseResist_SetLight(nValue) return PersonalDefenseResist_SetResist(PERSONAL_DEFRES_TASK_LIGHT,PERSONAL_DEFRES_SKILL_LIGHT,PERSONAL_DEFRES_SKILL_LIGHT_1,nValue,PERSONAL_DEFRES_MAX_SPECIFIC) end
function PersonalDefenseResist_SetAll(nValue) return PersonalDefenseResist_SetResist(PERSONAL_DEFRES_TASK_ALL,PERSONAL_DEFRES_SKILL_ALL,PERSONAL_DEFRES_SKILL_ALL_1,nValue,PERSONAL_DEFRES_MAX_ALL) end
function PersonalDefenseResist_PauseDefense() RemoveSkillState(PERSONAL_DEFRES_SKILL_DEFENSE); return PersonalDefenseResist_GetSavedDefense() end
function PersonalDefenseResist_PausePoison() RemoveSkillState(PERSONAL_DEFRES_SKILL_POISON); RemoveSkillState(PERSONAL_DEFRES_SKILL_POISON_1); return PersonalDefenseResist_GetSavedPoison() end
function PersonalDefenseResist_PauseCold() RemoveSkillState(PERSONAL_DEFRES_SKILL_COLD); RemoveSkillState(PERSONAL_DEFRES_SKILL_COLD_1); return PersonalDefenseResist_GetSavedCold() end
function PersonalDefenseResist_PauseFire() RemoveSkillState(PERSONAL_DEFRES_SKILL_FIRE); RemoveSkillState(PERSONAL_DEFRES_SKILL_FIRE_1); return PersonalDefenseResist_GetSavedFire() end
function PersonalDefenseResist_PauseLight() RemoveSkillState(PERSONAL_DEFRES_SKILL_LIGHT); RemoveSkillState(PERSONAL_DEFRES_SKILL_LIGHT_1); return PersonalDefenseResist_GetSavedLight() end
function PersonalDefenseResist_PauseAllRes() RemoveSkillState(PERSONAL_DEFRES_SKILL_ALL); RemoveSkillState(PERSONAL_DEFRES_SKILL_ALL_1); return PersonalDefenseResist_GetSavedAll() end
function PersonalDefenseResist_PauseEverything()
    RemoveSkillState(PERSONAL_DEFRES_SKILL_DEFENSE)
    RemoveSkillState(PERSONAL_DEFRES_SKILL_POISON); RemoveSkillState(PERSONAL_DEFRES_SKILL_POISON_1)
    RemoveSkillState(PERSONAL_DEFRES_SKILL_COLD); RemoveSkillState(PERSONAL_DEFRES_SKILL_COLD_1)
    RemoveSkillState(PERSONAL_DEFRES_SKILL_FIRE); RemoveSkillState(PERSONAL_DEFRES_SKILL_FIRE_1)
    RemoveSkillState(PERSONAL_DEFRES_SKILL_LIGHT); RemoveSkillState(PERSONAL_DEFRES_SKILL_LIGHT_1)
    RemoveSkillState(PERSONAL_DEFRES_SKILL_ALL); RemoveSkillState(PERSONAL_DEFRES_SKILL_ALL_1)
    return 1
end
function PersonalDefenseResist_TurnOffDefense() return PersonalDefenseResist_PauseDefense() end
function PersonalDefenseResist_TurnOffPoison() return PersonalDefenseResist_PausePoison() end
function PersonalDefenseResist_TurnOffCold() return PersonalDefenseResist_PauseCold() end
function PersonalDefenseResist_TurnOffFire() return PersonalDefenseResist_PauseFire() end
function PersonalDefenseResist_TurnOffLight() return PersonalDefenseResist_PauseLight() end
function PersonalDefenseResist_TurnOffAllRes() return PersonalDefenseResist_PauseAllRes() end
function PersonalDefenseResist_TurnOffEverything() return PersonalDefenseResist_PauseEverything() end
function PersonalDefenseResist_ResetEverything()
    PersonalDefenseResist_PauseEverything()
    SetTask(PERSONAL_DEFRES_TASK_DEFENSE,0); SetTask(PERSONAL_DEFRES_TASK_POISON,0); SetTask(PERSONAL_DEFRES_TASK_COLD,0)
    SetTask(PERSONAL_DEFRES_TASK_FIRE,0); SetTask(PERSONAL_DEFRES_TASK_LIGHT,0); SetTask(PERSONAL_DEFRES_TASK_ALL,0); return 1
end
function PersonalDefenseResist_ReapplySaved()
    local nDef=PersonalDefenseResist_GetSavedDefense(); local nPoison=PersonalDefenseResist_GetSavedPoison(); local nCold=PersonalDefenseResist_GetSavedCold()
    local nFire=PersonalDefenseResist_GetSavedFire(); local nLight=PersonalDefenseResist_GetSavedLight(); local nAll=PersonalDefenseResist_GetSavedAll()
    PersonalDefenseResist_PauseEverything()
    if (PersonalDefenseResist_ApplyDefense(nDef)<0) then PersonalDefenseResist_PauseEverything(); return -1 end
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_POISON,PERSONAL_DEFRES_SKILL_POISON_1,nPoison,PERSONAL_DEFRES_MAX_SPECIFIC)<0) then PersonalDefenseResist_PauseEverything(); return -2 end
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_COLD,PERSONAL_DEFRES_SKILL_COLD_1,nCold,PERSONAL_DEFRES_MAX_SPECIFIC)<0) then PersonalDefenseResist_PauseEverything(); return -3 end
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_FIRE,PERSONAL_DEFRES_SKILL_FIRE_1,nFire,PERSONAL_DEFRES_MAX_SPECIFIC)<0) then PersonalDefenseResist_PauseEverything(); return -4 end
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_LIGHT,PERSONAL_DEFRES_SKILL_LIGHT_1,nLight,PERSONAL_DEFRES_MAX_SPECIFIC)<0) then PersonalDefenseResist_PauseEverything(); return -5 end
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_ALL,PERSONAL_DEFRES_SKILL_ALL_1,nAll,PERSONAL_DEFRES_MAX_ALL)<0) then PersonalDefenseResist_PauseEverything(); return -6 end
    if (PersonalDefenseResist_GetAppliedDefense()~=nDef or PersonalDefenseResist_GetAppliedPoison()~=nPoison or PersonalDefenseResist_GetAppliedCold()~=nCold or PersonalDefenseResist_GetAppliedFire()~=nFire or PersonalDefenseResist_GetAppliedLight()~=nLight or PersonalDefenseResist_GetAppliedAll()~=nAll) then PersonalDefenseResist_PauseEverything(); return -7 end
    return 1
end
function PersonalDefenseResist_StopMonitorForCurrentPlayer() return 1 end
function PersonalDefenseResist_StartMonitorForCurrentPlayer() return 0 end
function PersonalDefenseResist_MonitorTimer(nPacked,nTimerId) return 0 end
function PersonalDefenseResist_MonitorTick(nToken) return 0 end
function PersonalDefenseResist_RefreshNow() return PersonalDefenseResist_ReapplySaved() end
function PersonalDefenseResist_RebalanceDefense() return PersonalDefenseResist_ApplyDefense(PersonalDefenseResist_GetSavedDefense()) end
function PersonalDefenseResist_RebalanceResistances()
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_POISON,PERSONAL_DEFRES_SKILL_POISON_1,PersonalDefenseResist_GetSavedPoison(),PERSONAL_DEFRES_MAX_SPECIFIC)<0) then return -1 end
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_COLD,PERSONAL_DEFRES_SKILL_COLD_1,PersonalDefenseResist_GetSavedCold(),PERSONAL_DEFRES_MAX_SPECIFIC)<0) then return -2 end
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_FIRE,PERSONAL_DEFRES_SKILL_FIRE_1,PersonalDefenseResist_GetSavedFire(),PERSONAL_DEFRES_MAX_SPECIFIC)<0) then return -3 end
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_LIGHT,PERSONAL_DEFRES_SKILL_LIGHT_1,PersonalDefenseResist_GetSavedLight(),PERSONAL_DEFRES_MAX_SPECIFIC)<0) then return -4 end
    if (PersonalDefenseResist_ApplyResist(PERSONAL_DEFRES_SKILL_ALL,PERSONAL_DEFRES_SKILL_ALL_1,PersonalDefenseResist_GetSavedAll(),PERSONAL_DEFRES_MAX_ALL)<0) then return -5 end
    return 1
end
function PersonalDefenseResist_OnLogin()
    if (PlayerIndex==nil or PlayerIndex<=0) then return 0 end
    return DynamicExecuteByPlayer(PlayerIndex,PERSONAL_DEFRES_CTRL_FILE,"PersonalDefenseResist_OnLoginInternal")
end
function PersonalDefenseResist_OnLoginInternal()
    if (PlayerIndex==nil or PlayerIndex<=0) then return 0 end
    local nRet=PersonalDefenseResist_ReapplySaved()
    if (nRet==nil or nRet<0) then return 0 end
    return 1
end
