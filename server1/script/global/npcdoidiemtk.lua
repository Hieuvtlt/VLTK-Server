Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

-- Khai báo h?ng s?
TASK_TONGKIM = 747
ITEM_VNTT = 5119
GIA_DOI_VNTT = 500
STACK_SIZE = 100 -- Sè l­îng tèi ®a mçi « (Stack)

function main()
	local nDiem = GetTask(TASK_TONGKIM)
	Say(
		"Ta lµ quan qu¶n lý qu©n nhu.\n\n"..
		"§iÓm Tèng Kim hiÖn cã: <color=yellow>"..nDiem.."<color>\n"..
		"Ng­¬i muèn thùc hiÖn giao dÞch g×?",
		3,
		"1. Dïng ®iÓm ®æi V¹n Niªn Tinh Th¶o/muavntt_menu",
		"2. §æi bÝ kÝp vµ vËt phÈm lÊy ®iÓm Tèng Kim/doivatpham_ui",
		"KÕt thóc/no"
	)
end

-- ===============================================
-- CHøC N¡NG 1: DÙNG §IÓM MUA V¹N NIÊN TINH TH¶O
-- ===============================================
function muavntt_menu()
	local nDiem = GetTask(TASK_TONGKIM)
	AskClientForNumber("doi_vattam", 1, 999,
		"Ng­¬i cã " .. nDiem .. " ®iÓm Tèng Kim. Gi¸ " .. GIA_DOI_VNTT
		.. " ®iÓm mçi c©y. NhËp sè c©y muèn ®æi:")
end

function menu_doistack()
	local nDiem = GetTask(TASK_TONGKIM)
	local nGia1Stack = GIA_DOI_VNTT * STACK_SIZE

	Say(
		"Mçi Stack gåm <color=green>100 c©y<color>. Gi¸ 1 Stack lµ <color=yellow>"..nGia1Stack.." ®iÓm<color>.\n\n"..
		"§iÓm hiÖn cã: <color=yellow>"..nDiem.."<color>\n"..
		"Ng­¬i muèn ®æi mÊy Stack?",
		6,
		"§æi 2 Stack (200 c©y)/#doi_vattam(200)",
		"§æi 5 Stack (500 c©y)/#doi_vattam(500)",
		"§æi 10 Stack (1000 c©y)/#doi_vattam(1000)",
		"§æi 20 Stack (2000 c©y)/#doi_vattam(2000)",
		"Quay l¹i/muavntt_menu",
		"KÕt thóc/no"
	)
end

function doi_vattam(nSoLuong)
	if nSoLuong == nil or nSoLuong < 1 then
		Msg2Player("<color=red>Sè l­îng kh«ng hîp lÖ.<color>")
		return
	end
	local nCan = nSoLuong * GIA_DOI_VNTT
	local nDiem = GetTask(TASK_TONGKIM)

	if nDiem < nCan then
		Say("Ng­¬i kh«ng ®ñ ®iÓm Tèng Kim.",0)
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

	SetTask(TASK_TONGKIM, floor(nDiem - nCan))
	SyncTaskValue(TASK_TONGKIM)

	for i = 1, nSoLuong do
		AddItem(6, 1, ITEM_VNTT, 1, 0, 0)
	end

	Msg2Player("§æi thµnh c«ng "..nSoLuong.." V¹n Niªn Tinh Th¶o.")
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().." ["..GetName().."] ®æi "..nSoLuong.." V¹n Niªn Tinh Th¶o b»ng "..nCan.." ®iÓm Tèng Kim.")
end

-- ===============================================
-- CHøC N¡NG 2: Bá VËT PHÈM VÀO §æI LÊY §IÓM TèNG KIM
-- ===============================================
function doivatpham_ui()
	GiveItemUI("§æi §iÓm Tèng Kim", "H·y ®Æt vËt phÈm hîp lÖ vµo ®©y. BÝ kÝp/S¸ch (22, 26, 127, 128) ®­îc 15.000 ®iÓm. VËt phÈm kh¸c (33-59) ®­îc 3.000 ®iÓm.", "xuly_doivatpham", "no", 1)
end

function GetItemTongKimValue(nGenre, nDetail, nParticular)
	if nGenre ~= 6 then
		return 0
	end
	
	if nDetail == 1 and (nParticular == 22 or nParticular == 26 or nParticular == 127 or nParticular == 128) then
		return 15000
	end
	
	if nDetail == 1 and (nParticular >= 33 and nParticular <= 59) then
		return 3000
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
		
		local nStackCount = GetItemStackCount(nItemIdx)
		if type(nStackCount) ~= "number" or nStackCount <= 0 then
			nStackCount = 1
		end
		
		local nValue = GetItemTongKimValue(nGenre, nDetail, nParticular)

		if nValue <= 0 then
			Say("Cã vËt phÈm kh«ng hîp lÖ! Ta chØ nhËn nh÷ng vËt phÈm Lo¹i 6 theo danh s¸ch quy ®Þnh.", 0)
			return
		end

		nTotalPoints = nTotalPoints + (nValue * nStackCount)
		tinsert(tbValidItems, nItemIdx)
	end

	for i = 1, getn(tbValidItems) do
		RemoveItemByIndex(tbValidItems[i])
	end

	local nDiemHienTai = GetTask(TASK_TONGKIM)
	SetTask(TASK_TONGKIM, nDiemHienTai + nTotalPoints)
	SyncTaskValue(TASK_TONGKIM)
	
	Msg2Player("§æi thµnh c«ng, ng­¬i nhËn ®­îc "..nTotalPoints.." ®iÓm Tèng Kim.")
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().." ["..GetName().."] ®æi vËt phÈm lÊy "..nTotalPoints.." ®iÓm Tèng Kim.")
end

function no()
end