Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	
	-- CH? CHO PHÉP HO?T D?NG TRONG THÁNG 6
	if SKN_ThangMo(6) ~= 1 then
		CreateNewSayEx("<color=yellow>Sø Gi¶ Sù KiÖn:<color>\nSù kiÖn Phong Háa Liªn Thµnh chØ diÔn ra trong Th¸ng 6, hÑn gÆp l¹i ®¹i hiÖp sau!", {{"Tho¸t", KetThuc}})
		return 1
	end

	local szMsg = "<color=yellow>Sø Gi¶ Sù KiÖn:<color>\nChµo mõng ®¹i hiÖp ®Õn víi sù kiÖn Phong Háa Liªn Thµnh vµ Kû niÖm VLTK 3 tuæi. Ngµi muèn thùc hiÖn giao dÞch g×?"
	local tbOpt = {
		{"Nép ch÷ Phong Háa Liªn Thµnh", Menu_NopChu},
		{"§æi B¸nh Kem Sinh NhËt", Menu_DoiBanh},
		{"Mua §¹i Hû LÔ Bao (TiÒn §ång)", Menu_MuaLeBao},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

-- ==================== MENU CH?C NANG ====================

function Menu_NopChu()
	local tbMat = {
		{szName = "Phong", tbProp = {6, 1, 1756, 1, 0, 0}, nCount = 1},
		{szName = "Háa", tbProp = {6, 1, 1757, 1, 0, 0}, nCount = 1},
		{szName = "Liªn", tbProp = {6, 1, 1758, 1, 0, 0}, nCount = 1},
		{szName = "thµnh", tbProp = {6, 1, 1759, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Nép Ch÷ Phong Háa Liªn Thµnh", tbMat, "NopChu")
end
function Menu_DoiBanh()
	local tbOpt = {
		{"§æi B¸nh Kem Nh­ Ý", Menu_BanhNhuY},
		{"§æi B¸nh Kem C¸t T­êng", Menu_BanhCatTuong},
		{"Quay l¹i", main}
	}
	CreateNewSayEx("Chän lo¹i b¸nh mµ ®¹i hiÖp muèn ®æi:", tbOpt)
end

function Menu_BanhNhuY()
	local tbMat = {
		{szName = "Mõng", tbProp = {6, 1, 1752, 1, 0, 0}, nCount = 1},
		{szName = "VLTK", tbProp = {6, 1, 1753, 1, 0, 0}, nCount = 1},
		{szName = "3", tbProp = {6, 1, 1754, 1, 0, 0}, nCount = 1},
		{szName = "Tuæi", tbProp = {6, 1, 1755, 1, 0, 0}, nCount = 1},
		{szName = "Ng©n l­îng", nJxb = 30000},
	}
	SKN_XacNhan("§æi B¸nh Kem Nh­ ý", tbMat, "DoiBanhNY")
end
function Menu_BanhCatTuong()
	local tbMat = {
		{szName = "§¹i Hû LÔ Bao", tbProp = {6, 1, 1760, 1, 0, 0}, nCount = 1},
		{szName = "Mõng", tbProp = {6, 1, 1752, 1, 0, 0}, nCount = 1},
		{szName = "VLTK", tbProp = {6, 1, 1753, 1, 0, 0}, nCount = 1},
		{szName = "3", tbProp = {6, 1, 1754, 1, 0, 0}, nCount = 1},
		{szName = "Tuæi", tbProp = {6, 1, 1755, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("§æi B¸nh Kem C¸t T­êng", tbMat, "DoiBanhCT")
end
function Menu_MuaLeBao()
	local tbMat = {
		{szName = "TiÒn §ång", tbProp = {4, 417, 1, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Mua §¹i Hû LÔ Bao", tbMat, "MuaLeBao")
end
-- ==================== HÀM X? LÝ LOGIC ====================

function NopChu(nCount)
	local TSK_COUNT_PHLT = 1400
	local nDaNop = GetTask(TSK_COUNT_PHLT)

	if nDaNop >= 500 then
		Msg2Player("§¹i hiÖp ®· nép ®ñ 500 lÇn, kh«ng thÓ nép thªm!") return
	end
	if nDaNop + nCount > 500 then
		Msg2Player("ChØ cßn cã thÓ nép thªm "..(500 - nDaNop).." lÇn!") return
	end

	if CalcEquiproomItemCount(6,1,1756,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ Phong!") return end
	if CalcEquiproomItemCount(6,1,1757,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ Háa!") return end
	if CalcEquiproomItemCount(6,1,1758,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ Liªn!") return end
	if CalcEquiproomItemCount(6,1,1759,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ Thµnh!") return end

	-- Ch?n n?u túi không d? ô d? nh?n quà lúc d?t m?c
	if (nDaNop + nCount == 500) and CalcFreeItemCellCount() < 1 then
		Msg2Player("Hµnh trang cÇn 1 « trèng ®Ó nhËn th­ëng bÝ mËt!") return
	end

	ConsumeEquiproomItem(nCount, 6, 1, 1756, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1757, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1758, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1759, -1)

	local nExpAdd = nCount * 1000000
	tl_addPlayerExp(nExpAdd)
	
	nDaNop = nDaNop + nCount
	SetTask(TSK_COUNT_PHLT, nDaNop)
	
	-- Ph?n thu?ng bí m?t khi hoàn thành m?c 500
	if nDaNop == 500 then
		AddItem(6, 1, 1431, 1, 0, 0)
		Msg2Player("<color=yellow>PhÇn th­ëng bÝ mËt: Hoµn thµnh 500 lÇn nép ch÷, nhËn ®­îc 1 Thiªn S¬n TuyÕt Liªn!<color>")
	end

	Msg2Player("<color=green>Nép thµnh c«ng, nhËn ®­îc " .. (nExpAdd/10000) .. " v¹n Kinh NghiÖm!<color>")
end

function DoiBanhNY(nCount)
	local nCost = nCount * 30000
	if GetCash() < nCost then Msg2Player("Kh«ng cã ®ñ "..(nCost/10000).." v¹n l­îng!") return end
	
	if CalcEquiproomItemCount(6,1,1752,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ Mõng!") return end
	if CalcEquiproomItemCount(6,1,1753,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ VLTK!") return end
	if CalcEquiproomItemCount(6,1,1754,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ 3!") return end
	if CalcEquiproomItemCount(6,1,1755,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ Tuæi!") return end
	
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return end

	Pay(nCost)
	ConsumeEquiproomItem(nCount, 6, 1, 1752, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1753, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1754, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1755, -1)

	for i = 1, nCount do AddItem(6, 1, 1761, 1, 0, 0) end
	Msg2Player("<color=yellow>§æi thµnh c«ng "..nCount.." B¸nh Kem Nh­ Ý!<color>")
end

function DoiBanhCT(nCount)
	if CalcEquiproomItemCount(6,1,1760,-1) < nCount then Msg2Player("Kh«ng ®ñ §¹i Hû LÔ Bao!") return end
	if CalcEquiproomItemCount(6,1,1752,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ Mõng!") return end
	if CalcEquiproomItemCount(6,1,1753,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ VLTK!") return end
	if CalcEquiproomItemCount(6,1,1754,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ 3!") return end
	if CalcEquiproomItemCount(6,1,1755,-1) < nCount then Msg2Player("Kh«ng ®ñ ch÷ Tuæi!") return end
	
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return end

	ConsumeEquiproomItem(nCount, 6, 1, 1760, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1752, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1753, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1754, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1755, -1)

	for i = 1, nCount do AddItem(6, 1, 1762, 1, 0, 0) end
	Msg2Player("<color=yellow>§æi thµnh c«ng "..nCount.." B¸nh Kem C¸t T­êng!<color>")
end

function MuaLeBao(nCount)
	if CalcEquiproomItemCount(4, 417, 1, -1) < nCount then
		Msg2Player("Kh«ng ®ñ "..nCount.." TiÒn §ång!") return
	end
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return
	end

	ConsumeEquiproomItem(nCount, 4, 417, 1, -1)

	for i = 1, nCount do AddItem(6, 1, 1760, 1, 0, 0) end
	Msg2Player("<color=yellow>Mua thµnh c«ng "..nCount.." §¹i Hû LÔ Bao!<color>")
end

function KetThuc() end