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
dofile("script/global/vanhung1/hotrotanthu/nguyetkhuyet.lua");		
			str = "Chµo mõng c¸c b¹n ®· tham gia thÕ giíi <color=red>Vâ L©m TruyÒn Kú<color> ®­îc Edit <color=green>By  V¨n H­ng !!!"
		AddGlobalCountNews(str, 1)
local szAccount = GetAccount()
	for i=1, getn(%tbGMAccount) do
		if szAccount == %tbGMAccount[i] then
			local szTitle = "<npc><color=red>Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! "
		local tbOpt =
	{
		{"NhËn trang bÞ HK NguyÖt KhuyÕt !", nguyetkhuyetHK},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)		
	else
			--str = "Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
		AddGlobalCountNews(str, 2)
local szTitle = "<npc>NhËn set ®å Hoµng Kim gia t¨ng søc m¹nh, b¸ chñ thiªn h¹  "
		local tbOpt =
	{
		{"NhËn trang bÞ HK NguyÖt KhuyÕt !", nguyetkhuyetHK},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)	

end
				return	

end			
end

function nguyetkhuyetHK()
	local tbOpt =
	{
		{"Ph¸i ThiÕu L©m",thieulam1},
		{"Ph¸i Thiªn V­¬ng",thienvuong1},
		{"Ph¸i §­êng M«n",duongmon1},
		{"Ph¸i Ngò §éc",ngudoc1},
		{"Ph¸i Nga My",ngamy1},
		{"Ph¸i Thóy Yªn",thuyyen1},
		{"Ph¸i Thiªn NhÉn",thiennhan1},
		{"Ph¸i C¸i Bang",caibang1},
		{"Ph¸i Vâ §ang",vodang1},
		{"Ph¸i C«n L«n",conlon1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function thieulam1()
	local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",thieulamquyen1},
		{"ThiÕu L©m Bæng",thieulambong1},
		{"ThiÕu L©m §ao",thieulamdao1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function thieulamquyen1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5670},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5671},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5672},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5673},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5674},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5675},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5676},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5677},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5678},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5679},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thieulambong1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5680},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5681},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5682},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5683},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5684},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5685},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5686},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5687},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5688},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5689},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thieulamdao1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5690},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5691},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5692},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5693},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5694},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5695},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5696},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5697},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5698},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5699},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thienvuong1()
	local tbOpt =
	{
		{"Thiªn V­¬ng Chïy",thienvuongchuy1},
		{"Thiªn V­¬ng Th­¬ng",thienvuongthuong1},
		{"Thiªn V­¬ng §ao",thienvuongdao1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function thienvuongchuy1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5700},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5701},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5702},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5703},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5704},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5705},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5706},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5707},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5708},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5709},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thienvuongthuong1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5710},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5711},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5712},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5713},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5714},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5715},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5716},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5717},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5718},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5719},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thienvuongdao1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5720},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5721},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5722},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5723},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5724},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5725},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5726},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5727},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5728},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5729},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function ngamy1()
	local tbOpt =
	{
		{"Nga My KiÕm",ngamykiem1},
		{"Nga My Ch­ëng",ngamychuong1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function ngamykiem1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5730},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5731},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5732},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5733},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5734},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5735},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5736},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5737},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5738},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5739},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function ngamychuong1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5740},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5741},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5742},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5743},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5744},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5745},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5746},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5747},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5748},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5749},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thuyyen1()
	local tbOpt =
	{
		{"Thóy Yªn §ao",thuyyendao1},
		{"Thóy Yªn Song §ao",thuyyensongdao1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function thuyyendao1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5750},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5751},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5752},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5753},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5754},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5755},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5756},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5757},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5758},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5759},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thuyyensongdao1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5760},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5761},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5762},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5763},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5764},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5765},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5766},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5767},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5768},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5769},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function ngudoc1()
	local tbOpt =
	{
		{"Ngò §éc §ao",ngudocchuong1},
		{"Ngò §éc Ch­ëng",ngudocdao1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function ngudocchuong1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5770},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5771},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5772},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5773},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5774},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5775},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5776},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5777},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5778},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5779},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function ngudocdao1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5780},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5781},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5782},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5783},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5784},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5785},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5786},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5787},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5788},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5789},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end


function duongmon1()
	local tbOpt =
	{
		{"§­êng M«n Phi §ao",duongmonphidao1},
		{"§­êng M«n Ná",duongmonno1},
		{"§­êng M«n Phi Tiªu",duongmonphitieu1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function duongmonno1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5790},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5791},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5792},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5793},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5794},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5795},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5796},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5797},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5798},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5799},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function duongmonphidao1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5800},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5801},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5802},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5803},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5804},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5805},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5806},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5807},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5808},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5809},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function duongmonphitieu1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5810},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5811},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5812},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5813},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5814},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5815},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5816},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5817},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5818},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5819},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function caibang1()
	local tbOpt =
	{
		{"C¸i Bang Rång",caibangrong1},
		{"C¸i Bang Bæng",caibangbong1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function caibangrong1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5820},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5821},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5822},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5823},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5824},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5825},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5826},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5827},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5828},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5829},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function caibangbong1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5830},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5831},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5832},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5833},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5834},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5835},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5836},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5837},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5838},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5839},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thiennhan1()
	local tbOpt =
	{
		{"Thiªn NhÉn KÝch",thiennhankich1},
		{"Thiªn NhÉn §ao",thiennhandao1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function thiennhankich1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5840},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5841},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5842},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5843},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5844},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5845},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5846},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5847},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5848},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5849},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thiennhandao1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5850},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5851},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5852},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5853},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5854},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5855},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5856},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5857},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5858},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5859},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function vodang1()
	local tbOpt =
	{
		{"Vâ §ang KhÝ",vodangkhi1},
		{"Vâ §ang KiÕm",vodangkiem1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function vodangkhi1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5860},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5861},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5862},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5863},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5864},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5865},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5866},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5867},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5868},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5869},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function vodangkiem1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5870},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5871},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5872},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5873},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5874},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5875},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5876},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5877},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5878},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5879},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end


function conlon1()
	local tbOpt =
	{
		{"C«n L«n §ao",conlondao1},
		{"C«n L«n KiÕm",conlonkiem1},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän tÝnh n¨ng !", tbOpt)
end
function conlondao1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5880},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5881},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5882},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5883},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5884},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5885},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5886},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5887},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5888},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5889},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function conlonkiem1()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5890},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5891},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5892},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5893},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5894},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5895},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5896},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5897},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5898},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="NguyÖt KhuyÕt",tbProp={0,5899},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);

end
