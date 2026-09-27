-- Spawning script for Tu Luyen Coc maps (1011 - 1024)
-- Configured for 50 normal mobs centered at (1607, 3220) with death script hook

if not tbSpawnedMaps then
    tbSpawnedMaps = {}
end

local TB_TULUYEN_MONSTERS = {}
TB_TULUYEN_MONSTERS[1011] = { lvl = 10,  tpl = 12,   name = "Quai Tu Luyen Cap 10" }
TB_TULUYEN_MONSTERS[1012] = { lvl = 20,  tpl = 11,   name = "Quai Tu Luyen Cap 20" }
TB_TULUYEN_MONSTERS[1013] = { lvl = 30,  tpl = 0,    name = "Quai Tu Luyen Cap 30" }
TB_TULUYEN_MONSTERS[1014] = { lvl = 40,  tpl = 1,    name = "Quai Tu Luyen Cap 40" }
TB_TULUYEN_MONSTERS[1015] = { lvl = 50,  tpl = 15,   name = "Quai Tu Luyen Cap 50" }
TB_TULUYEN_MONSTERS[1016] = { lvl = 60,  tpl = 16,   name = "Quai Tu Luyen Cap 60" }
TB_TULUYEN_MONSTERS[1017] = { lvl = 70,  tpl = 22,   name = "Quai Tu Luyen Cap 70" }
TB_TULUYEN_MONSTERS[1018] = { lvl = 80,  tpl = 23,   name = "Quai Tu Luyen Cap 80" }
TB_TULUYEN_MONSTERS[1019] = { lvl = 90,  tpl = 594,  name = "Quai Tu Luyen Cap 90",  count = 22 }
TB_TULUYEN_MONSTERS[1020] = { lvl = 100, tpl = 595,  name = "Siªu Nh©n Gao", count = 22 }
TB_TULUYEN_MONSTERS[1021] = { lvl = 120, tpl = 596,  name = "Th»ng b¹n th©n", count = 22 }
TB_TULUYEN_MONSTERS[1022] = { lvl = 140, tpl = 597,  name = "Th»ng Hµng Xãm", count = 22 }
TB_TULUYEN_MONSTERS[1023] = { lvl = 160, tpl = 598,  name = "Ng­êi Yªu Cò", count = 22 }
TB_TULUYEN_MONSTERS[1024] = { lvl = 180, tpl = 599,  name = "SÕp ë C«ng ty", count = 22 }

function OnNewWorld()
    local nMapIndex = SubWorld
    local nMapId = SubWorldIdx2ID(nMapIndex)
    
    local cfg = %TB_TULUYEN_MONSTERS[nMapId]
    if cfg then
        if not tbSpawnedMaps[nMapId] then
            tbSpawnedMaps[nMapId] = 1
            local nMaxCount = cfg.count or 50
            for i = 1, nMaxCount do
                local nRange = 5 -- Pham vi phan bo (so cang nho quai cang co cum)
                local rx = 1607 + random(-nRange, nRange)
                local ry = 3220 + random(-nRange, nRange)
                local nSeries = random(0, 4)
                local idx = AddNpcEx(cfg.tpl, cfg.lvl, nSeries, nMapIndex, rx * 32, ry * 32, 1, cfg.name, 0)
                if idx and idx > 0 then
                    SetNpcParam(idx, 1, cfg.tpl)
                    SetNpcParam(idx, 2, cfg.lvl)
                    SetNpcParam(idx, 3, nSeries)
                    SetNpcDeathScript(idx, "\\script\\global\\mel\\map\\tuluyencoc_death.lua")
                end
            end
        end
    end
end

function OnLeaveWorld()
end