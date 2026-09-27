function GetSkillLevelData(levelname, data, level)
	local nTime = 46656000
	local nLifeMana = level * 40

	if (levelname == "lifemax_v") then return Param2String(nLifeMana, nTime, 0) end
	if (levelname == "manamax_v") then return Param2String(nLifeMana, nTime, 0) end
	if (levelname == "lucky_v") then return Param2String(level, nTime, 0) end

	return ""
end

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end
