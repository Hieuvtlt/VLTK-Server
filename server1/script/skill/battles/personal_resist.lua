Include("\\script\\skill\\param2string.lua")

PERSONAL_RESIST_DEFAULT_TIME = 60 * 18

function GetSkillLevelData(levelname, data, level)
    level=tonumber(level); if (level==nil) then return "" end
    level=floor(level); if (level<1) then return "" end
    if (levelname == "poisonres_p" or levelname == "coldres_p" or levelname == "fireres_p" or levelname == "lightingres_p" or levelname == "allres_p") then
        local nStep=5
        if (data == "personal_resist_plus1") then nStep=1 end
        return Param2String(level*nStep,PERSONAL_RESIST_DEFAULT_TIME,0)
    end
    return ""
end
