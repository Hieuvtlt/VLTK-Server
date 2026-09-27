IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\global\\nobitaxd\\vdk\\simcity\\controllers\\thanhthi.lua")
Include("\\script\\global\\nobitaxd\\vdk\\simcity\\head.lua")
Include("\\script\\global\\nobitaxd\\vdk\\simcity\\controllers\\main.lua")
Include("\\script\\global\\nobitaxd\\vdk\\simcity\\controllers\\keoxe.lua")
Include("\\script\\global\\nobitaxd\\vdk\\simcity\\controllers\\vatnuoi.lua")


DAILAOSU = "<#><link=image[0]:\\spr\\maren.spr>§¹i s­ n©ng cÊp chiÕn m·: <link>"


function main()
	dofile("script/global/vanhungfc/nangcapngua/npc_dailaosu.lua")
	local sex = GetSex();
	if sex == 0 then sex = "Nam" else sex = "N÷" end 
	
	local szTitle = DAILAOSU.."\nQuý <color=green>"..sex.." ®¹i hiÖp<color> cÇn g×? "
	local tbOp = {		
		{"TriÖu håi thó c­ng",main_vatnuoi},
		{"Thuª ®ång hµnh",main_voky},
		{"N©ng cÊp ®å kh«ng thÓ ph¸ hñy",NangCapKhongThePhaHuy},
		{"§æi giíi tÝnh",doigioitinh},
		{"Tho¸t"},	
	}
	CreateNewSayEx(szTitle, tbOp)
	return 1;
end


function doigioitinh()
szTitle = "Xin chµo <color=red>"..GetName().."<color> \nNg­¬i muèn ®æi giíi tÝnh sao ?  ChuÈn bÞ cho ta 300 tiÒn ®ång. H·y nhí r»ng nÕu chuyÓn ThiÕu L©m N÷ vµ Nam Thóy Yªn, Nga Mi th× mét sè trang bÞ kh«ng phï hîp sÏ ph¶i mua thªm mò vµ ¸o thªm ngoµi nÕu muèn tr¶i nghiÖm trän vÑn nh©n vËt ®Æc biÖt! "
local tbOpt =
	{
		{"X¸c nhËn ®æi giíi tÝnh !",DoiGioiTinh},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function KiemTraDoiGioiTinh()

	local nGia = 300

	if GetLevel() <= 100 then
		Msg2Player("<color=green>ChØ nh©n vËt cÊp trªn 100 míi cã thÓ chuyÓn giíi.")
		return 0
	end

	-- B¾t buéc th¸o hÕt trang bÞ 
	if CalcItemCount(2,0,-1,-1,-1) > 0 then
		Msg2Player("<color=green>H·y th¸o hÕt trang bÞ trªn ng­êi  tr­íc khi sèng víi th©n phËn kh¸c!")
		return 0
	end

	local nSoXu = CalcEquiproomItemCount(4,417,1,-1)

	if nSoXu < nGia then
		Msg2Player("<color=green>Ng­¬i kh«ng ®ñ <color=yellow>300 TiÒn §ång<color> kh«ng thÓ chuyÓn giíi.")
		return 0
	end

	return 1

end


function DoiGioiTinh()

	if KiemTraDoiGioiTinh() ~= 1 then
		return
	end

	if GetSex() == 0 then

		Say(
			"Ng­¬i ®· th¸o hÕt trang bÞ.\n\n"..
			"Chi phÝ chuyÓn giíi: <color=yellow>300 TiÒn §ång<color>.\n\n"..
			"Ng­¬i cã ch¾c muèn chuyÓn giíi sang <color=yellow>N÷ Nh©n<color>?",
			2,
			"§ång ý/#DoiGioiTinh_XacNhan()",
			"Huû/no"
		)

	else

		Say(
			"Ng­¬i ®· th¸o hÕt trang bÞ.\n\n"..
			"Chi phÝ chuyÓn giíi: <color=yellow>300 TiÒn §ång<color>.\n\n"..
			"Ng­¬i cã ch¾c muèn chuyÓn giíi sang <color=yellow>Nam Nh©n<color>?",
			2,
			"§ång ý/#DoiGioiTinh_XacNhan()",
			"Huû/no"
		)

	end

end


function DoiGioiTinh_XacNhan()

	local nGia = 300

	-- Re-check toµn bé ®iÒu kiÖn
	if KiemTraDoiGioiTinh() ~= 1 then
		return
	end

	-- Trõ 300 TiÒn §ång
	if ConsumeEquiproomItem(nGia,4,417,1,-1) ~= 1 then
		Msg2Player("<color=green>Ng­¬i kh«ng cã ®ñ <color=yellow> 300 TiÒn §ång<color>, vui lßng thö l¹i.")
		return
	end

	local nOldSex = GetSex()

	local szOldSex
	local szNewSex

	if nOldSex == 0 then
		szOldSex = "Nam Nh©n"
		szNewSex = "N÷ Nh©n"
		SetSex(1)
	else
		szOldSex = "N÷ Nh©n"
		szNewSex = "Nam Nh©n"
		SetSex(0)
	end

	Msg2SubWorld("§¹o h÷u <color=green>"..GetName().."<color> ®· chuyÓn giíi thµnh c«ng tõ <color=gold>"..szOldSex.."<color> sang <color=gold>"..szNewSex.."<color> !")
	AddGlobalNews("§¹o h÷u <color=green>"..GetName().."<color> ®· chuyÓn giíi thµnh c«ng tõ <color=gold>"..szOldSex.."<color> sang <color=gold>"..szNewSex.."<color> !")
	Msg2Player("<color=yellow>ChuyÓn giíi thµnh c«ng. <enter>Tù ®éng kÕt nèi l¹i.<color>")

	KickOutSelf()

end

function NangCapKhongThePhaHuy()

	local szTitle = 
		"N©ng cÊp ®é bÒn trang bÞ thµnh kh«ng thÓ ph¸ hñy.<enter><enter>"..
		"Gi¸ n©ng cÊp : <color=yellow>200 v¹n l­îng x cÊp ®é trang bÞ<color>"

	local tbOpt = {}
	tinsert(tbOpt, {"TiÕn hµnh n©ng cÊp", GiveItemUI_NangCapKhongThePhaHuy})
	tinsert(tbOpt, {"§ãng", no})

	CreateNewSayEx(szTitle, tbOpt)
end

------------------------------------------------

function GiveItemUI_NangCapKhongThePhaHuy()

	GiveItemUI(
		"N©ng cÊp ®é bÒn trang bÞ",
		"§Æt 1 trang bÞ vµo ®Ó n©ng cÊp.<enter><enter>"..
		"+ ChØ 1 trang bÞ mçi lÇn.<enter>"..
		"+ Gi¸ : 200 v¹n l­îng x cÊp ®é trang bÞ.",
		"GiveItemUI_NangCapKhongThePhaHuy_OK",
		nil,
		1
	)
end


------------------------------------------------

function GiveItemUI_NangCapKhongThePhaHuy_OK(nCount)
	if (nCount ~= 1) then
		Talk(1, "", "ChØ ®­îc n©ng cÊp 1 trang bÞ mçi lÇn.")
		return
	end

	local nIdx = GetGiveItemUnit(1)
	if (not nIdx or nIdx <= 0) then
		Talk(1, "", "Kh«ng nhËn ®­îc trang bÞ.")
		return
	end

	local itemLevel = GetItemLevel(nIdx)
	local itemName  = GetItemName(nIdx)
	local durability = GetCurDurability(nIdx)
	local G, D, P = GetItemProp(nIdx)

	if (G == 6 or G == 4 or G == 1 or G == 7) then
		Talk(1, "", "ChØ n©ng cÊp ®­îc trang bÞ (tr¾ng, xanh, tÝm, b¹ch kim).")
		return
	end

	if (durability == -1) then
		Talk(1, "", "Trang bÞ nµy ®· lµ kh«ng thÓ ph¸ hñy.")
		return
	end

	local nMoney = 2000000 * itemLevel

	if (GetCash() < nMoney) then
		Talk(1, "", "Kh«ng ®ñ ng©n l­îng ®Ó n©ng cÊp.")
		return
	end

	Pay(nMoney)

	EH_SetCurDurability(nIdx, -1)

	Talk(1, "", 
		"§· n©ng cÊp thµnh c«ng!<enter><enter>"..
		"Trang bÞ <color=yellow>"..itemName.."<color> ®· trë thµnh kh«ng thÓ ph¸ hñy!"
	)

	Msg2Player("Trang bÞ ®· trë thµnh kh«ng thÓ ph¸ hñy.")
end

