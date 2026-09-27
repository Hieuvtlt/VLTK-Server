-- Luyen Cong Lenh Bai Script
-- Created for summoning training monsters

if not tbPlayerLuyenCongMonsters then
    tbPlayerLuyenCongMonsters = {}
end

function main()
    if GetFightState() == 0 then
        Msg2Player("Kh«ng thÓ sö dông vËt phÈm nµy t¹i khu vùc an toµn.")
        return 1
    end
    
    local nLevel = GetTask(2500)
    if nLevel == 0 then
        nLevel = GetLevel()
    end
    
    local nSeries = GetTask(2501)
    local szSeries = "NgÉu Nhiªn"
    if nSeries == 1 then szSeries = "HÖ Kim"
    elseif nSeries == 2 then szSeries = "HÖ Méc"
    elseif nSeries == 3 then szSeries = "HÖ Thđy"
    elseif nSeries == 4 then szSeries = "HÖ Háa"
    elseif nSeries == 5 then szSeries = "HÖ Thỉ"
    end
    
    local nModel = GetTask(2502)
    local szModel = "NhÝm"
    if nModel == 1 then szModel = "NhÝm"
    elseif nModel == 2 then szModel = "Sãi X¸m"
    elseif nModel == 3 then szModel = "Heo Rõng"
    elseif nModel == 4 then szModel = "C¸ SÊu"
    elseif nModel == 5 then szModel = "Bä C¹p"
    end

    local szMsg = format("--- LuyÖn C«ng LÖnh Bµi ---\nCÊu h×nh b·i qu¸i:\n  - CÊp ®é: %d\n  - Ngị hµnh: %s\n  - Ngo¹i h×nh: %s\n\nChän thao t¸c:", nLevel, szSeries, szModel)
    
    Say(szMsg, 6, 
        "TriÖu håi b·i qu¸i/DoSummon", 
        "Thay ®ỉi CÊp ®é/ChangeLevel", 
        "Thay ®ỉi Ngị hµnh/ChangeSeries", 
        "Thay ®ỉi Ngo¹i h×nh/ChangeModel", 
        "Xãa b·i qu¸i cò/DoClear", 
        "Rêi khái/DoNothing"
    )
end

function ChangeLevel()
    local szMsg = "Chän cÊp ®é cho qu¸i luyÖn c«ng:"
    Say(szMsg, 7,
        "Theo cÊp ®é cđa b¹n/SetLevelAuto",
        "CÊp 30/SetLevel30",
        "CÊp 50/SetLevel50",
        "CÊp 70/SetLevel70",
        "CÊp 90/SetLevel90",
        "CÊp 100/SetLevel100",
        "Quay l¹i/main"
    )
end

function SetLevelAuto()
    SetTask(2500, 0)
    Msg2Player("§· thiÕt lËp cÊp qu¸i tù ®éng theo cÊp cđa b¹n.")
    main()
end

function SetLevel30() SetTask(2500, 30); Msg2Player("§· thiÕt lËp cÊp qu¸i lµ 30."); main() end
function SetLevel50() SetTask(2500, 50); Msg2Player("§· thiÕt lËp cÊp qu¸i lµ 50."); main() end
function SetLevel70() SetTask(2500, 70); Msg2Player("§· thiÕt lËp cÊp qu¸i lµ 70."); main() end
function SetLevel90() SetTask(2500, 90); Msg2Player("§· thiÕt lËp cÊp qu¸i lµ 90."); main() end
function SetLevel100() SetTask(2500, 100); Msg2Player("§· thiÕt lËp cÊp qu¸i lµ 100."); main() end

function ChangeSeries()
    local szMsg = "Chän ngị hµnh cho qu¸i vËt:"
    Say(szMsg, 7,
        "NgÉu Nhiªn/SetSeriesRandom",
        "HÖ Kim (Kh¾c Hái)/SetSeries1",
        "HÖ Méc (Kh¾c Thỉ)/SetSeries2",
        "HÖ Thđy (Kh¾c Háa)/SetSeries3",
        "HÖ Háa (Kh¾c Kim)/SetSeries4",
        "HÖ Thỉ (Kh¾c Thđy)/SetSeries5",
        "Quay l¹i/main"
    )
end

function SetSeriesRandom() SetTask(2501, 0); Msg2Player("§· thiÕt lËp ngị hµnh ngÉu nhiªn."); main() end
function SetSeries1() SetTask(2501, 1); Msg2Player("§· thiÕt lËp ngị hµnh qu¸i: HÖ Kim."); main() end
function SetSeries2() SetTask(2501, 2); Msg2Player("§· thiÕt lËp ngị hµnh qu¸i: HÖ Méc."); main() end
function SetSeries3() SetTask(2501, 3); Msg2Player("§· thiÕt lËp ngị hµnh qu¸i: HÖ Thđy."); main() end
function SetSeries4() SetTask(2501, 4); Msg2Player("§· thiÕt lËp ngị hµnh qu¸i: HÖ Háa."); main() end
function SetSeries5() SetTask(2501, 5); Msg2Player("§· thiÕt lËp ngị hµnh qu¸i: HÖ Thỉ."); main() end

function ChangeModel()
    local szMsg = "Chän ngo¹i h×nh cho qu¸i vËt:"
    Say(szMsg, 6,
        "NhÝm/SetModel1",
        "Sãi X¸m/SetModel2",
        "Heo Rõng/SetModel3",
        "C¸ SÊu/SetModel4",
        "Bä C¹p/SetModel5",
        "Quay l¹i/main"
    )
end

function SetModel1() SetTask(2502, 1); Msg2Player("§· thiÕt lËp ngo¹i h×nh: NhÝm."); main() end
function SetModel2() SetTask(2502, 2); Msg2Player("§· thiÕt lËp ngo¹i h×nh: Sãi X¸m."); main() end
function SetModel3() SetTask(2502, 3); Msg2Player("§· thiÕt lËp ngo¹i h×nh: Heo Rõng."); main() end
function SetModel4() SetTask(2502, 4); Msg2Player("§· thiÕt lËp ngo¹i h×nh: C¸ SÊu."); main() end
function SetModel5() SetTask(2502, 5); Msg2Player("§· thiÕt lËp ngo¹i h×nh: Bä C¹p."); main() end

function DoClear()
    local player_name = GetName()
    local tbMonsters = tbPlayerLuyenCongMonsters[player_name]
    if tbMonsters then
        local count = 0
        local len = getn(tbMonsters)
        for i = 1, len do
            local npcIdx = tbMonsters[i]
            if npcIdx and npcIdx > 0 then
                DelNpc(npcIdx)
                count = count + 1
            end
        end
        tbPlayerLuyenCongMonsters[player_name] = {}
        return count
    end
    return 0
end

function DoSummon()
    local cleared = DoClear()
    
    local nLevel = GetTask(2500)
    if nLevel == 0 then 
        nLevel = GetLevel() 
    end
    
    local nSeriesOption = GetTask(2501)
    local nSeries = -1
    if nSeriesOption >= 1 and nSeriesOption <= 5 then
        nSeries = nSeriesOption - 1
    end
    
    local nModel = GetTask(2502)
    if nModel == 0 then nModel = 1 end
    
    -- Monster IDs:
    -- 1: Nhím (ID 12)
    -- 2: Sói Xám (ID 5)
    -- 3: Heo Rừng (ID 11)
    -- 4: Cá Sấu (ID 18)
    -- 5: Bọ Cạp (ID 44)
    local nNpcId = 12
    local szNpcName = "NhÝm"
    if nModel == 1 then nNpcId = 12; szNpcName = "NhÝm"
    elseif nModel == 2 then nNpcId = 5; szNpcName = "Sãi X¸m"
    elseif nModel == 3 then nNpcId = 11; szNpcName = "Heo Rõng"
    elseif nModel == 4 then nNpcId = 18; szNpcName = "C¸ SÊu"
    elseif nModel == 5 then nNpcId = 44; szNpcName = "Bä C¹p"
    end
    
    local W, X, Y = GetWorldPos()
    local mapIndex = SubWorldID2Idx(W)
    
    local player_name = GetName()
    tbPlayerLuyenCongMonsters[player_name] = {}
    
    local totalSummoned = 0
    local maxSummon = 30
    
    for i = 1, maxSummon do
        local dx = random(-8, 8)
        local dy = random(-8, 8)
        
        local targetSeries = nSeries
        if targetSeries == -1 then
            targetSeries = random(0, 4)
        end
        
        local seriesName = ""
        if targetSeries == 0 then seriesName = " (Kim)"
        elseif targetSeries == 1 then seriesName = " (Méc)"
        elseif targetSeries == 2 then seriesName = " (Thđy)"
        elseif targetSeries == 3 then seriesName = " (Háa)"
        elseif targetSeries == 4 then seriesName = " (Thỉ)"
        end
        
        local customName = szNpcName .. seriesName
        
        -- Summon NPC (nIsDeathTrigger=1, szName, nRename=1)
        local npcIdx = AddNpcEx(nNpcId, nLevel, targetSeries, mapIndex, (X + dx) * 32, (Y + dy) * 32, 1, customName, 1)
        if npcIdx and npcIdx > 0 then
            local len = getn(tbPlayerLuyenCongMonsters[player_name])
            tbPlayerLuyenCongMonsters[player_name][len + 1] = npcIdx
            totalSummoned = totalSummoned + 1
        end
    end
    
    local msg = format("TriÖu håi thµnh c«ng %d qu¸i cÊp %d.", totalSummoned, nLevel)
    if cleared > 0 then
        msg = format("§· xãa %d qu¸i cò. TriÖu håi thµnh c«ng %d qu¸i cÊp %d.", cleared, totalSummoned, nLevel)
    end
    Msg2Player(msg)
end

function DoNothing()
end
