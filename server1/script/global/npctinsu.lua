Include("\\script\\dailogsys\\g_dialog.lua")

-- ==========================================
-- C?U HÌNH ID VÀ TASK
-- ==========================================
TASK_TINSU = 1205

-- ID VËt phÈm b¸n
ID_THIENKYTHAO = 5121
ID_HOANGPHUONG = 5122

-- Gi¸ ®iÓm TÝn Sø
PRICE_THIENKYTHAO = 8000
PRICE_HOANGPHUONG = 12000

-- ==========================================
-- MENU CHÍNH
-- ==========================================
function main()
	local nDiem = GetTask(TASK_TINSU)
	Say(
		"HiÖn t¹i ng­¬i ®ang cã <color=green>"..nDiem.." ®iÓm TÝn Sø.<color>\nNg­¬i muèn thùc hiÖn giao dÞch g×?",
		5,
		"§æi Thiªn Kú Th¶o/menu_thienkythao",
		"§æi Hoµng Ph­îng NhËt Ngäc/menu_hoangphuong",
		"§æi VËt phÈm lÊy ®iÓm TÝn Sø/doivatpham_ui",
		"GhÐp Bµn Cæ Th¹ch/doibancothach_ui",
		"KÕt thóc/no"
	)
end

-- ==========================================
-- CH?C NANG 1: Ð?I THIÊN K? TH?O
-- ==========================================
function menu_thienkythao()
	Say("Ng­¬i muèn ®æi bao nhiªu Thiªn Kú Th¶o (Gi¸ 8.000 ®iÓm/c¸i)?", 3,
		"§æi 1 c¸i (8.000 ®iÓm)/buy_thienkythao_1",
		"§æi 2 c¸i (16.000 ®iÓm)/buy_thienkythao_2",
		"Quay l¹i/main"
	)
end

function buy_thienkythao_1() xuly_mua_tinsu(ID_THIENKYTHAO, 1, PRICE_THIENKYTHAO, "Thiªn Kú Th¶o") end
function buy_thienkythao_2() xuly_mua_tinsu(ID_THIENKYTHAO, 2, PRICE_THIENKYTHAO, "Thiªn Kú Th¶o") end

-- ==========================================
-- CH?C NANG 2: Ð?I HOÀNG PHU?NG NH?T NG?C
-- ==========================================
function menu_hoangphuong()
	Say("Ng­¬i muèn ®æi bao nhiªu Hoµng Ph­îng NhËt Ngäc (Gi¸ 12.000 ®iÓm/c¸i)?", 3,
		"§æi 1 c¸i (12.000 ®iÓm)/buy_hoangphuong_1",
		"§æi 2 c¸i (24.000 ®iÓm)/buy_hoangphuong_2",
		"Quay l¹i/main"
	)
end

function buy_hoangphuong_1() xuly_mua_tinsu(ID_HOANGPHUONG, 1, PRICE_HOANGPHUONG, "Hoµng Ph­îng NhËt Ngäc") end
function buy_hoangphuong_2() xuly_mua_tinsu(ID_HOANGPHUONG, 2, PRICE_HOANGPHUONG, "Hoµng Ph­îng NhËt Ngäc") end

-- Hµm dïng chung ®Ó trõ ®iÓm vµ nhËn vËt phÈm
function xuly_mua_tinsu(nIdItem, nAmount, nPrice, szName)
	local nTotalCost = nPrice * nAmount
	local nMyPoints = GetTask(TASK_TINSU)
	
	if nMyPoints < nTotalCost then
		Say("Ng­¬i kh«ng ®ñ ®iÓm TÝn Sø! CÇn <color=yellow>"..nTotalCost.." ®iÓm<color> ®Ó ®æi "..nAmount.." "..szName..".", 0)
		return
	end

	if CalcFreeItemCellCount() < nAmount then
		Say("Hµnh trang cña ng­¬i cÇn tèi thiÓu "..nAmount.." « trèng!", 0)
		return
	end

	SetTask(TASK_TINSU, nMyPoints - nTotalCost)
	for i = 1, nAmount do
		AddItem(6, 1, nIdItem, 1, 0, 0)
	end
	Msg2Player("§æi thµnh c«ng "..nAmount.." "..szName.."!")
end

-- ==========================================
-- CH?C NANG 3: Ð?I V?T PH?M L?Y ÐI?M TÍN S?
-- ==========================================
function doivatpham_ui()
	GiveItemUI("§æi §iÓm TÝn Sø", "H·y ®Æt vµo VLMT (26), TTK (22), Cèng NguyÖt (128) hoÆc Phông NguyÖt (127). Mçi vËt phÈm = 400 ®iÓm TÝn Sø.", "xuly_doivatpham", "no", 1)
end

function xuly_doivatpham(nCount)
	if nCount <= 0 then return end
	local total_points = 0
	local tbValidItems = {}

	for i = 1, nCount do
		local nItemIdx = GetGiveItemUnit(i)
		local nG, nD, nP = GetItemProp(nItemIdx)
		local nStack = GetItemStackCount(nItemIdx)
		
		-- Xö lý lçi stack
		if type(nStack) ~= "number" or nStack <= 0 then nStack = 1 end

		local isMatch = 0
		if nG == 6 and nD == 1 then
			if nP == 26 or nP == 22 or nP == 128 or nP == 127 then
				isMatch = 1
			end
		end

		if isMatch == 1 then
			-- TÝnh to¸n ®iÓm dùa trªn sè l­îng xÕp chång (stack)
			total_points = total_points + (nStack * 400)
			tinsert(tbValidItems, nItemIdx)
		else
			Say("VËt phÈm kh«ng hîp lÖ! Ta chØ nhËn VLMT, TTK, Cèng NguyÖt Qu¶ Dung vµ Phông NguyÖt Qu¶ Dung.", 0)
			return
		end
	end

	-- Xãa tÊt c¶ vËt phÈm hîp lÖ ®· ®Æt vµo
	for i = 1, getn(tbValidItems) do
		RemoveItemByIndex(tbValidItems[i])
	end

	-- Céng ®iÓm TÝn Sø
	local current_points = GetTask(TASK_TINSU)
	SetTask(TASK_TINSU, current_points + total_points)
	Msg2Player("Giao dÞch thµnh c«ng! B¹n nhËn ®­îc " .. total_points .. " ®iÓm TÝn Sø.")
end

-- ==========================================
-- CH?C NANG 4: GHÉP BÀN C? TH?CH (DÙNG UI)
-- ==========================================
function doibancothach_ui()
	GiveItemUI("GhÐp Bµn Cæ Th¹ch", "H·y t¸ch vµ ®Æt vµo ®óng 50 Cµn Kh«n NhÊt Th¹ch (5125) vµ 20 Cµn Kh«n Liªn Hoa (5123).", "xuly_bancothach", "no", 1)
end

function xuly_bancothach(nCount)
	if nCount <= 0 then return end
	
	local countNhatThach = 0
	local countLienHoa = 0
	local tbItems = {}

	for i = 1, nCount do
		local nItemIdx = GetGiveItemUnit(i)
		local nG, nD, nP = GetItemProp(nItemIdx)
		local nStack = GetItemStackCount(nItemIdx)
		
		if type(nStack) ~= "number" or nStack <= 0 then nStack = 1 end

		if nG == 6 and nD == 1 and nP == 5125 then
			countNhatThach = countNhatThach + nStack
			tinsert(tbItems, nItemIdx)
		elseif nG == 6 and nD == 1 and nP == 5123 then
			countLienHoa = countLienHoa + nStack
			tinsert(tbItems, nItemIdx)
		else
			Say("VËt phÈm kh«ng hîp lÖ! ChØ ®­îc ®Æt Cµn Kh«n NhÊt Th¹ch vµ Cµn Kh«n Liªn Hoa vµo ®©y.", 0)
			return
		end
	end

	-- KiÓm tra sè l­îng chÝnh x¸c (B¶o vÖ ng­êi ch¬i kh«ng bÞ x¸c nhËn xãa l©m vµo c¸c stack bÞ d­)
	if countNhatThach == 50 and countLienHoa == 20 then
		
		-- KiÓm tra r­¬ng
		if CalcFreeItemCellCount() < 1 then
			Say("Hµnh trang cña ng­¬i cÇn tèi thiÓu 1 « trèng ®Ó chøa Bµn Cæ Th¹ch!", 0)
			return
		end
		
		-- Xãa tÊt c¶ vËt phÈm hîp lÖ ®· ®Æt vµo
		for i = 1, getn(tbItems) do
			RemoveItemByIndex(tbItems[i])
		end
		
		-- Tr¶ bµn cæ th¹ch
		AddItem(6, 1, 5124, 1, 0, 0)
		Msg2Player("ChÕ t¹o thµnh c«ng 1 Bµn Cæ Th¹ch!")
	else
		Say("Sè l­îng kh«ng ®óng!\n\nYªu cÇu ®Æt vµo chÝnh x¸c:\n- 50 Cµn Kh«n NhÊt Th¹ch (Ng­¬i ®Æt: "..countNhatThach..")\n- 20 Cµn Kh«n Liªn Hoa (Ng­¬i ®Æt: "..countLienHoa..")\n\nH·y t¸ch vËt phÈm ra vµ thö l¹i.", 0)
		return
	end
end

function no()
end