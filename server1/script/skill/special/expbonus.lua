function GetSkillLevelData(levelname, data, level)

if (levelname == "expenhance_p") then
    local nStep = 100
    if (data == "personal_exp_plus10000") then nStep = 10000 end
    if (data == "personal_exp_plus1000") then nStep = 1000 end
    if (data == "personal_exp_plus100") then nStep = 100 end
    return Param2String(level*nStep,64800,0);
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;
