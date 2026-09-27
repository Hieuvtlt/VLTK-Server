Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\fuyuan.lua")

ITEM_CAROT = 5120
GIA_DOI_CAROT = 3000
STACK_SIZE = 100 

function main()
	local nDiem = FuYuan_Get() or 0
	Say(
		"HiÖn t¹i ng­¬i ®ang cã <color=yellow>"..nDiem.." ®iÓm Phóc Duyªn<color>.\n"..
		"Ng­¬i muèn thùc hiÖn giao dÞch g×?",
		3,
		"1. Mua Cµ rèt ®Æc biÖt/muacarot_menu",
		"2. §æi vËt phÈm lÊy Phóc Duyªn/doivatpham_ui",
		"KÕt thóc/no"
	)
end

-- ===============================================
-- CHøC N¡NG 1: MUA CÀ RèT
-- ===============================================
function muacarot_menu()
	local nDiem = FuYuan_Get() or 0
	AskClientForNumber("doi_vattam", 1, 999,
		"Ng­¬i cã " .. nDiem .. " ®iÓm Phóc Duyªn. Gi¸ " .. GIA_DOI_CAROT
		.. " ®iÓm mçi cñ. NhËp sè cñ muèn ®æi:")
end

function doi_20() doi_vattam(20) end
function doi_50() doi_vattam(50) end
function doi_100() doi_vattam(100) end

function doi_vattam(nSoLuong)
	if nSoLuong == nil or nSoLuong < 1 then
		Msg2Player("<color=red>Sè l­îng kh«ng hîp lÖ.<color>")
		return
	end
	local nCan = nSoLuong * GIA_DOI_CAROT
	local nDiem = FuYuan_Get() or 0

	if nDiem < nCan then
		Say("Ng­¬i kh«ng ®ñ ®iÓm Phóc Duyªn ®Ó ®æi chõng ®ã Cµ rèt.",0)
		return
	end

	local nCellNeed = 1
	if nSoLuong >= STACK_SIZE then
		nCellNeed = floor(nSoLuong / STACK_SIZE)
		if (nSoLuong - (nCellNeed * STACK_SIZE)) > 0 then
			nCellNeed = nCellNeed + 1
		end
	end

	if CalcFreeItemCellCount() < nCellNeed then
		Say("Hµnh trang cña ng­¬i cÇn tèi thiÓu "..nCellNeed.." « trèng.",0)
		return
	end

	if FuYuan_Reduce(nCan) ~= 1 then
		Say("HÖ thèng Phóc Duyªn cña ng­¬i ch­a ®­îc kÝch ho¹t hoÆc bÞ lçi!", 0)
		return
	end

	for i = 1, nSoLuong do
		AddItem(6, 1, ITEM_CAROT, 1, 0, 0)
	end

	Msg2Player("Mua thµnh c«ng "..nSoLuong.." Cµ rèt ®Æc biÖt.")
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().." ["..GetName().."] mua "..nSoLuong.." Cµ rèt = "..nCan.." Phóc Duyªn.")
end

-- ===============================================
-- CHøC N¡NG 2: Bá VËT PHÈM VÀO §æI LÊY PHóC DUYÊN
-- ===============================================
function doivatpham_ui()
	GiveItemUI("§æi Phóc Duyªn", "H·y ®Æt Tiªn th¶o lé, ThiÕt La H¸n, QuÕ hoa töu, Thñy tinh hoÆc Tinh hång b¶o th¹ch vµo ®©y ®Ó ®æi lÊy Phóc Duyªn.", "xuly_doivatpham", "no", 1)
end

function GetItemPhucDuyenValue(nGenre, nDetail, nParticular)
	-- Tiªn th¶o lé (Genre 6, Detail 1, Particular 71) = 100 diÓm
	if nGenre == 6 and nDetail == 1 and nParticular == 71 then
		return 100
	end
	
	-- QuÕ hoa töu (Genre 6, Detail 1, Particular 125) = 100 diÓm (B»ng tiªn th¶o lé)
	if nGenre == 6 and nDetail == 1 and nParticular == 125 then
		return 100
	end
	
	-- ThiÕt La H¸n (Genre 6, Detail 1, Particular 23) = 100 diÓm (B»ng tiªn th¶o lé)
	if nGenre == 6 and nDetail == 1 and nParticular == 23 then
		return 100
	end
	
	-- VËt phÈm ID 72 (Genre 6, Detail 1, Particular 72) = 50 diÓm
	if nGenre == 6 and nDetail == 1 and nParticular == 72 then
		return 50
	end
	
	-- Lam/Tö/Lôc Thñy tinh (Genre 4, Detail 238, 239, 240) = 300 diÓm
	if nGenre == 4 and (nDetail == 238 or nDetail == 239 or nDetail == 240) then
		return 300
	end
	
	-- Tinh hång b¶o th¹ch (Genre 4, Detail 353) = 400 diÓm
	if nGenre == 4 and nDetail == 353 then
		return 400
	end
	
	return 0
end

function xuly_doivatpham(nCount)
	if nCount <= 0 then
		Say("Ng­¬i kh«ng bá vËt phÈm nµo vµo.", 0)
		return
	end

	local nTotalPoints = 0
	local tbValidItems = {}

	for i = 1, nCount do
		local nItemIdx = GetGiveItemUnit(i)
		local nGenre, nDetail, nParticular, nLevel, nSeries = GetItemProp(nItemIdx)
		
		-- LÊy sè l­îng céng dån (stack) cña vËt phÈm trong « ®ã
		local nStackCount = GetItemStackCount(nItemIdx)
		if type(nStackCount) ~= "number" or nStackCount <= 0 then
			nStackCount = 1
		end
		
		local nValue = GetItemPhucDuyenValue(nGenre, nDetail, nParticular)

		if nValue <= 0 then
			Say("Cã vËt phÈm kh«ng hîp lÖ! Ta chØ nhËn Tiªn th¶o lé/QuÕ hoa töu/ThiÕt La H¸n (100®), vËt phÈm 72 (50®), Thñy tinh (300®) vµ Tinh hång b¶o th¹ch (400®).", 0)
			return
		end

		-- Nh©n gi¸ trÞ phóc duyªn víi sè l­îng ®å bÞ xÕp chång
		nTotalPoints = nTotalPoints + (nValue * nStackCount)
		tinsert(tbValidItems, nItemIdx)
	end

	for i = 1, getn(tbValidItems) do
		RemoveItemByIndex(tbValidItems[i])
	end

	FuYuan_Add(nTotalPoints)
	
	Msg2Player("§æi thµnh c«ng, ng­¬i nhËn ®­îc "..nTotalPoints.." ®iÓm Phóc Duyªn.")
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().." ["..GetName().."] ®æi vËt phÈm lÊy "..nTotalPoints.." ®iÓm Phóc Duyªn.")
end

function no()
end