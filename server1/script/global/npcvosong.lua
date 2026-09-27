Include("\\script\\dailogsys\\g_dialog.lua")

-- ==========================================
-- CAU HINH ID NGUYEN LIEU
-- ==========================================
ITEM_CK_LIENHOA = {6, 1, 5123}    -- Can Khon Lien Hoa
ITEM_CK_NHATTHACH = {6, 1, 5125}  -- Can Khon Nhat Thach
ITEM_BANCOTHACH = {6, 1, 5124}    -- Ban Co Thach

-- ==========================================
-- CAU HINH TIEN VAN (LUONG)
-- ==========================================
COST_UP_CANKHON = 100000000  -- 10 Ngan Van (100 Trieu)
COST_UP_VOSONG = 200000000   -- 20 Ngan Van (200 Trieu)

-- ==========================================
-- GIOI HAN ID TRANG BI (TU FILE GOLDEQUIP)
-- ==========================================
ID_VODANH_MIN = 5547
ID_VODANH_MAX = 5661

ID_CANKHON_MIN = 5662
ID_CANKHON_MAX = 5776

-- Khoang cach ID giua cac set (Cung vi tri, khac set)
OFFSET_ID = 115 

-- ==========================================
-- MAIN MENU
-- ==========================================
function main()
	Say(
		"Ta n¾m gi÷ bÝ quyÕt n©ng cÊp thÇn binh lîi khÝ ®Ønh cao nhÊt vâ l©m. Ng­êi muèn g×?", 3,
		"N©ng cÊp V« Danh lªn Cµn Kh«n/up_cankhon",
		"N©ng cÊp Cµn Kh«n lªn V« Song/up_vosong",
		"KÕt thóc/no"
	)
end

function up_cankhon()
	GiveItemUI("N©ng cÊp Cµn Kh«n", "H·y ®Æt vµo chÝnh x¸c: \n- 1 Trang bÞ V« Danh\n- 3 Cµn Kh«n Liªn Hoa\n- 1 Cµn Kh«n NhÊt Th¹ch\n- 10.000 v¹n l­îng", "xuly_up_cankhon", "no", 1)
end

function up_vosong()
	GiveItemUI("N©ng cÊp V« Song", "H·y ®Æt vµo chÝnh x¸c: \n- 1 Trang bÞ Cµn Kh«n\n- 1 Bµn Cæ Th¹ch\n- 20.000 v¹n l­îng", "xuly_up_vosong", "no", 1)
end

-- ==========================================
-- XU LY NANG CAP VO DANH -> CAN KHON
-- ==========================================
function xuly_up_cankhon(nCount)
	if nCount <= 0 then return end
	local nItemVD = 0
	local nLienHoa = 0
	local nNhatThach = 0
	local tbValidItems = {}
	local nIdVoDanh = 0

	-- 1. Kiem tra so luong tien mang theo (GetCash tinh bang luong)
	if GetCash() < COST_UP_CANKHON then
		return Say("Ng­¬i kh«ng ®ñ 10.000 v¹n l­îng mang theo trªn ng­êi!", 0)
	end

	-- 2. Kiem tra nguyen lieu dat vao UI
	for i = 1, nCount do
		local nItemIdx = GetGiveItemUnit(i)
		local nGoldID = GetGlodEqIndex(nItemIdx) or 0
		local nG, nD, nP = GetItemProp(nItemIdx)
		local nStack = GetItemStackCount(nItemIdx)
		if type(nStack) ~= "number" or nStack <= 0 then nStack = 1 end

		if nGoldID >= ID_VODANH_MIN and nGoldID <= ID_VODANH_MAX then
			nItemVD = nItemVD + 1
			nIdVoDanh = nGoldID
			tinsert(tbValidItems, nItemIdx)
		elseif nG == ITEM_CK_LIENHOA[1] and nD == ITEM_CK_LIENHOA[2] and nP == ITEM_CK_LIENHOA[3] then
			nLienHoa = nLienHoa + nStack
			tinsert(tbValidItems, nItemIdx)
		elseif nG == ITEM_CK_NHATTHACH[1] and nD == ITEM_CK_NHATTHACH[2] and nP == ITEM_CK_NHATTHACH[3] then
			nNhatThach = nNhatThach + nStack
			tinsert(tbValidItems, nItemIdx)
		else
			return Say("VËt phÈm kh«ng hîp lÖ! ChØ ®Æt trang bÞ V« Danh, Cµn Kh«n Liªn Hoa vµ Cµn Kh«n NhÊt Th¹ch.", 0)
		end
	end

	if nItemVD ~= 1 or nLienHoa ~= 3 or nNhatThach ~= 1 then
		return Say("Sè l­îng kh«ng hîp lÖ! Yªu cÇu chÝnh x¸c:\n- 1 Trang bÞ V« Danh\n- 3 Cµn Kh«n Liªn Hoa\n- 1 Cµn Kh«n NhÊt Th¹ch", 0)
	end

	if CalcFreeItemCellCount() < 1 then return Say("Hµnh trang ®· ®Çy! Vui lßng dän dÑp tr­íc khi n©ng cÊp.", 0) end

	-- 3. Xoa nguyen lieu
	for i = 1, getn(tbValidItems) do
		RemoveItemByIndex(tbValidItems[i])
	end

	-- 4. Tru tien van
	Pay(COST_UP_CANKHON)

	-- 5. Add trang bi Can Khon bang thuat toan tinh tien ID
	local targetID = nIdVoDanh + OFFSET_ID
	AddGoldItem(0, targetID)
	Msg2Player("N©ng cÊp thµnh c«ng Trang bÞ Cµn Kh«n!")
end

-- ==========================================
-- XU LY NANG CAP CAN KHON -> VO SONG
-- ==========================================
function xuly_up_vosong(nCount)
	if nCount <= 0 then return end
	local nItemCK = 0
	local nBanCo = 0
	local tbValidItems = {}
	local nIdCanKhon = 0

	-- 1. Kiem tra so luong tien mang theo
	if GetCash() < COST_UP_VOSONG then
		return Say("Ng­¬i kh«ng ®ñ 20.000 v¹n l­îng mang theo trªn ng­êi!", 0)
	end

	-- 2. Kiem tra nguyen lieu dat vao UI
	for i = 1, nCount do
		local nItemIdx = GetGiveItemUnit(i)
		local nGoldID = GetGlodEqIndex(nItemIdx) or 0
		local nG, nD, nP = GetItemProp(nItemIdx)
		local nStack = GetItemStackCount(nItemIdx)
		if type(nStack) ~= "number" or nStack <= 0 then nStack = 1 end

		if nGoldID >= ID_CANKHON_MIN and nGoldID <= ID_CANKHON_MAX then
			nItemCK = nItemCK + 1
			nIdCanKhon = nGoldID
			tinsert(tbValidItems, nItemIdx)
		elseif nG == ITEM_BANCOTHACH[1] and nD == ITEM_BANCOTHACH[2] and nP == ITEM_BANCOTHACH[3] then
			nBanCo = nBanCo + nStack
			tinsert(tbValidItems, nItemIdx)
		else
			return Say("VËt phÈm kh«ng hîp lÖ! ChØ ®Æt trang bÞ Cµn Kh«n vµ Bµn Cæ Th¹ch.", 0)
		end
	end

	if nItemCK ~= 1 or nBanCo ~= 1 then
		return Say("Sè l­îng kh«ng hîp lÖ! Yªu cÇu chÝnh x¸c:\n- 1 Trang bÞ Cµn Kh«n\n- 1 Bµn Cæ Th¹ch", 0)
	end

	if CalcFreeItemCellCount() < 1 then return Say("Hµnh trang ®· ®Çy! Vui lßng dän dÑp tr­íc khi n©ng cÊp.", 0) end

	-- 3. Xoa nguyen lieu
	for i = 1, getn(tbValidItems) do
		RemoveItemByIndex(tbValidItems[i])
	end

	-- 4. Tru tien van
	Pay(COST_UP_VOSONG)

	-- 5. Add trang bi Vo Song bang thuat toan tinh tien ID
	local targetID = nIdCanKhon + OFFSET_ID
	AddGoldItem(0, targetID)
	Msg2Player("N©ng cÊp thµnh c«ng Trang bÞ V« Song!")
end

function no()
end