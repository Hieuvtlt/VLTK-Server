Include("\\script\\dailogsys\\g_dialog.lua")

-- ==========================================
-- C?U HÌNH V?T PH?M & GIÁ 
-- ==========================================
-- (Bán ra) Th?o Du?c
ITEM_BUY_GENRE = 6
ITEM_BUY_DETAIL = 1
ITEM_BUY_PARTICULAR = 5118
UNIT_PRICE_BUY = 100000 -- Giá mua Th?o Du?c là 10 v?n

-- (Thu mua) Sát Th? Gi?n
ITEM_SELL_GENRE = 6
ITEM_SELL_DETAIL = 1
ITEM_SELL_PARTICULAR = 400
UNIT_PRICE_SELL = 100000 -- Giá thu mua Sát Th? Gi?n là 10 v?n/cái

function main()
	Say(
		"Ta chuyªn cung cÊp th¶o d­îc vµ thu mua S¸t Thñ Gi¶n. Ng­¬i muèn lµm g×?",
		3,
		"1. Mua Th¶o d­îc/mua_thao_duoc",
		"2. B¸n S¸t thñ gi¶n lÊy TiÒn/ban_sat_thu_gian",
		"KÕt thóc/no"
	)
end

-- ==========================================
-- 1. CH?C NANG BÁN TH?O DU?C CHO NGU?I CHOI
-- ==========================================
function mua_thao_duoc()
	AskClientForNumber("xuly_mua", 1, 999,
		"Mçi c©y gi¸ 10 v¹n l­îng. Ng­¬i muèn mua bao nhiªu c©y?")
end

function buy_50() xuly_mua(50) end
function buy_100() xuly_mua(100) end

function xuly_mua(nAmount)
	if nAmount == nil or nAmount < 1 then
		Msg2Player("<color=red>Sè l­îng kh«ng hîp lÖ.<color>")
		return
	end
	local nTotalPrice = nAmount * UNIT_PRICE_BUY
	
	if GetCash() < nTotalPrice then
		Say("Ng­¬i kh«ng mang ®ñ tiÒn! CÇn cã <color=yellow>"..nTotalPrice.." l­îng<color> ®Ó mua "..nAmount.." c¸i. H·y chuÈn bÞ thªm!", 0)
		return
	end

	local nCellNeed = floor(nAmount / 100)
	if mod(nAmount, 100) > 0 then nCellNeed = nCellNeed + 1 end

	if CalcFreeItemCellCount() < nCellNeed then
		Say("Hµnh trang cña ng­¬i kh«ng ®ñ chç trèng! CÇn Ýt nhÊt <color=yellow>"..nCellNeed.." « trèng<color> ®Ó chøa "..nAmount.." vËt phÈm nµy.", 0)
		return
	end

	Pay(nTotalPrice) 
	
	for i = 1, nAmount do
		AddItem(ITEM_BUY_GENRE, ITEM_BUY_DETAIL, ITEM_BUY_PARTICULAR, 1, 0, 0)
	end
	
	Msg2Player("Giao dÞch thµnh c«ng! Mua ®­îc "..nAmount.." vËt phÈm víi gi¸ "..nTotalPrice.." l­îng.")
end

-- ==========================================
-- 2. CH?C NANG THU MUA SÁT TH? GI?N T? NGU?I CHOI
-- ==========================================
function ban_sat_thu_gian()
	GiveItemUI("B¸n S¸t Thñ Gi¶n", "H·y ®Æt S¸t Thñ Gi¶n vµo ®©y ®Ó b¸n lÊy tiÒn (10 v¹n / c¸i).", "xuly_ban", "no", 1)
end

function xuly_ban(nCount)
	if nCount <= 0 then
		Say("Ng­¬i kh«ng bá vËt phÈm nµo vµo.", 0)
		return
	end

	local nTotalSellAmount = 0
	local tbValidItems = {}

	-- Quét t?t c? v?t ph?m ngu?i choi d?t vào
	for i = 1, nCount do
		local nItemIdx = GetGiveItemUnit(i)
		local nG, nD, nP = GetItemProp(nItemIdx)
		
		-- L?y s? lu?ng b? c?ng d?n trong ô dó
		local nStackCount = GetItemStackCount(nItemIdx)
		if type(nStackCount) ~= "number" or nStackCount <= 0 then
			nStackCount = 1
		end
		
		-- Ki?m tra xem có dúng là Sát Th? Gi?n (6, 1, 400) không
		if nG == ITEM_SELL_GENRE and nD == ITEM_SELL_DETAIL and nP == ITEM_SELL_PARTICULAR then
			nTotalSellAmount = nTotalSellAmount + nStackCount
			tinsert(tbValidItems, nItemIdx)
		else
			Say("Cã vËt phÈm kh«ng hîp lÖ! Ta chØ thu mua S¸t Thñ Gi¶n (ID 400).", 0)
			return
		end
	end

	-- Xóa v?t ph?m dã d?t vào UI
	for i = 1, getn(tbValidItems) do
		RemoveItemByIndex(tbValidItems[i])
	end

	-- Tính t?ng ti?n nh?n du?c và c?ng cho ngu?i choi
	local nTotalMoneyEarn = nTotalSellAmount * UNIT_PRICE_SELL
	Earn(nTotalMoneyEarn)
	
	Msg2Player("B¸n thµnh c«ng! Ng­¬i nhËn ®­îc "..nTotalMoneyEarn.." l­îng.")
end

function no()
end