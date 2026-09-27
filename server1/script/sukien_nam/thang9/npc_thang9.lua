Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

-- ================= HÀM CHÍNH N?M TRÊN CÙNG =================
function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	
	-- KHÓA D?CH V? N?U KHÔNG PH?I THÁNG 9
	if SKN_ThangMo(9) ~= 1 then
		local szMsg_Close = "<color=yellow>Sø Gi¶ Quèc Kh¸nh:<color>\nSù kiÖn Quèc Kh¸nh ®· kÕt thóc. HÑn gÆp l¹i §¹i hiÖp vµo th¸ng 9 n¨m sau!"
		local tbOpt_Close = {
			{"Tho¸t", KetThuc}
		}
		CreateNewSayEx(szMsg_Close, tbOpt_Close)
		return 1
	end

	-- MENU HO?T D?NG BÌNH THU?NG TRONG THÁNG 9
	local szMsg = "<color=yellow>Sø Gi¶ Quèc Kh¸nh:<color>\nChµo mõng §¹i hiÖp ®Õn víi sù kiÖn Quèc Kh¸nh! Ng­êi muèn thùc hiÖn giao dÞch g×?"
	local tbOpt = {
		{"GhÐp ChiÕc Mò Tai BÌo", Menu_GhepTaiBeo},
		{"GhÐp Huy Ch­¬ng Quèc Kh¸nh", Menu_GhepHuyChuong},
		{"Mua Ng«i Sao ChiÕn Th¾ng (TiÒn §ång)", Menu_MuaNgoiSao},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function Menu_SuKien_Thang()
	main()
end

-- ================= MENU CH?N S? LU?NG =================
function Menu_GhepTaiBeo()
	local tbMat = {
		{szName = "ChiÕc mò hßa b×nh", tbProp = {6, 1, 2098, 1, 0, 0}, nCount = 1},
		{szName = "ChiÕc mò tù do", tbProp = {6, 1, 2099, 1, 0, 0}, nCount = 1},
		{szName = "ChiÕc mò h¹nh phóc", tbProp = {6, 1, 2100, 1, 0, 0}, nCount = 1},
		{szName = "Ng©n l­îng", nJxb = 30000},
	}
	SKN_XacNhan("GhÐp Mò Tai BÌo", tbMat, "TienHanh_GhepTaiBeo")
end
function Menu_GhepHuyChuong()
	local tbMat = {
		{szName = "Ng«i sao chiÕn th¾ng", tbProp = {6, 1, 1494, 1, 0, 0}, nCount = 1},
		{szName = "ChiÕc mò hßa b×nh", tbProp = {6, 1, 2098, 1, 0, 0}, nCount = 1},
		{szName = "ChiÕc mò tù do", tbProp = {6, 1, 2099, 1, 0, 0}, nCount = 1},
		{szName = "ChiÕc mò h¹nh phóc", tbProp = {6, 1, 2100, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("GhÐp Huy Ch­¬ng Quèc Kh¸nh", tbMat, "TienHanh_GhepHuyChuong")
end
function Menu_MuaNgoiSao()
	local tbMat = {
		{szName = "TiÒn §ång", tbProp = {4, 417, 1, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Mua Ng«i Sao ChiÕn Th¾ng", tbMat, "TienHanh_MuaNgoiSao")
end
-- ================= HÀM H? TR? KI?M TRA & TR? D? =================
function CheckBaMu(nCount)
	if CalcEquiproomItemCount(6, 1, 2098, -1) < nCount then return 0 end -- Mu hòa bình
	if CalcEquiproomItemCount(6, 1, 2099, -1) < nCount then return 0 end -- Mu t? do
	if CalcEquiproomItemCount(6, 1, 2100, -1) < nCount then return 0 end -- Mu h?nh phúc
	return 1
end

function ConsumeBaMu(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 2098, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 2099, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 2100, -1)
end

-- ================= LOGIC X? LÝ CHÍNH =================
function TienHanh_GhepTaiBeo(nCount)
	local nCost = nCount * 30000
	
	if CheckBaMu(nCount) == 0 then
		Msg2Player("Hµnh trang kh«ng cã ®ñ " .. nCount .. " bé (Mò Hoµ B×nh + Tù Do + H¹nh Phóc)!")
		return
	end
	if GetCash() < nCost then
		Msg2Player("Ng­êi kh«ng cã ®ñ " .. (nCount * 3) .. " v¹n l­îng!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng ®Ó ghÐp ®å!")
		return
	end
	
	Pay(nCost)
	ConsumeBaMu(nCount)
	
	for i = 1, nCount do
		AddItem(6, 1, 2097, 1, 0, 0) -- Add Mu Tai Bèo
	end
	Msg2Player("GhÐp thµnh c«ng " .. nCount .. " ChiÕc Mò Tai BÌo!")
end

function TienHanh_GhepHuyChuong(nCount)
	if CheckBaMu(nCount) == 0 then
		Msg2Player("Hµnh trang kh«ng cã ®ñ " .. nCount .. " bé (Mò Hoµ B×nh + Tù Do + H¹nh Phóc)!")
		return
	end
	if CalcEquiproomItemCount(6, 1, 1494, -1) < nCount then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " Ng«i Sao ChiÕn Th¾ng!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng ®Ó ghÐp ®å!")
		return
	end
	
	ConsumeBaMu(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1494, -1)
	
	for i = 1, nCount do
		AddItem(6, 1, 1496, 1, 0, 0) -- Add Huy Chuong Qu?c Khánh
	end
	Msg2Player("GhÐp thµnh c«ng " .. nCount .. " Huy Ch­¬ng Quèc Kh¸nh!")
end

function TienHanh_MuaNgoiSao(nCount)
	if CalcEquiproomItemCount(4, 417, 1, -1) < nCount then
		Msg2Player("Ng­êi kh«ng cã ®ñ " .. nCount .. " TiÒn §ång!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	ConsumeEquiproomItem(nCount, 4, 417, 1, -1)
	
	for i = 1, nCount do
		AddItem(6, 1, 1494, 1, 0, 0) -- Add Ngôi Sao Chi?n Th?ng
	end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " Ng«i Sao ChiÕn Th¾ng b»ng TiÒn §ång!")
end

-- ================= WRAPPERS G?I HÀM =================
function KetThuc() end