-- Chó ý: vßng s¸ng vµ h×nh d¹ng npc tù biÕn mÊt sau 1 phót
IL("TITLE")

function main()
	dofile("script/item/biggift.lua")
	switch_check_feature()
	return 1
end

function switch_check_feature()
	local szTitle = "Xin chµo! §¹i hiÖp muèn kiÓm ngo¹i trang g×? Muèn trë l¹i nh­ cò chØ cÇn tho¸t ra vµo game l¹i."
	local tbOpt =
	{
		"Ngùa/#choose_check_feature(4)",
		"Vò KhÝ/#choose_check_feature(3)",
		"Ao gi¸p/#choose_check_feature(2)",
		"Mò/#choose_check_feature(1)",
		"Thay ®æi ngo¹i h×nh mò, ¸o, vò khÝ, ngùa/change_set_feature_inbody",
		"Phôc håi ngo¹i h×nh gèc cho mò, ¸o, vò khÝ, ngùa/restore_feature_item_inbody",
		"Vßng S¸ng (tù xãa sau 1 phót)/#choose_check_feature(5)",
		"Ngo¹i h×nh NPC (tù xãa sau 1 phót)/#choose_check_feature(6)",
		"NhËn bao l× x×/nhanlixi",
		"Tho¸t/no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end


function nhanlixi()
	AddItem(6,1,13,1,0,0,0)
	AddItem(6,1,14,1,0,0,0)
	--AddItem(6,1,16,1,0,0,0)
	Msg2Player("§· nhËn 2 bao l× x×.")
end

function choose_check_feature(num)
	SetTaskTemp(168, num)
	if num == 5 then
		AskClientForNumber("addvongsang_quick", 1, 3300, "NhËp ID vßng s¸ng")
	elseif num == 6 then
		AskClientForNumber("addmask_npc", 1, 1999, "NhËp ID NPC")
	end
end

function addmask_npc(npcindex)
	ChangeOwnFeature(1, 60*18, npcindex,  0, 0, 0, 0) -- 1 lµ cã thêi h¹n, sÏ ®äc sè tiÕp theo gi©y * 18
	SetTaskTemp(169, npcindex)
end

function addvongsang_quick(nindex)
	Title_AddTitle(nindex, 1, 3600000*18) -- 1 phut
	Title_ActiveTitle(nindex)
	SetTask(1122, nindex)
end

function change_set_feature_inbody()
	local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
	local tbRes = {nHelm,nArmor, nWeapon, nHorse}
	local tbEquip = GetAllEquipment() -- lÊy tÊt c¶ ®å ®ang mÆc
	-- 1: helm, 2: armor, 4: weapon, 11: horse
	local itemcheck = {1, 2, 4, 11}
	for i = 1, 4 do
		local id_item_check = itemcheck[i]
		if tbEquip[id_item_check]>0 then
			local nItemIndex = tbEquip[id_item_check]
			SetItemNewFeature(nItemIndex, tbRes[i])
			local strItem = GetItemName(nItemIndex)
			Msg2Player(format("Thay ®æi ngo¹i h×nh <color=yellow>%s sang ID %d<color>",strItem, tbRes[i]))
		end
	end
	Talk(1, "KickOutSelf", "§· thay ®æi ngo¹i h×nh nh©n vËt.")
end

function restore_feature_item_inbody()
	local tbEquip = GetAllEquipment() -- lÊy tÊt c¶ ®å ®ang mÆc
	-- 1: helm, 2: armor, 4: weapon, 11: horse
	local itemcheck = {1, 2, 4, 11}
	for i = 1, 4 do
		local id_item_check = itemcheck[i]
		if tbEquip[id_item_check]>0 then
			local nItemIndex = tbEquip[id_item_check]
			SetItemNewFeature(nItemIndex, -1)
			local strItem = GetItemName(nItemIndex)
			Msg2Player(format("Phôc håi ngo¹i h×nh <color=yellow>%s<color>",strItem))
		end
	end
	Talk(1, "KickOutSelf", "§· phôc håi ngo¹i h×nh nh©n vËt.")
end