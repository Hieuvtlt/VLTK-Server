Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	if SKN_ThangMo(12) ~= 1 then
		local szMsg_Close = "<color=green>Thiªn Sø Gi¸ng Sinh:<color>\nGií phót gi¸ng sinh ch­a tíi, tuÇn léc cña ta vÉn ®ang nghØ ng¬i. HÑn gÆp l¹i §¹i hiÖp vµo mïa ®«ng nhÐ!"
		CreateNewSayEx(szMsg_Close, {{"Tho¸t", KetThuc}})
		return 1
	end

	local szMsg = "<color=red>Thiªn Sø Gi¸ng Sinh:<color>\nGi¸ng sinh an lµnh! C¸c h¹ ®· chuÈn bÞ quµ tÆng cho nh÷ng ng­êi th©n yªu ch­a?"
	local tbOpt = {
		{"Mua ThiÖp Gi¸ng Sinh (B»ng V¹n)", Menu_MuaThiep},
		{"Mua Ng«i Sao Gi¸ng Sinh (1 TiÒn §ång)", Menu_MuaNgoiSao},
		{"GhÐp KÑo Gi¸ng Sinh", Menu_GhepKeo},
		{"GhÐp Hép Quµ Gi¸ng Sinh", Menu_GhepHopQua},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function Menu_SuKien_Thang12() main() end

function Menu_MuaThiep()
	local tbMat = {
		{szName = "Ng©n l­îng", nJxb = 30000},
	}
	SKN_XacNhan("Mua ThiÖp Gi¸ng Sinh", tbMat, "MuaThiep")
end
function Menu_MuaNgoiSao()
	local tbMat = {
		{szName = "TiÒn §ång", tbProp = {4, 417, 1, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Mua Ng«i Sao Gi¸ng Sinh", tbMat, "MuaNgoiSao")
end
function Menu_GhepKeo()
	local tbMat = {
		{szName = "ThiÖp Gi¸ng Sinh", tbProp = {6, 1, 1846, 1, 0, 0}, nCount = 1},
		{szName = "NÕn Gi¸ng Sinh", tbProp = {6, 1, 1843, 1, 0, 0}, nCount = 1},
		{szName = "Chu«ng Gi¸ng Sinh", tbProp = {6, 1, 1844, 1, 0, 0}, nCount = 1},
		{szName = "Ví Gi¸ng Sinh", tbProp = {6, 1, 1845, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("GhÐp KÑo Gi¸ng Sinh", tbMat, "GhepKeo")
end
function Menu_GhepHopQua()
	local tbMat = {
		{szName = "Ng«i Sao Gi¸ng Sinh", tbProp = {6, 1, 1847, 1, 0, 0}, nCount = 1},
		{szName = "NÕn Gi¸ng Sinh", tbProp = {6, 1, 1843, 1, 0, 0}, nCount = 1},
		{szName = "Chu«ng Gi¸ng Sinh", tbProp = {6, 1, 1844, 1, 0, 0}, nCount = 1},
		{szName = "Ví Gi¸ng Sinh", tbProp = {6, 1, 1845, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("GhÐp Hép Quµ Gi¸ng Sinh", tbMat, "GhepHopQua")
end
-- ================= HÀM X? LÝ CHÍNH =================
function GetNeedCell(nCount)
	if nCount >= 100 then return 10
	elseif nCount >= 50 then return 5
	elseif nCount >= 10 then return 2
	else return 1 end
end

function MuaThiep(nCount)
	local nCost = nCount * 30000
	if GetCash() < nCost then
		Msg2Player("Kh«ng ®ñ " .. (nCost/10000) .. " v¹n l­îng!") return
	end
	if CalcFreeItemCellCount() < GetNeedCell(nCount) then
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return
	end
	
	Pay(nCost)
	for i = 1, nCount do AddItem(6, 1, 1846, 1, 0, 0) end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " ThiÖp Gi¸ng Sinh!")
end

function MuaNgoiSao(nCount)
	if CalcEquiproomItemCount(4, 417, 1, -1) < nCount then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " TiÒn §ång!") return
	end
	if CalcFreeItemCellCount() < GetNeedCell(nCount) then
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return
	end
	
	ConsumeEquiproomItem(nCount, 4, 417, 1, -1)
	for i = 1, nCount do AddItem(6, 1, 1847, 1, 0, 0) end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " Ng«i Sao Gi¸ng Sinh!")
end

function CheckNLChung(nCount)
	if CalcEquiproomItemCount(6, 1, 1843, -1) < nCount then return 0 end -- Nen
	if CalcEquiproomItemCount(6, 1, 1844, -1) < nCount then return 0 end -- Chuong
	if CalcEquiproomItemCount(6, 1, 1845, -1) < nCount then return 0 end -- Vo
	return 1
end

function ConsumeNLChung(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1843, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1844, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 1845, -1)
end

function GhepKeo(nCount)
	if CheckNLChung(nCount) == 0 then 
		Msg2Player("Kh«ng cã ®ñ " .. nCount .. " bé nguyªn liÖu (NÕn + Chu«ng + Ví)!") 
		return 
	end
	if CalcEquiproomItemCount(6, 1, 1846, -1) < nCount then 
		Msg2Player("Kh«ng ®ñ " .. nCount .. " ThiÖp Gi¸ng Sinh!") 
		return 
	end
	if CalcFreeItemCellCount() < GetNeedCell(nCount) then 
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") 
		return 
	end
	
	ConsumeNLChung(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1846, -1)
	for i = 1, nCount do AddItem(6, 1, 1626, 1, 0, 0) end
	Msg2Player("GhÐp thµnh c«ng " .. nCount .. " KÑo gi¸ng sinh (®Æc biÖt)!")
end

function GhepHopQua(nCount)
	if CheckNLChung(nCount) == 0 then 
		Msg2Player("Kh«ng cã ®ñ " .. nCount .. " bé nguyªn liÖu (NÕn + Chu«ng + Ví)!") 
		return 
	end
	if CalcEquiproomItemCount(6, 1, 1847, -1) < nCount then 
		Msg2Player("Kh«ng ®ñ " .. nCount .. " Ng«i Sao Gi¸ng Sinh!") 
		return 
	end
	if CalcFreeItemCellCount() < GetNeedCell(nCount) then 
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") 
		return 
	end
	
	ConsumeNLChung(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 1847, -1)
	for i = 1, nCount do AddItem(6, 1, 1627, 1, 0, 0) end
	Msg2Player("GhÐp thµnh c«ng " .. nCount .. " Hép quµ gi¸ng sinh!")
end

function KetThuc() end