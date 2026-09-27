function GetSkillLevelData(levelname, data, level)
	local nTime = 46656000 
	local nStat = level * 3
	
	if (levelname == "strength_v") then return Param2String(nStat, nTime, 0) end
	if (levelname == "dexterity_v") then return Param2String(nStat, nTime, 0) end
	if (levelname == "vitality_v") then return Param2String(nStat, nTime, 0) end
	if (levelname == "energy_v") then return Param2String(nStat, nTime, 0) end

	if (levelname == "expenhance_p") then
		local nExp = 100
		if level > 50 then nExp = 600
		elseif level > 40 then nExp = 500
		elseif level > 30 then nExp = 400
		elseif level > 20 then nExp = 300
		elseif level > 10 then nExp = 200
		else nExp = 100
		end
		
		return Param2String(nExp, nTime, 0)
	end

	if (levelname == "all_series_resist_max_v") then
		local nResistMax = 0
		if level > 50 then nResistMax = 10
		elseif level > 40 then nResistMax = 5
		end
		
		if nResistMax > 0 then
			return Param2String(nResistMax, nTime, 0)
		end
	end

	return ""
end

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end