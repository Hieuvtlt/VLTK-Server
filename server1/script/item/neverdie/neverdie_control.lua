-- Never Die - 2 lùa chän ®· kiÓm chøng trªn source BOSS ONLY.
-- 1 Kh¸ng th­êng: SkillState 993 + 309.
-- 2 Kh¸ng Full Ph¶n §am: SkillState 993 + 309 + 835.
-- Task 5907 t­¬ng thÝch ng­îc: 0=T¾t, 1=Kh¸ng th­êng, 2=Kh¸ng Full Ph¶n §am.
-- Kh«ng söa game.exe, kh«ng söa jx_linux_y, kh«ng söa settings/skills.txt.

NEVER_DIE_CTRL_FILE = "\\script\\item\\neverdie\\neverdie_control.lua"
NEVER_DIE_TASK = 5907
NEVER_DIE_DURATION = 18 * 60 * 60 * 24 * 365
NEVER_DIE_SKILL_BLOCK = 993
NEVER_DIE_SKILL_IMMUNE = 309
NEVER_DIE_SKILL_REFLECT = 835

function NeverDie_GetSaved()
    local nValue = GetTask(NEVER_DIE_TASK)
    if (nValue == 1 or nValue == 2) then return nValue; end;
    return 0;
end;

function NeverDie_GetBlockState()
    local nLevel = GetSkillState(NEVER_DIE_SKILL_BLOCK)
    if (nLevel == nil or nLevel < 1) then return 0; end;
    return nLevel;
end;

function NeverDie_GetImmuneState()
    local nLevel = GetSkillState(NEVER_DIE_SKILL_IMMUNE)
    if (nLevel == nil or nLevel < 1) then return 0; end;
    return nLevel;
end;

function NeverDie_GetReflectState()
    local nLevel = GetSkillState(NEVER_DIE_SKILL_REFLECT)
    if (nLevel == nil or nLevel < 1) then return 0; end;
    return nLevel;
end;

function NeverDie_ModeText(nMode)
    if (nMode == 1) then return "1 Kh¸ng th­êng"; end;
    if (nMode == 2) then return "2 Kh¸ng Full Ph¶n §am"; end;
    return "TÀT";
end;

function NeverDie_ClearRuntime()
    if (GetSkillState(NEVER_DIE_SKILL_BLOCK) ~= -1) then
        RemoveSkillState(NEVER_DIE_SKILL_BLOCK);
    end;
    if (GetSkillState(NEVER_DIE_SKILL_IMMUNE) ~= -1) then
        RemoveSkillState(NEVER_DIE_SKILL_IMMUNE);
    end;
    if (GetSkillState(NEVER_DIE_SKILL_REFLECT) ~= -1) then
        RemoveSkillState(NEVER_DIE_SKILL_REFLECT);
    end;
    return 1;
end;

function NeverDie_ApplyMode(nMode)
    if (nMode ~= 1 and nMode ~= 2) then return -10; end;
    NeverDie_ClearRuntime();

    -- 993: block_rate = 100, líp kh¸ng damage ®· test thµnh c«ng.
    local nRet1 = AddSkillState(NEVER_DIE_SKILL_BLOCK, 1, 0, NEVER_DIE_DURATION, 1);
    if (nRet1 == nil or nRet1 == -1) then
        NeverDie_ClearRuntime();
        return -1;
    end;

    -- 309: miÔn dÞch tr¹ng th¸i xÊu ®· test thµnh c«ng.
    local nRet2 = AddSkillState(NEVER_DIE_SKILL_IMMUNE, 10, 0, NEVER_DIE_DURATION, 1);
    if (nRet2 == nil or nRet2 == -1) then
        NeverDie_ClearRuntime();
        return -2;
    end;

    -- Mode 2: thªm ®óng 835 theo bµi test chèng ph¶n ®ßn ®· PASS.
    -- Gi÷ c¸ch gäi gièng bµi test, chØ ®æi thêi gian tõ 60 gi©y thµnh 1 n¨m.
    if (nMode == 2) then
        local nRet3 = AddSkillState(NEVER_DIE_SKILL_REFLECT, 1, 0, NEVER_DIE_DURATION);
        if (nRet3 == nil or nRet3 == -1) then
            NeverDie_ClearRuntime();
            return -5;
        end;
    end;

    if (NeverDie_GetBlockState() < 1) then
        NeverDie_ClearRuntime();
        return -3;
    end;
    if (NeverDie_GetImmuneState() < 1) then
        NeverDie_ClearRuntime();
        return -4;
    end;
    if (nMode == 2 and NeverDie_GetReflectState() < 1) then
        NeverDie_ClearRuntime();
        return -6;
    end;
    if (nMode == 1 and NeverDie_GetReflectState() > 0) then
        NeverDie_ClearRuntime();
        return -7;
    end;
    return 1;
end;

function NeverDie_EnableMode(nMode)
    if (nMode ~= 1 and nMode ~= 2) then return -10; end;
    local nOldSaved = NeverDie_GetSaved();
    local nRet = NeverDie_ApplyMode(nMode);
    if (nRet == nil or nRet < 1) then
        SetTask(NEVER_DIE_TASK, nOldSaved);
        if (nOldSaved == 1 or nOldSaved == 2) then
            NeverDie_ApplyMode(nOldSaved);
        else
            NeverDie_ClearRuntime();
        end;
        return nRet;
    end;
    SetTask(NEVER_DIE_TASK, nMode);
    return 1;
end;

function NeverDie_EnableNormal()
    return NeverDie_EnableMode(1);
end;

function NeverDie_EnableFullReflect()
    return NeverDie_EnableMode(2);
end;

-- Gi÷ tªn hµm cò ®Ó t­¬ng thÝch script/menu cò: mÆc ®Þnh lµ Kh¸ng th­êng.
function NeverDie_Enable()
    return NeverDie_EnableNormal();
end;

function NeverDie_Disable()
    SetTask(NEVER_DIE_TASK, 0);
    NeverDie_ClearRuntime();
    return 1;
end;

function NeverDie_Reapply()
    local nMode = NeverDie_GetSaved();
    if (nMode ~= 1 and nMode ~= 2) then return 0; end;
    return NeverDie_ApplyMode(nMode);
end;

function NeverDie_OnLogin()
    if (PlayerIndex == nil or PlayerIndex <= 0) then return 0; end;
    return DynamicExecuteByPlayer(PlayerIndex, NEVER_DIE_CTRL_FILE, "NeverDie_OnLoginInternal");
end;

function NeverDie_OnLoginInternal()
    if (PlayerIndex == nil or PlayerIndex <= 0) then return 0; end;
    local nMode = NeverDie_GetSaved();
    if (nMode ~= 1 and nMode ~= 2) then return 0; end;
    local nRet = NeverDie_ApplyMode(nMode);
    if (nRet == nil or nRet < 1) then return 0; end;
    return 1;
end;
