function GetSkillLevelData(levelname, data, level)

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
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

function Getaddphysicsdamage_p(level)
result = 7+level*3
return Param2String(result,60,0)
end;

function Getskill_append1(level)
return Param2String(43,level,0)
end
