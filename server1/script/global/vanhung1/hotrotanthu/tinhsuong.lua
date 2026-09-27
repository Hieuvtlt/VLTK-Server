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
--Include("\\script\\global\\vanhung1\\hotrotanthu\\tinhsuong.lua")
Include("\\script\\global\\vanhung1\\hotrotanthu\\diemdanhhangngay.lua")
szNpcName = "<color=yellow>Hç trî T©n thñ<color>: "
szPlayer = "§¹i HiÖp"
if GetSex() == 1 then
	szPlayer = "N÷ HiÖp"
end



local tbGMAccount = {"vanhung", "vanhung1"}
function main()
--dofile("script/global/vanhung1/hotrotanthu/tinhsuong.lua");		
			str = "Chµo mõng c¸c b¹n ®· tham gia thÕ giíi <color=red>Vâ L©m TruyÒn Kú<color> ®­îc Edit <color=green>By  V¨n H­ng !!!"
		AddGlobalCountNews(str, 1)
local szAccount = GetAccount()
	for i=1, getn(%tbGMAccount) do
		if szAccount == %tbGMAccount[i] then
			local szTitle = "<npc><color=red>Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! "
		local tbOpt =
	{
		{"NhËn trang bÞ HK Tinh S­¬ng !", tinhsuongHK},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)		
	else
			--str = "Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
		AddGlobalCountNews(str, 2)
local szTitle = "<npc>NhËn set ®å Hoµng Kim gia t¨ng søc m¹nh, b¸ chñ thiªn h¹  "
		local tbOpt =
	{
		{"NhËn trang bÞ HK Tinh S­¬ng !", tinhsuongHK},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)	

end
				return	

end			
end

function tinhsuongHK()
	local tbOpt =
	{
		{"Ph¸i ThiÕu L©m",thieulam},
		{"Ph¸i Thiªn V­¬ng",thienvuong},
		{"Ph¸i §­êng M«n",duongmon},
		{"Ph¸i Ngò §éc",ngudoc},
		{"Ph¸i Nga My",ngamy},
		{"Ph¸i Thóy Yªn",thuyyen},
		{"Ph¸i Thiªn NhÉn",thiennhan},
		{"Ph¸i C¸i Bang",caibang},
		{"Ph¸i Vâ §ang",vodang},
		{"Ph¸i C«n L«n",conlon},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thieulam()
	local tbOpt =
	{
		{"ThiÕu L©m Bæng",thieulamdao},
		{"ThiÕu L©m §ao",thieulambong},
		{"ThiÕu L©m QuyÒn",thieulamquyen},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thieulamquyen()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5399},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5400},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5401},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5402},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5403},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5404},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5405},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5406},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5407},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5408},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thieulambong()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5389},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5390},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5391},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5392},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5393},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5394},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5395},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5396},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5397},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5398},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thieulamdao()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5379},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5380},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5381},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5382},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5383},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5384},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5385},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5386},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5387},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5388},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thienvuong()
	local tbOpt =
	{
		{"Thiªn V­¬ng Chïy",thienvuongchuy},
		{"Thiªn V­¬ng Th­¬ng",thienvuongthuong},
		{"Thiªn V­¬ng §ao",thienvuongdao},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thienvuongchuy()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5409},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5410},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5411},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5412},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5413},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5414},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5415},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5416},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5417},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5418},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thienvuongthuong()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5419},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5420},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5421},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5422},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5423},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5424},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5425},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5426},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5427},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5428},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thienvuongdao()
	-- [17/09/2026] Da go toan bo phan thuong (goldequip 5429-5438).
	-- Dai 5433-5438 la NGUA Huyet Mach cua Tieu Dao;
	-- chi Tieu Dao Tu duoc phat con goc 5433, phat o day lam thung luat "tiet mach".
	return 1;
end

function ngamy()
	local tbOpt =
	{
		{"Nga My KiÕm",ngamykiem},
		{"Nga My Ch­ëng",ngamychuong},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function ngamykiem()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5443},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5444},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5445},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5446},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5447},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5448},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function ngamychuong()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5449},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5450},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5451},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5452},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5453},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5454},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5455},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5456},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5457},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5458},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thuyyen()
	local tbOpt =
	{
		{"Thóy Yªn §ao",thuyyendao},
		{"Thóy Yªn Song §ao",thuyyensongdao},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thuyyendao()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5459},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5460},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5461},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5462},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5463},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5464},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5465},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5466},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5467},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5468},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thuyyensongdao()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5469},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5470},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5471},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5472},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5473},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5474},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5475},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5476},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5477},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5478},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function ngudoc()
	local tbOpt =
	{
		{"Ngò §éc §ao",ngudocchuong},
		{"Ngò §éc Ch­ëng",ngudocdao},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function ngudocchuong()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5479},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5480},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5481},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5482},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5483},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5484},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5485},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5486},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5487},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5488},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function ngudocdao()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5489},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5490},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5491},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5492},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5493},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5494},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5495},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5496},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5497},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5498},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end


function duongmon()
	local tbOpt =
	{
		{"§­êng M«n Phi §ao",duongmonphidao},
		{"§­êng M«n Ná",duongmonno},
		{"§­êng M«n Phi Tiªu",duongmonphitieu},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function duongmonno()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5499},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5500},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5501},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5502},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5503},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5504},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5505},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5506},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5507},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5508},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function duongmonphidao()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5509},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5510},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5511},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5512},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5513},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5514},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5515},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5516},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5517},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5518},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function duongmonphitieu()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5519},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5520},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5521},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5522},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5523},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5524},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5525},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5526},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5527},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5528},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function caibang()
	local tbOpt =
	{
		{"C¸i Bang Rång",caibangrong},
		{"C¸i Bang Bæng",caibangbong},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function caibangrong()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5529},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5530},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5531},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5532},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5533},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5534},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5535},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5536},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5537},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5538},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function caibangbong()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5539},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5540},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5541},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5542},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5543},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5544},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5545},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5546},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5547},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5548},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thiennhan()
	local tbOpt =
	{
		{"Thiªn NhÉn KÝch",thiennhankich},
		{"Thiªn NhÉn §ao",thiennhandao},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thiennhankich()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5549},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5550},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5551},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5552},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5553},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5554},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5555},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5556},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5557},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5558},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thiennhandao()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5559},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5560},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5561},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5562},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5563},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5564},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5565},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5566},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5567},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5568},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function vodang()
	local tbOpt =
	{
		{"Vâ §ang KhÝ",vodangkhi},
		{"Vâ §ang KiÕm",vodangkiem},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function vodangkhi()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5569},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5570},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5571},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5572},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5573},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5574},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5575},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5576},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5577},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5578},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function vodangkiem()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5579},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5580},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5581},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5582},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5583},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5584},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5585},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5586},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5587},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5588},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end


function conlon()
	local tbOpt =
	{
		{"C«n L«n §ao",conlondao},
		{"C«n L«n KiÕm",conlonkiem},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function conlondao()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5589},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5590},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5591},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5592},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5593},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5594},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5595},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5596},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5597},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5598},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function conlonkiem()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 40 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5599},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5600},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5601},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5602},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5603},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5604},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5605},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5606},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5607},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Tinh S­¬ng",tbProp={0,5608},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end




