Include("\\script\\dailogsys\\g_dialog.lua")

-- ==========================================
-- CAU HINH ID NGUYEN LIEU
-- ==========================================
ITEM_TIENDONG_GENRE = 4
ITEM_TIENDONG_DETAIL = 417
ITEM_TIENDONG_PART = 1

ITEM_MANHHK_GENRE = 6
ITEM_MANHHK_DETAIL = 1
ITEM_MANHHK_PART = 5128

-- DANH SACH CAC TU KHOA HKMP (DUOC TACH THANH 10)
tbPrefix10 = {
	"Méng Long", "Phôc Ma", "Tø Kh«ng", "H¸m Thiªn", "KÕ NghiÖp",
	"Ngù Long", "V« Gian", "V« Ma", "V« YÓm", "TÒ Hoµng", "BÝch H¶i",
	"U Lung", "Minh ¶o", "B¨ng Hµn", "Thiªn Quang", "S©m Hoang",
	"§ång Cõu", "§Þch Kh¸i", "Ma S¸t", "Ma ThÞ", "L¨ng Nh¹c",
	"CËp Phong", "S­¬ng Tinh", "L«i Khung", 
	"Thanh C©u", "V¹n Léc", "Th­¬ng Lang", "HuyÒn Viªn", 
	"V« Danh", "Cµn Kh«n", "V« Song",
	-- BO SUNG 5 HE PHAI BUFF (TCVN3 GOC)
	"V« TrÇn", "§Þa Ph¸ch", "Vô ¶o", "Ma Hoµng", "Chó Ph­îc", "Chó Phäc", "Chó Ph­íc"
}

-- DANH SACH CAC TU KHOA KHONG DUOC TACH
tbPrefixBan = {
	"Thiªn Hoµng", "Kim Phong"
}

-- ==========================================
-- MAIN MENU
-- ==========================================
function main()
	Say(
		"Ta lµ chuyªn gia ph©n t¸ch trang bÞ. Ng­êi muèn ph©n t¸ch b¶o vËt lÊy g×?", 3,
		"1. Ph©n t¸ch lÊy TiÒn §ång/ra_tiendong",
		"2. Ph©n t¸ch lÊy M¶nh Hoµng Kim/ra_manh",
		"KÕt thóc/no"
	)
end

function KiemTraGoldIDHopLe(nGoldID)
	-- Kiem tra xem co phai ID do Hoang Kim hop le khong
	if nGoldID >= 1 and nGoldID <= 10000 then
		if nGoldID >= 168 and nGoldID <= 185 then
			return 0
		end
		return 1
	end
	return 0
end

-- ==========================================
-- TINH TOAN SO LUONG PHAN TACH
-- ==========================================
function GetDismantleReward(strName)
	-- 1. Kiem tra do bi cam (Kim Phong, Thien Hoang)
	for i=1, getn(tbPrefixBan) do
		if strfind(strName, tbPrefixBan[i]) then
			return 0 -- Khong duoc phan tach
		end
	end
	
	-- 2. Kiem tra do HKMP (Duoc 10 manh / 10 tien dong)
	for i=1, getn(tbPrefix10) do
		if strfind(strName, tbPrefix10[i]) then
			return 10
		end
	end
	
	-- 3. Tat ca cac do Hoang Kim khac chi duoc 1 manh / 1 tien dong
	return 1
end

-- ==========================================
-- PHAN TACH TIEN DONG
-- ==========================================
function ra_tiendong()
	GiveItemUI("Ph©n Gi¶i TiÒn §ång", "H·y ®Æt vµo ®óng 1 mãn ®å Hoµng Kim ®Ó r· lÊy TiÒn §ång. Trang bÞ HKMP sÏ nhËn ®­îc 10, trang bÞ cßn l¹i nhËn 1.", "xuly_ra_tiendong", "no", 1)
end

function xuly_ra_tiendong(nCount)
	if nCount ~= 1 then return Say("Ng­êi chØ ®­îc ®Æt vµo chÝnh x¸c 1 mãn ®å mçi lÇn r·!", 0) end
	local nItemIdx = GetGiveItemUnit(1)
	local nGoldID = GetGlodEqIndex(nItemIdx) or 0 

	if KiemTraGoldIDHopLe(nGoldID) ~= 1 then return Say("VËt phÈm nµy kh«ng ph¶i ®å Hoµng Kim, kh«ng thÓ ph©n t¸ch!", 0) end
	
	local strName = GetItemName(nItemIdx)
	local nCoinReward = GetDismantleReward(strName)
	
	if nCoinReward == 0 then
		return Say("Trang bÞ Kim Phong vµ Thiªn Hoµng kh«ng thÓ ph©n t¸ch!", 0)
	end

	if CalcFreeItemCellCount() < nCoinReward then return Say("Hµnh trang cña ng­êi cÇn tèi thiÓu "..nCoinReward.."  « trèng.", 0) end

	RemoveItemByIndex(nItemIdx)
	for i = 1, nCoinReward do
		AddItem(ITEM_TIENDONG_GENRE, ITEM_TIENDONG_DETAIL, ITEM_TIENDONG_PART, 1, 0, 0)
	end
	Msg2Player("R· thµnh c«ng! NhËn ®­îc "..nCoinReward.." TiÒn §ång.")
end

-- ==========================================
-- PHAN TACH MANH HOANG KIM
-- ==========================================
function ra_manh()
	GiveItemUI("Ph©n Gi¶i M¶nh HK", "H·y ®Æt vµo ®óng 1 mãn ®å Hoµng Kim ®Ó r· lÊy M¶nh HKMP. Trang bÞ HKMP sÏ nhËn ®­îc 10, trang bÞ cßn l¹i nhËn 1.", "xuly_ra_manh", "no", 1)
end

function xuly_ra_manh(nCount)
	if nCount ~= 1 then return Say("Ng­êi chØ ®­îc ®Æt vµo chÝnh x¸c 1 mãn ®å mçi lÇn r·!", 0) end
	local nItemIdx = GetGiveItemUnit(1)
	local nGoldID = GetGlodEqIndex(nItemIdx) or 0

	if KiemTraGoldIDHopLe(nGoldID) ~= 1 then return Say("VËt phÈm nµy kh«ng ph¶i ®å Hoµng Kim, kh«ng thÓ ph©n t¸ch!", 0) end
	
	local strName = GetItemName(nItemIdx)
	local nReward = GetDismantleReward(strName)
	
	if nReward == 0 then
		return Say("Trang bÞ Kim Phong vµ Thiªn Hoµng kh«ng thÓ ph©n t¸ch!", 0)
	end
	
	if CalcFreeItemCellCount() < nReward then return Say("Hµnh trang ®· ®Çy! CÇn Ýt nhÊt "..nReward.." « trèng.", 0) end

	RemoveItemByIndex(nItemIdx)
	for i = 1, nReward do
		AddItem(ITEM_MANHHK_GENRE, ITEM_MANHHK_DETAIL, ITEM_MANHHK_PART, 1, 0, 0)
	end
	Msg2Player("R· thµnh c«ng! NhËn ®­îc "..nReward.." M¶nh Hoµng Kim §a N¨ng.")
end

function no()
end