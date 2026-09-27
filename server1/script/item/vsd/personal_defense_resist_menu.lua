-- V5.13.1: Phong thu / Khang tinh dung truc tiep SkillState native HUYTRAN.
-- Kh«ng ®äc GetPlayerMagicAttrib, kh«ng monitor 1 gi©y, kh«ng tù tÝnh MaxResist.
-- Trang thai chi hien phan do Lenh bai luu va private SkillState dang ap.

function PersonalDefenseResist_ShowMessage(szText, pBack)
	local tbOpt = {
		{"quay l¹i", pBack},
	}
	CreateNewSayEx(szText, tbOpt)
	return 1
end

function PersonalDefenseResist_StateText(nSaved, nApplied)
	if (nSaved == nil or nSaved < 0) then nSaved = 0 end
	if (nApplied == nil or nApplied < 0) then nApplied = 0 end
	if (nSaved <= 0 and nApplied <= 0) then return "t¾t" end
	if (nSaved > 0 and nApplied == nSaved) then return "bËt" end
	if (nSaved > 0 and nApplied <= 0) then return "ch­a ¸p" end
	return "cÇn ®ång bé"
end

function PersonalDefenseResist_Menu()
	local tbOpt = {
		{"xem tr¹ng th¸i hiÖn t¹i", PersonalDefenseResist_StatusMenu},
		{"phßng thñ", PersonalDefenseResist_DefenseMenu},
		{"kh¸ng hµn", PersonalDefenseResist_ColdMenu},
		{"kh¸ng l«i", PersonalDefenseResist_LightMenu},
		{"kh¸ng háa", PersonalDefenseResist_FireMenu},
		{"kh¸ng ®éc", PersonalDefenseResist_PoisonMenu},
		{"kh¸ng tÊt c¶", PersonalDefenseResist_AllMenu},
		{"dïng l¹i møc ®· l­u", PersonalDefenseResist_ReapplyMenu},
		{"t¹m t¾t tÊt c¶ - gi÷ møc ®· l­u", PersonalDefenseResist_OffEverythingMenu},
		{"quay l¹i", main},
	}
	CreateNewSayEx("phßng thñ vµ kh¸ng tÝnh\n¸p trùc tiÕp theo tr¹ng th¸i kü n¨ng gèc cña m¸y chñ. kh«ng ch¹y bé ®Õm thêi gian. ®¨ng nhËp l¹i sÏ tù ¸p møc ®· l­u.", tbOpt)
	return 1
end

function PersonalDefenseResist_StatusMenu()
	local nDefSaved = PersonalDefenseResist_GetSavedDefense(); local nDefApplied = PersonalDefenseResist_GetAppliedDefense()
	local nColdSaved = PersonalDefenseResist_GetSavedCold(); local nColdApplied = PersonalDefenseResist_GetAppliedCold()
	local nLightSaved = PersonalDefenseResist_GetSavedLight(); local nLightApplied = PersonalDefenseResist_GetAppliedLight()
	local nFireSaved = PersonalDefenseResist_GetSavedFire(); local nFireApplied = PersonalDefenseResist_GetAppliedFire()
	local nPoisonSaved = PersonalDefenseResist_GetSavedPoison(); local nPoisonApplied = PersonalDefenseResist_GetAppliedPoison()
	local nAllSaved = PersonalDefenseResist_GetSavedAll(); local nAllApplied = PersonalDefenseResist_GetAppliedAll()
	local tbOpt = {
		{"phßng thñ", PersonalDefenseResist_DefenseMenu},
		{"kh¸ng hµn", PersonalDefenseResist_ColdMenu},
		{"kh¸ng l«i", PersonalDefenseResist_LightMenu},
		{"kh¸ng háa", PersonalDefenseResist_FireMenu},
		{"kh¸ng ®éc", PersonalDefenseResist_PoisonMenu},
		{"kh¸ng tÊt c¶", PersonalDefenseResist_AllMenu},
		{"dïng l¹i møc ®· l­u", PersonalDefenseResist_ReapplyMenu},
		{"quay l¹i", PersonalDefenseResist_Menu},
	}
	local sz = "tr¹ng th¸i phßng thñ vµ kh¸ng tÝnh"
	sz = sz..format("\nphßng thñ: %s | ®· l­u +%d | ®ang ¸p +%d", PersonalDefenseResist_StateText(nDefSaved,nDefApplied), nDefSaved, nDefApplied)
	sz = sz..format("\nkh¸ng hµn: %s | ®· l­u +%d | ®ang ¸p +%d", PersonalDefenseResist_StateText(nColdSaved,nColdApplied), nColdSaved, nColdApplied)
	sz = sz..format("\nkh¸ng l«i: %s | ®· l­u +%d | ®ang ¸p +%d", PersonalDefenseResist_StateText(nLightSaved,nLightApplied), nLightSaved, nLightApplied)
	sz = sz..format("\nkh¸ng háa: %s | ®· l­u +%d | ®ang ¸p +%d", PersonalDefenseResist_StateText(nFireSaved,nFireApplied), nFireSaved, nFireApplied)
	sz = sz..format("\nkh¸ng ®éc: %s | ®· l­u +%d | ®ang ¸p +%d", PersonalDefenseResist_StateText(nPoisonSaved,nPoisonApplied), nPoisonSaved, nPoisonApplied)
	sz = sz..format("\nkh¸ng tÊt c¶: %s | ®· l­u +%d | ®ang ¸p +%d", PersonalDefenseResist_StateText(nAllSaved,nAllApplied), nAllSaved, nAllApplied)
	sz = sz.."\nkh¸ng tÊt c¶ t¸c ®éng c¶ kh¸ng vËt lý theo c¬ chÕ gèc cña m¸y chñ."
	sz = sz.."\nm¸y chñ tù xö lý giíi h¹n kh¸ng."
	CreateNewSayEx(sz, tbOpt)
	return 1
end

function PersonalDefenseResist_DefenseMenu()
	local nSaved = PersonalDefenseResist_GetSavedDefense(); local nApplied = PersonalDefenseResist_GetAppliedDefense()
	local tbOpt = {
		{"nhËp møc phßng thñ", PersonalDefenseResist_AskDefense},
		{"t¹m t¾t phßng thñ - gi÷ møc", PersonalDefenseResist_OffDefenseMenu},
		{"xem tr¹ng th¸i tæng", PersonalDefenseResist_StatusMenu},
		{"quay l¹i", PersonalDefenseResist_Menu},
	}
	CreateNewSayEx(format("phßng thñ\ntr¹ng th¸i: %s\nmøc ®· l­u: +%d\nlÖnh bµi ®ang ¸p: +%d\ngiíi h¹n lÖnh bµi: +200; b­íc 10.", PersonalDefenseResist_StateText(nSaved,nApplied), nSaved, nApplied), tbOpt)
	return 1
end
function PersonalDefenseResist_AskDefense()
	g_AskClientNumberEx(0,200,"nhËp phßng thñ tõ 0 ®Õn 200; hÖ thèng dïng b­íc 10",{PersonalDefenseResist_InputDefense}); return 1
end
function PersonalDefenseResist_InputDefense(nValue)
	local nInput=tonumber(nValue); if (nInput==nil) then nInput=0 end; nInput=floor(nInput)
	local nSaved=PersonalDefenseResist_SetDefense(nInput)
	if (nSaved==nil or nSaved<0) then return PersonalDefenseResist_ShowMessage("kh«ng ¸p ®­îc phßng thñ. møc cò ®· ®­îc gi÷ l¹i.",PersonalDefenseResist_DefenseMenu) end
	return PersonalDefenseResist_ShowMessage(format("phßng thñ\nb¹n nhËp: %d\n®· l­u: +%d\n®ang ¸p: +%d",nInput,nSaved,PersonalDefenseResist_GetAppliedDefense()),PersonalDefenseResist_DefenseMenu)
end

function PersonalDefenseResist_ColdMenu()
	local nSaved=PersonalDefenseResist_GetSavedCold(); local nApplied=PersonalDefenseResist_GetAppliedCold()
	local tbOpt={{"nhËp møc kh¸ng hµn",PersonalDefenseResist_AskCold},{"t¹m t¾t kh¸ng hµn - gi÷ møc",PersonalDefenseResist_OffColdMenu},{"xem tr¹ng th¸i tæng",PersonalDefenseResist_StatusMenu},{"quay l¹i",PersonalDefenseResist_Menu}}
	CreateNewSayEx(format("kh¸ng hµn\ntr¹ng th¸i: %s\nmøc ®· l­u: +%d\nlÖnh bµi ®ang ¸p: +%d\ngiíi h¹n lÖnh bµi: +75.",PersonalDefenseResist_StateText(nSaved,nApplied),nSaved,nApplied),tbOpt); return 1
end
function PersonalDefenseResist_AskCold()
	g_AskClientNumberEx(0,75,"nhËp kh¸ng hµn tõ 0 ®Õn 75",{PersonalDefenseResist_InputCold}); return 1
end
function PersonalDefenseResist_InputCold(nValue)
	local nInput=tonumber(nValue); if (nInput==nil) then nInput=0 end; nInput=floor(nInput)
	local nSaved=PersonalDefenseResist_SetCold(nInput)
	if (nSaved==nil or nSaved<0) then return PersonalDefenseResist_ShowMessage("kh«ng ¸p ®­îc kh¸ng hµn. møc cò ®· ®­îc gi÷ l¹i.",PersonalDefenseResist_ColdMenu) end
	return PersonalDefenseResist_ShowMessage(format("kh¸ng hµn\nb¹n nhËp: %d\n®· l­u: +%d\n®ang ¸p: +%d",nInput,nSaved,PersonalDefenseResist_GetAppliedCold()),PersonalDefenseResist_ColdMenu)
end

function PersonalDefenseResist_LightMenu()
	local nSaved=PersonalDefenseResist_GetSavedLight(); local nApplied=PersonalDefenseResist_GetAppliedLight()
	local tbOpt={{"nhËp møc kh¸ng l«i",PersonalDefenseResist_AskLight},{"t¹m t¾t kh¸ng l«i - gi÷ møc",PersonalDefenseResist_OffLightMenu},{"xem tr¹ng th¸i tæng",PersonalDefenseResist_StatusMenu},{"quay l¹i",PersonalDefenseResist_Menu}}
	CreateNewSayEx(format("kh¸ng l«i\ntr¹ng th¸i: %s\nmøc ®· l­u: +%d\nlÖnh bµi ®ang ¸p: +%d\ngiíi h¹n lÖnh bµi: +75.",PersonalDefenseResist_StateText(nSaved,nApplied),nSaved,nApplied),tbOpt); return 1
end
function PersonalDefenseResist_AskLight()
	g_AskClientNumberEx(0,75,"nhËp kh¸ng l«i tõ 0 ®Õn 75",{PersonalDefenseResist_InputLight}); return 1
end
function PersonalDefenseResist_InputLight(nValue)
	local nInput=tonumber(nValue); if (nInput==nil) then nInput=0 end; nInput=floor(nInput)
	local nSaved=PersonalDefenseResist_SetLight(nInput)
	if (nSaved==nil or nSaved<0) then return PersonalDefenseResist_ShowMessage("kh«ng ¸p ®­îc kh¸ng l«i. møc cò ®· ®­îc gi÷ l¹i.",PersonalDefenseResist_LightMenu) end
	return PersonalDefenseResist_ShowMessage(format("kh¸ng l«i\nb¹n nhËp: %d\n®· l­u: +%d\n®ang ¸p: +%d",nInput,nSaved,PersonalDefenseResist_GetAppliedLight()),PersonalDefenseResist_LightMenu)
end

function PersonalDefenseResist_FireMenu()
	local nSaved=PersonalDefenseResist_GetSavedFire(); local nApplied=PersonalDefenseResist_GetAppliedFire()
	local tbOpt={{"nhËp møc kh¸ng háa",PersonalDefenseResist_AskFire},{"t¹m t¾t kh¸ng háa - gi÷ møc",PersonalDefenseResist_OffFireMenu},{"xem tr¹ng th¸i tæng",PersonalDefenseResist_StatusMenu},{"quay l¹i",PersonalDefenseResist_Menu}}
	CreateNewSayEx(format("kh¸ng háa\ntr¹ng th¸i: %s\nmøc ®· l­u: +%d\nlÖnh bµi ®ang ¸p: +%d\ngiíi h¹n lÖnh bµi: +75.",PersonalDefenseResist_StateText(nSaved,nApplied),nSaved,nApplied),tbOpt); return 1
end
function PersonalDefenseResist_AskFire()
	g_AskClientNumberEx(0,75,"nhËp kh¸ng háa tõ 0 ®Õn 75",{PersonalDefenseResist_InputFire}); return 1
end
function PersonalDefenseResist_InputFire(nValue)
	local nInput=tonumber(nValue); if (nInput==nil) then nInput=0 end; nInput=floor(nInput)
	local nSaved=PersonalDefenseResist_SetFire(nInput)
	if (nSaved==nil or nSaved<0) then return PersonalDefenseResist_ShowMessage("kh«ng ¸p ®­îc kh¸ng háa. møc cò ®· ®­îc gi÷ l¹i.",PersonalDefenseResist_FireMenu) end
	return PersonalDefenseResist_ShowMessage(format("kh¸ng háa\nb¹n nhËp: %d\n®· l­u: +%d\n®ang ¸p: +%d",nInput,nSaved,PersonalDefenseResist_GetAppliedFire()),PersonalDefenseResist_FireMenu)
end

function PersonalDefenseResist_PoisonMenu()
	local nSaved=PersonalDefenseResist_GetSavedPoison(); local nApplied=PersonalDefenseResist_GetAppliedPoison()
	local tbOpt={{"nhËp møc kh¸ng ®éc",PersonalDefenseResist_AskPoison},{"t¹m t¾t kh¸ng ®éc - gi÷ møc",PersonalDefenseResist_OffPoisonMenu},{"xem tr¹ng th¸i tæng",PersonalDefenseResist_StatusMenu},{"quay l¹i",PersonalDefenseResist_Menu}}
	CreateNewSayEx(format("kh¸ng ®éc\ntr¹ng th¸i: %s\nmøc ®· l­u: +%d\nlÖnh bµi ®ang ¸p: +%d\ngiíi h¹n lÖnh bµi: +75.",PersonalDefenseResist_StateText(nSaved,nApplied),nSaved,nApplied),tbOpt); return 1
end
function PersonalDefenseResist_AskPoison()
	g_AskClientNumberEx(0,75,"nhËp kh¸ng ®éc tõ 0 ®Õn 75",{PersonalDefenseResist_InputPoison}); return 1
end
function PersonalDefenseResist_InputPoison(nValue)
	local nInput=tonumber(nValue); if (nInput==nil) then nInput=0 end; nInput=floor(nInput)
	local nSaved=PersonalDefenseResist_SetPoison(nInput)
	if (nSaved==nil or nSaved<0) then return PersonalDefenseResist_ShowMessage("kh«ng ¸p ®­îc kh¸ng ®éc. møc cò ®· ®­îc gi÷ l¹i.",PersonalDefenseResist_PoisonMenu) end
	return PersonalDefenseResist_ShowMessage(format("kh¸ng ®éc\nb¹n nhËp: %d\n®· l­u: +%d\n®ang ¸p: +%d",nInput,nSaved,PersonalDefenseResist_GetAppliedPoison()),PersonalDefenseResist_PoisonMenu)
end

function PersonalDefenseResist_AllMenu()
	local nSaved=PersonalDefenseResist_GetSavedAll(); local nApplied=PersonalDefenseResist_GetAppliedAll()
	local tbOpt={{"nhËp møc kh¸ng tÊt c¶",PersonalDefenseResist_AskAll},{"t¹m t¾t kh¸ng tÊt c¶ - gi÷ møc",PersonalDefenseResist_OffAllResMenu},{"xem tr¹ng th¸i tæng",PersonalDefenseResist_StatusMenu},{"quay l¹i",PersonalDefenseResist_Menu}}
	CreateNewSayEx(format("kh¸ng tÊt c¶\ntr¹ng th¸i: %s\nmøc ®· l­u: +%d\nlÖnh bµi ®ang ¸p: +%d\ngiíi h¹n lÖnh bµi: +75.\nkh¸ng tÊt c¶ t¸c ®éng hµn, l«i, háa, ®éc vµ vËt lý.",PersonalDefenseResist_StateText(nSaved,nApplied),nSaved,nApplied),tbOpt); return 1
end
function PersonalDefenseResist_AskAll()
	g_AskClientNumberEx(0,75,"nhËp kh¸ng tÊt c¶ tõ 0 ®Õn 75",{PersonalDefenseResist_InputAll}); return 1
end
function PersonalDefenseResist_InputAll(nValue)
	local nInput=tonumber(nValue); if (nInput==nil) then nInput=0 end; nInput=floor(nInput)
	local nSaved=PersonalDefenseResist_SetAll(nInput)
	if (nSaved==nil or nSaved<0) then return PersonalDefenseResist_ShowMessage("kh«ng ¸p ®­îc kh¸ng tÊt c¶. møc cò ®· ®­îc gi÷ l¹i.",PersonalDefenseResist_AllMenu) end
	return PersonalDefenseResist_ShowMessage(format("kh¸ng tÊt c¶\nb¹n nhËp: %d\n®· l­u: +%d\n®ang ¸p: +%d",nInput,nSaved,PersonalDefenseResist_GetAppliedAll()),PersonalDefenseResist_AllMenu)
end

function PersonalDefenseResist_ReapplyMenu()
	local nRet=PersonalDefenseResist_ReapplySaved()
	if (nRet==nil or nRet<0) then return PersonalDefenseResist_ShowMessage("kh«ng ¸p l¹i ®­îc toµn bé cÊu h×nh. h·y vµo tõng môc ®Ó kiÓm tra.",PersonalDefenseResist_Menu) end
	return PersonalDefenseResist_ShowMessage("®· ¸p l¹i toµn bé møc phßng thñ vµ kh¸ng tÝnh ®· l­u.",PersonalDefenseResist_StatusMenu)
end

function PersonalDefenseResist_OffDefenseMenu()
	PersonalDefenseResist_TurnOffDefense(); return PersonalDefenseResist_ShowMessage("®· t¹m t¾t phßng thñ; møc l­u sÏ tù ¸p khi ®¨ng nhËp l¹i.",PersonalDefenseResist_DefenseMenu)
end
function PersonalDefenseResist_OffColdMenu()
	PersonalDefenseResist_TurnOffCold(); return PersonalDefenseResist_ShowMessage("®· t¹m t¾t kh¸ng hµn; møc l­u sÏ tù ¸p khi ®¨ng nhËp l¹i.",PersonalDefenseResist_ColdMenu)
end
function PersonalDefenseResist_OffLightMenu()
	PersonalDefenseResist_TurnOffLight(); return PersonalDefenseResist_ShowMessage("®· t¹m t¾t kh¸ng l«i; møc l­u sÏ tù ¸p khi ®¨ng nhËp l¹i.",PersonalDefenseResist_LightMenu)
end
function PersonalDefenseResist_OffFireMenu()
	PersonalDefenseResist_TurnOffFire(); return PersonalDefenseResist_ShowMessage("®· t¹m t¾t kh¸ng háa; møc l­u sÏ tù ¸p khi ®¨ng nhËp l¹i.",PersonalDefenseResist_FireMenu)
end
function PersonalDefenseResist_OffPoisonMenu()
	PersonalDefenseResist_TurnOffPoison(); return PersonalDefenseResist_ShowMessage("®· t¹m t¾t kh¸ng ®éc; møc l­u sÏ tù ¸p khi ®¨ng nhËp l¹i.",PersonalDefenseResist_PoisonMenu)
end
function PersonalDefenseResist_OffAllResMenu()
	PersonalDefenseResist_TurnOffAllRes(); return PersonalDefenseResist_ShowMessage("®· t¹m t¾t kh¸ng tÊt c¶. c¸c kh¸ng riªng gi÷ nguyªn; møc l­u sÏ tù ¸p khi ®¨ng nhËp l¹i.",PersonalDefenseResist_AllMenu)
end
function PersonalDefenseResist_OffEverythingMenu()
	PersonalDefenseResist_TurnOffEverything(); return PersonalDefenseResist_ShowMessage("®· t¹m t¾t phßng thñ vµ kh¸ng tÝnh vision. bé nhí vÉn cßn; kh«ng xãa hiÖu lùc kü n¨ng, trang bÞ hay vËt phÈm kh¸c.",PersonalDefenseResist_StatusMenu)
end
