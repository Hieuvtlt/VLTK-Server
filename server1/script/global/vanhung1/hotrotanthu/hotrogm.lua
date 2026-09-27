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
Include("\\script\\global\\vanhung1\\hotrotanthu\\diemdanhhangngay.lua")
szNpcName = "<color=yellow>Hç trî T©n thñ<color>: "
szPlayer = "§¹i HiÖp"
if GetSex() == 1 then
	szPlayer = "N÷ HiÖp"
end


tbSkillBook90 = {
	shaolin = {56,57,58},
	tianwang = {37,38,39},
	tangmen = {27,28,45,46},
	wudu = {47,48,49},
	emei = {42,43,59},
	cuiyan = {40,41},
	gaibang = {54,55},
	tianren = {35,36,53},
	wudang = {33,34},
	kunlun = {50,51,52},
}

tbAllSkill = {
	shaolin = {
		[1] = {10,14},
		[2] = {4,6,8},
		[3] = {15},
		[4] = {16},
		[5] = {20},
		[6] = {11,19,271},
		[7] = {21,273},
		[9] = {318,319,321},
	},
	tianwang = {
		[1] = {29,30,34},
		[2] = {23,24,26},
		[3] = {33},
		[4] = {31,35,37},
		[5] = {40},
		[6] = {42},
		[7] = {32,36,41,324},
		[9] = {322,323,325},
	},
	tangmen = {
		[1] = {45},
		[2] = {43,347},
		[3] = {303},
		[4] = {47,50,54,343},
		[5] = {345},
		[6] = {349},
		[7] = {48,58,249,341},
		[9] = {302,339,342,351},
	},
	wudu = {
		[1] = {63,65},
		[2] = {60,62,67},
		[3] = {66,70},
		[4] = {64,68,69,384},
		[5] = {73,356},
		[6] = {72},
		[7] = {71,74,75},
		[9] = {353,355,390},
	},
	emei = {
		[1] = {80,85},
		[2] = {77,79},
		[3] = {93},
		[4] = {82,89,385},
		[5] = {86},
		[6] = {92},
		[7] = {88,91,252,282},
		[9] = {328,332,380},
	},
	cuiyan = {
		[1] = {99,102},
		[2] = {95,97},
		[3] = {269},
		[4] = {105,113},
		[5] = {100},
		[6] = {109},
		[7] = {108,111,114},
		[9] = {336,337},
	},
	gaibang = {
		[1] = {119,122},
		[2] = {115,116},
		[3] = {129},
		[4] = {124,274},
		[5] = {277},
		[6] = {125,128},
		[7] = {130,360},
		[9] = {357,359},
	},
	tianren = {
		[1] = {135,145},
		[2] = {131,132,136},
		[3] = {137},
		[4] = {138,140,141},
		[5] = {364},
		[6] = {143},
		[7] = {142,148,150},
		[9] = {361,362,391},
	},
	wudang = {
		[1] = {153,155},
		[2] = {151,152},
		[3] = {159},
		[4] = {158,164},
		[5] = {160},
		[6] = {157},
		[7] = {165,166,267},
		[9] = {365,368},
	},
	kunlun = {
		[1] = {169,179},
		[2] = {167,168,171,392},
		[3] = {174},
		[4] = {172,173,178,393},
		[5] = {175,181},
		[6] = {90,176},
		[7] = {182,275,630},
		[9] = {372,375,394},
	},
}


local tbGMAccount = {"vanhung", "vanhung1"}
function main()
dofile("script/global/vanhung1/hotrotanthu/hotrogame.lua");		
			str = "Chµo mõng c¸c b¹n ®· tham gia thÕ giíi <color=red>Vâ L©m TruyÒn Kú<color> ®­îc Edit <color=green>By  V¨n H­ng !!!"
		AddGlobalCountNews(str, 1)
local szAccount = GetAccount()
	for i=1, getn(%tbGMAccount) do
		if szAccount == %tbGMAccount[i] then
			local szTitle = "<npc><color=red>Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! "
		local tbOpt =
	{
		{"NhËn Kü N¨ng cÊp 180 !", dkgm2},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle, tbOpt)		
	else
			--Talk(1, "", "<color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! ")
			str = "Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>Offline edit by V¨n H­ng <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... !"
		AddGlobalCountNews(str, 2)
local szTitle = "<npc><color=red>TuyÖt häc cÊp 180 chÝnh lµ ch×a khãa gióp ch­ vÞ nh©n sÜ bøt ph¸ giíi h¹n vµ gia t¨ng uy lùc b¶n th©n !  "
		local tbOpt =
	{
		{"NhËn Kü N¨ng cÊp 180", dkgm2},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	

end
				return	

end			
end

function hotrotrain()
AddItem(6,1,4835,0,0,0,10000)
end

function HoTroSkill()
if GetLastFactionNumber(10) and (HaveMagic(1347) >= 0) and (HaveMagic(1364) < 0) and GetTask(169) < 73 then
AddMagic(1349)
AddMagic(1374)
AddMagic(1350)
AddMagic(1375)
AddMagic(1351)
AddMagic(1376)
AddMagic(1354)
AddMagic(1378)
AddMagic(1355)
AddMagic(1379)
AddMagic(1358)
AddMagic(1360)
AddMagic(1380)
AddMagic(1364,20)
AddMagic(1382,20)
Talk(1,"",szNpcName.."Vâ häc ®· ®­îc truyÒn thô, "..szPlayer .." h·y thö vËn c«ng n©ng thµnh xem sao.")
elseif (HaveMagic(1364) > 0) then
Talk(1,"",szNpcName.."Vâ häc ®· ®­îc truyÒn thô, "..szPlayer .." h·y thö vËn c«ng n©ng thµnh xem sao.")
end
	local nIndex = floor(GetLevel()/10)
	local szFaction = GetFaction()
	if tbAllSkill[szFaction] == nil then
		return
	end
	if nIndex >= 1 then
		for i=1, min(9,nIndex) do
			if tbAllSkill[szFaction][i] ~= nil then
				for j=1, getn(tbAllSkill[szFaction][i]) do
					if i ==9 then
						if HaveMagic(tbAllSkill[szFaction][i][j]) == -1 then
							AddMagic(tbAllSkill[szFaction][i][j],20)
						end
					else
						if HaveMagic(tbAllSkill[szFaction][i][j]) == -1 then
							AddMagic(tbAllSkill[szFaction][i][j])
						end
					end
				end
			end
		end
	end
	Talk(1,"",szNpcName.."Vâ häc ®· ®­îc truyÒn thô, "..szPlayer .." h·y thö vËn c«ng n©ng thµnh xem sao.")
end




function dkgm9()
Msg2Player("<color=yellow>HiÖn t¹i ®ang cã<color><color=green> "..GetPlayerCount().."<color> Ng­­êi Online !.")
end

function dkgm4()
	LoadFromFile()
	tbTop10:Regist()
	tbTop10:UpdateTopList()
	tbTop10:hangcanhan()
	tbTop10:ShowTopList()
end

function dkgm3()
hoason()

end

function dkgm2()
namcung2()
end

function phanthuong()
if CalcFreeItemCellCount() < 10 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
		return 1;
end
AskClientForString("checkcode", "", 1, 100, "Xin nhËp code");
end
tbitem  =
	{
		[1]	={szName = "Tiªn th¶o lé", tbProp = {6, 1, 71, 1,0,0}, nCount = 5, nExpiredTime = 10080, nBindState = -2},
		[2]	={szName = "Håi thµnh phï (nhá)", tbProp = {6, 1, 1082,1,0,0}, nCount = 1, nExpiredTime = 43200, nBindState = -2},
		[3]	={szName="Kim M· CÈm Nang",tbProp={6,1,4088,1,0,0},nCount=1,nExpiredTime=43200,nBindState = -2},
		[4]	={szName = "M¶nh b¶n ®å s¬n hµ x· t¾c (1000 m¶nh)", tbProp = {6, 1, 2514,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		[5]	={szName="ThÇn Hµnh Phï",tbProp={6,1,1266,1,0,0},nCount=1,nExpiredTime=43200,nBindState = -2},
		[6]	={szName="T©n Thñ LÖnh",tbProp={6,1,4265,1,0,0},nCount=1,nExpiredTime=14400,nBindState = -2},
		[7]	={szName="Phông NguyÖt Qu¶ Dung",tbProp={6,1,127,1,0,0},nCount=2,nBindState = -2},
		[8]	={szName="Cèng NguyÖt Phï Dung",tbProp={6,1,128,1,0,0},nCount=2,nBindState = -2},
	}
function checkcode(strings)
		if GetTask(3000)==1 then
		Talk(1, "", "B¹n ®· nhËn råi mµ ");
		return
	end
	if (strings=="PGAMING6" or strings=="PGAMING" or strings=="PGAMING1" or strings=="PGAMING2" or strings=="PGAMING3" or strings=="PGAMING4" or strings=="PGMAING5")then
		tbAwardTemplet:GiveAwardByList(tbitem, "PhÇn th­ëng t©n thñ");
		SetTask(3000,1)
		str = "Tin chÊn ®éng giang hå, Cao thñ<color=red>"..GetName().."<color> Ch¨m chØ luyÖn tËp ®· nhËn ®­îc <color=green>phÇn th­ëng T©n Thñ<color> x­ng b¸ thiªn h¹ kh«ng ®Þch thñ !."
		AddGlobalCountNews(str, 1)
		Msg2Player( "Chóc mõng b¹n ®· nhËn ®­îc phÇn th­¬ng T©n Thñ" );
	else
		Talk(1, "", "Code sai");
	end
end


function hotrotanthu()
	if GetLevel()<50 then
		AddSkillState(512,20,1,60*60*18)
		AddSkillState(527,5,1,60*60*18)
		AddSkillState(313,5,1,60*60*18)  	--Vong duoi chan
		AddSkillState(314,12,1,60*60*18)	 --Vong duoi chan
		AddSkillState(546,1,1,60*60*18)		 --Rong bay
		Talk(1, "", "B¹n sÏ ®­îc nhËn hæ trî kü n¨ng nµy ®Õn cÊp 50");
		Msg2Player( "Lªn Trang Chñ <color=yellow>192.168.1.200<color> §Ó nhËn gift code" );
		tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
	end
end

function partner_getdust1()
partner_givetodo()
end

function DoiTenNV()
	AskClientForString("danhten", "", 1, 100, "Xin nhËp tªn muèn ®æi");
end

function danhten(strings)
	RenameRole(strings)
end

function dkgm()
	n_title = 5000 -- S?a ID danh hi?u vào
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate = FormatTime2Number(nServerTime);
	local nDay = floor(mod(nDate,1000000) / 10000);
	local nMon = mod(floor(nDate / 1000000) , 100)
	local nTime = nMon * 1000000 + nDay * 10000 
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	local nCurLevel = GetLevel()
	if nCurLevel < 150 then
		ST_LevelUp(150 - nCurLevel)
	end
	SetFightState(0)
	SetCamp(6)
	SetCurCamp(6)
	AddMagic(732, 50) --Skill GM
	AddMagic(733, 50) --Skill GM
	if CalcFreeItemCellCount() >= 1 then
		local tbItem = {szName="LÖnh bµi Gm", tbProp={6,1,4257,1,0,0}, nBindState=-2}
		tbAwardTemplet:GiveAwardByList(tbItem, "LÖnh bµi Gm", 1)
	end
end

function deltem()
	if (GetBoxLockState() ~= 0) then
		Say("Xin më khãa r­¬ng tr­íc !", 0)
		return
	end
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "Mçi lÇn chØ cã thÓ hñy ®­îc mét vËt phÈm!!");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	
	if (nBindState >=0)  then
		Talk(1, "", "VËt phÈm cÇn hñy ph¶i lµ vËt phÈm khãa!");
		return
	end
	local strItem = GetItemName(nItemIndex)
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", "§¹i hiÖp cã thÓ s¾p xÕp l¹i r­¬ng chøa ®å råi!");
	Msg2Player("§¹i hiÖp võa hñy vËt phÈm thµnh c«ng")
	WriteLog(date("%Y%m%d %H%M%S").."\t".." Hñy item khãa "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
end

function doirac()
weapon_ring()
end


