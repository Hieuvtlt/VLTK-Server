-- V5.37 Giao diÖn Bï qu¸i tiÕng ViÖt TCVN
-- ChØ thay giao diÖn vµ thªm cÊu h×nh sè qu¸i cho ChÕ ®é 1 vµ ChÕ ®é 2
-- ChÕ ®é 2 gi÷ nguyªn c¬ chÕ cè ®Þnh håi sinh gèc cña V5.35

function AdaptiveTrain_Menu()
    if VSDTrain3_TryRestoreSavedOnCurrentMap then VSDTrain3_TryRestoreSavedOnCurrentMap() end
    local pW = GetWorldPos()
    local szM1 = "t¾t"
    local szM2 = "t¾t"
    local szM3 = "t¾t"
    if g_tbVSDTrainMapManager and g_tbVSDTrainMapManager[pW] then szM1 = "bËt" end
    if g_tbVSDTrain2MapManager and g_tbVSDTrain2MapManager[pW] then
        local t = g_tbVSDTrain2MapManager[pW]
        if t.nState == 1 then szM2 = "®ang quÐt"
        elseif t.nState == 2 then szM2 = "®ang t¹o"
        else szM2 = "bËt" end
    end
    if g_tbVSDTrain3MapManager and g_tbVSDTrain3MapManager[pW] then
        local t3 = g_tbVSDTrain3MapManager[pW]
        if t3.nActive == 1 then szM3 = "®ang gi÷ b·i" else szM3 = "chê s¸t th­¬ng" end
    end
    Say(format("bï qu¸i toµn b¶n ®å\nb¶n ®å %d\nchÕ ®é 1 %s\nchÕ ®é 2 %s\nchÕ ®é 3 %s", pW, szM1, szM2, szM3), 5,
        "chÕ ®é 1 c©n b»ng ®éng/#AdaptiveTrain_Mode1_Menu()",
        "chÕ ®é 2 cè ®Þnh håi sinh/#AdaptiveTrain_Mode2_Menu()",
        "chÕ ®é 3 s¸t th­¬ng më b·i/#AdaptiveTrain_Mode3_Menu()",
        "t¾t tÊt c¶ chÕ ®é bï qu¸i/#AdaptiveTrain_Disable_All_Menu()",
        "quay l¹i/#main()")
    return 1
end

function AdaptiveTrain_Disable_All_Menu()
    local nD1 = 0
    local nD2 = 0
    local nP2 = 0
    local nS2 = 0
    local nD3 = 0
    if VSDTrain_Disable then nD1 = VSDTrain_Disable() or 0 end
    if VSDTrain2_Disable then nD2, nP2, nS2 = VSDTrain2_Disable() end
    if VSDTrain3_Disable then nD3 = VSDTrain3_Disable() or 0 end
    nD2 = nD2 or 0
    nP2 = nP2 or 0
    if nD1 < 0 then nD1 = 0 end
    if nD2 < 0 then nD2 = 0 end
    if nD3 < 0 then nD3 = 0 end
    if nP2 > 0 then
        Say(format("kÕt qu¶ t¾t c¸c chÕ ®é\nchÕ ®é 1 ®· dän %d qu¸i\nchÕ ®é 2 ®· dän %d qu¸i\nchÕ ®é 2 cßn %d qu¸i chê håi sinh\nchÕ ®é 3 ®· dän %d qu¸i", nD1, nD2, nP2, nD3), 1,
            "quay l¹i bï qu¸i/#AdaptiveTrain_Menu()")
        return 1
    end
    Say(format("kÕt qu¶ t¾t tÊt c¶ chÕ ®é bï qu¸i\nchÕ ®é 1 ®· dän %d qu¸i\nchÕ ®é 2 ®· dän %d qu¸i\nchÕ ®é 3 ®· dän %d qu¸i", nD1, nD2, nD3), 1,
        "quay l¹i bï qu¸i/#AdaptiveTrain_Menu()")
    return 1
end

function AdaptiveTrain_Mode1_GetRange()
    local c = VSDTrain_GetOwnerConfig and VSDTrain_GetOwnerConfig() or nil
    if not c then return VSD_TRAIN_TARGET_MIN, VSD_TRAIN_TARGET_MAX end
    return c.nTargetMin or VSD_TRAIN_TARGET_MIN, c.nTargetMax or VSD_TRAIN_TARGET_MAX
end

function AdaptiveTrain_Mode1_Menu()
    local pW = GetWorldPos()
    local t = g_tbVSDTrainMapManager and g_tbVSDTrainMapManager[pW] or nil
    local nMin, nMax = AdaptiveTrain_Mode1_GetRange()
    local szState = "t¾t"
    if t then
        szState = "bËt"
        nMin = t.nTargetMin or nMin
        nMax = t.nTargetMax or nMax
    end
    Say(format("chÕ ®é 1 c©n b»ng ®éng\ntr¹ng th¸i %s\nsè qu¸i tõ %d ®Õn %d", szState, nMin, nMax), 6,
        "bËt chÕ ®é 1/#AdaptiveTrain_Enable_Menu()",
        "cµi sè qu¸i ngÉu nhiªn/#AdaptiveTrain_Mode1_Config_Menu()",
        "c©n b»ng ngay/#AdaptiveTrain_ForceScan_Menu()",
        "th«ng tin vµ h­íng dÉn/#AdaptiveTrain_Mode1_Info_Menu()",
        "t¾t chÕ ®é 1/#AdaptiveTrain_Disable_Menu()",
        "quay l¹i bï qu¸i/#AdaptiveTrain_Menu()")
    return 1
end

function AdaptiveTrain_Mode1_Config_Menu()
    local nMin, nMax = AdaptiveTrain_Mode1_GetRange()
    Say(format("cµi sè qu¸i chÕ ®é 1\nsè qu¸i tõ %d ®Õn %d\ncho phÐp tõ 3 ®Õn 50", nMin, nMax), 4,
        "nhËp sè qu¸i nhá nhÊt/#AdaptiveTrain_Mode1_AskTargetMin()",
        "nhËp sè qu¸i lín nhÊt/#AdaptiveTrain_Mode1_AskTargetMax()",
        "kh«i phôc mÆc ®Þnh/#AdaptiveTrain_Mode1_Reset_Config()",
        "quay l¹i chÕ ®é 1/#AdaptiveTrain_Mode1_Menu()")
    return 1
end

function AdaptiveTrain_Mode1_AskTargetMin()
    AskClientForNumber("AdaptiveTrain_Mode1_InputTargetMin", VSD_TRAIN_CONFIG_TARGET_MIN, VSD_TRAIN_CONFIG_TARGET_MAX, "nhËp sè qu¸i nhá nhÊt tõ 3 ®Õn 50")
    return 1
end

function AdaptiveTrain_Mode1_InputTargetMin(nValue)
    local nMin, nMax = VSDTrain_SetTargetMin(nValue)
    if not nMin then return AdaptiveTrain_Mode1_Config_Menu() end
    if g_tbVSDTrainMapManager and g_tbVSDTrainMapManager[GetWorldPos()] then VSDTrain_ForceScan() end
    Say(format("®· l­u sè qu¸i tõ %d ®Õn %d", nMin, nMax), 1,
        "quay l¹i cµi sè qu¸i/#AdaptiveTrain_Mode1_Config_Menu()")
    return 1
end

function AdaptiveTrain_Mode1_AskTargetMax()
    AskClientForNumber("AdaptiveTrain_Mode1_InputTargetMax", VSD_TRAIN_CONFIG_TARGET_MIN, VSD_TRAIN_CONFIG_TARGET_MAX, "nhËp sè qu¸i lín nhÊt tõ 3 ®Õn 50")
    return 1
end

function AdaptiveTrain_Mode1_InputTargetMax(nValue)
    local nMin, nMax = VSDTrain_SetTargetMax(nValue)
    if not nMax then return AdaptiveTrain_Mode1_Config_Menu() end
    if g_tbVSDTrainMapManager and g_tbVSDTrainMapManager[GetWorldPos()] then VSDTrain_ForceScan() end
    Say(format("®· l­u sè qu¸i tõ %d ®Õn %d", nMin, nMax), 1,
        "quay l¹i cµi sè qu¸i/#AdaptiveTrain_Mode1_Config_Menu()")
    return 1
end

function AdaptiveTrain_Mode1_Reset_Config()
    local c = VSDTrain_ResetOwnerConfig()
    if c and g_tbVSDTrainMapManager and g_tbVSDTrainMapManager[GetWorldPos()] then VSDTrain_ForceScan() end
    return AdaptiveTrain_Mode1_Config_Menu()
end

function AdaptiveTrain_Enable_Menu()
    local nRet = VSDTrain_Enable()
    if nRet == 1 then
        Say("®· bËt chÕ ®é 1\nhÖ thèng b¾t ®Çu c©n b»ng qu¸i", 1, "quay l¹i chÕ ®é 1/#AdaptiveTrain_Mode1_Menu()")
        return 1
    end
    if nRet == 2 then
        Say("chÕ ®é 1 ®· bËt\nhÖ thèng võa c©n b»ng l¹i", 1, "quay l¹i chÕ ®é 1/#AdaptiveTrain_Mode1_Menu()")
        return 1
    end
    if nRet == -20 then
        Say("kh«ng bËt ®­îc chÕ ®é 1\nchÕ ®é 2 ®ang bËt\nh·y t¾t chÕ ®é 2 tr­íc", 1, "quay l¹i chÕ ®é 1/#AdaptiveTrain_Mode1_Menu()")
        return 0
    end
    if nRet == -21 then
        Say("kh«ng bËt ®­îc chÕ ®é 1\nchÕ ®é 3 ®ang bËt\nh·y t¾t chÕ ®é 3 tr­íc", 1, "quay l¹i chÕ ®é 1/#AdaptiveTrain_Mode1_Menu()")
        return 0
    end
    Say("kh«ng bËt ®­îc chÕ ®é 1\nh·y kiÓm tra m¸y chñ", 1, "quay l¹i chÕ ®é 1/#AdaptiveTrain_Mode1_Menu()")
    return 0
end

function AdaptiveTrain_ForceScan_Menu()
    local nRet = VSDTrain_ForceScan()
    if nRet == 1 then
        Say("®· c©n b»ng chÕ ®é 1 ngay", 1, "quay l¹i chÕ ®é 1/#AdaptiveTrain_Mode1_Menu()")
        return 1
    end
    Say("chÕ ®é 1 ch­a bËt", 1, "quay l¹i chÕ ®é 1/#AdaptiveTrain_Mode1_Menu()")
    return 0
end

function AdaptiveTrain_Mode1_Info_Menu()
    Say("th«ng tin chÕ ®é 1\nchän néi dung cÇn xem", 4,
        "xem tr¹ng th¸i/#AdaptiveTrain_Status_Menu()",
        "xem h­íng dÉn/#AdaptiveTrain_Mode1_Guide_Menu()",
        "chÈn ®o¸n an toµn/#AdaptiveTrain_Diagnose_Menu()",
        "quay l¹i chÕ ®é 1/#AdaptiveTrain_Mode1_Menu()")
    return 1
end

function AdaptiveTrain_Status_Menu()
    local pW = GetWorldPos()
    local t = g_tbVSDTrainMapManager and g_tbVSDTrainMapManager[pW] or nil
    local nMin, nMax = AdaptiveTrain_Mode1_GetRange()
    if not t then
        Say(format("tr¹ng th¸i chÕ ®é 1\nchÕ ®é ®ang t¾t\nb¶n ®å %d\nsè qu¸i tõ %d ®Õn %d", pW, nMin, nMax), 1,
            "quay l¹i th«ng tin/#AdaptiveTrain_Mode1_Info_Menu()")
        return 1
    end
    Say(format("tr¹ng th¸i chÕ ®é 1\nchÕ ®é ®ang bËt\nb¶n ®å %d\nsè ng­êi %d\nsè b·i %d\nqu¸i gèc %d\nqu¸i bï ®ang sèng %d\nsè qu¸i tõ %d ®Õn %d", pW, t.nLastPlayers or 0, t.nLastActiveSpots or 0, t.nLastNaturalSeen or 0, g_nVSDTrainLiveExtra or 0, t.nTargetMin or nMin, t.nTargetMax or nMax), 1,
        "quay l¹i th«ng tin/#AdaptiveTrain_Mode1_Info_Menu()")
    return 1
end

function AdaptiveTrain_Mode1_Guide_Menu()
    Say("h­íng dÉn chÕ ®é 1\nchÕ ®é nµy c©n b»ng qu¸i t¹i c¸c b·i ®ang cã ng­êi\nb¹n chän sè qu¸i nhá nhÊt vµ lín nhÊt\nmçi b·i chän ngÉu nhiªn mét sè trong kho¶ng ®· chän\nhÖ thèng chØ t¹o phÇn qu¸i cßn thiÕu\nkhi t¾t hÖ thèng dän qu¸i bï do chÕ ®é nµy t¹o", 1,
        "quay l¹i th«ng tin/#AdaptiveTrain_Mode1_Info_Menu()")
    return 1
end

function AdaptiveTrain_Diagnose_Menu()
    if not PlayerIndex or PlayerIndex <= 0 then
        Say("chÈn ®o¸n chÕ ®é 1\nkh«ng ®äc ®­îc nh©n vËt", 1, "quay l¹i th«ng tin/#AdaptiveTrain_Mode1_Info_Menu()")
        return 0
    end
    local pW = GetWorldPos()
    local tbNatural, tbPlayerPos, tbStats = VSDTrain_CollectMapView(pW)
    local nManageDistance = VSD_TRAIN_EFFECTIVE_DISTANCE_FALLBACK
    if tbStats.nExpandApi == 1 then nManageDistance = VSD_TRAIN_EFFECTIVE_DISTANCE_EXPANDED end
    local tbCandidates = VSDTrain_BuildCandidates(tbNatural, tbPlayerPos, nManageDistance)
    local nMin, nMax = AdaptiveTrain_Mode1_GetRange()
    Say(format("chÈn ®o¸n chÕ ®é 1\nb¶n ®å %d\nsè ng­êi %d\nqu¸i gèc %d\nsè b·i ®ñ ®iÒu kiÖn %d\nkho¶ng qu¶n lý %d\nsè qu¸i tõ %d ®Õn %d", pW, tbStats.nPlayers or 0, getn(tbNatural), getn(tbCandidates), nManageDistance, nMin, nMax), 1,
        "quay l¹i th«ng tin/#AdaptiveTrain_Mode1_Info_Menu()")
    return 1
end

function AdaptiveTrain_Disable_Menu()
    local nDeleted = VSDTrain_Disable()
    if not nDeleted or nDeleted < 0 then nDeleted = 0 end
    Say(format("®· t¾t chÕ ®é 1\n®· dän %d qu¸i bï", nDeleted), 1,
        "quay l¹i bï qu¸i/#AdaptiveTrain_Menu()")
    return 1
end

function AdaptiveTrain_Mode2_GetRange()
    local c = VSDTrain2_GetOwnerConfig and VSDTrain2_GetOwnerConfig() or nil
    if not c then return VSD_TRAIN2_TARGET_MIN, VSD_TRAIN2_TARGET_MAX end
    return c.nTargetMin or VSD_TRAIN2_TARGET_MIN, c.nTargetMax or VSD_TRAIN2_TARGET_MAX
end

function AdaptiveTrain_Mode2_Menu()
    local pW = GetWorldPos()
    local t = g_tbVSDTrain2MapManager and g_tbVSDTrain2MapManager[pW] or nil
    local nMin, nMax = AdaptiveTrain_Mode2_GetRange()
    local szState = "t¾t"
    if t then
        nMin = t.nTargetMin or nMin
        nMax = t.nTargetMax or nMax
        if t.nState == 1 then szState = "®ang quÐt"
        elseif t.nState == 2 then szState = "®ang t¹o"
        else szState = "bËt" end
    end
    Say(format("chÕ ®é 2 cè ®Þnh håi sinh\ntr¹ng th¸i %s\nsè qu¸i tõ %d ®Õn %d", szState, nMin, nMax), 5,
        "bËt chÕ ®é 2/#AdaptiveTrain_Mode2_Enable_Menu()",
        "cµi sè qu¸i ngÉu nhiªn/#AdaptiveTrain_Mode2_Config_Menu()",
        "th«ng tin vµ h­íng dÉn/#AdaptiveTrain_Mode2_Info_Menu()",
        "t¾t chÕ ®é 2/#AdaptiveTrain_Mode2_Disable_Menu()",
        "quay l¹i bï qu¸i/#AdaptiveTrain_Menu()")
    return 1
end

function AdaptiveTrain_Mode2_Config_Menu()
    local c = VSDTrain2_GetOwnerConfig and VSDTrain2_GetOwnerConfig() or nil
    local nMin = c and c.nTargetMin or VSD_TRAIN2_TARGET_MIN
    local nMax = c and c.nTargetMax or VSD_TRAIN2_TARGET_MAX
    local szNote = "thiÕt lËp dïng khi bËt chÕ ®é 2"
    if g_tbVSDTrain2MapManager and g_tbVSDTrain2MapManager[GetWorldPos()] then
        szNote = "thiÕt lËp míi dïng khi bËt l¹i chÕ ®é 2"
    end
    Say(format("cµi sè qu¸i chÕ ®é 2\nsè qu¸i tõ %d ®Õn %d\ncho phÐp tõ 3 ®Õn 50\n%s", nMin, nMax, szNote), 4,
        "nhËp sè qu¸i nhá nhÊt/#AdaptiveTrain_Mode2_AskTargetMin()",
        "nhËp sè qu¸i lín nhÊt/#AdaptiveTrain_Mode2_AskTargetMax()",
        "kh«i phôc mÆc ®Þnh/#AdaptiveTrain_Mode2_Reset_Config()",
        "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
    return 1
end

function AdaptiveTrain_Mode2_AskTargetMin()
    AskClientForNumber("AdaptiveTrain_Mode2_InputTargetMin", VSD_TRAIN2_CONFIG_TARGET_MIN, VSD_TRAIN2_CONFIG_TARGET_MAX, "nhËp sè qu¸i nhá nhÊt tõ 3 ®Õn 50")
    return 1
end

function AdaptiveTrain_Mode2_InputTargetMin(nValue)
    local nMin, nMax = VSDTrain2_SetTargetMin(nValue)
    if not nMin then return AdaptiveTrain_Mode2_Config_Menu() end
    Say(format("®· l­u sè qu¸i tõ %d ®Õn %d", nMin, nMax), 1,
        "quay l¹i cµi sè qu¸i/#AdaptiveTrain_Mode2_Config_Menu()")
    return 1
end

function AdaptiveTrain_Mode2_AskTargetMax()
    AskClientForNumber("AdaptiveTrain_Mode2_InputTargetMax", VSD_TRAIN2_CONFIG_TARGET_MIN, VSD_TRAIN2_CONFIG_TARGET_MAX, "nhËp sè qu¸i lín nhÊt tõ 3 ®Õn 50")
    return 1
end

function AdaptiveTrain_Mode2_InputTargetMax(nValue)
    local nMin, nMax = VSDTrain2_SetTargetMax(nValue)
    if not nMax then return AdaptiveTrain_Mode2_Config_Menu() end
    Say(format("®· l­u sè qu¸i tõ %d ®Õn %d", nMin, nMax), 1,
        "quay l¹i cµi sè qu¸i/#AdaptiveTrain_Mode2_Config_Menu()")
    return 1
end

function AdaptiveTrain_Mode2_Reset_Config()
    VSDTrain2_ResetOwnerConfig()
    return AdaptiveTrain_Mode2_Config_Menu()
end

function AdaptiveTrain_Mode2_Enable_Menu()
    local nRet = VSDTrain2_Enable()
    if nRet == 1 then
        Say("®· b¾t ®Çu chÕ ®é 2\nhÖ thèng ®ang quÐt vµ t¹o qu¸i cè ®Þnh\nsau khi hoµn tÊt qu¸i bï håi sinh theo qu¸i gèc", 1,
            "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
        return 1
    end
    if nRet == 2 then
        Say("chÕ ®é 2 ®ang quÐt hoÆc ®ang t¹o\nhÖ thèng kh«ng khëi t¹o lÇn hai", 1,
            "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
        return 1
    end
    if nRet == 3 then
        Say("chÕ ®é 2 ®· hoµn tÊt vµ ®ang ch¹y cè ®Þnh\nbËt l¹i kh«ng t¹o thªm qu¸i", 1,
            "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
        return 1
    end
    if nRet == -20 then
        Say("kh«ng bËt ®­îc chÕ ®é 2\nchÕ ®é 1 ®ang bËt\nh·y t¾t chÕ ®é 1 tr­íc", 1,
            "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
        return 0
    end
    if nRet == -22 then
        Say("kh«ng bËt ®­îc chÕ ®é 2\nchÕ ®é 3 ®ang bËt\nh·y t¾t chÕ ®é 3 tr­íc", 1,
            "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
        return 0
    end
    if nRet == -21 then
        Say("chÕ ®é 2 ®ang ch¹y ë b¶n ®å kh¸c\nh·y t¾t chÕ ®é 2 ë b¶n ®å cò tr­íc", 1,
            "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
        return 0
    end
    Say("kh«ng bËt ®­îc chÕ ®é 2\nh·y kiÓm tra m¸y chñ", 1,
        "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
    return 0
end

function AdaptiveTrain_Mode2_Info_Menu()
    Say("th«ng tin chÕ ®é 2\nchän néi dung cÇn xem", 4,
        "xem tr¹ng th¸i/#AdaptiveTrain_Mode2_Status_Menu()",
        "xem h­íng dÉn/#AdaptiveTrain_Mode2_Guide_Menu()",
        "chÈn ®o¸n an toµn/#AdaptiveTrain_Mode2_Diagnose_Menu()",
        "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
    return 1
end

function AdaptiveTrain_Mode2_Status_Menu()
    local pW = GetWorldPos()
    local t = g_tbVSDTrain2MapManager and g_tbVSDTrain2MapManager[pW] or nil
    local nMin, nMax = AdaptiveTrain_Mode2_GetRange()
    if not t then
        Say(format("tr¹ng th¸i chÕ ®é 2\nchÕ ®é ®ang t¾t\nb¶n ®å %d\nsè qu¸i tõ %d ®Õn %d", pW, nMin, nMax), 1,
            "quay l¹i th«ng tin/#AdaptiveTrain_Mode2_Info_Menu()")
        return 1
    end
    nMin = t.nTargetMin or nMin
    nMax = t.nTargetMax or nMax
    if t.nState == 1 then
        local st = t.tbScanStats or {}
        local nTotal = getn(t.tbCatalogNames or {})
        Say(format("tr¹ng th¸i chÕ ®é 2\n®ang quÐt toµn b¶n ®å\nb¶n ®å %d\n®· quÐt %d trªn %d tªn\nqu¸i gèc t×m thÊy %d\nsè qu¸i tõ %d ®Õn %d", pW, st.nNameQueries or 0, nTotal, getn(t.tbNatural or {}), nMin, nMax), 1,
            "quay l¹i th«ng tin/#AdaptiveTrain_Mode2_Info_Menu()")
        return 1
    end
    if t.nState == 2 then
        local nDoneSpot = (t.nSpawnSpotIndex or 1) - 1
        if nDoneSpot < 0 then nDoneSpot = 0 end
        Say(format("tr¹ng th¸i chÕ ®é 2\n®ang t¹o qu¸i cè ®Þnh\nb¶n ®å %d\n®· xö lý %d trªn %d b·i\ncÇn bï %d qu¸i\n®· t¹o %d qu¸i\nsè qu¸i tõ %d ®Õn %d", pW, nDoneSpot, t.nSpotCount or 0, t.nExpectedExtra or 0, t.nCreatedTotal or 0, nMin, nMax), 1,
            "quay l¹i th«ng tin/#AdaptiveTrain_Mode2_Info_Menu()")
        return 1
    end
    Say(format("tr¹ng th¸i chÕ ®é 2\nchÕ ®é ®ang bËt cè ®Þnh\nb¶n ®å %d\nsè b·i %d\nqu¸i gèc %d\ncÇn bï %d qu¸i\n®· t¹o %d qu¸i\nsè qu¸i tõ %d ®Õn %d", pW, t.nSpotCount or 0, t.nNaturalFound or 0, t.nExpectedExtra or 0, t.nCreatedTotal or 0, nMin, nMax), 1,
        "quay l¹i th«ng tin/#AdaptiveTrain_Mode2_Info_Menu()")
    return 1
end

function AdaptiveTrain_Mode2_Guide_Menu()
    Say("h­íng dÉn chÕ ®é 2\nchÕ ®é nµy gi÷ nguyªn c¸ch ho¹t ®éng cè ®Þnh cña b¶n cò\nkhi bËt hÖ thèng quÐt toµn b¶n ®å mét lÇn\nmçi b·i chän ngÉu nhiªn sè qu¸i trong kho¶ng ®· chän\nhÖ thèng chØ t¹o phÇn qu¸i cßn thiÕu\nsau khi t¹o xong qu¸ tr×nh khëi t¹o tù dõng\nqu¸i bï håi sinh theo qu¸i gèc\nbËt l¹i kh«ng t¹o thªm qu¸i", 1,
        "quay l¹i th«ng tin/#AdaptiveTrain_Mode2_Info_Menu()")
    return 1
end

function AdaptiveTrain_Mode2_Diagnose_Menu()
    if not PlayerIndex or PlayerIndex <= 0 then
        Say("chÈn ®o¸n chÕ ®é 2\nkh«ng ®äc ®­îc nh©n vËt", 1, "quay l¹i th«ng tin/#AdaptiveTrain_Mode2_Info_Menu()")
        return 0
    end
    local pW = GetWorldPos()
    local tbCatalog = VSDTrain2_LoadCatalogSnapshot()
    if not tbCatalog then
        Say("chÈn ®o¸n chÕ ®é 2\nkh«ng ®äc ®­îc danh s¸ch qu¸i gèc", 1, "quay l¹i th«ng tin/#AdaptiveTrain_Mode2_Info_Menu()")
        return 0
    end
    local tbAround = GetAroundNpcList(VSD_TRAIN2_RUNTIME_SCAN_RADIUS)
    if type(tbAround) ~= "table" then tbAround = {} end
    local nMin, nMax = AdaptiveTrain_Mode2_GetRange()
    Say(format("chÈn ®o¸n chÕ ®é 2\nb¶n ®å %d\nmÉu qu¸i gèc hîp lÖ %d\ntªn qu¸i cÇn quÐt %d\nqu¸i quanh nh©n vËt %d\nsè qu¸i tõ %d ®Õn %d", pW, tbCatalog.nEligibleRows or 0, getn(tbCatalog.tbNames or {}), getn(tbAround), nMin, nMax), 1,
        "quay l¹i th«ng tin/#AdaptiveTrain_Mode2_Info_Menu()")
    return 1
end

function AdaptiveTrain_Mode2_Disable_Menu()
    local nDeleted, nPending, nState = VSDTrain2_Disable()
    nDeleted = nDeleted or 0
    nPending = nPending or 0
    if nState == 2 then
        Say(format("®· dän %d qu¸i chÕ ®é 2\ncßn %d qu¸i ®ang chê håi sinh\nh·y chê qu¸i håi sinh råi t¾t l¹i chÕ ®é 2", nDeleted, nPending), 1,
            "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
        return 1
    end
    if nState == 1 then
        Say(format("®· t¾t chÕ ®é 2\n®· dän %d qu¸i bï", nDeleted), 1,
            "quay l¹i bï qu¸i/#AdaptiveTrain_Menu()")
        return 1
    end
    Say("chÕ ®é 2 ch­a bËt", 1, "quay l¹i chÕ ®é 2/#AdaptiveTrain_Mode2_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Menu()
    if VSDTrain3_TryRestoreSavedOnCurrentMap then VSDTrain3_TryRestoreSavedOnCurrentMap() end
    local pW = GetWorldPos()
    local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
    local t = g_tbVSDTrain3MapManager and g_tbVSDTrain3MapManager[pW] or nil
    local szState = "t¾t"
    local nDist = c.nNewBatchDistance
    local nMin = c.nExtraMin
    local nMax = c.nExtraMax
    if t then
        if t.nActive == 1 then szState = "®ang gi÷ b·i" else szState = "chê s¸t th­¬ng" end
        nDist = VSDTrain3_GetManagerDistance(t)
        nMin, nMax = VSDTrain3_GetManagerExtraRange(t)
    end
    Say(format("chÕ ®é 3 s¸t th­¬ng më b·i\ntr¹ng th¸i %s\nkho¶ng c¸ch më b·i %d\nsè qu¸i bï tõ %d ®Õn %d", szState, nDist, nMin, nMax), 6,
        "bËt chÕ ®é 3/#AdaptiveTrain_Mode3_Enable_Menu()",
        "cµi kho¶ng c¸ch vµ sè qu¸i/#AdaptiveTrain_Mode3_Config_Menu()",
        "tr¹ng th¸i vµ h­íng dÉn/#AdaptiveTrain_Mode3_Status_Menu()",
        "chÈn ®o¸n an toµn/#AdaptiveTrain_Mode3_Diagnose_Menu()",
        "t¾t chÕ ®é 3/#AdaptiveTrain_Mode3_Disable_Menu()",
        "quay l¹i bï qu¸i/#AdaptiveTrain_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Config_Menu()
    local c = VSDTrain3_GetOwnerConfig()
    if not c then
        Say("kh«ng ®äc ®­îc cÊu h×nh chÕ ®é 3", 1, "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
        return 0
    end
    Say(format("cµi chÕ ®é 3\nkho¶ng c¸ch më b·i %d\nsè qu¸i bï tõ %d ®Õn %d\nmçi b·i tù dän khi ®i qu¸ xa", c.nNewBatchDistance, c.nExtraMin, c.nExtraMax), 4,
        "nhËp kho¶ng c¸ch më b·i/#AdaptiveTrain_Mode3_AskDistance()",
        "cµi sè qu¸i ngÉu nhiªn/#AdaptiveTrain_Mode3_Random_Menu()",
        "kh«i phôc mÆc ®Þnh/#AdaptiveTrain_Mode3_Reset_Config()",
        "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_AskDistance()
    AskClientForNumber("AdaptiveTrain_Mode3_InputDistance", VSD_TRAIN3_CONFIG_DISTANCE_MIN, VSD_TRAIN3_CONFIG_DISTANCE_MAX, "nhËp kho¶ng c¸ch më b·i tõ 3 ®Õn 40")
    return 1
end

function AdaptiveTrain_Mode3_InputDistance(nValue)
    local nSaved = VSDTrain3_SetNewBatchDistance(nValue)
    if not nSaved then
        Say("kh«ng l­u ®­îc kho¶ng c¸ch chÕ ®é 3", 1, "quay l¹i cµi chÕ ®é 3/#AdaptiveTrain_Mode3_Config_Menu()")
        return 0
    end
    Say(format("®· l­u kho¶ng c¸ch më b·i %d", nSaved), 1,
        "quay l¹i cµi chÕ ®é 3/#AdaptiveTrain_Mode3_Config_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Random_Menu()
    local c = VSDTrain3_GetOwnerConfig()
    if not c then return AdaptiveTrain_Mode3_Config_Menu() end
    Say(format("cµi sè qu¸i chÕ ®é 3\nsè qu¸i bï tõ %d ®Õn %d\ncho phÐp tõ 1 ®Õn 50", c.nExtraMin, c.nExtraMax), 5,
        "chän nhanh tõ 6 ®Õn 10/#AdaptiveTrain_Mode3_Preset_6_10()",
        "chän nhanh tõ 8 ®Õn 10/#AdaptiveTrain_Mode3_Preset_8_10()",
        "nhËp sè qu¸i nhá nhÊt/#AdaptiveTrain_Mode3_AskExtraMin()",
        "nhËp sè qu¸i lín nhÊt/#AdaptiveTrain_Mode3_AskExtraMax()",
        "quay l¹i cµi chÕ ®é 3/#AdaptiveTrain_Mode3_Config_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Preset_6_10()
    VSDTrain3_SetExtraRange(6, 10)
    return AdaptiveTrain_Mode3_Random_Menu()
end

function AdaptiveTrain_Mode3_Preset_8_10()
    VSDTrain3_SetExtraRange(8, 10)
    return AdaptiveTrain_Mode3_Random_Menu()
end

function AdaptiveTrain_Mode3_AskExtraMin()
    AskClientForNumber("AdaptiveTrain_Mode3_InputExtraMin", VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, "nhËp sè qu¸i nhá nhÊt tõ 1 ®Õn 50")
    return 1
end

function AdaptiveTrain_Mode3_InputExtraMin(nValue)
    local nMin, nMax = VSDTrain3_SetExtraMin(nValue)
    if not nMin then return AdaptiveTrain_Mode3_Random_Menu() end
    Say(format("®· l­u sè qu¸i bï tõ %d ®Õn %d", nMin, nMax), 1,
        "quay l¹i cµi sè qu¸i/#AdaptiveTrain_Mode3_Random_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_AskExtraMax()
    AskClientForNumber("AdaptiveTrain_Mode3_InputExtraMax", VSD_TRAIN3_CONFIG_EXTRA_MIN, VSD_TRAIN3_CONFIG_EXTRA_MAX, "nhËp sè qu¸i lín nhÊt tõ 1 ®Õn 50")
    return 1
end

function AdaptiveTrain_Mode3_InputExtraMax(nValue)
    local nMin, nMax = VSDTrain3_SetExtraMax(nValue)
    if not nMax then return AdaptiveTrain_Mode3_Random_Menu() end
    Say(format("®· l­u sè qu¸i bï tõ %d ®Õn %d", nMin, nMax), 1,
        "quay l¹i cµi sè qu¸i/#AdaptiveTrain_Mode3_Random_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Reset_Config()
    VSDTrain3_ResetOwnerConfig()
    return AdaptiveTrain_Mode3_Config_Menu()
end

function AdaptiveTrain_Mode3_Enable_Menu()
    local nRet = VSDTrain3_Enable()
    if nRet == 1 then
        Say("®· bËt chÕ ®é 3\nchÕ ®é ch­a t¹o qu¸i ngay\nnh©n vËt ph¶i g©y s¸t th­¬ng ®Ó më b·i", 1,
            "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
        return 1
    end
    if nRet == 2 then
        Say("chÕ ®é 3 ®· bËt trªn b¶n ®å nµy", 1,
            "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
        return 1
    end
    if nRet == -20 then
        Say("kh«ng bËt ®­îc chÕ ®é 3\nchÕ ®é 1 ®ang bËt\nh·y t¾t chÕ ®é 1 tr­íc", 1,
            "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
        return 0
    end
    if nRet == -21 then
        Say("kh«ng bËt ®­îc chÕ ®é 3\nchÕ ®é 2 ®ang bËt\nh·y t¾t chÕ ®é 2 tr­íc", 1,
            "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
        return 0
    end
    if nRet == -22 then
        Say("kh«ng bËt ®­îc chÕ ®é 3\nb¶n ®å ®ang cã ng­êi kh¸c qu¶n lý chÕ ®é 3", 1,
            "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
        return 0
    end
    Say("kh«ng bËt ®­îc chÕ ®é 3\nh·y kiÓm tra m¸y chñ", 1,
        "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
    return 0
end

function AdaptiveTrain_Mode3_Status_Menu()
    local pW = GetWorldPos()
    local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
    local t = g_tbVSDTrain3MapManager and g_tbVSDTrain3MapManager[pW] or nil
    local szState = "t¾t"
    local nBatch = 0
    local nLive = 0
    if t then
        szState = "chê s¸t th­¬ng"
        nBatch = t.tbBatches and getn(t.tbBatches) or 0
        nLive = VSDTrain3_CountLive(t)
        if nBatch > 0 then szState = "®ang gi÷ b·i" end
    end
    Say(format("tr¹ng th¸i chÕ ®é 3\ntr¹ng th¸i %s\nb¶n ®å %d\nsè b·i ®ang gi÷ %d\nqu¸i bï ®ang sèng %d", szState, pW, nBatch, nLive), 4,
        "chi tiÕt kü thuËt/#AdaptiveTrain_Mode3_Status_Tech_Menu()",
        "xem h­íng dÉn/#AdaptiveTrain_Mode3_Guide_Menu()",
        "xem l­u vµ kh«i phôc/#AdaptiveTrain_Mode3_Persistence_Menu()",
        "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Status_Tech_Menu()
    local pW = GetWorldPos()
    local t = g_tbVSDTrain3MapManager and g_tbVSDTrain3MapManager[pW] or nil
    if not t then
        Say("chi tiÕt chÕ ®é 3\nchÕ ®é ®ang t¾t\nkh«ng cã d÷ liÖu ®ang ch¹y", 2,
            "chÈn ®o¸n an toµn/#AdaptiveTrain_Mode3_Diagnose_Menu()",
            "quay l¹i tr¹ng th¸i/#AdaptiveTrain_Mode3_Status_Menu()")
        return 1
    end
    Say(format("chi tiÕt chÕ ®é 3\nsè lÇn quÐt %d\nqu¸i hîp lÖ gÇn nhÊt %d\nlÇn g©y s¸t th­¬ng %d\ntæng b·i ®· më %d\n®· t¹o %d qu¸i\n®· dän %d qu¸i", t.nScanCount or 0, t.nLastEligible or 0, t.nDamageEvents or 0, t.nTriggerTotal or 0, t.nCreatedTotal or 0, t.nDeletedTotal or 0), 2,
        "chÈn ®o¸n an toµn/#AdaptiveTrain_Mode3_Diagnose_Menu()",
        "quay l¹i tr¹ng th¸i/#AdaptiveTrain_Mode3_Status_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Guide_Menu()
    Say("h­íng dÉn chÕ ®é 3\nbËt chÕ ®é 3 ch­a t¹o qu¸i ngay\nnh©n vËt bËt chÕ ®é ph¶i g©y s¸t th­¬ng qu¸i hîp lÖ\nkhi ®ñ kho¶ng c¸ch hÖ thèng më mét b·i míi\nqu¸i bï chÕt sÏ kh«ng håi sinh\nmçi b·i tù dän khi nh©n vËt ®i qu¸ xa\ncÊu h×nh vµ tr¹ng th¸i bËt ®­îc l­u tù ®éng", 1,
        "quay l¹i tr¹ng th¸i/#AdaptiveTrain_Mode3_Status_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Persistence_Menu()
    local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
    local nSavedMap = VSDTrain3_GetSavedEnabledMap()
    local szState = "t¾t"
    if nSavedMap and nSavedMap >= 0 then szState = "®· l­u bËt" end
    Say(format("l­u vµ kh«i phôc chÕ ®é 3\ntr¹ng th¸i %s\nkho¶ng c¸ch më b·i %d\nsè qu¸i bï tõ %d ®Õn %d\nkhi ®¨ng nhËp l¹i hÖ thèng tù kh«i phôc trªn b¶n ®å ®· l­u\nqu¸i bï cò kh«ng ®­îc t¹o l¹i", szState, c.nNewBatchDistance, c.nExtraMin, c.nExtraMax), 1,
        "quay l¹i tr¹ng th¸i/#AdaptiveTrain_Mode3_Status_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Diagnose_Menu()
    if not PlayerIndex or PlayerIndex <= 0 then
        Say("chÈn ®o¸n chÕ ®é 3\nkh«ng ®äc ®­îc nh©n vËt", 1, "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
        return 0
    end
    local nApi = VSDTrain3_CheckApi()
    if nApi ~= 1 then
        Say("chÈn ®o¸n chÕ ®é 3\nm¸y chñ thiÕu hµm cÇn thiÕt", 1, "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
        return 0
    end
    local pW = GetWorldPos()
    local c = VSDTrain3_GetOwnerConfig() or VSDTrain3_DefaultConfig()
    local t = g_tbVSDTrain3MapManager and g_tbVSDTrain3MapManager[pW] or nil
    local tbCatalog
    if t and t.tbCatalogMeta then
        tbCatalog = {tbMeta=t.tbCatalogMeta, nRows=t.nCatalogRows or 0, nEligibleRows=t.nCatalogEligible or 0}
    else
        tbCatalog = VSDTrain3_LoadCatalogSnapshot()
    end
    if not tbCatalog then
        Say("chÈn ®o¸n chÕ ®é 3\nkh«ng ®äc ®­îc danh s¸ch qu¸i gèc", 1, "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
        return 0
    end
    local tbTemp = {nLastAroundRaw=0, nLastEligible=0, nLastCatalogReject=0, nLastRuntimeNameMismatch=0, tbCatalogMeta=tbCatalog.tbMeta}
    local tbCurrent = VSDTrain3_CollectCurrent(tbTemp)
    local nDist = t and VSDTrain3_GetManagerDistance(t) or c.nNewBatchDistance
    local nMin, nMax
    if t then nMin, nMax = VSDTrain3_GetManagerExtraRange(t) else nMin, nMax = c.nExtraMin, c.nExtraMax end
    Say(format("chÈn ®o¸n chÕ ®é 3\nb¶n ®å %d\nqu¸i quanh nh©n vËt %d\nqu¸i hîp lÖ %d\nmÉu qu¸i gèc hîp lÖ %d\nkho¶ng c¸ch më b·i %d\nsè qu¸i bï tõ %d ®Õn %d", pW, tbTemp.nLastAroundRaw or 0, getn(tbCurrent), tbCatalog.nEligibleRows or 0, nDist, nMin, nMax), 1,
        "quay l¹i chÕ ®é 3/#AdaptiveTrain_Mode3_Menu()")
    return 1
end

function AdaptiveTrain_Mode3_Disable_Menu()
    local nDeleted = VSDTrain3_Disable()
    if not nDeleted or nDeleted < 0 then nDeleted = 0 end
    Say(format("®· t¾t chÕ ®é 3\n®· dän %d qu¸i bï", nDeleted), 1,
        "quay l¹i bï qu¸i/#AdaptiveTrain_Menu()")
    return 1
end
