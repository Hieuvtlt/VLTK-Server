Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
IncludeLib("TONG")
IncludeLib("RELAYLADDER");
Include( "\\script\\item\\compound\\compound_header.lua" );
Include( "\\script\\item\\compound\\atlas.lua" );
Include("\\script\\global\\rename_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\global\\vanhung1\\hotrotanthu\\itemblue.lua")
Include("\\script\\global\\vanhung1\\\hotrotanthu\\duatop.lua")
Include("\\script\\tagnewplayer\\tbitemHK.lua");
Include("\\script\\global\\vanhung1\\hotrotanthu\\hotroitem.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\vanhung1\\hotrotanthu\\hotronew.lua")
Include("\\script\\global\\vanhung1\\hotrotanthu\\nc_topall.lua")
Include("\\script\\task\\partner\\education\\swordking_people.lua")
Include("\\script\\global\\vanhung1\\hotrotanthu\\doiraclayvk.lua")
Include("\\script\\global\\vanhung1\\hotrotanthu\\tinhsuong.lua")
Include("\\script\\global\\vanhung1\\hotrotanthu\\diemdanhhangngay.lua")
szNpcName = "<color=yellow>Hç trî T©n thñ<color>: "
szPlayer = "§¹i HiÖp"
if GetSex() == 1 then
	szPlayer = "N÷ HiÖp"
end



local tbGMAccount = {"vanhung", "vanhung1"}
function main()
dofile("script/global/vanhung1/npc/nangcapBK.lua");		
			str = "Chµo mõng c¸c b¹n ®· tham gia thÕ giíi <color=red>Vâ L©m TruyÒn Kú<color> ®­îc Edit <color=green>By  V¨n H­ng !!!"
		AddGlobalCountNews(str, 1)
local szAccount = GetAccount()
	for i=1, getn(%tbGMAccount) do
		if szAccount == %tbGMAccount[i] then
			local szTitle = "<npc><color=red>Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! "
		local tbOpt =
	{
		{"N©ng cÊp ®å B¹ch Kim", bachkim_main},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)		
	else
			--str = "Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
		AddGlobalCountNews(str, 2)
local szTitle = "<npc>NhËn set ®å Hoµng Kim gia t¨ng søc m¹nh, b¸ chñ thiªn h¹  "
		local tbOpt =
	{
		{"N©ng cÊp ®å B¹ch Kim", bachkim_main},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)	

end
				return	

end			
end

function bachkim_main()
	local szTitle = " Xin chµo <color=red>"..GetName().."<color> ! §¹i hiÖp muèn sö dông chøc n¨ng g×?"
	local tbOpt={}
	tinsert(tbOpt, "N©ng cÊp ®å Hoµng kim lªn B¹ch kim cÊp 0/make_bachkim")
	tinsert(tbOpt, "N©ng cÊp ®å Hoµng kim lªn B¹ch kim cÊp 10/make_bachkim_max")
	tinsert(tbOpt, "N©ng cÊp trang bÞ B¹ch Kim tõng cÊp/up_bachkim")
	tinsert(tbOpt, "Quay l¹i/main")
	tinsert(tbOpt, "Th«i./no")
	Say(szTitle, getn(tbOpt), tbOpt)
end

function make_bachkim()
	GiveItemUI("T¹o trang bÞ B¹ch Kim","N©ng cÊp trang bÞ Hoµng kim thµnh B¹ch kim", "do_upgoldeq_process",1);
end
function do_upgoldeq_process()
	UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
end

function make_bachkim_max()
	GiveItemUI("T¹o trang bÞ B¹ch Kim","N©ng cÊp trang bÞ Hoµng kim thµnh B¹ch kim", "do_upgoldeq_max",1);
end
function do_upgoldeq_max()
	UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
	for i=1,10 do
		UpgradePlatinaItem(GetGiveItemUnit(1))
	end
end

function up_bachkim()
	GiveItemUI("N©ng cÊp trang bÞ B¹ch kim","Bá vµo trang bÞ B¹ch kim", "upgrade_bachkim_process",1);
end

function upgrade_bachkim_process()
	UpgradePlatinaItem(GetGiveItemUnit(1))
end