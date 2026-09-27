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
dofile("script/global/vanhung1/hotrotanthu/minhphuong.lua");		
			str = "Chµo mõng c¸c b¹n ®· tham gia thÕ giíi <color=red>Vâ L©m TruyÒn Kú<color> ®­îc Edit <color=green>By  V¨n H­ng !!!"
		AddGlobalCountNews(str, 1)
local szAccount = GetAccount()
	for i=1, getn(%tbGMAccount) do
		if szAccount == %tbGMAccount[i] then
			local szTitle = "<npc><color=red>Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! "
		local tbOpt =
	{
		{"NhËn trang bÞ HK Minh Ph­îng !", minhphuongHK},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)		
	else
			--str = "Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
		AddGlobalCountNews(str, 2)
local szTitle = "<npc>NhËn set ®å Hoµng Kim gia t¨ng søc m¹nh, b¸ chñ thiªn h¹  "
		local tbOpt =
	{
		{"NhËn trang bÞ HK Minh Ph­îng !", minhphuongHK},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)	

end
				return	

end			
end

function minhphuongHK()
	local tbOpt =
	{
		{"Ph¸i ThiÕu L©m",thieulam4},
		{"Ph¸i Thiªn V­¬ng",thienvuong4},
		{"Ph¸i §­êng M«n",duongmon4},
		{"Ph¸i Ngò §éc",ngudoc4},
		{"Ph¸i Nga My",ngamy4},
		{"Ph¸i Thóy Yªn",thuyyen4},
		{"Ph¸i Thiªn NhÉn",thiennhan4},
		{"Ph¸i C¸i Bang",caibang4},
		{"Ph¸i Vâ §ang",vodang4},
		{"Ph¸i C«n L«n",conlon4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å", tbOpt)
end
function thieulam4()
	local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",thieulamquyen4},
		{"ThiÕu L©m Bæng",thieulambong4},
		{"ThiÕu L©m §ao",thieulamdao4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thieulamquyen4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2745},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2746},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2747},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2748},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2749},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2750},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2751},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2752},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2753},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2754},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thieulambong4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2755},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2756},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2757},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2758},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2759},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2760},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2761},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2762},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2763},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2764},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thieulamdao4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2765},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2766},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2767},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2768},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2769},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2770},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2771},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2772},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2773},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2774},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thienvuong4()
	local tbOpt =
	{
		{"Thiªn V­¬ng Chïy",thienvuongchuy4},
		{"Thiªn V­¬ng Th­¬ng",thienvuongthuong4},
		{"Thiªn V­¬ng §ao",thienvuongdao4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thienvuongchuy4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2775},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2776},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2777},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2778},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2779},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2780},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2781},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2782},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2783},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2784},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thienvuongthuong4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2785},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2786},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2787},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2788},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2789},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2790},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2791},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2792},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2793},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2794},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thienvuongdao4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2795},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2796},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2797},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2798},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2799},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2800},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2801},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2802},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2803},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2804},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function ngamy4()
	local tbOpt =
	{
		{"Nga My KiÕm",ngamykiem4},
		{"Nga My Ch­ëng",ngamychuong4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function ngamykiem4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2805},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2806},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2807},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2808},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2809},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2810},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2811},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2812},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2813},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2814},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function ngamychuong4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2815},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2816},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2817},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2818},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2819},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2820},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2821},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2822},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2823},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2824},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thuyyen4()
	local tbOpt =
	{
		{"Thóy Yªn §ao",thuyyendao4},
		{"Thóy Yªn Song §ao",thuyyensongdao4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thuyyendao4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2825},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2826},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2827},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2828},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2829},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2830},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2831},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2832},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2833},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2834},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thuyyensongdao4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2835},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2836},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2837},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2838},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2839},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2840},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2841},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2842},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2843},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2844},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function ngudoc4()
	local tbOpt =
	{
		{"Ngò §éc §ao",ngudocchuong4},
		{"Ngò §éc Ch­ëng",ngudocdao4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function ngudocchuong4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2845},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2846},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2847},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2848},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2849},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2850},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2851},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2852},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2853},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2854},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function ngudocdao4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2855},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2856},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2857},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2858},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2859},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2860},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2861},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2862},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2863},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2864},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end


function duongmon4()
	local tbOpt =
	{
		{"§­êng M«n Phi §ao",duongmonphidao4},
		{"§­êng M«n Ná",duongmonno4},
		{"§­êng M«n Phi Tiªu",duongmonphitieu4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function duongmonno4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2865},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2866},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2867},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2868},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2869},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2870},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2871},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2872},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2873},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2874},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function duongmonphidao4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2875},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2876},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2877},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2878},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2879},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2880},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2881},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2882},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2883},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2884},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function duongmonphitieu4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2885},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2886},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2887},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2888},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2889},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2890},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2891},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2892},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2893},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2894},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function caibang4()
	local tbOpt =
	{
		{"C¸i Bang Rång",caibangrong4},
		{"C¸i Bang Bæng",caibangbong4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function caibangrong4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2895},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2896},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2897},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2898},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2899},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2900},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2901},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2902},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2903},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2904},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function caibangbong4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2905},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2906},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2907},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2908},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2909},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2910},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2911},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2912},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2913},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2914},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thiennhan4()
	local tbOpt =
	{
		{"Thiªn NhÉn KÝch",thiennhankich4},
		{"Thiªn NhÉn §ao",thiennhandao4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thiennhankich4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2915},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2916},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2917},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2918},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2919},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2920},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2921},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2922},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2923},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2924},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thiennhandao4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2925},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2926},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2927},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2928},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2929},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2930},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2931},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2932},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2933},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2934},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function vodang4()
	local tbOpt =
	{
		{"Vâ §ang KhÝ",vodangkhi4},
		{"Vâ §ang KiÕm",vodangkiem4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function vodangkhi4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2935},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2936},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2937},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2938},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2939},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2940},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2941},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2942},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2943},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2944},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function vodangkiem4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2945},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2946},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2947},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2948},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2949},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2950},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2951},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2952},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2953},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2954},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end


function conlon4()
	local tbOpt =
	{
		{"C«n L«n §ao",conlondao4},
		{"C«n L«n KiÕm",conlonkiem4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function conlondao4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2955},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2956},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2957},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2958},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2959},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2960},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2961},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2962},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2963},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2964},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function conlonkiem4()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2965},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2966},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2967},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2968},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2969},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2970},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2971},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2972},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2973},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="Minh Ph­îng",tbProp={0,2974},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);

end




