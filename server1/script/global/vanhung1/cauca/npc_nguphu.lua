IncludeLib("SPREADER")
IncludeLib("SETTING")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")

Include("\\script\\global\\vanhung1\\cauca\\head.lua")

IncludeLib("LEAGUE");
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composeex.lua")
----------
Include("\\script\\lib\\composeex.lua")
IncludeLib("LEAGUE");
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
dofile("script/global/pgaming/cauca/npc_nguphu.lua")	
	AskDeal()
end
function myplayersex()
	if GetSex() == 1 then 
		return "N÷ hiÖp";
	else
		return "§¹i hiÖp";
	end
	--      "..myplayersex().."
end

function AskDeal()
Say("Ta cã b¸n c¸c lo¹i dông cô ®¸nh b¾t c¸. Kh¸ch quan nÕu bá lì kh«ng mua th× thËt v« cïng ®¸ng tiÕc!", 4, 
	"CÇn c©u (10 tiÒn ®ång)/#DealBuy(1)", 
	"L­íi ®¸nh c¸ (15 tiÒn ®ång)/#DealBuy(2)",
	"§æi C¸ lÊy phÇn th­ëng/doi_phan_thuong",
	"Kh«ng cÇn ®©u/OnCancelBuy_xxg");
end;

function DealBuy(ItemID)
	tien = 0
	if (ItemID == 1) then
		SetTaskTemp(15,4807); --- can cau
		tien = 10;
	elseif (ItemID == 2) then
		SetTaskTemp(15,4806);
		tien = 15;
	else
		return
	end;
	if tien == 0 then
		return
	end
	Say("Gi¸ <color=yellow>"..tien.." TiÒn ®ång<color> Cã ®ång ý kh«ng?", 2, "Muèn/#DoBuy(tien)", "ta nghÜ l¹i xem /OnCancelBuyxx");
end;
function DoBuy(tien)
	TheItem = GetTaskTemp(15);
	if (TheItem >= 4806 and TheItem <= 4807) then ---luoi danh ca
		if (CalcEquiproomItemCount(4, 417, 1, 1)>=tien) then
			ConsumeEquiproomItem(tien, 4, 417, 1, 1)
			AddItem(6,1,TheItem,1,0,0);
			SaveNow();
			Say("Kh¸ch quan thËt biÕt xem hµng!", 0);
		else
			Say("Kh¸ch quan ®ang trªu chäc tiÓu nh©n hay thËt sù kh«ng cã <color=yellow>"..tien.." tiÒn ®ång<color>?", 0);
		end
	end;
end

function doi_phan_thuong()
	local tbDialog = 
{ 
"<dec><npc>\n<color=yewllow>Hç trî nh©n sÜ Vâ L©m khi tham gia Vâ L©m TruyÒn Kú?<color>", 
--"§æi 50 C¸ Hång = 40 Ph¸o §¹i/doi_ca_hong", 
"§æi 50 C¸ MËp = 55 Ph¸o §¹i/doi_ca_map",
"§æi 50 C¸ Rång = 80 Ph¸o §¹i/doi_ca_rong",
"§æi 50 C¸ SÊu = 100 Ph¸o §¹i /doi_ca_sau",
"§æi 50 Con Mùc = 130 Ph¸o §¹i /doi_muc",
"§æi 30 Con T«m = 150 Ph¸o §¹i/doi_tom",
"§æi 2 Nµng Tiªn C¸ = 400 Ph¸o §¹i /doi_tien_ca",
"KÕt thóc ®èi tho¹i /thonghonafk", 
} 
CreateTaskSay(tbDialog) 
end

function doi_ca_hong()
local ca= 50 ---so  luong
local la= CalcItemCount(3,6, 1, 4799, -1) ;
if la < 50 then --so luong
 Talk(2, "", ""..myplayersex().." cßn thiÕu <color=red>"..ca-la.."<color> <color=green>C¸ Hång<color> råi! <color> "); 
 else
		for i=1,ca do
			ConsumeEquiproomItem(1,6,1,4799,-1)
		end
 lay_pt_ca_hong()
 end
end
function lay_pt_ca_hong()	-----ca hong
local tbAward = {
		
		[1]	={szName="Ph¸o §¹i", tbProp = {6, 1, 1353, 1,0,0}, nCount = 40},
		--[3]={szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=5},
		--[4]={szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=5},
		--[5]={szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount=2},			
}
	tbAwardTemplet:GiveAwardByList(tbAward, "PhÇn th­ëng ®æi c¸");
	--Earn(500000) ---500 van
	Msg2SubWorld("<color=green>Xin chóc mõng "..myplayersex().." <color>"..GetName().." <color=green> ®· ®æi thµnh c«ng <color=fire>50 C¸ Hång <color>tõ NPC Ng­ Phñ !!!")
end

function doi_ca_map()
local ca= 50 ---so  luong
local la= CalcItemCount(3,6, 1, 4800, -1) ;
if la < 50 then --so luong
 Talk(2, "", ""..myplayersex().." cßn thiÕu <color=red>"..ca-la.."<color> <color=green>C¸ MËp<color> råi! <color> "); 
 else
		for i=1,ca do
			ConsumeEquiproomItem(1,6,1,4800,-1)
		end
 lay_pt_ca_map()
 end
end
function lay_pt_ca_map()	-----ca hong
local tbAward = {
		[1]	={szName="Ph¸o §¹i", tbProp = {6, 1, 1353, 1,0,0}, nCount = 55},
		--[2]	={szName="Méc R­¬ng", tbProp = {6, 1, 4777, 1,0,0}, nCount = 10},
		--[3]={szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=10},
		--[4]={szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=10},
		--[5]={szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount=3},			
}
	tbAwardTemplet:GiveAwardByList(tbAward, "PhÇn th­ëng ®æi c¸");
	--Earn(550000) ---500 van
	Msg2SubWorld("<color=green>Xin chóc mõng "..myplayersex().." <color>"..GetName().." <color=green> ®· ®æi thµnh c«ng <color=fire>50 C¸ Rång <color>tõ NPC Ng­ Phñ !!!")
end

function doi_ca_rong()
local ca= 50 ---so  luong
local la= CalcItemCount(3,6, 1, 4801, -1) ;
if la < 50 then --so luong
 Talk(2, "", ""..myplayersex().." cßn thiÕu <color=red>"..ca-la.."<color> <color=green>C¸ Rång<color> råi! <color> "); 
 else
		for i=1,ca do
			ConsumeEquiproomItem(1,6,1,4801,-1)
		end
 lay_pt_ca_hong()
 end
end
function lay_pt_ca_rong()	-----ca hong
local tbAward = {
		[1]	={szName="Ph¸o §¹i", tbProp = {6, 1, 1353, 1,0,0}, nCount = 80},
		--[2]	={szName="Méc R­¬ng", tbProp = {6, 1, 4777, 1,0,0}, nCount = 15},
		--[3]={szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=15},
		--[4]={szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=15},
		--[5]={szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount=4},			
}
	tbAwardTemplet:GiveAwardByList(tbAward, "PhÇn th­ëng ®æi c¸");
	--Earn(600000) ---500 van
	Msg2SubWorld("<color=green>Xin chóc mõng "..myplayersex().." <color>"..GetName().." <color=green> ®· ®æi thµnh c«ng <color=fire>50 C¸ Rång <color>tõ NPC Ng­ Phñ !!!")
end

function doi_ca_sau()
local ca= 50 ---so  luong
local la= CalcItemCount(3,6, 1, 4802, -1) ;
if la < 50 then --so luong
 Talk(2, "", ""..myplayersex().." cßn thiÕu <color=red>"..ca-la.."<color> <color=green>C¸ SÊu<color> råi! <color> "); 
 else
		for i=1,ca do
			ConsumeEquiproomItem(1,6,1,4802,-1)
		end
 lay_pt_ca_sau()
 end
end
function lay_pt_ca_sau()	-----ca hong
local tbAward = {
		[1]	={szName="Ph¸o §¹i", tbProp = {6, 1, 1353, 1,0,0}, nCount = 100},
		--[2]	={szName="Méc R­¬ng", tbProp = {6, 1, 4777, 1,0,0}, nCount = 15},
		--[3]={szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=15},
		--[4]={szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=15},
		--[5]={szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount=5},			
}
	tbAwardTemplet:GiveAwardByList(tbAward, "PhÇn th­ëng ®æi c¸");
	--Earn(650000) ---500 van
	Msg2SubWorld("<color=green>Xin chóc mõng "..myplayersex().." <color>"..GetName().." <color=green> ®· ®æi thµnh c«ng <color=fire>50 C¸ SÊu <color>tõ NPC Ng­ Phñ !!!")
end

function doi_muc()
local ca= 50 ---so  luong
local la= CalcItemCount(3,6, 1, 4803, -1) ;
if la < 50 then --so luong
 Talk(2, "", ""..myplayersex().." cßn thiÕu <color=red>"..ca-la.."<color> <color=green>Con Mùc<color> råi! <color> "); 
 else
		for i=1,ca do
			ConsumeEquiproomItem(1,6,1,4803,-1)
		end
 lay_pt_muc()
 end
end
function lay_pt_muc()	-----ca hong
local tbAward = {
		[1]	={szName="Ph¸o §¹i", tbProp = {6, 1, 1353, 1,0,0}, nCount = 130},
		--[2]	={szName="Méc R­¬ng", tbProp = {6, 1, 4777, 1,0,0}, nCount = 15},
		--[3]={szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=15},
		--[4]={szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=15},
		--[5]={szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount=6},			
}
	tbAwardTemplet:GiveAwardByList(tbAward, "PhÇn th­ëng ®æi c¸");
	--Earn(700000) ---500 van
	Msg2SubWorld("<color=green>Xin chóc mõng "..myplayersex().." <color>"..GetName().." <color=green> ®· ®æi thµnh c«ng <color=fire>50 Con Mùc <color>tõ NPC Ng­ Phñ !!!")
end

function doi_tom()
local ca= 30 ---so  luong
local la= CalcItemCount(3,6, 1, 4804, -1) ;
if la < 30 then --so luong
 Talk(2, "", ""..myplayersex().." cßn thiÕu <color=red>"..ca-la.."<color> <color=green>Con T«m<color> råi! <color> "); 
 else
		for i=1,ca do
			ConsumeEquiproomItem(1,6,1,4804,-1)
		end
 lay_pt_muc()
 end
end
function lay_pt_tom()	-----ca hong
local tbAward = {
		[1]	={szName="Ph¸o §¹i", tbProp = {6, 1, 1353, 1,0,0}, nCount = 150},
		--[2]	={szName="Méc R­¬ng", tbProp = {6, 1, 4777, 1,0,0}, nCount = 25},
		--[3]={szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=25},
		--[4]={szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=25},
		--[5]={szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount=7},			
}
	tbAwardTemplet:GiveAwardByList(tbAward, "PhÇn th­ëng ®æi c¸");
	--Earn(800000) ---1000 van
	Msg2SubWorld("<color=green>Xin chóc mõng "..myplayersex().." <color>"..GetName().." <color=green> ®· ®æi thµnh c«ng <color=fire>30 Con T«m <color>tõ NPC Ng­ Phñ !!!")
end

function doi_tien_ca()
local ca= 2 ---so  luong
local la= CalcItemCount(3,6, 1, 4805, -1) ;
if la < 2 then --so luong
 Talk(2, "", ""..myplayersex().." cßn thiÕu <color=red>"..ca-la.."<color> <color=green>Nµng Tiªn C¸<color> råi! <color> "); 
 else
		for i=1,ca do
			ConsumeEquiproomItem(1,6,1,4805,-1)
		end
 lay_pt_tien_ca()
 end
end
function lay_pt_tien_ca()	-----ca hong
local tbAward = {
		[1]	={szName="Ph¸o §¹i", tbProp = {6, 1, 1353, 1,0,0}, nCount = 400},
		--[2]	={szName="Méc R­¬ng", tbProp = {6, 1, 4777, 1,0,0}, nCount = 200},
		--[3]={szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=200},
		--[4]={szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=200},
		--[5]={szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount=50},			
}
	tbAwardTemplet:GiveAwardByList(tbAward, "PhÇn th­ëng ®æi c¸");
	--Earn(10000000) ---1000 van
	Msg2SubWorld("<color=green>Xin chóc mõng "..myplayersex().." <color>"..GetName().." <color=green> ®· ®æi thµnh c«ng <color=fire><bclr=yellow> 5 Nµng Tiªn C¸<bclr><color> tõ NPC Ng­ Phñ !!!")
end
