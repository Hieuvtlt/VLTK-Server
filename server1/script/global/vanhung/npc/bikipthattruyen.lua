--Jackie Gaming
--08/10/2019
---------------------
IncludeLib("ITEM");
IncludeLib("SETTING")
IncludeLib("FILESYS")
IncludeLib("LEAGUE");
IncludeLib("TONG")
IncludeLib("RELAYLADDER");
--Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\global\\weapon_ring.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")
--Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
--Include("\\script\\lib\\log.lua")
--Include("\\script\\bonusvlmc\\fucmain.lua")
Include("\\script\\global\\equip_system.lua")
Include("\\script\\global\\vanhung\\npc\\callboss.lua")
--Include("\\script\\global\\npc\\ht_shopvip1.lua")
--Include("\\script\\global\\npc\\shopvip2.lua")
--Include("\\script\\global\\vanhung\\hotrotanthu\\diemdanhhangngay.lua")
Include("\\script\\task\\partner\\education\\swordking_people.lua")
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------BANG HOI--------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")

CAMNANG_ADMIN = "<#><link=image[0]:\\spr\\item\\Nam.spr>CÈm Nang ADMIN: <link>"
if GetSex() == 1 then
CAMNANG_ADMIN = "<#><link=image[0]:\\spr\\item\\Nu.spr>CÈm Nang ADMIN: <link>"
end

function main()
	dofile("script/global/vanhung/npc/bikipthattruyen.lua")
	local sex = GetSex();
	if sex == 0 then sex = "Nam" else sex = "N÷" end 
		local Faction = GetLastFactionNumber();
		local zFaction = "Ch­a gia nhËp m«n ph¸i"
	if Faction == 0 then zFaction = "ThiÕu L©m" 
	elseif Faction == 1 then zFaction = "Thiªn V­¬ng Bang"
	elseif Faction == 2 then zFaction = "§­êng M«n" 
	elseif Faction == 3 then zFaction = "Ngò §éc" 
	elseif Faction == 4 then zFaction = "Nga My" 
	elseif Faction == 5 then zFaction = "Thóy Yªn" 
	elseif Faction == 6 then zFaction = "C¸i Bang" 
	elseif Faction == 7 then zFaction = "Thiªn NhÉn" 
	elseif Faction == 8 then zFaction = "Vâ §ang" 
	elseif Faction == 9 then zFaction = "C«n L«n" 
	elseif Faction == 10 then zFaction = "Hoa S¬n"
	end
	local nMoney = GetBoxMoney()+ GetCash()
	local sMoney = nMoney/10000
	local szTitle ="<color=red>Häc vâ häc ph¸i hoa s¬n hay tÈy tñy ? Song tu ®¹i ph¸p, ta cã thÓ truyÒn thô bé vâ häc Hoa S¬n cho ng­¬i. Ng­¬i ®· s½n sµng  !"
	local tbOpt =
	{
		{"Céng §iÓm nhanh", tangdiemnhanh},	
		{"TÈy tñy", TayTuyNhanh},	
		{"NhËn vâ Häc Hoa S¬n", fix_skill_hs},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
	return 1;
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------- HOA SON
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function fix_skill_hs()
AddMagic(1347) --Skill Hoa son
		AddMagic(1372) --Skill Hoa son
		AddMagic(1349) --Skill Hoa son
		AddMagic(1374) --Skill Hoa son
		AddMagic(1350) --Skill Hoa son
		AddMagic(1375) --Skill Hoa son
		AddMagic(1351) --Skill Hoa son
		AddMagic(1376) --Skill Hoa son
		AddMagic(1354) --Skill Hoa son
		AddMagic(1355) --Skill Hoa son
		AddMagic(1358) --Skill Hoa son
		AddMagic(1360) --Skill Hoa son
		AddMagic(1380) --Skill Hoa son
		AddMagic(1364,20) --Skill Hoa son
		AddMagic(1382,1) --Skill Hoa son
		AddMagic(1365,20) --Skill Hoa son
		AddMagic(1369,20) --Skill Hoa son
		AddMagic(1384,20) --Skill Hoa son
		AddMagic(1368,20) --Skill Hoa son --------Doc Co Cuu Kiem
		KickOutSelf()
end

-- Quan ly nhan vat
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function ManageCharacterSystem()
local szTitle = CAMNANG.."<color=red>Song tu ®¹i ph¸p, ta cã thÓ truyÒn thô bé vâ häc Hoa S¬n cho ng­¬i. Ng­¬i ®· s½n sµng  !"
		local tbOpt =
	{
		{"§æi tªn nh©n vËt", DoiTenNV},
		{"Gäi b¹n ®ång hµnh", partner_getdust1},
		{"Hñy trang bÞ khãa", deltem},	
		{"Xem sè ng­êi ch¬i ®ang Online", dkgm9},
		{"§æi r¸c lÊy vò khÝ ngÉu nhiªn", doirac},
		{"Trë l¹i",main},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	
end

-----Xoa vat pham
----------------------------------------------------------------------------------------------------------------------------------------------------------------
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


function TayTuyNhanh()
	local tbSay = {"Ng­¬i muèn tÈy tñy lo¹i g× ®©y?"}
		tinsert(tbSay, "TÈy ®iÓm kü n¨ng/taydiemkynang")
		tinsert(tbSay, "TÈy ®iÓm tiÒm n¨ng/taydiemtiemnang")
		tinsert(tbSay, "KÕt thóc ®èi tho¹i./OnCancel")
	CreateTaskSay(tbSay)
end

function taydiemkynang()
	Say("Ng­¬i ®ång ý TÈy ®iÓm kü n¨ng kh«ng?", 2, "TÈy ®iÓm kü n¨ng /taydiemkynangok","Kh«ng tÈy /OnCancel")
end

function taydiemkynangok()
	i = HaveMagic(210)
	j = HaveMagic(400)
	n = RollbackSkill()
	x = 0
	if (i ~= -1) then x = x + i end
	if (j ~= -1) then x = x + j end
	rollback_point = n - x
	if (rollback_point + GetMagicPoint() < 0) then
		rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210,i) end
	if (j ~= -1) then AddMagic(400,j) end
	Msg2Player("TÈy Tñy thµnh c«ng! ng­¬i ®· cã thÓ ph©n phèi "..rollback_point.." ®iÓm. ")
	Talk(1,"KickOutSelf","TÈy Tñy thµnh c«ng! ng­¬i ®· cã thÓ ph©n phèi "..rollback_point.." ®iÓm.")
end

function taydiemtiemnang()
	Say("Ng­¬i ®ång ý tÈy ®iÓm tiÒm n¨ng kh«ng?", 2, "TÈy ®iÓm tiÒm n¨ng/taydiemtiemnangok", "Kh«ng tÈy /OnCancel")
end

function taydiemtiemnangok()
	base_str = {35,20,25,30,20}
	base_dex = {25,35,25,20,15}
	base_vit = {25,20,25,30,25}
	base_eng = {15,25,25,20,40}
	player_series = GetSeries() + 1
	Utask88 = GetTask(88)
	AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))
	AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
	AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
	AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
end

function tangdiemnhanh()
	Say("ThÝch Minh: Ng­¬i muèn t¨ng ®iÓm kü n¨ng nµo?", 4,
		"T¨ng Søc M¹nh/add_prop_str",
		"T¨ng Th©n Ph¸p/add_prop_dex",
		"T¨ng Ngo¹i C«ng/add_prop_vit",
		"T¨ng Néi C«ng/add_prop_eng")
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "Xin h·y nhËp ®iÓm sè søc m¹nh: ");
end

function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "Xin h·y nhËp ®iÓm sè th©n ph¸p: ");
end

function add_prop_vit()
	AskClientForNumber("enter_vit_num", 0, GetProp(), "Xin h·y nhËp ®iÓm sè ngo¹i c«ng:");
end

function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0, GetProp(), "Xin h·y nhËp ®iÓm sè néi c«ng: ");
end

function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end

function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end

function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end

function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end
function OnCancel()
end;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
---So nguoi online
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function dkgm9()
Msg2Player("<color=yellow>HiÖn t¹i ®ang cã<color><color=green> "..GetPlayerCount().."<color> Ng­­êi Online !.")
Say("HiÖn t¹i ®ang cã <color=green> "..GetPlayerCount().." <color> ng­êi Online")
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------Bang Hoi----------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function ManageTongSystem()
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
	local szTitle = CAMNANG"Xin chµo ! <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>"..GetPlayerCount().."<color>"
	local tbOpt =
	{
		{"NhËn §iÒu KiÖn T¹o Bang Héi",dmcreatetong},
		{"Gia NhËp Bang Héi",dmjointong},
		{"T¹o Bang Héi",dmcreateit},
		{"Trë L¹i",main},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
	else
	Say(szTitle,0)
	end
end

function dmcreatetong()	
		SetCamp(4)
		SetCurCamp(4)
		AddRepute(1000);
		FuYuan_Start();
		FuYuan_Add(1000);
		AddLeadExp(20000)
		AddEventItem(195)
		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end
Msg2Player("<color=yellow>Ng­¬i ®· héi ®ñ tÊt c¶ ®iªu kiÖn ®Ó t¹o Bang Héi!<color>")
end

function dmjointong()
if  GetCamp() ~= 4 then
		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end
		SetCamp(4)
		SetCurCamp(4)
Msg2Player("<color=yellow>Gia nhËp Bang héi thµnh c«ng!<color>")
else
end
end
function dmcreateit()
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("Kiªm hiÖp ch­ëng m«n nh©n:Khai s¸ng bang héi, më réng b¸ nghiÖp." ,2,"B¾t ®Çu dùng bang/Direct_CreateTong","§îi ta mét chót/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay", "Ng­êi ch¬i: Kiªm hiÖp ch­ëng m«n nh©n, xin hái ta ph¶i lµm nh­ thÕ nµo míi ca thÓ khai t«ng lËp ph¸i trë thµnh Bang chñ ®©y?", "Kiªm hiÖp ch­ëng m«n nh©n: §Çu tiªn ng­¬i ph¶i cã ®ñ n¨ng lùc l·nh ®¹o, cã 16 ng­êi cïng chÝ h­íng cïng ng­¬i lËp bang, tr¶i qua 3 ngµy Kh¶o NghiÖm Kú ", "Ch­ëng m«n nh©n:  NÕu trong 3 ngµy cã ng­êi rêi bang th× néi trong 3 ngµy ®ã ng­¬i ph¶i t×m ng­êi kh¸c thay thÕ.", "Ch­ëng m«n nh©n:  Ng­¬i ph¶i cã ®ñ tµi l·nh ®¹o vµ tÝn vËt ®ã lµ Nh¹c V­¬ng KiÕm", "Ng­êi ch¬i: Nh¹c V­¬ng Kiªm ? Ng­êi nãi lµ thanh kiªm nµy µ ? ", "Kiªm hiÖp ch­ëng m«n nh©n : Th× ra lµ ng­¬i ®· cã nã... Kh«ng tÖ, qu¶ nhiªn tuæi trÎ tµi cao!!! ")
	else	
		i = random(0,1)
		if (i == 0) then
			Talk(1,"", "Kiªm hiÖp ch­ëng m«n nh©n: Nªu nh­ muèn thµnh lËp bang héi, ng­¬i cã thÓ v× nã bá ra 1 l­îng lín thêi gian, søc lùc cïng t©m huyÕt, kh«ng thÓ n÷a ®­êng hñy bá." )
		else
			Talk(6,"", "Kiªm hiÖp ch­ëng m«n nh©n:  Ng­¬i muèn hái ®iÒu kiÖn lËp bang µ? §Ó ta nãi cho ng­¬i râ.", "Kiªm hiÖp ch­ëng m«n nh©n: ®Çu tiªn ph¶i xuÊt x­,  tiªp theo ng­¬i kh«ng thÓ ë bÊt kú bang héi nµo kh¸c, ng­¬i nhÊt ®inh ph¶i cã danh väng giang hå, cuèi cïng lµ tµi l·nh ®¹o ph¶i h¬n 30 cÊp.", "Kiªm hiÖp ch­ëng m«n nh©n: Sau ®ã ®i chiÕn tr­êng t×m mét thanh Nh¹c V­¬ng Kiªm lµm bang chñ tÝn vËt lµ ®­îc råi.")
		end
	end
end

function create_pay()
	Say("Kiªm hiÖp ch­ëng m«n nh©n: Ng­¬i cÇn lÖ phi lµ 100 v¹n l­îng b¹c." ,2,"Kh«ng thµnh vÊn ®ª, ta cã ®em 100v l­îng ®©y! /create_pay_yes","Ta kh«ng ®em ®ñ tiªn råi. /create_pay_no")
end
function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)		
		DelItem(195)		
		SetTask(99,1)				
		Direct_CreateTong()		
	else
		Talk(1,"", "Kiªm hiÖp ch­ëng m«n nh©n: ViÖc duy tr× bang héi rÊt tèn kÐm, ng­êi ph¶i cè g¾ng cïng mäi ng­êi tÝch gãp ®Ó Bang Héi ®­îc giµu m¹nh. ")	end
end

function Direct_CreateTong()
	CreateTong(1)				
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Tang hinh
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function HideFeature()
local szTitle = CAMNANG_ADMIN.."Xin chµo Gamemaster <color=red>"..GetName().."!<color>"
	local tbOption = {};
	if (GetSkillState(733) == -1) then
		tinsert(tbOption, {"BËt tÝnh n¨ng tµng h×nh", GMHide})
	else
		tinsert(tbOption, {"T¾t tÝnh n¨ng tµng h×nh", GMShow})
	end
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle, tbOption)
end

function GMHide()
	AddSkillState(733,1,0,777600);
	Msg2Player("BËt chøc n¨ng Èn th©n cho GM");
end

function GMShow()
	AddSkillState(733,1,0,18*1);
	Msg2Player("T¾t chøc n¨ng Èn th©n cho GM");
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Thay doi hinh dang Gamemaster
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function ChangeMaskFeature()
local szTitle = CAMNANG_ADMIN.."Xin chµo Gamemaster <color=red>"..GetName().."!<color> <enter> TÝnh n¨ng biÕn thµnh <color=red>GameMaster.<color>"
	local tbOption = {};
	if (IsOwnFeatureChanged() == 0) then
		tinsert(tbOption, {"BËt tÝnh n¨ng biÕn h×nh", ChangeMask})
	else
		tinsert(tbOption, {"T¾t tÝnh n¨ng biÕn h×nh", RestoreMask})
	end
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle, tbOption)
end

function ChangeMask()
	ChangeOwnFeature(0,0,567);
	Msg2Player("BiÕn thµnh h×nh d¹ng GM");
end

function RestoreMask()
	RestoreOwnFeature();
	Msg2Player("Trë l¹i h×nh d¹ng ban ®Çu");
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Quan ly nguoi choi
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function ManagePlayerSystem()
    local nNam = tonumber(GetLocalDate("%Y")); 
    local nThang = tonumber(GetLocalDate("%m")); 
    local nNgay = tonumber(GetLocalDate("%d")); 
    local nGio = tonumber(GetLocalDate("%H")); 
    local nPhut = tonumber(GetLocalDate("%M")); 
    local nGiay = tonumber(GetLocalDate("%S")); 
    local nW, nX, nY = GetWorldPos() 
    local nIdPlay = PlayerIndex 
    local tbSay = {}
			tinsert(tbSay,"Thao t¸c lªn ng­êi ch¬i./luachonid1")
			tinsert(tbSay,"Call Boss New./kimquang11")
			tinsert(tbSay,"NhËn Tói Xu./tuixu")
			tinsert(tbSay,"Më Shop TiÒn V¹n/shop11")
			tinsert(tbSay,"ChÕ T¹o §å TÝm/onFoundryItem")
			tinsert(tbSay,"Reload Script./ReLoadScript")
			tinsert(tbSay,"Tho¸t/no")
			tinsert(tbSay,"Trë l¹i.")
		Say("Xin Chµo <color=red>"..GetName().."<color>!\nTäa ®é hiÖn t¹i: <color=green>"..nW.."<color> <color=blue>"..nX.."/"..nY.."<color> \n<color>Index:           <color=green>"..nIdPlay.."<color>\nSè SHXT: <color=green>        "..GetTask(T_SonHaXaTac).."<color> m¶nh.\nHiÖn §ang Cã:    <bclr=red><color=yellow>["..GetPlayerCount().."]<color><bclr> ng­êi ch¬i trong game.\n", getn(tbSay), tbSay)


end

function kimquang11() 
Auto_TestBoss()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
---Tui Xu---
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function tuixu()
AskClientForNumber("tuixu1",0,999,"NhËp Sè L­îng:") 
end;

function tuixu1(sltuixu)
for i = 1, sltuixu do
local tuixujackie = AddItem (6,1,4869,0,0,0)
SetItemBindState(tuixujackie,-2)
end
Msg2Player("B¹n nhËn ®­îc <color=yellow>"..sltuixu.." <color>Tói Xu.")
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Thao tac nguoi choi
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function luachonid1() 
AskClientForNumber("one",0,5000,"NhËp ID ng­êi ch¬i") 
end 

function one(num) 
if ((num)>GetPlayerCount()) then 
Msg2Player("Kh«ng cã nh©n vËt víi ID: <color=green>"..num.."<color> ®­îc chän !!"); 
else 
SetTaskTemp(200,num) 
    gmName=GetName() 
    gmidx=PlayerIndex 
    PlayerIndex=GetTaskTemp(200) 
    tk=GetAccount() 
    lev=GetLevel() 
    xp=GetExp() 
    cam=GetCamp() 
    fac=GetFaction() 
    cash=GetCash() 
    lif=GetExtPoint() 
    man=GetMana() 
    apo=GetEnergy() 
    spo=GetRestSP() 
    cr=GetColdR() 
    pr=GetTask(747) 
    phr=GetPhyR() 
    fr=GetFireR() 
    lr=GetLightR() 
    eng=GetEng() 
    dex=GetDex() 
    strg=GetStrg() 
    vit=GetVit() 
    w,x,y=GetWorldPos() 
    xinxi = GetInfo() 
    ObjName=GetName() 
    PlayerIndex=gmidx 
    Msg2Player("Nh©n vËt tªn:<color=metal> "..ObjName.."<color>"); 
    local tbSay=  {}
			tinsert(tbSay,"T¨ng cÊp ®é cho ng­êi ch¬i./tangcap1")
			tinsert(tbSay,"Hæ trî tiÒn ®ång./bufskillsgm1")
			tinsert(tbSay,"Hæ trî tiÒn v¹n./themtienvan1")
			tinsert(tbSay,"Di chuyÓn nh©n vËt vÒ BLH./move")
            tinsert(tbSay,"KÝch nh©n vËt./kick")
			tinsert(tbSay,"CÊm Ch¸t./camchat")
			tinsert(tbSay,"Më Ch¸t./mochat")
            tinsert(tbSay,"Tho¸t./no")
			tinsert(tbSay,"Trë l¹i.")            
    Say("- Tµi Kho¶n:<color=green> "..tk.."<color>       - Nh©n VËt   :<color=green> "..ObjName.."<color>\n- CÊp ®é   :<color=green> "..lev.."<color>           - Kinh nghiÖm: <color=green>"..xp.."%<color>\n- Mµu      :<color=green> "..cam.."<color>            - M«n ph¸i   : <color=green>"..fac.."<color>\n- TiÒn MÆt :<color=green> "..(cash/10000).." v¹n<color>   - TiÒn §ång  : <color=green>"..lif.." ®ång<color>\n- VÞ trÝ   : <color=blue>"..w.."<color>,<color=green>"..x.."<color>,<color=green>"..y.."<color>", getn(tbSay), tbSay)
    Msg2Player("Ng­êi ch¬i <color=cyan>"..xinxi) 
end 
end; 

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Them tien van
----------------------------------------------------------------------------------------------------------------------------------------------------------------

function themtienvan1() 
AskClientForNumber("themtienvan",0,2000000000,"NhËp sè tiÒn cÇn chuyÓn") 
end 

function themtienvan(num) 
nNum = num/10000 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· thªm <color=metal>"..nNum.."<color> v¹n l­îng cho b¹n !"); 
Earn(num) 
PlayerIndex=gmidx 
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n thªm <color=metal>"..nNum.."<color> v¹n l­îng thµnh c«ng"); 
end; 

function bufskillsgm1() 
AskClientForNumber("buffskillsgm",0,500,"sè l­îng tiÒn ®ång") 
end 

function buffskillsgm(num) 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· chuyÓn <color=metal>"..num.."<color> tiÒn ®ång cho b¹n !"); 
AddStackItem(num,4,417,1,1,0,0,0) 
PlayerIndex=gmidx 
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> tiÒn ®ång thµnh c«ng"); 
end;

function tangcap1() 
AskClientForNumber("tangcap",0,200,"cÊp cÇn t¨ng") 
end 

function tangcap(num) 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· t¨ng <color=metal>"..num.."<color> cÊp ®é cho b¹n !"); 
for i=1,num  do 
AddOwnExp(999999999999) 
end 
PlayerIndex=gmidx 
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n t¨ng <color=metal>"..num.."<color> cÊp ®é thµnh c«ng"); 
end; 

function move() 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
w,x,y=GetWorldPos() 
if (w~=53) then 
SetFightState(0) 
NewWorld(53,200*8,200*16) 
else 
SetPos(1630, 3255) 
end 
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· di chuyÓn b¹n vÒ Ba L¨ng HuyÖn"); 
PlayerIndex=gmidx 
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n di chuyÓn vÒ Ba LÆng HuyÖn thµnh c«ng"); 
end 

function kick() 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· kick kÑt tµi kho¶n cho b¹n"); 
KickOutSelf() 
PlayerIndex=gmidx 
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n kick kÑt tµi kho¶n thµnh c«ng"); 
end; 

function camchat() 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
SetChatFlag(1) 
Msg2Player("B¹n bÞ khãa Ch¸t trªn mäi tÇn sè !") 
PlayerIndex=gmidx 
AddGlobalCountNews("Nh©n VËt:<color=red> "..ObjName.."<color> §· BÞ CÊm Chat Trªn Mäi TÇn Sè !",1) 
end 

function mochat() 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
SetChatFlag(0) 
Msg2Player("B¹n ®­îc më khãa Ch¸t trªn mäi tÇn sè !") 
PlayerIndex=gmidx 
AddGlobalCountNews("Nh©n VËt:<color=green> "..ObjName.."<color> §­îc Më Chat Trªn Mäi TÇn Sè !",1)  
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Shop tien van
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function shop11()
Sale(179); 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Che tao vu khi
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function onFoundryItem() 
FoundryItem();     
end 

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Reload script
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function NhapDuongDan(Link)
        local ReloadScript = LoadScript(Link);
        if (FALSE(ReloadScript )) then
            Msg2Player("XuÊt hiÖn lçi, kh«ng thÓ Reload!<enter><color=yellow>"..Link.."");
        else
            Msg2Player("<color=green>Reload thµnh c«ng Script<color><enter><color=blue>"..Link.."");
        end
end

function ReLoadScript()
    return AskClientForString("NhapDuongDan", "", 1, 500, "<#>NhËp ®­êng dÉn")
end  


