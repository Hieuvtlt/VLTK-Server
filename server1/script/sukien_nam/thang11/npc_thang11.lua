Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	if SKN_ThangMo(11) ~= 1 then
		local szMsg_Close = "<color=yellow>Tiªn Töu S­:<color>\nSù kiÖn th¸ng 11 ®· kÕt thóc. HÑn gÆp l¹i §¹i hiÖp vµo mïa thu n¨m sau!"
		CreateNewSayEx(szMsg_Close, {{"Tho¸t", KetThuc}})
		return 1
	end

	local szMsg = "<color=yellow>Tiªn Töu S­:<color>\nNhµ gi¸o lµ ng­êi dÉn lèi. §Ó b¸o ®¸p ©n s­, b¹n cã muèn mua d­îc liÖu hoÆc ñ r­îu quý kh«ng?"
	local tbOpt = {
		{"Mua Hoµng Linh Chi (B»ng V¹n)", Menu_MuaHLC},
		{"Mua Hæ Cèt (1 TiÒn §ång)", Menu_MuaHC},
		{"ñ Tiªn Linh Töu", Menu_UTLT},
		{"ñ Hæ Cèt Töu", Menu_UHCT},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function Menu_SuKien_Thang11() main() end

function Menu_MuaHLC()
	local tbMat = {
		{szName = "Ng©n l­îng", nJxb = 30000},
	}
	SKN_XacNhan("Mua Hoµng Linh Chi", tbMat, "MuaHLC")
end
function Menu_MuaHC()
	local tbMat = {
		{szName = "TiÒn §ång", tbProp = {4, 417, 1, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Mua Hæ Cèt", tbMat, "MuaHC")
end
function Menu_UTLT()
	local tbMat = {
		{szName = "Hoµng Linh chi", tbProp = {6, 1, 5157, 1, 0, 0}, nCount = 1},
		{szName = "Linh Chi Th¶o", tbProp = {6, 1, 5154, 1, 0, 0}, nCount = 1},
		{szName = "Nh©n s©m ngh×n n¨m", tbProp = {6, 1, 5155, 1, 0, 0}, nCount = 1},
		{szName = "ChØ huyÕt th¶o", tbProp = {6, 1, 5156, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Uñ Tiªn Linh Töu", tbMat, "UTLT")
end
function Menu_UHCT()
	local tbMat = {
		{szName = "Hæ cèt", tbProp = {6, 1, 5158, 1, 0, 0}, nCount = 1},
		{szName = "Linh Chi Th¶o", tbProp = {6, 1, 5154, 1, 0, 0}, nCount = 1},
		{szName = "Nh©n s©m ngh×n n¨m", tbProp = {6, 1, 5155, 1, 0, 0}, nCount = 1},
		{szName = "ChØ huyÕt th¶o", tbProp = {6, 1, 5156, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Uñ Hæ Cèt Töu", tbMat, "UHCT")
end
function MuaHLC(nCount)
	local nCost = nCount * 30000
	if GetCash() < nCost then
		Msg2Player("Kh«ng ®ñ " .. (nCost/10000) .. " v¹n l­îng!") return
	end
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return
	end
	Pay(nCost)
	for i = 1, nCount do AddItem(6, 1, 5157, 1, 0, 0) end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " Hoµng Linh chi!")
end

function MuaHC(nCount)
	if CalcEquiproomItemCount(4, 417, 1, -1) < nCount then
		Msg2Player("Kh«ng ®ñ " .. nCount .. " TiÒn §ång!") return
	end
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return
	end
	ConsumeEquiproomItem(nCount, 4, 417, 1, -1)
	for i = 1, nCount do AddItem(6, 1, 5158, 1, 0, 0) end
	Msg2Player("Mua thµnh c«ng " .. nCount .. " Hæ cèt!")
end

function CheckThaoDuoc(nCount)
	if CalcEquiproomItemCount(6, 1, 5154, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 5155, -1) < nCount then return 0 end
	if CalcEquiproomItemCount(6, 1, 5156, -1) < nCount then return 0 end
	return 1
end

function ConsumeThaoDuoc(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 5154, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 5155, -1)
	ConsumeEquiproomItem(nCount, 6, 1, 5156, -1)
end

function UTLT(nCount)
	if CheckThaoDuoc(nCount) == 0 then Msg2Player("Kh«ng cã ®ñ " .. nCount .. " bé 3 lo¹i th¶o d­îc!") return end
	if CalcEquiproomItemCount(6, 1, 5157, -1) < nCount then Msg2Player("Kh«ng ®ñ Hoµng Linh chi!") return end
	if CalcFreeItemCellCount() < 2 then Msg2Player("Hµnh trang cÇn Ýt nhÊt 2 « trèng!") return end
	
	ConsumeThaoDuoc(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 5157, -1)
	for i = 1, nCount do AddItem(6, 1, 5159, 1, 0, 0) end
	Msg2Player("ñ thµnh c«ng " .. nCount .. " Tiªn Linh töu!")
end

function UHCT(nCount)
	if CheckThaoDuoc(nCount) == 0 then Msg2Player("Kh«ng cã ®ñ " .. nCount .. " bé 3 lo¹i th¶o d­îc!") return end
	if CalcEquiproomItemCount(6, 1, 5158, -1) < nCount then Msg2Player("Kh«ng ®ñ Hæ cèt!") return end
	if CalcFreeItemCellCount() < 2 then Msg2Player("Hµnh trang cÇn Ýt nhÊt 2 « trèng!") return end
	
	ConsumeThaoDuoc(nCount)
	ConsumeEquiproomItem(nCount, 6, 1, 5158, -1)
	for i = 1, nCount do AddItem(6, 1, 5160, 1, 0, 0) end
	Msg2Player("ñ thµnh c«ng " .. nCount .. " Hæ Cèt Töu!")
end

function KetThuc() end