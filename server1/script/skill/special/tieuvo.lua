function GetSkillLevelData(levelname, data, level)
	local nTime = 46656000
	local nSpeed = floor(level * 100 / 60)

	if (levelname == "attackspeed_v") then return Param2String(nSpeed, nTime, 0) end
	if (levelname == "castspeed_p") then return Param2String(nSpeed, nTime, 0) end
	if (levelname == "returnres_p") then return Param2String(level, nTime, 0) end

	return ""
end

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end
