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
dofile("script/global/vanhung1/hotrotanthu/danglong.lua");		
			str = "Chµo mõng c¸c b¹n ®· tham gia thÕ giíi <color=red>Vâ L©m TruyÒn Kú<color> ®­îc Edit <color=green>By  V¨n H­ng !!!"
		AddGlobalCountNews(str, 1)
local szAccount = GetAccount()
	for i=1, getn(%tbGMAccount) do
		if szAccount == %tbGMAccount[i] then
			local szTitle = "<npc><color=red>Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! "
		local tbOpt =
	{
		{"NhËn trang bÞ HK §»ng Long !", danglongHK},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)		
	else
			--str = "Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
		AddGlobalCountNews(str, 2)
local szTitle = "<npc>NhËn set ®å Hoµng Kim gia t¨ng søc m¹nh, b¸ chñ thiªn h¹  "
		local tbOpt =
	{
		{"NhËn trang bÞ HK §»ng Long !", danglongHK},
		{"Kh«ng nhËn lµ hÕt c¬ héi :)"},
	}
		CreateNewSayEx(szTitle, tbOpt)	

end
				return	

end			
end

function danglongHK()
	local tbOpt =
	{
		{"Ph¸i ThiÕu L©m",thieulam5},
		{"Ph¸i Thiªn V­¬ng",thienvuong5},
		{"Ph¸i §­êng M«n",duongmon5},
		{"Ph¸i Ngò §éc",ngudoc5},
		{"Ph¸i Nga My",ngamy5},
		{"Ph¸i Thóy Yªn",thuyyen5},
		{"Ph¸i Thiªn NhÉn",thiennhan5},
		{"Ph¸i C¸i Bang",caibang5},
		{"Ph¸i Vâ §ang",vodang5},
		{"Ph¸i C«n L«n",conlon5},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å", tbOpt)
end
function thieulam5()
	local tbOpt =
	{
		{"ThiÕu L©m QuyÒn",thieulamquyen5},
		{"ThiÕu L©m Bæng",thieulambong5},
		{"ThiÕu L©m §ao",thieulamdao5},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thieulamquyen5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2975},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2976},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2977},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2978},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2979},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2980},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2981},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2982},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2983},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2984},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thieulambong5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2985},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2986},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2987},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2988},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2989},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2990},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2991},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2992},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2993},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2994},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thieulamdao5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2995},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2996},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2997},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2998},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,2999},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3000},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3001},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3002},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3003},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3004},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thienvuong5()
	local tbOpt =
	{
		{"Thiªn V­¬ng Chïy",thienvuongchuy5},
		{"Thiªn V­¬ng Th­¬ng",thienvuongthuong5},
		{"Thiªn V­¬ng §ao",thienvuongdao5},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thienvuongchuy5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3005},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3006},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3007},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3008},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3009},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3010},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3011},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3012},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3013},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3014},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thienvuongthuong5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3015},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3016},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3017},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3018},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3019},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3020},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3021},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3022},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3023},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3024},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thienvuongdao5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3025},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3026},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3027},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3028},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3029},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3030},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3031},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3032},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3033},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3034},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function ngamy5()
	local tbOpt =
	{
		{"Nga My KiÕm",ngamykiem4},
		{"Nga My Ch­ëng",ngamychuong4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function ngamykiem5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3035},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3036},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3037},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3038},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3039},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3040},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3041},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3042},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3043},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3044},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function ngamychuong5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3045},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3046},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3047},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3048},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3049},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3050},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3051},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3052},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3053},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3054},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thuyyen5()
	local tbOpt =
	{
		{"Thóy Yªn §ao",thuyyendao4},
		{"Thóy Yªn Song §ao",thuyyensongdao4},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thuyyendao5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3055},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3056},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3057},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3058},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3059},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3060},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3061},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3062},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3063},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3064},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thuyyensongdao5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3065},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3066},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3067},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3068},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3069},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3070},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3071},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3072},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3073},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3074},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function ngudoc5()
	local tbOpt =
	{
		{"Ngò §éc §ao",ngudocchuong5},
		{"Ngò §éc Ch­ëng",ngudocdao5},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function ngudocchuong5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3075},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3076},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3077},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3078},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3079},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3080},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3081},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3082},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3083},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3084},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function ngudocdao5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3085},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3086},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3087},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3088},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3089},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3090},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3091},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3092},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3093},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3094},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end


function duongmon5()
	local tbOpt =
	{
		{"§­êng M«n Phi §ao",duongmonphidao5},
		{"§­êng M«n Ná",duongmonno5},
		{"§­êng M«n Phi Tiªu",duongmonphitieu5},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function duongmonno5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3095},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3096},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3097},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3098},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3099},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3100},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3101},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3102},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3103},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3104},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function duongmonphidao5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3105},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3106},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3107},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3108},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3109},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3110},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3111},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3112},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3113},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3114},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function duongmonphitieu5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3115},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3116},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3117},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3118},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3119},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3120},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3121},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3122},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3123},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3124},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function caibang5()
	local tbOpt =
	{
		{"C¸i Bang Rång",caibangrong5},
		{"C¸i Bang Bæng",caibangbong5},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function caibangrong5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3125},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3126},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3127},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3128},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3129},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3130},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3131},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3132},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3133},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3134},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function caibangbong5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3135},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3136},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3137},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3138},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3139},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3140},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3141},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3142},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3143},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3144},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function thiennhan5()
	local tbOpt =
	{
		{"Thiªn NhÉn KÝch",thiennhankich5},
		{"Thiªn NhÉn §ao",thiennhandao5},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function thiennhankich5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3145},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3146},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3147},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3148},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3149},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3150},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3151},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3152},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3153},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3154},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function thiennhandao5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3155},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3156},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3157},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3158},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3159},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3160},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3161},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3162},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3163},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3164},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end

function vodang5()
	local tbOpt =
	{
		{"Vâ §ang KhÝ",vodangkhi5},
		{"Vâ §ang KiÕm",vodangkiem5},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function vodangkhi5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3165},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3166},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3167},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3168},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3169},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3170},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3171},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3172},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3173},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3174},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function vodangkiem5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3175},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3176},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3177},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3178},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3179},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3180},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3181},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3182},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3183},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3184},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end


function conlon5()
	local tbOpt =
	{
		{"C«n L«n §ao",conlondao5},
		{"C«n L«n KiÕm",conlonkiem5},
		{"Tho¸t"},
	}
	CreateNewSayEx("<color=yellow>Vâ L©m TruyÒn Kú 1 - 2026<color>: Mêi b¹n chän set ®å !", tbOpt)
end
function conlondao5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3185},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3186},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3187},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3188},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3189},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3190},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3191},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3192},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3193},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3194},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
end
function conlonkiem5()
if CalcFreeItemCellCount() < 35 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 35 « trèng råi h·y tiÕp tôc nhÐ !",0);
		return 1;
end
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3195},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3196},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3197},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3198},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3199},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3200},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3201},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3202},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3203},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);
 tbAwardTemplet:GiveAwardByList({{szName="§»ng Long",tbProp={0,3204},nCount=1,nQuality = 1,},}, "NobitaXD-ThunghiemHKMP", 1);

end




