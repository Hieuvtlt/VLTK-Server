-- BOSS ONLY - Lenh Bai GMBOSS 6,1,2526
-- File nay thay TOAN BO code cu cua gmboss_lingpai.lua (neu co).
-- Chi con 2 chuc nang: Boss Sat Thu + Boss Hoang Kim.

KILLER_BOSS_CTRL = "\\script\\task\\tollgate\\killer\\killerboss_lenhbai_control.lua"
BOSS_MANAGER_CTRL = "\\script\\missions\\boss\\bossmanager_lenhbai_control.lua"
NEVER_DIE_CTRL = "\\script\\item\\neverdie\\neverdie_control.lua"
TEAM_CALL_CTRL = "\\script\\item\\teamcall\\teamcall_control.lua"
Include("\\script\\item\\teamcall\\teamcall_control.lua")

function main(nItemIndex)
	Say("LÖnh Bµi GMBOSS - Qu¶n lý Boss", 6,
		"Qu¶n lý Boss S¸t Thñ/#KillerBoss_Menu()",
		"Qu¶n lý Boss Hoµng Kim/#GoldBoss_MainMenu()",
		"Never Die/#NeverDie_Menu()",
		"Gäi Tæ §éi/#TeamCall_Menu()",
		"Gäi All Player/#AllCall_Menu()",
		"§ãng/#BossControl_Close()");
	return 1;
end;

function BossControl_Close()
	return 1;
end;

function KillerBoss_Menu()
	local nCount = DynamicExecute(KILLER_BOSS_CTRL, "KillerBoss_Count");
	if (nCount == nil) then nCount = 0; end;
	Say(format("Boss S¸t Thñ - hiÖn cã %d Boss", nCount), 4,
		"BËt Boss S¸t Thñ/#KillerBoss_TurnOn_Menu()",
		"T¾t toµn bé Boss S¸t Thñ/#KillerBoss_TurnOff_Menu()",
		"KiÓm tra tr¹ng th¸i/#KillerBoss_Status_Menu()",
		"Quay l¹i/#main()");
	return 1;
end;

function KillerBoss_TurnOn_Menu()
	local nAdded = DynamicExecute(KILLER_BOSS_CTRL, "KillerBoss_TurnOn");
	if (nAdded == nil or nAdded < 0) then
		Say("Lçi khi më Boss S¸t Thñ", 1, "Quay l¹i/#KillerBoss_Menu()");
		return 0;
	end;
	local nCount = DynamicExecute(KILLER_BOSS_CTRL, "KillerBoss_Count");
	if (nCount == nil) then nCount = 0; end;
	Say(format("§· bËt Boss S¸t Thñ. Thªm %d Boss. HiÖn cã %d Boss.", nAdded, nCount), 1, "Quay l¹i/#KillerBoss_Menu()");
	return 1;
end;

function KillerBoss_TurnOff_Menu()
	local nDeleted = DynamicExecute(KILLER_BOSS_CTRL, "KillerBoss_TurnOff");
	if (nDeleted == nil or nDeleted < 0) then nDeleted = 0; end;
	Say(format("§· t¾t Boss S¸t Thñ. §· xãa %d Boss.", nDeleted), 1, "Quay l¹i/#KillerBoss_Menu()");
	return 1;
end;

function KillerBoss_Status_Menu()
	local nCount = DynamicExecute(KILLER_BOSS_CTRL, "KillerBoss_Count");
	if (nCount == nil) then nCount = 0; end;
	Say(format("Sè Boss S¸t Thñ ®ang tån t¹i: %d", nCount), 1, "Quay l¹i/#KillerBoss_Menu()");
	return 1;
end;

function GoldBoss_StateText(szKey)
	local nState = DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_GetState", szKey);
	if (nState == 0) then return "T¾t"; end;
	return "BËt";
end;

function GoldBoss_Count(szKey)
	local nCount = DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Count", szKey);
	if (nCount == nil) then nCount = 0; end;
	return nCount;
end;

function GoldBoss_StateCountText(szKey)
	return format("%s | Boss ®ang cã: %d", GoldBoss_StateText(szKey), GoldBoss_Count(szKey));
end;

function GoldBoss_Set(szKey, nValue, szName, szBack)
	if (nValue == 1) then
		DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", szKey);
		Say(szName.." ®· bËt. Boss sÏ xuÊt hiÖn ë lÇn lÞch kÕ tiÕp.", 1, "Quay l¹i/"..szBack);
	else
		local nDeleted = DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", szKey);
		if (nDeleted == nil) then nDeleted = 0; end;
		Say(format("%s ®· t¾t. §· xãa %d Boss ®ang tån t¹i.", szName, nDeleted), 1, "Quay l¹i/"..szBack);
	end;
	return 1;
end;

function GoldBoss_Toggle(szKey, szName, szBack)
	local nState = DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_GetState", szKey);
	if (nState == 0) then
		return GoldBoss_Set(szKey, 1, szName, szBack);
	end;
	return GoldBoss_Set(szKey, 0, szName, szBack);
end;

function GoldBoss_ManualToggle(szKey, szName, szBack)
	local nState = DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_GetState", szKey);
	if (nState == 0) then
		DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", szKey);
		Say(szName.." ®· bËt. CÈm nang T©n Thñ ®­îc phÐp gäi Boss.", 1, "Quay l¹i/"..szBack);
		return 1;
	end;
	local nDeleted = DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", szKey);
	if (nDeleted == nil) then nDeleted = 0; end;
	Say(format("%s ®· t¾t. §· xãa %d Boss gäi tõ CÈm nang T©n Thñ.", szName, nDeleted), 1, "Quay l¹i/"..szBack);
	return 1;
end;

function GoldBoss_ManualBig()
	return GoldBoss_ManualToggle("HK_DAI_MANUAL", "Boss §¹i gäi tõ CÈm nang T©n Thñ", "#GoldBoss_BigMenu()");
end;

function GoldBoss_ManualSmall()
	return GoldBoss_ManualToggle("HK_TIEU_MANUAL", "Boss TiÓu gäi tõ CÈm nang T©n Thñ", "#GoldBoss_SmallMenu()");
end;

function GoldBoss_MainMenu()
	Say("Qu¶n lý Boss Hoµng Kim", 7,
		"Boss Hoµng Kim TiÓu/#GoldBoss_SmallMenu()",
		"Boss Hoµng Kim §¹i/#GoldBoss_BigMenu()",
		"§éc C« Thiªn Phong - 19:45/#GoldBoss_DocCoMenu()",
		"BËt toµn bé Boss Hoµng Kim/#GoldBoss_AllOn()",
		"T¾t toµn bé Boss Hoµng Kim/#GoldBoss_AllOff()",
		"Xem tr¹ng th¸i Boss Hoµng Kim/#GoldBoss_AllStatus()",
		"Quay l¹i/#main()");
	return 1;
end;

function GoldBoss_SmallMenu()
	local s0400 = GoldBoss_StateCountText("HK_TIEU_0400");
	local s1230 = GoldBoss_StateCountText("HK_TIEU_1230");
	local s2000 = GoldBoss_StateCountText("HK_TIEU_2000");
	local s2300 = GoldBoss_StateCountText("HK_TIEU_2300");
	local sManual = GoldBoss_StateCountText("HK_TIEU_MANUAL");
	Say("Boss Hoµng Kim TiÓu - chän mét dßng ®Ó ®æi BËt/T¾t", 8,
		"04:00 | "..s0400.."/#GoldBoss_Small0400()",
		"12:30 | "..s1230.."/#GoldBoss_Small1230()",
		"20:00 | "..s2000.."/#GoldBoss_Small2000()",
		"23:00 | "..s2300.."/#GoldBoss_Small2300()",
		"CÈm nang T©n Thñ | "..sManual.."/#GoldBoss_ManualSmall()",
		"BËt toµn bé Boss TiÓu/#GoldBoss_SmallAllOn()",
		"T¾t toµn bé Boss TiÓu/#GoldBoss_SmallAllOff()",
		"Quay l¹i/#GoldBoss_MainMenu()");
	return 1;
end;

function GoldBoss_Small0400() return GoldBoss_Toggle("HK_TIEU_0400", "Boss TiÓu 04:00", "#GoldBoss_SmallMenu()"); end;
function GoldBoss_Small1230() return GoldBoss_Toggle("HK_TIEU_1230", "Boss TiÓu 12:30", "#GoldBoss_SmallMenu()"); end;
function GoldBoss_Small2000() return GoldBoss_Toggle("HK_TIEU_2000", "Boss TiÓu 20:00", "#GoldBoss_SmallMenu()"); end;
function GoldBoss_Small2300() return GoldBoss_Toggle("HK_TIEU_2300", "Boss TiÓu 23:00", "#GoldBoss_SmallMenu()"); end;

function GoldBoss_SmallAllOn()
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_0400");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_1230");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_2000");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_2300");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_MANUAL");
	Say("§· BËt toµn bé Boss Hoµng Kim TiÓu, gåm c¶ ®­êng gäi tõ CÈm nang T©n Thñ.", 1, "Quay l¹i/#GoldBoss_SmallMenu()");
	return 1;
end;

function GoldBoss_SmallAllOff()
	local n = 0;
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_0400");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_1230");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_2000");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_2300");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_MANUAL");
	Say(format("§· T¾t toµn bé Boss Hoµng Kim TiÓu. §· xãa %d Boss ®ang tån t¹i.", n), 1, "Quay l¹i/#GoldBoss_SmallMenu()");
	return 1;
end;

function GoldBoss_BigMenu()
	local s0800 = GoldBoss_StateCountText("HK_DAI_0800");
	local s1930 = GoldBoss_StateCountText("HK_DAI_1930");
	local s2200 = GoldBoss_StateCountText("HK_DAI_2200");
	local sManual = GoldBoss_StateCountText("HK_DAI_MANUAL");
	Say("Boss Hoµng Kim §¹i - chän mét dßng ®Ó ®æi BËt/T¾t", 7,
		"08:00 | "..s0800.."/#GoldBoss_Big0800()",
		"19:30 | "..s1930.."/#GoldBoss_Big1930()",
		"22:00 | "..s2200.."/#GoldBoss_Big2200()",
		"CÈm nang T©n Thñ | "..sManual.."/#GoldBoss_ManualBig()",
		"BËt toµn bé Boss §¹i/#GoldBoss_BigAllOn()",
		"T¾t toµn bé Boss §¹i/#GoldBoss_BigAllOff()",
		"Quay l¹i/#GoldBoss_MainMenu()");
	return 1;
end;

function GoldBoss_Big0800() return GoldBoss_Toggle("HK_DAI_0800", "Boss §¹i 08:00", "#GoldBoss_BigMenu()"); end;
function GoldBoss_Big1930() return GoldBoss_Toggle("HK_DAI_1930", "Boss §¹i 19:30", "#GoldBoss_BigMenu()"); end;
function GoldBoss_Big2200() return GoldBoss_Toggle("HK_DAI_2200", "Boss §¹i 22:00", "#GoldBoss_BigMenu()"); end;

function GoldBoss_BigAllOn()
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_DAI_0800");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_DAI_1930");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_DAI_2200");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_DAI_MANUAL");
	Say("§· BËt toµn bé Boss Hoµng Kim §¹i, gåm c¶ ®­êng gäi tõ CÈm nang T©n Thñ.", 1, "Quay l¹i/#GoldBoss_BigMenu()");
	return 1;
end;

function GoldBoss_BigAllOff()
	local n = 0;
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_DAI_0800");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_DAI_1930");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_DAI_2200");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_DAI_MANUAL");
	Say(format("§· T¾t toµn bé Boss Hoµng Kim §¹i. §· xãa %d Boss ®ang tån t¹i.", n), 1, "Quay l¹i/#GoldBoss_BigMenu()");
	return 1;
end;

function GoldBoss_DocCoMenu()
	local s = GoldBoss_StateCountText("DOC_CO_1945");
	local szAction = "BËt §éc C« Thiªn Phong";
	if (GoldBoss_StateText("DOC_CO_1945") == "BËt") then
		szAction = "T¾t §éc C« Thiªn Phong";
	end;
	Say("§éc C« Thiªn Phong - 19:45\nTr¹ng th¸i: "..s, 2,
		szAction.."/#GoldBoss_DocCoToggle()",
		"Quay l¹i/#GoldBoss_MainMenu()");
	return 1;
end;

function GoldBoss_DocCoToggle()
	return GoldBoss_Toggle("DOC_CO_1945", "§éc C« Thiªn Phong 19:45", "#GoldBoss_DocCoMenu()");
end;

function GoldBoss_SmallAllOn_Silent()
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_0400");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_1230");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_2000");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_2300");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_TIEU_MANUAL");
end;

function GoldBoss_BigAllOn_Silent()
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_DAI_0800");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_DAI_1930");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_DAI_2200");
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "HK_DAI_MANUAL");
end;

function GoldBoss_AllOn()
	GoldBoss_SmallAllOn_Silent();
	GoldBoss_BigAllOn_Silent();
	DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Enable", "DOC_CO_1945");
	Say("§· BËt toµn bé Boss Hoµng Kim: Boss TiÓu, Boss §¹i, CÈm nang T©n Thñ vµ §éc C« Thiªn Phong.", 1, "Quay l¹i/#GoldBoss_MainMenu()");
	return 1;
end;

function GoldBoss_AllOff()
	local n = 0;
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_0400");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_1230");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_2000");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_2300");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_TIEU_MANUAL");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_DAI_0800");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_DAI_1930");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_DAI_2200");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "HK_DAI_MANUAL");
	n = n + DynamicExecute(BOSS_MANAGER_CTRL, "BossManager_Disable", "DOC_CO_1945");
	Say(format("§· T¾t toµn bé Boss Hoµng Kim. §· xãa %d Boss ®ang tån t¹i.", n), 1, "Quay l¹i/#GoldBoss_MainMenu()");
	return 1;
end;

function GoldBoss_AllStatus()
	local sz = "Tr¹ng th¸i Boss Hoµng Kim";
	sz = sz.."\nTiÓu 04:00: "..GoldBoss_StateCountText("HK_TIEU_0400");
	sz = sz.."\nTiÓu 12:30: "..GoldBoss_StateCountText("HK_TIEU_1230");
	sz = sz.."\nTiÓu 20:00: "..GoldBoss_StateCountText("HK_TIEU_2000");
	sz = sz.."\nTiÓu 23:00: "..GoldBoss_StateCountText("HK_TIEU_2300");
	sz = sz.."\nTiÓu - CÈm nang T©n Thñ: "..GoldBoss_StateCountText("HK_TIEU_MANUAL");
	sz = sz.."\n§¹i 08:00: "..GoldBoss_StateCountText("HK_DAI_0800");
	sz = sz.."\n§¹i 19:30: "..GoldBoss_StateCountText("HK_DAI_1930");
	sz = sz.."\n§éc C« Thiªn Phong 19:45: "..GoldBoss_StateCountText("DOC_CO_1945");
	sz = sz.."\n§¹i 22:00: "..GoldBoss_StateCountText("HK_DAI_2200");
	sz = sz.."\n§¹i - CÈm nang T©n Thñ: "..GoldBoss_StateCountText("HK_DAI_MANUAL");
	Say(sz, 1,
		"Quay l¹i/#GoldBoss_MainMenu()");
	return 1;
end;

-- NEVER DIE - 2 lùa chän: Kh¸ng th­êng hoÆc Kh¸ng Full Ph¶n §am.
function NeverDie_Menu()
    local nSaved = DynamicExecuteByPlayer(PlayerIndex, NEVER_DIE_CTRL, "NeverDie_GetSaved");
    local nBlock = DynamicExecuteByPlayer(PlayerIndex, NEVER_DIE_CTRL, "NeverDie_GetBlockState");
    local nImmune = DynamicExecuteByPlayer(PlayerIndex, NEVER_DIE_CTRL, "NeverDie_GetImmuneState");
    local nReflect = DynamicExecuteByPlayer(PlayerIndex, NEVER_DIE_CTRL, "NeverDie_GetReflectState");
    if (nSaved == nil) then nSaved = 0; end;
    if (nBlock == nil) then nBlock = 0; end;
    if (nImmune == nil) then nImmune = 0; end;
    if (nReflect == nil) then nReflect = 0; end;
    local szMode = "TÀT";
    if (nSaved == 1) then szMode = "1 Kh¸ng th­êng"; end;
    if (nSaved == 2) then szMode = "2 Kh¸ng Full Ph¶n §am"; end;
    Say(format("Never Die\nChÕ ®é ®ang l­u: %s\n993: %d | 309: %d | Ph¶n §am 835: %d", szMode, nBlock, nImmune, nReflect), 6,
        "1 Kh¸ng th­êng/#NeverDie_EnableNormal_Menu()",
        "2 Kh¸ng Full Ph¶n §am/#NeverDie_EnableFullReflect_Menu()",
        "T¾t Never Die/#NeverDie_Disable_Menu()",
        "ƒp l¹i chÕ ®é ®ang l­u/#NeverDie_Reapply_Menu()",
        "KiÓm tra tr¹ng th¸i/#NeverDie_Status_Menu()",
        "Quay l¹i/#main()");
    return 1;
end;

function NeverDie_EnableNormal_Menu()
    local nRet = DynamicExecuteByPlayer(PlayerIndex, NEVER_DIE_CTRL, "NeverDie_EnableNormal");
    if (nRet == nil or nRet < 1) then
        Say(format("Kh«ng thÓ bËt Kh¸ng th­êng. M· lçi: %d", nRet or -99), 1, "Quay l¹i/#NeverDie_Menu()");
        return 0;
    end;
    Say("§· bËt Never Die - 1 Kh¸ng th­êng. Dïng 993 + 309, tr¹ng th¸i ®­îc l­u qua restart server.", 1,
        "Quay l¹i/#NeverDie_Menu()");
    return 1;
end;

function NeverDie_EnableFullReflect_Menu()
    local nRet = DynamicExecuteByPlayer(PlayerIndex, NEVER_DIE_CTRL, "NeverDie_EnableFullReflect");
    if (nRet == nil or nRet < 1) then
        Say(format("Kh«ng thÓ bËt Kh¸ng Full Ph¶n §am. M· lçi: %d", nRet or -99), 1, "Quay l¹i/#NeverDie_Menu()");
        return 0;
    end;
    Say("§· bËt Never Die - 2 Kh¸ng Full Ph¶n §am. Dïng 993 + 309 + 835, gåm líp chèng ph¶n ®ßn ®· test thµnh c«ng.", 1,
        "Quay l¹i/#NeverDie_Menu()");
    return 1;
end;

-- Gi÷ callback cò ®Ó kh«ng lçi menu/script cò: mÆc ®Þnh chuyÓn vÒ Kh¸ng th­êng.
function NeverDie_Enable_Menu()
    return NeverDie_EnableNormal_Menu();
end;

function NeverDie_Disable_Menu()
    DynamicExecuteByPlayer(PlayerIndex, NEVER_DIE_CTRL, "NeverDie_Disable");
    Say("§· t¾t Never Die vµ xãa c¸c tr¹ng th¸i 993 + 309 + 835 ®ang ¸p.", 1, "Quay l¹i/#NeverDie_Menu()");
    return 1;
end;

function NeverDie_Reapply_Menu()
    local nRet = DynamicExecuteByPlayer(PlayerIndex, NEVER_DIE_CTRL, "NeverDie_Reapply");
    if (nRet == nil or nRet < 1) then
        Say("Never Die ®ang TÀT hoÆc kh«ng thÓ ¸p l¹i. H·y chän 1 Kh¸ng th­êng hoÆc 2 Kh¸ng Full Ph¶n §am tr­íc.", 1,
            "Quay l¹i/#NeverDie_Menu()");
        return 0;
    end;
    Say("§· ¸p l¹i ®óng chÕ ®é Never Die ®ang l­u trong 1 n¨m kÓ tõ thêi ®iÓm hiÖn t¹i.", 1,
        "Quay l¹i/#NeverDie_Menu()");
    return 1;
end;

function NeverDie_Status_Menu()
    return NeverDie_Menu();
end;

-- GOI TO DOI + ALL PLAYER FIX3 - FIXED 3S / MIN 10 O / MUTUAL EXCLUSION.
function TeamCall_Menu()
    local nMode = TeamCall_GetMode();
    local nDistance = TeamCall_GetDistance();
    if (nDistance == nil or nDistance < 10 or nDistance > 100) then nDistance = 10; end;

    local szStatus = "T¾t";
    if (nMode == TEAM_CALL_MODE_PT) then
        szStatus = format("PT ®ang bËt vÜnh viÔn | kho¶ng c¸ch %d «", nDistance);
    elseif (nMode == TEAM_CALL_MODE_ALL) then
        szStatus = "All Player ®ang bËt vÜnh viÔn | PT ®· ng¾t";
    end;

    Say("Gäi Tæ §éi\nTr¹ng th¸i: "..szStatus, 4,
        "Gäi PT 1 LÇn/#TeamCall_CallNow_Menu()",
        "BËt PT VÜnh ViÔn/#TeamCall_PermanentConfigure()",
        "T¾t Mäi Gäi VÜnh ViÔn/#TeamCall_PermanentDisable_Menu()",
        "Quay L¹i/#main()");
    return 1;
end;

function TeamCall_CallNow_Menu()
    local nRet = TeamCall_CallNow();
    if (nRet == nil) then nRet = -99; end;
    if (nRet == -1) then
        Say("§· ng¾t mäi chÕ ®é gäi vÜnh viÔn. B¹n ch­a cã tæ ®éi hoÆc PT kh«ng cã thµnh viªn kh¸c ®Ó gäi.", 1,
            "Quay L¹i/#TeamCall_Menu()");
        return 0;
    end;
    if (nRet < 0) then
        Say(format("§· ng¾t mäi chÕ ®é gäi vÜnh viÔn nh­ng kh«ng thÓ gäi tæ ®éi. M· lçi: %d", nRet), 1,
            "Quay L¹i/#TeamCall_Menu()");
        return 0;
    end;
    Say(format("§· ng¾t mäi chÕ ®é gäi vÜnh viÔn vµ gäi %d thµnh viªn PT vÒ ®óng täa ®é cña b¹n.", nRet), 1,
        "Quay L¹i/#TeamCall_Menu()");
    return 1;
end;

function TeamCall_PermanentConfigure()
    local nDefault = TeamCall_GetDistance();
    if (nDefault == nil or nDefault < 10 or nDefault > 100) then nDefault = 10; end;
    AskClientForNumber("TeamCall_PermanentDistanceInput", nDefault, 100,
        "NhËp kho¶ng c¸ch tõ 10 ®Õn 100 «. MÆc ®Þnh 10 «.");
    return 1;
end;

function TeamCall_PermanentDistanceInput(nDistance)
    nDistance = tonumber(nDistance);
    if (nDistance == nil or nDistance < 10 or nDistance > 100) then
        Say("Kho¶ng c¸ch kh«ng hîp lÖ. ChØ nhËp tõ 10 ®Õn 100 «.", 1,
            "NhËp L¹i/#TeamCall_PermanentConfigure()");
        return 0;
    end;
    nDistance = floor(nDistance);

    local nRet = TeamCall_EnablePermanent(nDistance, 3);
    if (nRet == nil or nRet < 1) then
        if (nRet == -1) then
            Say("Ph¶i ®ang ë trong tæ ®éi cã thµnh viªn kh¸c míi bËt ®­îc Gäi PT VÜnh ViÔn.", 1,
                "Quay L¹i/#TeamCall_Menu()");
            return 0;
        end;
        Say(format("Kh«ng thÓ bËt Gäi PT VÜnh ViÔn. M· lçi: %d", nRet or -99), 1,
            "Quay L¹i/#TeamCall_Menu()");
        return 0;
    end;

    Say(format("§· bËt Gäi PT VÜnh ViÔn. Kho¶ng c¸ch: %d «. Gäi All Player VÜnh ViÔn nÕu ®ang bËt ®· tù ng¾t.", nDistance), 1,
        "Quay L¹i/#TeamCall_Menu()");
    return 1;
end;

function TeamCall_PermanentIntervalInput(nIgnored)
    local nDistance = TeamCall_GetDistance();
    if (nDistance == nil or nDistance < 10 or nDistance > 100) then nDistance = 10; end;
    return TeamCall_PermanentDistanceInput(nDistance);
end;

function TeamCall_PermanentDisable_Menu()
    TeamCall_DisablePermanent();
    Say("§· t¾t mäi chÕ ®é gäi vÜnh viÔn.", 1,
        "Quay L¹i/#TeamCall_Menu()");
    return 1;
end;

function AllCall_Menu()
    local nMode = TeamCall_GetMode();
    local nDistance = AllCall_GetDistance();
    if (nDistance == nil or nDistance < 10 or nDistance > 100) then nDistance = 10; end;

    local szStatus = "T¾t";
    if (nMode == TEAM_CALL_MODE_ALL) then
        szStatus = format("All Player ®ang bËt vÜnh viÔn | kho¶ng c¸ch %d «", nDistance);
    elseif (nMode == TEAM_CALL_MODE_PT) then
        szStatus = "PT ®ang bËt vÜnh viÔn | All Player ®· ng¾t";
    end;

    Say("Gäi All Player\nTr¹ng th¸i: "..szStatus, 4,
        "Gäi Player 1 LÇn/#AllCall_CallNow_Menu()",
        "BËt All VÜnh ViÔn/#AllCall_PermanentConfigure()",
        "T¾t Mäi Gäi VÜnh ViÔn/#AllCall_PermanentDisable_Menu()",
        "Quay L¹i/#main()");
    return 1;
end;

function AllCall_CallNow_Menu()
    local nRet = AllCall_CallNow();
    if (nRet == nil) then nRet = -99; end;
    if (nRet < 0) then
        Say(format("§· ng¾t mäi chÕ ®é gäi vÜnh viÔn nh­ng kh«ng thÓ Gäi All Player. M· lçi: %d", nRet), 1,
            "Quay L¹i/#AllCall_Menu()");
        return 0;
    end;
    Say(format("§· ng¾t mäi chÕ ®é gäi vÜnh viÔn vµ gäi %d player ®ang online vÒ ®óng täa ®é cña b¹n.", nRet), 1,
        "Quay L¹i/#AllCall_Menu()");
    return 1;
end;

function AllCall_PermanentConfigure()
    local nDefault = AllCall_GetDistance();
    if (nDefault == nil or nDefault < 10 or nDefault > 100) then nDefault = 10; end;
    AskClientForNumber("AllCall_PermanentDistanceInput", nDefault, 100,
        "NhËp kho¶ng c¸ch tõ 10 ®Õn 100 «. MÆc ®Þnh 10 «.");
    return 1;
end;

function AllCall_PermanentDistanceInput(nDistance)
    nDistance = tonumber(nDistance);
    if (nDistance == nil or nDistance < 10 or nDistance > 100) then
        Say("Kho¶ng c¸ch kh«ng hîp lÖ. ChØ nhËp tõ 10 ®Õn 100 «.", 1,
            "NhËp L¹i/#AllCall_PermanentConfigure()");
        return 0;
    end;
    nDistance = floor(nDistance);

    local nRet = AllCall_EnablePermanent(nDistance, 3);
    if (nRet == nil or nRet < 1) then
        if (nRet == -11) then
            Say("Core hiÖn t¹i kh«ng cã API quÐt toµn bé player trªn GameServer.", 1,
                "Quay L¹i/#AllCall_Menu()");
            return 0;
        end;
        Say(format("Kh«ng thÓ bËt Gäi All Player VÜnh ViÔn. M· lçi: %d", nRet or -99), 1,
            "Quay L¹i/#AllCall_Menu()");
        return 0;
    end;

    Say(format("§· bËt Gäi All Player VÜnh ViÔn. Kho¶ng c¸ch: %d «. Gäi PT VÜnh ViÔn nÕu ®ang bËt ®· tù ng¾t.", nDistance), 1,
        "Quay L¹i/#AllCall_Menu()");
    return 1;
end;

function AllCall_PermanentDisable_Menu()
    AllCall_DisablePermanent();
    Say("§· t¾t mäi chÕ ®é gäi vÜnh viÔn.", 1,
        "Quay L¹i/#AllCall_Menu()");
    return 1;
end;
