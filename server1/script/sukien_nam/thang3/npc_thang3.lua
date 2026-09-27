Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	if SKN_ThangMo(3) ~= 1 then
		local szMsg_Close = "<color=pink>Thî C¾m Hoa:<color>\nMïa hoa th¸ng 3 ®· kÕt thóc. HÑn gÆp l¹i §¹i hiÖp vµo n¨m sau!"
		CreateNewSayEx(szMsg_Close, {{"Tho¸t", KetThuc}})
		return 1
	end

	local szMsg = "<color=pink>Thî C¾m Hoa:<color>\nNg­êi muèn chuÈn bÞ quµ tÆng g× cho th¸ng 3 nµy?"
	local tbOpt = {
		{"Mua D©y Cét Hoa (B»ng V¹n)", Menu_MuaDay},
		{"Mua Giá §ùng Hoa (1 TiÒn §ång)", Menu_MuaGio},
		{"Gãi Bã Hoa Hång", Menu_GhepBo},
		{"C¾m Giá Hoa Hång VÜnh Cöu", Menu_GhepGio},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function Menu_SuKien_Thang3() main() end

function Menu_MuaDay()
	local tbMat = {
		{szName = "Ng©n l­îng", nJxb = 30000},
	}
	SKN_XacNhan("Mua D©y Cét Hoa", tbMat, "MuaDay")
end
function Menu_MuaGio()
	local tbMat = {
		{szName = "TiÒn §ång", tbProp = {4, 417, 1, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Mua Giá §ùng Hoa", tbMat, "MuaGio")
end
function Menu_GhepBo()
	local tbMat = {
		{szName = "D©y Cét Hoa", tbProp = {6, 1, 5150, 1, 0, 0}, nCount = 1},
		{szName = "Hoa Hång Tr¾ng", tbProp = {6, 1, 5146, 1, 0, 0}, nCount = 1},
		{szName = "Hoa Hång Xanh", tbProp = {6, 1, 5147, 1, 0, 0}, nCount = 1},
		{szName = "Hoa Hång Vµng", tbProp = {6, 1, 5148, 1, 0, 0}, nCount = 1},
		{szName = "Hoa Hång §á", tbProp = {6, 1, 5149, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("GhÐp Bã Hoa Hång", tbMat, "GhepBo")
end
function Menu_GhepGio()
	local tbMat = {
		{szName = "Giá §ùng Hoa", tbProp = {6, 1, 5151, 1, 0, 0}, nCount = 1},
		{szName = "Hoa Hång Tr¾ng", tbProp = {6, 1, 5146, 1, 0, 0}, nCount = 1},
		{szName = "Hoa Hång Xanh", tbProp = {6, 1, 5147, 1, 0, 0}, nCount = 1},
		{szName = "Hoa Hång Vµng", tbProp = {6, 1, 5148, 1, 0, 0}, nCount = 1},
		{szName = "Hoa Hång §á", tbProp = {6, 1, 5149, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("GhÐp Giá Hoa Hång", tbMat, "GhepGio")
end
function MuaDay(nCount)
	local nCost = nCount * 30000
	if GetCash() < nCost then
		Msg2Player("Kh«ng ®ñ " .. (nCost/10000) .. " v¹n l­îng!") return
	end
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return
	end
	Pay(nCost)
	for i = 1, nCount do AddItem(6, 1, 5150, 1, 0, 0) end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " D©y Cét Hoa!")
end

function MuaGio(nCount)
	if CalcEquiproomItemCount(4, 417, 1, -1) < nCount then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " TiÒn §ång!") return
	end
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return
	end
	ConsumeEquiproomItem(nCount, 4, 417, 1, -1)
	for i = 1, nCount do AddItem(6, 1, 5151, 1, 0, 0) end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " Giá §ùng Hoa!")
end

function CheckHoa(nCount)
	if CalcEquiproomItemCount(6, 1, 5146, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 5147, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 5148, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 5149, -1) < nCount then return 0 end
	return 1
end

function ConsumeHoa(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 5146, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 5147, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 5148, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 5149, -1)
end

function GhepBo(nCount)
	if CheckHoa(nCount) == 0 then Msg2Player("Kh«ng cã ®ñ " .. nCount .. " bé 4 lo¹i Hoa Hång!") return end
	if CalcEquiproomItemCount(6, 1, 5150, -1) < nCount then Msg2Player("Kh«ng ®ñ D©y Cét Hoa!") return end
	if CalcFreeItemCellCount() < 2 then Msg2Player("Hµnh trang cÇn Ýt nhÊt 2 « trèng!") return end
	ConsumeHoa(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 5150, -1)
	for i = 1, nCount do AddItem(6, 1, 5152, 1, 0, 0) end
	Msg2Player("Gãi thµnh c«ng " .. nCount .. " Bã Hoa Hång!")
end

function GhepGio(nCount)
	if CheckHoa(nCount) == 0 then Msg2Player("Kh«ng cã ®ñ " .. nCount .. " bé 4 lo¹i Hoa Hång!") return end
	if CalcEquiproomItemCount(6, 1, 5151, -1) < nCount then Msg2Player("Kh«ng ®ñ Giá §ùng Hoa!") return end
	if CalcFreeItemCellCount() < 2 then Msg2Player("Hµnh trang cÇn Ýt nhÊt 2 « trèng!") return end
	ConsumeHoa(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 5151, -1)
	for i = 1, nCount do AddItem(6, 1, 5153, 1, 0, 0) end
	Msg2Player("C¾m thµnh c«ng " .. nCount .. " Giá Hoa Hång VÜnh Cöu!")
end

function KetThuc() end