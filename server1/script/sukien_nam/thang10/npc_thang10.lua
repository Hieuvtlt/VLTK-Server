Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

-- ================= HÀM CHÍNH =================
function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	
	if SKN_ThangMo(10) ~= 1 then
		local szMsg_Close = "<color=yellow>H»ng Nga:<color>\nTr¨ng r»m ®· tµn, mïa Trung Thu ®· kÕt thóc. HÑn gÆp l¹i §¹i hiÖp vµo th¸ng 10 n¨m sau!"
		local tbOpt_Close = {
			{"Tho¸t", KetThuc}
		}
		CreateNewSayEx(szMsg_Close, tbOpt_Close)
		return 1
	end

	local szMsg = "<color=yellow>H»ng Nga:<color>\nTr¨ng r»m s¸ng tá nh­ g­¬ng, ng­êi ng­êi n« nøc ®ãn TÕt Trung Thu. Ng­êi muèn thùc hiÖn giao dÞch g×?"
	local tbOpt = {
		{"Lµm B¸nh Trung Thu", Menu_LamBanh},
		{"GhÐp Hép B¸nh Trung Thu", Menu_GhepHop},
		{"Mua Nguyªn LiÖu Trung Thu", Menu_MuaNguyenLieu},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function Menu_SuKien_Thang() main() end

-- ================= CÁC MENU CH?N S? LU?NG =================
function Menu_LamBanh()
	local tbOpt = {
		{"B¸nh §Ëu Xanh", Menu_BanhDauXanh},
		{"B¸nh H¹t Sen", Menu_BanhHatSen},
		{"B¸nh Gµ N­íng", Menu_BanhGaNuong},
		{"B¸nh Heo Quay", Menu_BanhHeoQuay},
		{"Quay l¹i", main}
	}
	CreateNewSayEx("Lµm b¸nh cÇn: 1 Bét, 1 §­êng, 1 Trøng vµ 1 Nguyªn liÖu chÝnh. Chän lo¹i b¸nh:", tbOpt)
end

function Menu_BanhDauXanh()
	local tbMat = {
		{szName = "§Ëu xanh", tbProp = {6, 1, 1506, 1, 0, 0}, nCount = 1},
		{szName = "Bét", tbProp = {6, 1, 1503, 1, 0, 0}, nCount = 1},
		{szName = "Tói ®­êng", tbProp = {6, 1, 1504, 1, 0, 0}, nCount = 1},
		{szName = "Trøng", tbProp = {6, 1, 1505, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Lµm B¸nh §Ëu Xanh", tbMat, "TienHanh_LamBanhDX")
end
function Menu_BanhHatSen()
	local tbMat = {
		{szName = "Tói h¹t sen", tbProp = {6, 1, 1507, 1, 0, 0}, nCount = 1},
		{szName = "Bét", tbProp = {6, 1, 1503, 1, 0, 0}, nCount = 1},
		{szName = "Tói ®­êng", tbProp = {6, 1, 1504, 1, 0, 0}, nCount = 1},
		{szName = "Trøng", tbProp = {6, 1, 1505, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Lµm B¸nh H¹t Sen", tbMat, "TienHanh_LamBanhHS")
end
function Menu_BanhGaNuong()
	local tbMat = {
		{szName = "Tói thÞt gµ", tbProp = {6, 1, 1508, 1, 0, 0}, nCount = 1},
		{szName = "Bét", tbProp = {6, 1, 1503, 1, 0, 0}, nCount = 1},
		{szName = "Tói ®­êng", tbProp = {6, 1, 1504, 1, 0, 0}, nCount = 1},
		{szName = "Trøng", tbProp = {6, 1, 1505, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Lµm B¸nh Gµ N­íng", tbMat, "TienHanh_LamBanhGN")
end
function Menu_BanhHeoQuay()
	local tbMat = {
		{szName = "ThÞt", tbProp = {6, 1, 1509, 1, 0, 0}, nCount = 1},
		{szName = "Bét", tbProp = {6, 1, 1503, 1, 0, 0}, nCount = 1},
		{szName = "Tói ®­êng", tbProp = {6, 1, 1504, 1, 0, 0}, nCount = 1},
		{szName = "Trøng", tbProp = {6, 1, 1505, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Lµm B¸nh Heo Quay", tbMat, "TienHanh_LamBanhHQ")
end
function Menu_GhepHop()
	local tbMat = {
		{szName = "B¸nh ®Ëu xanh", tbProp = {6, 1, 1510, 1, 0, 0}, nCount = 1},
		{szName = "B¸nh h¹t sen", tbProp = {6, 1, 1511, 1, 0, 0}, nCount = 1},
		{szName = "B¸nh Trung Thu gµ n­íng", tbProp = {6, 1, 1512, 1, 0, 0}, nCount = 1},
		{szName = "B¸nh Trung Thu heo quay", tbProp = {6, 1, 1513, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("GhÐp Hép B¸nh Trung Thu", tbMat, "TienHanh_GhepHop")
end
function Menu_MuaNguyenLieu()
	local tbOpt = {
		{"Mua Tói H¹t Sen (3 v¹n)", Menu_MuaHatSen},
		{"Mua Tói ThÞt Gµ (5 v¹n)", Menu_MuaThitGa},
		{"Mua ThÞt Heo (1 TiÒn §ång)", Menu_MuaThitHeo},
		{"Quay l¹i", main}
	}
	CreateNewSayEx("Nguyªn liÖu thîng h¹ng do ChÞ H»ng ®Ých th©n chuÈn bÞ. Ng­êi muèn mua g×?", tbOpt)
end

function Menu_MuaHatSen()
	local tbMat = {
		{szName = "Ng©n l­îng", nJxb = 30000},
	}
	SKN_XacNhan("Mua Tói H¹t Sen", tbMat, "TienHanh_MuaHatSen")
end
function Menu_MuaThitGa()
	local tbMat = {
		{szName = "Ng©n l­îng", nJxb = 50000},
	}
	SKN_XacNhan("Mua Tói ThÞt Gµ", tbMat, "TienHanh_MuaThitGa")
end
function Menu_MuaThitHeo()
	local tbMat = {
		{szName = "TiÒn §ång", tbProp = {4, 417, 1, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Mua ThÞt Heo", tbMat, "TienHanh_MuaThitHeo")
end
-- ================= HÀM H? TR? KI?M TRA =================
function CheckNguyenLieuChung(nCount)
	if CalcEquiproomItemCount(6, 1, 1503, -1) < nCount then return 0 end -- Bot
	if CalcEquiproomItemCount(6, 1, 1504, -1) < nCount then return 0 end -- Duong
	if CalcEquiproomItemCount(6, 1, 1505, -1) < nCount then return 0 end -- Trung
	return 1
end

function ConsumeNguyenLieuChung(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1503, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1504, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1505, -1)
end

function CheckBonBanh(nCount)
	if CalcEquiproomItemCount(6, 1, 1510, -1) < nCount then return 0 end 
	if CalcEquiproomItemCount(6, 1, 1511, -1) < nCount then return 0 end 
	if CalcEquiproomItemCount(6, 1, 1512, -1) < nCount then return 0 end 
	if CalcEquiproomItemCount(6, 1, 1513, -1) < nCount then return 0 end 
	return 1
end

function ConsumeBonBanh(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1510, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1511, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1512, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1513, -1)
end

-- ================= LOGIC N?U BÁNH & GHÉP H?P =================
function TienHanh_LamBanhDX(nCount)
	if CheckNguyenLieuChung(nCount) == 0 then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " bé (Bét + §­êng + Trøng)!")
		return
	end
	if CalcEquiproomItemCount(6, 1, 1506, -1) < nCount then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " §Ëu Xanh!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	ConsumeNguyenLieuChung(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1506, -1)
	
	for i = 1, nCount do AddItem(6, 1, 1510, 1, 0, 0) end
	Msg2Player("Lµm thµnh c«ng " .. nCount .. " B¸nh §Ëu Xanh!")
end

function TienHanh_LamBanhHS(nCount)
	if CheckNguyenLieuChung(nCount) == 0 then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " bé (Bét + §­êng + Trøng)!")
		return
	end
	if CalcEquiproomItemCount(6, 1, 1507, -1) < nCount then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " Tói H¹t Sen!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	ConsumeNguyenLieuChung(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1507, -1)
	
	for i = 1, nCount do AddItem(6, 1, 1511, 1, 0, 0) end
	Msg2Player("Lµm thµnh c«ng " .. nCount .. " B¸nh H¹t Sen!")
end

function TienHanh_LamBanhGN(nCount)
	if CheckNguyenLieuChung(nCount) == 0 then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " bé (Bét + §­êng + Trøng)!")
		return
	end
	if CalcEquiproomItemCount(6, 1, 1508, -1) < nCount then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " Tói ThÞt Gµ!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	ConsumeNguyenLieuChung(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1508, -1)
	
	for i = 1, nCount do AddItem(6, 1, 1512, 1, 0, 0) end
	Msg2Player("Lµm thµnh c«ng " .. nCount .. " B¸nh Gµ N­íng!")
end

function TienHanh_LamBanhHQ(nCount)
	if CheckNguyenLieuChung(nCount) == 0 then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " bé (Bét + §­êng + Trøng)!")
		return
	end
	if CalcEquiproomItemCount(6, 1, 1509, -1) < nCount then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " ThÞt Heo!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	ConsumeNguyenLieuChung(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1509, -1)
	
	for i = 1, nCount do AddItem(6, 1, 1513, 1, 0, 0) end
	Msg2Player("Lµm thµnh c«ng " .. nCount .. " B¸nh Heo Quay!")
end

function TienHanh_GhepHop(nCount)
	if CheckBonBanh(nCount) == 0 then
		Msg2Player("Hµnh trang kh«ng cã ®ñ " .. nCount .. " bé B¸nh Trung Thu (4 VÞ)!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng ®Ó ghÐp ®å!")
		return
	end
	
	ConsumeBonBanh(nCount)
	
	for i = 1, nCount do AddItem(6, 1, 1514, 1, 0, 0) end
	Msg2Player("GhÐp thµnh c«ng " .. nCount .. " Hép B¸nh Trung Thu!")
end

-- ================= LOGIC BÁN V?T PH?M (TR? TI?N) =================
function TienHanh_MuaHatSen(nCount)
	local nCost = nCount * 30000
	
	if GetCash() < nCost then
		Msg2Player("Ng­êi kh«ng cã ®ñ " .. (nCount * 3) .. " v¹n l­îng!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	Pay(nCost)
	
	for i = 1, nCount do AddItem(6, 1, 1507, 1, 0, 0) end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " Tói H¹t Sen!")
end

function TienHanh_MuaThitGa(nCount)
	local nCost = nCount * 50000
	
	if GetCash() < nCost then
		Msg2Player("Ng­êi kh«ng cã ®ñ " .. (nCount * 5) .. " v¹n l­îng!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	Pay(nCost)
	
	for i = 1, nCount do AddItem(6, 1, 1508, 1, 0, 0) end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " Tói ThÞt Gµ!")
end

function TienHanh_MuaThitHeo(nCount)
	if CalcEquiproomItemCount(4, 417, 1, -1) < nCount then
		Msg2Player("Ng­êi kh«ng cã ®ñ " .. nCount .. " TiÒn §ång!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt 5 « trèng!")
		return
	end
	
	ConsumeEquiproomItem(nCount, 4, 417, 1, -1)
	
	for i = 1, nCount do AddItem(6, 1, 1509, 1, 0, 0) end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " ThÞt Heo b»ng TiÒn §ång!")
end


-- ================= WRAPPERS G?I HÀM =================
function KetThuc() end