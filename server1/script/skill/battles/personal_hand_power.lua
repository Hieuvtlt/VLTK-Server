Include("\\script\\skill\\param2string.lua")

PERSONAL_HAND_POWER_DEFAULT_TIME = 3 * 60 * 18

function GetSkillLevelData(levelname, data, level)
    if (levelname ~= "add_damage_p") then return "" end
    level = tonumber(level)
    if (level == nil) then return "" end
    level = floor(level)
    if (level < 1) then return "" end

    if (data == "personal_hand_plus50") then
        return Param2String(level * 50, PERSONAL_HAND_POWER_DEFAULT_TIME, 0)
    end
    if (data == "personal_hand_plus10") then
        return Param2String(level * 10, PERSONAL_HAND_POWER_DEFAULT_TIME, 0)
    end
    if (data == "personal_hand_minus10") then
        return Param2String(level * -10, PERSONAL_HAND_POWER_DEFAULT_TIME, 0)
    end
    if (data == "personal_hand_minus1") then
        return Param2String(level * -1, PERSONAL_HAND_POWER_DEFAULT_TIME, 0)
    end
    return ""
end
