PERSONAL_HAND_POWER_CTRL = "\\script\\item\\vsd\\personal_hand_power_control.lua"
function PersonalHandPower_FormatValue(nValue)
    if (nValue==nil) then return "Lçi tr¹ng th¸i" end
    nValue=floor(nValue); if (nValue>0) then return format("+%d%%",nValue) end
    if (nValue<0) then return format("-%d%%",-nValue) end
    return "T¾t"
end
function PersonalHandPower_Menu()
    local nSaved=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_HAND_POWER_CTRL,"PersonalHandPower_GetSaved")
    local nApplied=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_HAND_POWER_CTRL,"PersonalHandPower_GetApplied")
    Say(format("Lùc tay (add_damage_p)\n§· l­u: %s | ®ang ¸p: %s\nT¨ng 10-1000%% b­íc 10. Gi¶m 10-99%% b­íc 1.\nTù kh«i phôc khi ®¨ng nhËp l¹i.",PersonalHandPower_FormatValue(nSaved),PersonalHandPower_FormatValue(nApplied)),6,
        "T¨ng Lùc tay/#PersonalHandPower_AskIncrease()",
        "Gi¶m Lùc tay/#PersonalHandPower_AskDecrease()",
        "ƒp l¹i møc ®· l­u/#PersonalHandPower_Reapply()",
        "T¹m t¾t - gi÷ møc ®· l­u/#PersonalHandPower_Off()",
        "Xãa møc ®· l­u/#PersonalHandPower_Reset()",
        "Quay l¹i/#main()")
    return 1
end
function PersonalHandPower_AskIncrease() AskClientForNumber("PersonalHandPower_InputIncrease",10,1000,"NhËp % T¡NG Lùc tay 10-1000; b­íc 10."); return 1 end
function PersonalHandPower_InputIncrease(nValue)
    local nApplied=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_HAND_POWER_CTRL,"PersonalHandPower_SetIncrease",nValue)
    if (nApplied==nil) then Say("Kh«ng ¸p ®­îc møc t¨ng; møc cò ®­îc gi÷.",1,"Quay l¹i/#PersonalHandPower_Menu()"); return 0 end
    return PersonalHandPower_Menu()
end
function PersonalHandPower_AskDecrease() AskClientForNumber("PersonalHandPower_InputDecrease",10,99,"NhËp % GIM Lùc tay 10-99; b­íc 1."); return 1 end
function PersonalHandPower_InputDecrease(nValue)
    local nApplied=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_HAND_POWER_CTRL,"PersonalHandPower_SetDecrease",nValue)
    if (nApplied==nil) then Say("Kh«ng ¸p ®­îc møc gi¶m; møc cò ®­îc gi÷.",1,"Quay l¹i/#PersonalHandPower_Menu()"); return 0 end
    return PersonalHandPower_Menu()
end
function PersonalHandPower_Reapply()
    local nRet=DynamicExecuteByPlayer(PlayerIndex,PERSONAL_HAND_POWER_CTRL,"PersonalHandPower_ReapplySaved")
    if (nRet==nil) then Say("Kh«ng ¸p l¹i ®­îc Lùc tay ®· l­u.",1,"Quay l¹i/#PersonalHandPower_Menu()"); return 0 end
    return PersonalHandPower_Menu()
end
function PersonalHandPower_Off()
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_HAND_POWER_CTRL,"PersonalHandPower_Pause")
    Say("§· T„M TÀT Lùc tay. Møc l­u vÉn cßn; ®¨ng nhËp l¹i sÏ tù ¸p.",1,"Quay l¹i/#PersonalHandPower_Menu()"); return 1
end
function PersonalHandPower_Reset()
    DynamicExecuteByPlayer(PlayerIndex,PERSONAL_HAND_POWER_CTRL,"PersonalHandPower_ResetSaved")
    Say("§· xãa møc Lùc tay Vision ®· l­u.",1,"Quay l¹i/#PersonalHandPower_Menu()"); return 1
end
