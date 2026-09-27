Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

-- ================= HÀM CHÍNH N?M TRÊN CÙNG =================
function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	
	-- B?Y TH?I GIAN: KHÓA D?CH V? N?U KHÔNG PH?I THÁNG 2
	if SKN_ThangMo(2) ~= 1 then
		local szMsg_Close = "<color=pink>NguyÖt L·o:<color>\nSù kiÖn Valentine ®· kÕt thóc. HÑn gÆp l¹i §¹i hiÖp vµo th¸ng 2 n¨m sau!"
		local tbOpt_Close = {
			{"Tho¸t", KetThuc}
		}
		CreateNewSayEx(szMsg_Close, tbOpt_Close)
		return 1
	end

	-- MENU HO?T Ð?NG BÌNH THU?NG TRONG THÁNG 2
	local szMsg = "<color=pink>NguyÖt L·o:<color>\nChóc mõng LÔ T×nh Nh©n! T×nh yªu lu«n cÇn sù vÞ tha vµ nh÷ng mãn quµ ngät ngµo. Ng­êi muèn ghÐp vËt phÈm g×?"
	local tbOpt = {
		{"GhÐp Socola T×nh Yªu", Menu_GhepSocola},
		{"GhÐp Socola H¹nh Nh©n", Menu_GhepSocolaHanhNhan},
		{"Mua H¹nh Nh©n b»ng TiÒn §ång", Menu_MuaHanhNhan},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function Menu_SuKien_Thang2()
	main()
end

-- ================= MENU CH?N S? LU?NG =================
function Menu_GhepSocola()
	local tbMat = {
		{szName = "§­êng c¸t", tbProp = {6, 1, 5176, 1, 0, 0}, nCount = 1},
		{szName = "Bét m×", tbProp = {6, 1, 5177, 1, 0, 0}, nCount = 1},
		{szName = "Trøng", tbProp = {6, 1, 5178, 1, 0, 0}, nCount = 1},
		{szName = "S÷a t­¬i", tbProp = {6, 1, 5179, 1, 0, 0}, nCount = 1},
		{szName = "SocoLa", tbProp = {6, 1, 5143, 1, 0, 0}, nCount = 1},
		{szName = "Ng©n l­îng", nJxb = 30000},
	}
	SKN_XacNhan("GhÐp Socola T×nh Yªu", tbMat, "TienHanh_GhepSocola")
end
function Menu_GhepSocolaHanhNhan()
	local tbMat = {
		{szName = "H¹nh nh©n", tbProp = {6, 1, 5138, 1, 0, 0}, nCount = 1},
		{szName = "§­êng c¸t", tbProp = {6, 1, 5176, 1, 0, 0}, nCount = 1},
		{szName = "Bét m×", tbProp = {6, 1, 5177, 1, 0, 0}, nCount = 1},
		{szName = "Trøng", tbProp = {6, 1, 5178, 1, 0, 0}, nCount = 1},
		{szName = "S÷a t­¬i", tbProp = {6, 1, 5179, 1, 0, 0}, nCount = 1},
		{szName = "SocoLa", tbProp = {6, 1, 5143, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("GhÐp Socola H¹nh Nh©n", tbMat, "TienHanh_GhepSocolaHanhNhan")
end
function Menu_MuaHanhNhan()
	local tbMat = {
		{szName = "TiÒn §ång", tbProp = {4, 417, 1, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Mua H¹nh Nh©n", tbMat, "TienHanh_MuaHanhNhan")
end
-- ================= HÀM H? TR? KI?M TRA & TR? Ð? =================
function CheckNguyenLieu(nCount)
	if CalcEquiproomItemCount(6, 1, 5176, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 5177, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 5178, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 5179, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 5143, -1) < nCount then return 0 end
	return 1
end

function ConsumeNguyenLieu(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 5176, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 5177, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 5178, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 5179, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 5143, -1)
end

-- ================= LOGIC X? LÝ CHÍNH =================
function TienHanh_GhepSocola(nCount)
	local nCost = nCount * 30000
	
	if CheckNguyenLieu(nCount) == 0 then
		Msg2Player("Hµnh trang kh«ng cã ®ñ " .. nCount .. " bé nguyªn liÖu Socola!")
		return
	end
	if GetCash() < nCost then
		Msg2Player("Ng­êi kh«ng cã ®ñ " .. (nCount * 3) .. " v¹n l­îng!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	Pay(nCost)
	ConsumeNguyenLieu(nCount)
	for i = 1, nCount do
		AddItem(6, 1, 5144, 1, 0, 0)
	end
	Msg2Player("GhÐp thµnh c«ng " .. nCount .. " Socola T×nh Yªu!")
end

function TienHanh_GhepSocolaHanhNhan(nCount)
	-- Socola H?nh Nhân Tình Yêu (Gi?ng Bánh H?o H?ng, không tr? lu?ng)
	if CheckNguyenLieu(nCount) == 0 then
		Msg2Player("Hµnh trang kh«ng cã ®ñ " .. nCount .. " bé nguyªn liÖu Socola!")
		return
	end
	if CalcEquiproomItemCount(6, 1, 5138, -1) < nCount then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " H¹nh Nh©n!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	ConsumeNguyenLieu(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 5138, -1)
	
	for i = 1, nCount do
		AddItem(6, 1, 5145, 1, 0, 0)
	end
	Msg2Player("GhÐp thµnh c«ng " .. nCount .. " Socola H¹nh Nh©n T×nh Yªu!")
end

function TienHanh_MuaHanhNhan(nCount)
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
		AddItem(6, 1, 5138, 1, 0, 0)
	end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " H¹nh Nh©n b»ng TiÒn §ång!")
end

-- ================= WRAPPERS G?I HÀM =================
function KetThuc() end