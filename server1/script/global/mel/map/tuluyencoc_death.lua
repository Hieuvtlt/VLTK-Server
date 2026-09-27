-- Death script for Tu Luyen Coc training monsters
-- Automatically respawns a new monster in the center area

function OnDeath(nNpcIndex)
    local tpl = GetNpcParam(nNpcIndex, 1)
    local lvl = GetNpcParam(nNpcIndex, 2)
    local series = GetNpcParam(nNpcIndex, 3)
    local name = GetNpcName(nNpcIndex)
    
    local _, _, nMapIndex = GetNpcPos(nNpcIndex)
    
    if tpl and tpl > 0 and nMapIndex and nMapIndex > 0 then
        local nRange = 5 -- Pham vi phan bo (so cang nho quai cang co cum)
        local rx = 1607 + random(-nRange, nRange)
        local ry = 3220 + random(-nRange, nRange)
        local idx = AddNpcEx(tpl, lvl, series, nMapIndex, rx * 32, ry * 32, 1, name, 0)
        if idx and idx > 0 then
            SetNpcParam(idx, 1, tpl)
            SetNpcParam(idx, 2, lvl)
            SetNpcParam(idx, 3, series)
            SetNpcDeathScript(idx, "\\script\\global\\mel\\map\\tuluyencoc_death.lua")
        end
    end
end