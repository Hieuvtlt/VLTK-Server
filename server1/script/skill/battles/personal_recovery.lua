Include("\\script\\skill\\param2string.lua")

PERSONAL_RECOVERY_DEFAULT_TIME = 12

function GetSkillLevelData(levelname, data, level)
    level=tonumber(level); if (level==nil) then return "" end
    level=floor(level); if (level<1) then return "" end
    if (levelname == "lifereplenish_v") then
        if (data == "personal_life_plus1000") then return Param2String(level*1000,PERSONAL_RECOVERY_DEFAULT_TIME,0) end
        if (data == "personal_life_plus100") then return Param2String(level*100,PERSONAL_RECOVERY_DEFAULT_TIME,0) end
        if (data == "personal_life_plus10") then return Param2String(level*10,PERSONAL_RECOVERY_DEFAULT_TIME,0) end
        if (data == "personal_life_plus1") then return Param2String(level,PERSONAL_RECOVERY_DEFAULT_TIME,0) end
    end
    if (levelname == "manareplenish_v") then
        if (data == "personal_mana_plus1000") then return Param2String(level*1000,PERSONAL_RECOVERY_DEFAULT_TIME,0) end
        if (data == "personal_mana_plus100") then return Param2String(level*100,PERSONAL_RECOVERY_DEFAULT_TIME,0) end
        if (data == "personal_mana_plus10") then return Param2String(level*10,PERSONAL_RECOVERY_DEFAULT_TIME,0) end
        if (data == "personal_mana_plus1") then return Param2String(level,PERSONAL_RECOVERY_DEFAULT_TIME,0) end
    end
    return ""
end
