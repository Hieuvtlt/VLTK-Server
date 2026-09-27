-- V5.12.4: hien ro trang thai PHSL/PHNL theo dung dialog native HUYTRAN.
-- Menu dung CreateNewSayEx va callback bang function reference.
-- O nhap so dung g_AskClientNumberEx cua dailogsay.lua original.
-- So "dang ap" chi doc private SkillState 1909/1912 cua Lenh bai, khong suy doan buff ngoai.

function PersonalRecovery_ShowMessage(szText, pBack)
	local tbOpt = {
		{"quay l¹i", pBack},
	}
	CreateNewSayEx(szText, tbOpt)
	return 1
end

function PersonalRecovery_StateText(nSaved, nApplied)
	if (nSaved == nil or nSaved < 0) then nSaved = 0 end
	if (nApplied == nil or nApplied < 0) then nApplied = 0 end
	if (nSaved <= 0 and nApplied <= 0) then return "t¾t" end
	if (nSaved > 0 and nApplied == nSaved) then return "bËt" end
	if (nSaved > 0 and nApplied <= 0) then return "ch­a ¸p" end
	return "cÇn ®ång bé"
end

function PersonalRecovery_Menu()
	local tbOpt = {
		{"xem tr¹ng th¸i hiÖn t¹i", PersonalRecovery_StatusMenu},
		{"phôc håi sinh lùc", PersonalRecovery_LifeMenu},
		{"phôc håi néi lùc", PersonalRecovery_ManaMenu},
		{"dïng l¹i møc ®· l­u", PersonalRecovery_ReapplyMenu},
		{"t¹m t¾t c¶ hai - gi÷ møc ®· l­u", PersonalRecovery_OffAllMenu},
		{"quay l¹i", main},
	}
	CreateNewSayEx("phôc håi sinh lùc vµ néi lùc\nmøc håi ®­îc tÝnh mçi 0,5 gi©y.\n®¨ng nhËp l¹i sÏ tù ¸p møc ®· l­u.", tbOpt)
	return 1
end

function PersonalRecovery_StatusMenu()
	local nLifeSaved = PersonalRecovery_GetSavedLife()
	local nManaSaved = PersonalRecovery_GetSavedMana()
	local nLifeApplied = PersonalRecovery_GetAppliedLife()
	local nManaApplied = PersonalRecovery_GetAppliedMana()
	local szLifeState = PersonalRecovery_StateText(nLifeSaved, nLifeApplied)
	local szManaState = PersonalRecovery_StateText(nManaSaved, nManaApplied)
	local tbOpt = {
		{"phôc håi sinh lùc", PersonalRecovery_LifeMenu},
		{"phôc håi néi lùc", PersonalRecovery_ManaMenu},
		{"dïng l¹i møc ®· l­u", PersonalRecovery_ReapplyMenu},
		{"quay l¹i", PersonalRecovery_Menu},
	}
	CreateNewSayEx(format("tr¹ng th¸i phôc håi sinh lùc vµ néi lùc\nsinh lùc (phsl): %s | ®· l­u +%d | ®ang ¸p +%d /0,5 gi©y\nnéi lùc (phnl): %s | ®· l­u +%d | ®ang ¸p +%d /0,5 gi©y\ngiíi h¹n lÖnh bµi: 10000 ®iÓm mçi 0,5 gi©y.\nsè ®ang ¸p lµ phÇn riªng do lÖnh bµi cÊp; hiÖu lùc kh¸c kh«ng n»m trong thèng kª nµy.", szLifeState, nLifeSaved, nLifeApplied, szManaState, nManaSaved, nManaApplied), tbOpt)
	return 1
end

function PersonalRecovery_LifeMenu()
	local nSaved = PersonalRecovery_GetSavedLife()
	local nApplied = PersonalRecovery_GetAppliedLife()
	local szState = PersonalRecovery_StateText(nSaved, nApplied)
	local tbOpt = {
		{"nhËp møc phôc håi sinh lùc", PersonalRecovery_AskLife},
		{"t¹m t¾t phsl - gi÷ møc ®· l­u", PersonalRecovery_OffLifeMenu},
		{"xem tr¹ng th¸i tæng", PersonalRecovery_StatusMenu},
		{"quay l¹i", PersonalRecovery_Menu},
	}
	CreateNewSayEx(format("phôc håi sinh lùc (phsl)\ntr¹ng th¸i: %s\nmøc ®· l­u: +%d /0,5 gi©y\nlÖnh bµi ®ang ¸p: +%d /0,5 gi©y\nmøc nhËp: tõ 10 ®Õn 10000.", szState, nSaved, nApplied), tbOpt)
	return 1
end

function PersonalRecovery_AskLife()
	g_AskClientNumberEx(10, 10000, "nhËp phôc håi sinh lùc tõ 10 ®Õn 10000 ®iÓm mçi 0,5 gi©y", {PersonalRecovery_InputLife})
	return 1
end

function PersonalRecovery_InputLife(nValue)
	local nInput = tonumber(nValue)
	if (nInput == nil) then nInput = 0 end
	nInput = floor(nInput)
	local nSaved = PersonalRecovery_SetLife(nInput)
	if (nSaved == nil or nSaved < 0) then
		return PersonalRecovery_ShowMessage("kh«ng ¸p ®­îc phôc håi sinh lùc. møc cò ®· ®­îc gi÷ l¹i.", PersonalRecovery_LifeMenu)
	end
	local nApplied = PersonalRecovery_GetAppliedLife()
	local szState = PersonalRecovery_StateText(nSaved, nApplied)
	return PersonalRecovery_ShowMessage(format("phôc håi sinh lùc\nb¹n nhËp: %d\n®· l­u: +%d /0,5 gi©y\nlÖnh bµi ®ang ¸p: +%d /0,5 gi©y\ntr¹ng th¸i: %s", nInput, nSaved, nApplied, szState), PersonalRecovery_LifeMenu)
end

function PersonalRecovery_ManaMenu()
	local nSaved = PersonalRecovery_GetSavedMana()
	local nApplied = PersonalRecovery_GetAppliedMana()
	local szState = PersonalRecovery_StateText(nSaved, nApplied)
	local tbOpt = {
		{"nhËp møc phôc håi néi lùc", PersonalRecovery_AskMana},
		{"t¹m t¾t phnl - gi÷ møc ®· l­u", PersonalRecovery_OffManaMenu},
		{"xem tr¹ng th¸i tæng", PersonalRecovery_StatusMenu},
		{"quay l¹i", PersonalRecovery_Menu},
	}
	CreateNewSayEx(format("phôc håi néi lùc (phnl)\ntr¹ng th¸i: %s\nmøc ®· l­u: +%d /0,5 gi©y\nlÖnh bµi ®ang ¸p: +%d /0,5 gi©y\nmøc nhËp: tõ 10 ®Õn 10000.", szState, nSaved, nApplied), tbOpt)
	return 1
end

function PersonalRecovery_AskMana()
	g_AskClientNumberEx(10, 10000, "nhËp phôc håi néi lùc tõ 10 ®Õn 10000 ®iÓm mçi 0,5 gi©y", {PersonalRecovery_InputMana})
	return 1
end

function PersonalRecovery_InputMana(nValue)
	local nInput = tonumber(nValue)
	if (nInput == nil) then nInput = 0 end
	nInput = floor(nInput)
	local nSaved = PersonalRecovery_SetMana(nInput)
	if (nSaved == nil or nSaved < 0) then
		return PersonalRecovery_ShowMessage("kh«ng ¸p ®­îc phôc håi néi lùc. møc cò ®· ®­îc gi÷ l¹i.", PersonalRecovery_ManaMenu)
	end
	local nApplied = PersonalRecovery_GetAppliedMana()
	local szState = PersonalRecovery_StateText(nSaved, nApplied)
	return PersonalRecovery_ShowMessage(format("phôc håi néi lùc\nb¹n nhËp: %d\n®· l­u: +%d /0,5 gi©y\nlÖnh bµi ®ang ¸p: +%d /0,5 gi©y\ntr¹ng th¸i: %s", nInput, nSaved, nApplied, szState), PersonalRecovery_ManaMenu)
end

function PersonalRecovery_ReapplyMenu()
	local nRet = PersonalRecovery_ReapplySaved()
	local nLifeSaved = PersonalRecovery_GetSavedLife()
	local nManaSaved = PersonalRecovery_GetSavedMana()
	local nLifeApplied = PersonalRecovery_GetAppliedLife()
	local nManaApplied = PersonalRecovery_GetAppliedMana()
	if (nRet == nil or nRet < 0) then
		return PersonalRecovery_ShowMessage("kh«ng ¸p l¹i ®­îc cÊu h×nh ®· l­u. h·y nhËp l¹i tõng phÇn ®Ó kiÓm tra.", PersonalRecovery_Menu)
	end
	return PersonalRecovery_ShowMessage(format("®· ¸p l¹i cÊu h×nh\nsinh lùc: ®· l­u +%d | ®ang ¸p +%d /0,5 gi©y\nnéi lùc: ®· l­u +%d | ®ang ¸p +%d /0,5 gi©y", nLifeSaved, nLifeApplied, nManaSaved, nManaApplied), PersonalRecovery_StatusMenu)
end

function PersonalRecovery_OffLifeMenu()
	PersonalRecovery_TurnOffLife()
	local nApplied = PersonalRecovery_GetAppliedLife()
	return PersonalRecovery_ShowMessage(format("®· t¹m t¾t phôc håi sinh lùc. møc l­u vÉn cßn vµ sÏ tù ¸p khi ®¨ng nhËp l¹i.\n®ang ¸p: +%d /0,5 gi©y.", nApplied), PersonalRecovery_LifeMenu)
end

function PersonalRecovery_OffManaMenu()
	PersonalRecovery_TurnOffMana()
	local nApplied = PersonalRecovery_GetAppliedMana()
	return PersonalRecovery_ShowMessage(format("®· t¹m t¾t phôc håi néi lùc. møc l­u vÉn cßn vµ sÏ tù ¸p khi ®¨ng nhËp l¹i.\n®ang ¸p: +%d /0,5 gi©y.", nApplied), PersonalRecovery_ManaMenu)
end

function PersonalRecovery_OffAllMenu()
	PersonalRecovery_TurnOffAll()
	local nLifeApplied = PersonalRecovery_GetAppliedLife()
	local nManaApplied = PersonalRecovery_GetAppliedMana()
	return PersonalRecovery_ShowMessage(format("®· t¹m t¾t c¶ sinh lùc vµ néi lùc; møc l­u vÉn cßn.\nsinh lùc ®ang ¸p: +%d /0,5 gi©y\nnéi lùc ®ang ¸p: +%d /0,5 gi©y", nLifeApplied, nManaApplied), PersonalRecovery_StatusMenu)
end
