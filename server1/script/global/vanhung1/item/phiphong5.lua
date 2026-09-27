--- phi phong 5

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

function myplayersex()
	if GetSex() == 1 then 
		return "N÷ hiÖp";
	else
		return "§¹i hiÖp";
	end
	--      "..myplayersex().."
end

function main()
	dofile("script/global/pgaming/phiphong5.lua");
		doi_ff_cap5()
		return -1
end

function doi_ff_cap5()
	local opt = 
	{
		"<dec><npc>Mêi "..myplayersex().." chän phi phong? ",
		"Phi Phong - Träng KÝch/ff_trong_kich",
		"Phi Phong - DÞch ChuyÓn Tøc Thêi/ff_dich_chuyen",
		"Phi Phong - Hãa Gi¶i S¸t Th­¬ng/ff_sat_thuong",
	}
	tinsert(opt,"§Ó ta suy nghÜ thªm/cancel")
	CreateTaskSay(opt);
end
function ff_dich_chuyen()	
	--AddGoldItem(0,3485)
	tbAwardTemplet:GiveAwardByList(tb_ff_dich_chuyen, "Mo tui phi phong");
	ConsumeEquiproomItem(1,6,1,30360,-1)--xoa Item ff
	--ConsumeEquiproomItem(6,1,30360,0,0,0) ---  xoa tui ff	
	Talk(1, "", "Chóc mõng "..myplayersex().." ®· nhËn ®­îc <color=green>Phi Phong 5 - DÞch ChuyÓn Tøc Thêi"); 		
end
function ff_sat_thuong()	
	tbAwardTemplet:GiveAwardByList(tb_ff_sat_thuong, "Mo tui phi phong");
	ConsumeEquiproomItem(1,6,1,30360,-1)--xoa Item ff
	Talk(1, "", "Chóc mõng "..myplayersex().." ®· nhËn ®­îc <color=green>Phi Phong 5 - Hãa Gi¶i S¸t Th­¬ng"); 		
end

function ff_trong_kich()	
	tbAwardTemplet:GiveAwardByList(tb_ff_trong_kich, "Mo tui phi phong");
	ConsumeEquiproomItem(1,6,1,30360,-1)--xoa Item ff
	Talk(1, "", "Chóc mõng "..myplayersex().." ®· nhËn ®­îc <color=green>Phi Phong 5 - Träng KÝch"); 		
end

-------------lay phi phong-----
tb_ff_dich_chuyen  =
{
		[1]	={szName = "Phi Phong 5", tbProp = {0,3470}, nQuality = 1, nCount = 1, nExpiredTime = 43200},
}
tb_ff_sat_thuong  =
{
		[1]	={szName = "Phi Phong 5", tbProp = {0,3471}, nQuality = 1, nCount = 1, nExpiredTime = 43200},
}
tb_ff_trong_kich  =
{
		[1]	={szName = "Phi Phong 5", tbProp = {0,3472}, nQuality = 1, nCount = 1, nExpiredTime = 43200},
}
