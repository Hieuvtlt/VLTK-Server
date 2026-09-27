Include("\\script\\maps\\checkmap.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\item\\vsd\\personal_recovery_control.lua");
Include("\\script\\item\\vsd\\personal_recovery_menu.lua");
Include("\\script\\item\\vsd\\personal_defense_resist_control.lua");
Include("\\script\\item\\vsd\\personal_defense_resist_menu.lua");
Include("\\script\\item\\vsd\\personal_hand_power_control.lua");
Include("\\script\\item\\vsd\\personal_hand_power_menu.lua");
Include("\\script\\item\\vsd\\adaptive_train_density_ai.lua");
Include("\\script\\item\\vsd\\adaptive_train_density_control.lua");
Include("\\script\\item\\vsd\\adaptive_train_density_mode2_control.lua");
Include("\\script\\item\\vsd\\adaptive_train_density_mode3_control.lua");
Include("\\script\\item\\vsd\\adaptive_train_density_menu.lua");
PERSONAL_EXP_CTRL = "\\script\\item\\vsd\\personalexp_lenhbai_control.lua"
PERSONAL_ATTACK_SPEED_CTRL = "\\script\\item\\vsd\\personal_attack_speed_control.lua"
PERSONAL_MOVE_SPEED_CTRL = "\\script\\item\\vsd\\personal_move_speed_control.lua"
VISION_HAND_CTRL = "\\script\\item\\vsd\\personal_hand_power_control.lua"
VISION_RECOVERY_CTRL = "\\script\\item\\vsd\\personal_recovery_control.lua"
VISION_DEFRES_CTRL = "\\script\\item\\vsd\\personal_defense_resist_control.lua"

function main(nItemIndex)
	local tbOpt = {
		{"sö dông lÖnh bµi vi s¬n ®¶o", VSD_UseOriginal},
		{"qu¶n lý exp c¸ nh©n", PersonalExp_Menu},
		{"qu¶n lý tèc ®é ®¸nh", PersonalAttackSpeed_Menu},
		{"qu¶n lý tèc ®é di chuyÓn", PersonalMoveSpeed_Menu},
		{"Qu¶n lý Lùc tay (%)", PersonalHandPower_Menu},
		{"bï qu¸i toµn b¶n ®å", AdaptiveTrain_Menu},
		{"phôc håi sinh lùc vµ néi lùc", PersonalRecovery_Menu},
		{"phßng thñ vµ kh¸ng tÝnh", PersonalDefenseResist_Menu},
		{"bé nhí vision c¸ nh©n", VisionPersist_Menu},
		{"®ãng"},
	}
	CreateNewSayEx("lÖnh bµi vi s¬n ®¶o", tbOpt)
	return 1;
end;

function PersonalExp_Menu()
	local nSaved = DynamicExecuteByPlayer(PlayerIndex, PERSONAL_EXP_CTRL, "PersonalExp_GetSavedRate");
	local nReal = DynamicExecuteByPlayer(PlayerIndex, PERSONAL_EXP_CTRL, "PersonalExp_GetEffectiveRate");
	if (nSaved == nil or nSaved < 1) then nSaved = 1; end;
	if (nReal == nil or nReal < 1) then nReal = 1; end;
	Say(format("exp c¸ nh©n - l­u x%d | ®ang ¸p x%d\ntù kh«i phôc khi ®¨ng nhËp l¹i.", nSaved, nReal), 6,
		"nhËp sè lÇn exp c¸ nh©n/#PersonalExp_Ask()",
		"¸p l¹i møc ®· l­u/#PersonalExp_Reapply()",
		"t¹m t¾t - gi÷ møc ®· l­u/#PersonalExp_Off()",
		"xãa møc ®· l­u - vÒ x1/#PersonalExp_Reset()",
		"kiÓm tra tr¹ng th¸i/#PersonalExp_Status()",
		"quay l¹i/#main()");
	return 1;
end;

function PersonalExp_Ask()
	AskClientForNumber("PersonalExp_Input", 1, 1000, "nhËp sè lÇn exp c¸ nh©n tõ 1 ®Õn 1000");
	return 1;
end;

function PersonalExp_Input(nRate)
	local nApplied = DynamicExecuteByPlayer(PlayerIndex, PERSONAL_EXP_CTRL, "PersonalExp_SetRate", nRate);
	local nReal = DynamicExecuteByPlayer(PlayerIndex, PERSONAL_EXP_CTRL, "PersonalExp_GetEffectiveRate");
	if (nReal == nil or nReal < 1) then nReal = 1; end;
	if (nApplied == nil or nApplied < 1) then Say("kh«ng ¸p ®­îc exp; møc cò ®­îc gi÷ l¹i.",1,"quay l¹i/#PersonalExp_Menu()"); return 0; end;
	Say(format("®· l­u vµ ¸p exp x%d. thùc tÕ x%d.",nApplied,nReal),1,"quay l¹i/#PersonalExp_Menu()"); return 1;
end;

function PersonalExp_Reapply()
	local nRet=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_EXP_CTRL,"PersonalExp_ReapplySaved");
	if (nRet==nil or nRet<1) then Say("kh«ng ¸p l¹i ®­îc exp ®· l­u.",1,"quay l¹i/#PersonalExp_Menu()"); return 0; end;
	return PersonalExp_Status();
end;

function PersonalExp_Off()
	DynamicExecuteByPlayer(PlayerIndex, PERSONAL_EXP_CTRL, "PersonalExp_Pause");
	Say("®· t¹m t¾t exp. møc l­u vÉn cßn vµ sÏ tù ¸p khi ®¨ng nhËp l¹i.",1,"quay l¹i/#PersonalExp_Menu()"); return 1;
end;

function PersonalExp_Reset()
	DynamicExecuteByPlayer(PlayerIndex, PERSONAL_EXP_CTRL, "PersonalExp_ResetSaved");
	Say("®· xãa møc exp ®· l­u vµ ®­a vÒ x1.",1,"quay l¹i/#PersonalExp_Menu()"); return 1;
end;

function PersonalExp_Status()
	local nSaved=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_EXP_CTRL,"PersonalExp_GetSavedRate");
	local nReal=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_EXP_CTRL,"PersonalExp_GetEffectiveRate");
	if (nSaved==nil or nSaved<1) then nSaved=1 end; if (nReal==nil or nReal<1) then nReal=1 end;
	Say(format("exp c¸ nh©n: l­u x%d | ®ang ¸p x%d",nSaved,nReal),1,"quay l¹i/#PersonalExp_Menu()"); return 1;
end;

function PersonalAttackSpeed_Menu()
	local nExtSaved=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_GetSavedExternal");
	local nExtApplied=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_GetAppliedExternal");
	local nIntSaved=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_GetSavedInternal");
	local nIntApplied=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_GetAppliedInternal");
	if (nExtSaved==nil or nExtSaved<0) then nExtSaved=0 end; if (nExtApplied==nil or nExtApplied<0) then nExtApplied=0 end;
	if (nIntSaved==nil or nIntSaved<0) then nIntSaved=0 end; if (nIntApplied==nil or nIntApplied<0) then nIntApplied=0 end;
	Say(format("tèc ®é ®¸nh\nngo¹i: l­u +%d | ¸p +%d\nnéi: l­u +%d | ¸p +%d\ntù kh«i phôc khi ®¨ng nhËp l¹i.",nExtSaved,nExtApplied,nIntSaved,nIntApplied),6,
		"nhËp ngo¹i c«ng/#PersonalAttackSpeed_AskExternal()",
		"nhËp néi c«ng/#PersonalAttackSpeed_AskInternal()",
		"¸p l¹i c¶ hai møc ®· l­u/#PersonalAttackSpeed_Reapply()",
		"t¹m t¾t c¶ hai - gi÷ bé nhí/#PersonalAttackSpeed_OffAll()",
		"xãa c¶ hai møc ®· l­u/#PersonalAttackSpeed_ResetAll()",
		"quay l¹i/#main()"); return 1;
end;

function PersonalAttackSpeed_AskExternal()
	AskClientForNumber("PersonalAttackSpeed_InputExternal",0,200,"nhËp tèc ®é ®¸nh ngo¹i c«ng 0-200; b­íc 10."); return 1;
end;
function PersonalAttackSpeed_InputExternal(nValue)
	local nApplied=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_SetExternal",nValue);
	if (nApplied==nil or nApplied<0) then Say("kh«ng ¸p ®­îc ngo¹i c«ng; møc cò ®­îc gi÷.",1,"quay l¹i/#PersonalAttackSpeed_Menu()"); return 0; end;
	Say(format("®· l­u vµ ¸p ngo¹i c«ng +%d.",nApplied),1,"quay l¹i/#PersonalAttackSpeed_Menu()"); return 1;
end;
function PersonalAttackSpeed_AskInternal()
	AskClientForNumber("PersonalAttackSpeed_InputInternal",0,200,"nhËp tèc ®é ®¸nh néi c«ng 0-200; b­íc 10."); return 1;
end;
function PersonalAttackSpeed_InputInternal(nValue)
	local nApplied=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_SetInternal",nValue);
	if (nApplied==nil or nApplied<0) then Say("kh«ng ¸p ®­îc néi c«ng; møc cò ®­îc gi÷.",1,"quay l¹i/#PersonalAttackSpeed_Menu()"); return 0; end;
	Say(format("®· l­u vµ ¸p néi c«ng +%d.",nApplied),1,"quay l¹i/#PersonalAttackSpeed_Menu()"); return 1;
end;
function PersonalAttackSpeed_Reapply()
	local nRet=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_ReapplySaved");
	if (nRet==nil or nRet<0) then Say("kh«ng ¸p l¹i ®­îc tèc ®é ®¸nh ®· l­u.",1,"quay l¹i/#PersonalAttackSpeed_Menu()"); return 0; end;
	return PersonalAttackSpeed_Menu();
end;
function PersonalAttackSpeed_OffExternal() DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_PauseExternal"); return PersonalAttackSpeed_Menu(); end;
function PersonalAttackSpeed_OffInternal() DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_PauseInternal"); return PersonalAttackSpeed_Menu(); end;
function PersonalAttackSpeed_OffAll()
	DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_PauseAll");
	Say("®· t¹m t¾t tèc ®é ®¸nh. hai møc l­u vÉn cßn; ®¨ng nhËp l¹i sÏ tù ¸p.",1,"quay l¹i/#PersonalAttackSpeed_Menu()"); return 1;
end;
function PersonalAttackSpeed_ResetAll()
	DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_ResetAll");
	Say("®· xãa hai møc tèc ®é ®¸nh vision ®· l­u.",1,"quay l¹i/#PersonalAttackSpeed_Menu()"); return 1;
end;

function PersonalMoveSpeed_Menu()
	local nSaved=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_GetSaved");
	local nApplied=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_GetApplied");
	if (nSaved==nil or nSaved<0) then nSaved=0 end; if (nApplied==nil or nApplied<0) then nApplied=0 end;
	Say(format("tèc ®é di chuyÓn - l­u +%d%% | ®ang ¸p +%d%%\ntù kh«i phôc khi ®¨ng nhËp l¹i. tèi ®a 200%%, b­íc 10%%.",nSaved,nApplied),5,
		"nhËp tèc ®é di chuyÓn/#PersonalMoveSpeed_Ask()",
		"¸p l¹i møc ®· l­u/#PersonalMoveSpeed_Reapply()",
		"t¹m t¾t - gi÷ møc ®· l­u/#PersonalMoveSpeed_Off()",
		"xãa møc ®· l­u/#PersonalMoveSpeed_Reset()",
		"quay l¹i/#main()"); return 1;
end;
function PersonalMoveSpeed_Ask()
	AskClientForNumber("PersonalMoveSpeed_Input",0,200,"nhËp tèc ®é di chuyÓn 0-200 (%); b­íc 10."); return 1;
end;
function PersonalMoveSpeed_Input(nValue)
	local nApplied=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_Set",nValue);
	if (nApplied==nil or nApplied<0) then Say("kh«ng ¸p ®­îc tèc ®é di chuyÓn; møc cò ®­îc gi÷.",1,"quay l¹i/#PersonalMoveSpeed_Menu()"); return 0; end;
	Say(format("®· l­u vµ ¸p tèc ®é di chuyÓn +%d%%.",nApplied),1,"quay l¹i/#PersonalMoveSpeed_Menu()"); return 1;
end;
function PersonalMoveSpeed_Reapply()
	local nRet=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_ReapplySaved");
	if (nRet==nil or nRet<0) then Say("kh«ng ¸p l¹i ®­îc tèc ®é di chuyÓn ®· l­u.",1,"quay l¹i/#PersonalMoveSpeed_Menu()"); return 0; end;
	return PersonalMoveSpeed_Menu();
end;
function PersonalMoveSpeed_Off()
	DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_Pause");
	Say("®· t¹m t¾t tèc ®é di chuyÓn. møc l­u vÉn cßn; ®¨ng nhËp l¹i sÏ tù ¸p.",1,"quay l¹i/#PersonalMoveSpeed_Menu()"); return 1;
end;
function PersonalMoveSpeed_Reset()
	DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_ResetSaved");
	Say("®· xãa møc tèc ®é di chuyÓn vision ®· l­u.",1,"quay l¹i/#PersonalMoveSpeed_Menu()"); return 1;
end;

function VisionPersist_Menu()
    local tbOpt={
        {"¸p l¹i tÊt c¶ møc c¸ nh©n ®· l­u",VisionPersist_ReapplyAll},
        {"t¹m t¾t tÊt c¶, gi÷ bé nhí",VisionPersist_PauseAll},
        {"xãa tÊt c¶ bé nhí c¸ nh©n",VisionPersist_ResetAll},
        {"xem tr¹ng th¸i",VisionPersist_Status},
        {"quay l¹i",main},
    }
    CreateNewSayEx("bé nhí vision c¸ nh©n\nl­u cÊu h×nh c¸ nh©n l©u dµi.\nkhi ®¨ng nhËp l¹i, hÖ thèng tù ¸p møc ®· l­u.",tbOpt); return 1;
end;
function VisionPersist_ReapplyAll()
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_EXP_CTRL,"PersonalExp_ReapplySaved");
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_ReapplySaved");
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_ReapplySaved");
    DynamicExecuteByPlayer(PlayerIndex,VISION_HAND_CTRL,"PersonalHandPower_ReapplySaved");
    DynamicExecuteByPlayer(PlayerIndex,VISION_RECOVERY_CTRL,"PersonalRecovery_ReapplySaved");
    DynamicExecuteByPlayer(PlayerIndex,VISION_DEFRES_CTRL,"PersonalDefenseResist_ReapplySaved");
    return VisionPersist_Status();
end;
function VisionPersist_PauseAll()
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_EXP_CTRL,"PersonalExp_Pause");
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_PauseAll");
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_Pause");
    DynamicExecuteByPlayer(PlayerIndex,VISION_HAND_CTRL,"PersonalHandPower_Pause");
    DynamicExecuteByPlayer(PlayerIndex,VISION_RECOVERY_CTRL,"PersonalRecovery_PauseAll");
    DynamicExecuteByPlayer(PlayerIndex,VISION_DEFRES_CTRL,"PersonalDefenseResist_PauseEverything");
    Say("®· t¹m t¾t hiÖu lùc vision c¸ nh©n. bé nhí vÉn cßn vµ sÏ tù ¸p khi ®¨ng nhËp l¹i.",1,"quay l¹i/#VisionPersist_Menu()"); return 1;
end;
function VisionPersist_ResetAll()
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_EXP_CTRL,"PersonalExp_ResetSaved");
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_ATTACK_SPEED_CTRL,"PersonalAttackSpeed_ResetAll");
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_ResetSaved");
    DynamicExecuteByPlayer(PlayerIndex,VISION_HAND_CTRL,"PersonalHandPower_ResetSaved");
    DynamicExecuteByPlayer(PlayerIndex,VISION_RECOVERY_CTRL,"PersonalRecovery_ResetAll");
    DynamicExecuteByPlayer(PlayerIndex,VISION_DEFRES_CTRL,"PersonalDefenseResist_ResetEverything");
    Say("®· xãa toµn bé bé nhí vision c¸ nh©n vµ t¾t c¸c tr¹ng th¸i riªng.",1,"quay l¹i/#VisionPersist_Menu()"); return 1;
end;
function VisionPersist_Status()
    local eS=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_EXP_CTRL,"PersonalExp_GetSavedRate"); local eA=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_EXP_CTRL,"PersonalExp_GetEffectiveRate");
    local mS=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_GetSaved"); local mA=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_MOVE_SPEED_CTRL,"PersonalMoveSpeed_GetApplied");
    local hS=DynamicExecuteByPlayer(PlayerIndex,VISION_HAND_CTRL,"PersonalHandPower_GetSaved"); local hA=DynamicExecuteByPlayer(PlayerIndex,VISION_HAND_CTRL,"PersonalHandPower_GetApplied");
    if (eS==nil) then eS=1 end; if (eA==nil) then eA=1 end; if (mS==nil) then mS=0 end; if (mA==nil) then mA=0 end; if (hS==nil) then hS=0 end; if (hA==nil) then hA=0 end;
    Say(format("vision c¸ nh©n\nexp: l­u x%d | ®ang ¸p x%d\ndi chuyÓn: l­u +%d | ®ang ¸p +%d\nlùc tay: l­u %d%% | ®ang ¸p %d%%\ntèc ®é ®¸nh, sinh lùc, néi lùc, phßng thñ vµ kh¸ng tÝnh: xem trong tõng môc.",eS,eA,mS,mA,hS,hA),1,"quay l¹i/#VisionPersist_Menu()"); return 1;
end;

function VSD_UseOriginal(nItemIndex)
	local pMapID, pMx, pMy = GetWorldPos();
	if GetFightState()>=1 or (IsCityMap(pMapID)~=1 and IsFreshmanMap(pMapID)~=1 and pMapID ~= 175)  then
		Msg2Player("lÖnh bµi vi s¬n ®¶o chØ dïng t¹i khu vùc phi chiÕn ®Êu cña thµnh thÞ, t©n thñ th«n vµ t©y s¬n th«n");
		return 1;
	end;
	--DinhHQ
	--20110407: kh«ng cho sö dông lÖnh bµi VSD trong v­ît ¶i 30
	if pMapID == 957 then
		Msg2Player("cuén truyÒn tèng m¹c b¾c chØ dïng t¹i khu vùc phi chiÕn ®Êu cña thµnh thÞ, t©n thñ th«n vµ t©y s¬n th«n");
		return 1;
	end
	NewWorld(342, 1417, 2801)
	SetFightState(0);
	return 0
end


