function GetSkillLevelData(levelname, data, level)

if (levelname == "attackratingenhance_v") then
return Getattackratingenhance_v(level)
end;

if (levelname == "lifemax_p") then
return Getlifemax_p(level)
end;

if (levelname == "skill_append1") then
return Getskill_append1(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getattackratingenhance_v(level)
result = 50+level*10
return Param2String(result,60,0)
end;

function Getlifemax_p(level)
result = 30+level*3
return Param2String(result,60,0)
end;

function Getskill_append1(level)
return Param2String(28,level,0)
end