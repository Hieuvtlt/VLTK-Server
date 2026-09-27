Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	
	-- §¤I Sè 9 THµNH Sè 5 KHI CH¹Y CHÝNH THøC
	if SKN_ThangMo(5) ~= 1 then
		CreateNewSayEx("<color=yellow>NPC Sù KiÖn:<color>\nSù kiÖn R­îu Mõng ChiÕn Th¾ng chØ diÔn ra trong Th¸ng 5, hÑn gÆp l¹i!", {{"Tho¸t", KetThuc}})
		return 1
	end

	local szMsg = "<color=yellow>NPC Sù KiÖn:<color>\nChµo mõng ®¹i tiÖc chiÕn th¾ng! Ng­¬i muèn dïng nguyªn liÖu ®Ó cÊt r­îu ngon hay muèn mua Nho T­¬i?"
	local tbOpt = {
		{"GhÐp B×nh R­îu (Th­êng)", Menu_BinhRuou},
		{"GhÐp R­îu Nho (Cao CÊp)", Menu_RuouNho},
		{"Mua Nho T­¬i (1 TiÒn §ång)", Menu_MuaNho},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function Menu_BinhRuou()
	local tbMat = {
		{szName = "Men r­îu", tbProp = {6, 1, 2012, 1, 0, 0}, nCount = 1},
		{szName = "Bao g¹o", tbProp = {6, 1, 2010, 1, 0, 0}, nCount = 1},
		{szName = "N­íc tinh khiÕt", tbProp = {6, 1, 2011, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("GhÐp BÇu R­îu", tbMat, "GhepBR")
end
function Menu_RuouNho()
	local tbMat = {
		{szName = "Men r­îu", tbProp = {6, 1, 2012, 1, 0, 0}, nCount = 1},
		{szName = "Bao g¹o", tbProp = {6, 1, 2010, 1, 0, 0}, nCount = 1},
		{szName = "N­íc tinh khiÕt", tbProp = {6, 1, 2011, 1, 0, 0}, nCount = 1},
		{szName = "Nho t­¬i", tbProp = {6, 1, 2007, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("GhÐp R­îu Nho", tbMat, "GhepRN")
end
function Menu_MuaNho()
	local tbMat = {
		{szName = "TiÒn §ång", tbProp = {4, 417, 1, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("Mua Nho T­¬i", tbMat, "MuaNho")
end
function GhepBR(nCount)
	local nCostCash = nCount * 30000
	if GetCash() < nCostCash then
		Msg2Player("Kh«ng ®ñ "..(nCostCash/10000).." v¹n l­îng!") return
	end
	if CalcEquiproomItemCount(6,1,2012,-1) < (nCount * 1) then Msg2Player("Kh«ng ®ñ Men R­îu!") return end
	if CalcEquiproomItemCount(6,1,2010,-1) < (nCount * 2) then Msg2Player("Kh«ng ®ñ Bao G¹o!") return end
	if CalcEquiproomItemCount(6,1,2011,-1) < (nCount * 3) then Msg2Player("Kh«ng ®ñ N­íc Tinh KhiÕt!") return end
	
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then 
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return 
	end

	Pay(nCostCash)
	ConsumeEquiproomItem(nCount * 1, 6, 1, 2012, -1)
	ConsumeEquiproomItem(nCount * 2, 6, 1, 2010, -1)
	ConsumeEquiproomItem(nCount * 3, 6, 1, 2011, -1)

	for i = 1, nCount do AddItem(6, 1, 2013, 1, 0, 0) end
	Msg2Player("<color=yellow>GhÐp thµnh c«ng "..nCount.." B×nh R­îu!<color>")
end

function GhepRN(nCount)
	if CalcEquiproomItemCount(6,1,2012,-1) < (nCount * 1) then Msg2Player("Kh«ng ®ñ Men R­îu!") return end
	if CalcEquiproomItemCount(6,1,2010,-1) < (nCount * 2) then Msg2Player("Kh«ng ®ñ Bao G¹o!") return end
	if CalcEquiproomItemCount(6,1,2011,-1) < (nCount * 3) then Msg2Player("Kh«ng ®ñ N­íc Tinh KhiÕt!") return end
	if CalcEquiproomItemCount(6,1,2007,-1) < (nCount * 1) then Msg2Player("Kh«ng ®ñ Nho T­¬i!") return end
	
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then 
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return 
	end

	Pay(nCostCash)
	ConsumeEquiproomItem(nCount * 1, 6, 1, 2012, -1)
	ConsumeEquiproomItem(nCount * 2, 6, 1, 2010, -1)
	ConsumeEquiproomItem(nCount * 3, 6, 1, 2011, -1)
	ConsumeEquiproomItem(nCount * 1, 6, 1, 2007, -1)

	for i = 1, nCount do AddItem(6, 1, 2014, 1, 0, 0) end
	Msg2Player("<color=yellow>GhÐp thµnh c«ng "..nCount.." R­îu Nho!<color>")
end

function MuaNho(nCount)
	-- Sö dông ®óng form TiÒn §ång mµ Server b¸c ®ang nhËn (4, 417, 1)
	if CalcEquiproomItemCount(4, 417, 1, -1) < nCount then
		Msg2Player("Kh«ng ®ñ "..nCount.." TiÒn §ång!") return
	end
	if CalcFreeItemCellCount() < floor(nCount/10) + 1 then
		Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") return
	end

	ConsumeEquiproomItem(nCount, 4, 417, 1, -1)

	for i = 1, nCount do AddItem(6, 1, 2007, 1, 0, 0) end
	Msg2Player("<color=yellow>Mua thµnh c«ng "..nCount.." Nho T­¬i!<color>")
end

function KetThuc() end