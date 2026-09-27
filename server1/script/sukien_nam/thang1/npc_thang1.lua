Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

-- ================= H¿M CHÕNH N?M TR N CŸNG =================
function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	
	-- B?Y TH?I GIAN: KH”A D?CH V? N?U KH‘NG PH?I TH¡NG 1
	if SKN_ThangMo(1) ~= 1 then
		local szMsg_Close = "<color=yellow>Th«n Tµi:<color>\nS˘ ki÷n MÔa Xu©n Æ∑ k’t thÛc. H—n g∆p lπi ßπi hi÷p vµo th∏ng 1 n®m sau!"
		local tbOpt_Close = {
			{"Tho∏t", KetThuc}
		}
		CreateNewSayEx(szMsg_Close, tbOpt_Close)
		return 1
	end

	-- MENU HO?T D?NG BÃNH THU?NG TRONG TH¡NG 1
	local szMsg = "<color=yellow>Th«n Tµi:<color>\nChµo mıng ßπi hi÷p Æ’n vÌi s˘ ki÷n MÔa Xu©n! Ng≠Íi muËn ÆÊi vÀt ph»m g◊?"
	local tbOpt = {
		{"Gh–p B∏nh Ch≠ng Th≠Óng Hπng", Menu_GhepBanhTH},
		{"Gh–p B∏nh Ch≠ng H∂o Hπng", Menu_GhepBanhHH},
		{"Mua Thﬁt Heo bªng Ti“n ßÂng", Menu_MuaThit},
		{"Tho∏t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function Menu_SuKien_Thang()
	main()
end

-- ================= MENU CH?N S? LU?NG =================
function Menu_GhepBanhTH()
	local tbMat = {
		{szName = "M∑ng C«u", tbProp = {6, 1, 1886, 1, 0, 0}, nCount = 1},
		{szName = "Dıa", tbProp = {6, 1, 1887, 1, 0, 0}, nCount = 1},
		{szName = "ßu ßÒ", tbProp = {6, 1, 1888, 1, 0, 0}, nCount = 1},
		{szName = "Xoµi", tbProp = {6, 1, 1889, 1, 0, 0}, nCount = 1},
		{szName = "Sung", tbProp = {6, 1, 1890, 1, 0, 0}, nCount = 1},
		{szName = "Ng©n l≠Óng", nJxb = 30000},
	}
	SKN_XacNhan("Gh–p B∏nh Ch≠ng Th≠Íng", tbMat, "TienHanh_GhepTH")
end
function Menu_GhepBanhHH()
	local tbMat = {
		{szName = "Thﬁt heo", tbProp = {6, 1, 1898, 1, 0, 0}, nCount = 1},
		{szName = "M∑ng C«u", tbProp = {6, 1, 1886, 1, 0, 0}, nCount = 1},
		{szName = "Dıa", tbProp = {6, 1, 1887, 1, 0, 0}, nCount = 1},
		{szName = "ßu ßÒ", tbProp = {6, 1, 1888, 1, 0, 0}, nCount = 1},
		{szName = "Xoµi", tbProp = {6, 1, 1889, 1, 0, 0}, nCount = 1},
		{szName = "Sung", tbProp = {6, 1, 1890, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Gh–p B∏nh Ch≠ng H∂o Hπng", tbMat, "TienHanh_GhepHH")
end
function Menu_MuaThit()
	local tbMat = {
		{szName = "Ti“n ßÂng", tbProp = {4, 417, 1, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Mua Thﬁt Heo", tbMat, "TienHanh_MuaThit")
end
-- ================= H¿M H? TR? KI?M TRA & TR? D? =================
function CheckNguQua(nCount)
	if CalcEquiproomItemCount(6, 1, 1886, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 1887, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 1888, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 1889, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 1890, -1) < nCount then return 0 end
	return 1
end

function ConsumeNguQua(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1886, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1887, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1888, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1889, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1890, -1)
end

-- ================= LOGIC X? L› CHÕNH =================
function TienHanh_GhepTH(nCount)
	local nCost = nCount * 30000
	
	if CheckNguQua(nCount) == 0 then
		Msg2Player("Hµnh trang kh´ng c„ ÆÒ " .. nCount .. " bÈ M©m NgÚ Qu∂!")
		return
	end
	if GetCash() < nCost then
		Msg2Player("Ng≠Íi kh´ng c„ ÆÒ " .. (nCount * 3) .. " vπn l≠Óng!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang c«n ›t nh t 5 ´ trËng!")
		return
	end
	
	Pay(nCost)
	ConsumeNguQua(nCount)
	for i = 1, nCount do
		AddItem(6, 1, 1894, 1, 0, 0)
	end
	Msg2Player("Gh–p thµnh c´ng " .. nCount .. " B∏nh Ch≠ng Th≠Óng Hπng!")
end

function TienHanh_GhepHH(nCount)
	if CheckNguQua(nCount) == 0 then
		Msg2Player("Hµnh trang kh´ng c„ ÆÒ " .. nCount .. " bÈ M©m NgÚ Qu∂!")
		return
	end
	if CalcEquiproomItemCount(6, 1, 1898, -1) < nCount then
		Msg2Player("Kh´ng ÆÒ " .. nCount .. " Thﬁt Heo!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang c«n ›t nh t 5 ´ trËng!")
		return
	end
	
	ConsumeNguQua(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1898, -1)
	
	for i = 1, nCount do
		AddItem(6, 1, 1663, 1, 0, 0)
	end
	Msg2Player("Gh–p thµnh c´ng " .. nCount .. " B∏nh Ch≠ng H∂o Hπng!")
end

function TienHanh_MuaThit(nCount)
	if CalcEquiproomItemCount(4, 417, 1, -1) < nCount then
		Msg2Player("Ng≠Íi kh´ng c„ ÆÒ " .. nCount .. " Ti“n ßÂng!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang c«n ›t nh t 5 ´ trËng!")
		return
	end
	
	ConsumeEquiproomItem(nCount, 4, 417, 1, -1)
	for i = 1, nCount do
		AddItem(6, 1, 1898, 1, 0, 0)
	end
	Msg2Player("Mua thµnh c´ng " .. nCount .. " Thﬁt Heo bªng Ti“n ßÂng!")
end

-- ================= WRAPPERS G?I H¿M =================
function KetThuc() end