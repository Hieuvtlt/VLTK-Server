-- ============================================================
-- TÓI CµN KH¤N - B¸N §å QUA GIAO DIÖN (B¶N CHèT CUèI)
-- ============================================================
Include("\\script\\lib\\common.lua")
Include("\\script\\item\\tuicankhon_gia.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")


-- [23/09/2026] Bang gia + TinhGiaItemTui da chuyen sang tuicankhon_gia.lua
-- de tui me va tui Thien Phuc dung chung MOT bang gia.

-- ================== KHëI T¹O GIAO DIÖN ==================
-- ID vat pham Tui Can Khon Thien Phuc (ban 1 click)
TCK_ID_TP = 5180

function main(nItemIdx)
	local szTrang = "<color=green>§ang bËt<color>"
	if TCK_BAN_DO_TRANG ~= 1 then szTrang = "<color=red>§ang t¾t<color>" end

	local szMsg = "<color=yellow>Tói Cµn Kh«n<color><enter><enter>"
	szMsg = szMsg .. "B¸n ®å Tr¾ng (0 dßng xanh): " .. szTrang

	local tbOpt = {
		{"Dïng tói cµn kh«n", TCK_MoBangDatDo},
		{"Gäi ra Tói Cµn Kh«n ThiÖn Phóc", TCK_GoiRaTP},
		{"Thu håi Tói Cµn Kh«n ThiÖn Phóc", TCK_ThuHoiTP},
		{"§æi chÕ ®é b¸n ®å Tr¾ng", TCK_DoiCoTrang},
		{"Tho¸t"},
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

-- Chuc nang goc: mo bang cho nguoi choi TU BO do can thanh ly vao
function TCK_MoBangDatDo()
	GiveItemUI(
		"Tói Cµn Kh«n",
		"Bá c¸c mãn Trang BÞ (Tr¾ng/Xanh) cÇn thanh lý vµo ®©y.\nNhÊn <color=green>X¸c ®Þnh<color> tói sÏ tù ®éng hãa kiÕp chóng thµnh vµng l­îng.\n(T¹p vËt, vËt phÈm nhiÖm vô vµ ®å Hoµng Kim sÏ ®­îc hoµn tr¶ l¹i r­¬ng)",
		"XuLyBanDoTrucTiep",
		"HuyBo",
		1
	)
end

function TCK_GoiRaTP()
	if CalcEquiproomItemCount(6, 1, TCK_ID_TP, -1) > 0 then
		Msg2Player("<color=red>Ng­¬i ®· cã Tói Cµn Kh«n ThiÖn Phóc råi!<color>") return
	end
	if CalcFreeItemCellCount() < 1 then
		Msg2Player("<color=red>Hµnh trang cÇn Ýt nhÊt 1 « trèng!<color>") return
	end
	AddItem(6, 1, TCK_ID_TP, 1, 0, 0)
	Msg2Player("<color=yellow>§· gäi ra Tói Cµn Kh«n ThiÖn Phóc. BÊm mét c¸i lµ quÐt s¹ch hµnh trang.<color>")
end

function TCK_ThuHoiTP()
	local n = CalcEquiproomItemCount(6, 1, TCK_ID_TP, -1)
	if n < 1 then
		Msg2Player("<color=red>Ng­¬i kh«ng cã Tói Cµn Kh«n ThiÖn Phóc nµo ®Ó thu håi.<color>") return
	end
	ConsumeEquiproomItem(n, 6, 1, TCK_ID_TP, -1)
	Msg2Player("<color=yellow>§· thu håi " .. n .. " Tói Cµn Kh«n ThiÖn Phóc.<color>")
end

-- Co TCK_BAN_DO_TRANG la bien TOAN CUC ca server: doi o day la doi cho MOI NGUOI.
function TCK_DoiCoTrang()
	if TCK_BAN_DO_TRANG == 1 then
		TCK_BAN_DO_TRANG = 0
		Msg2Player("<color=red>§· t¾t b¸n ®å Tr¾ng cho Tói ThiÖn Phóc (¸p dông toµn server).<color>")
	else
		TCK_BAN_DO_TRANG = 1
		Msg2Player("<color=green>§· bËt b¸n ®å Tr¾ng cho Tói ThiÖn Phóc (¸p dông toµn server).<color>")
	end
end

-- ================== Xö LÝ Vµ CéNG TIÒN ==================
function XuLyBanDoTrucTiep(nCount)
	if nCount < 1 then
		Msg2Player("Ng­¬i ch­a bá mãn ®å nµo vµo tói!")
		return
	end

	local nTotalLuong = 0
	local nTotalItem = 0
	local tbItemXoa = {}

	for i = 1, nCount do
		local v = GetGiveItemUnit(i)
		if v and v > 0 then
			local g, d, p, l = GetItemProp(v)
			
			-- B¾t buéc lµ Trang BÞ th× míi mua
			if g == 0 then
				local nGoldId = 0
				if type(GetGlodEqIndex) == "function" then 
					nGoldId = GetGlodEqIndex(v) or 0 
				end
				
				-- B¾t buéc KH¤NG ph¶i ®å Hoµng Kim
				if nGoldId <= 0 then
					local nSoDongXanh, nGia = TinhGiaItemTui(v)
					if nGia and nGia > 0 then
						nTotalLuong = nTotalLuong + nGia
						nTotalItem = nTotalItem + 1
						tinsert(tbItemXoa, v)
					end
				else
					Msg2Player("Tói ®· hoµn tr¶ l¹i Trang BÞ Hoµng Kim!")
				end
			else
				Msg2Player("Tói ®· hoµn tr¶ c¸c t¹p vËt, thuèc mµ ng­¬i bá nhÇm!")
			end
		end
	end

	if nTotalItem == 0 then
		Msg2Player("TÊt c¶ ®å ng­¬i bá vµo kh«ng ®¹t chuÈn thu mua!")
		return
	end

	-- Xãa ®å nhê API RemoveItemByIndex chuÈn x¸c
	for i = 1, getn(tbItemXoa) do
		RemoveItemByIndex(tbItemXoa[i])
	end

	-- Céng tiÒn vµ b¸o c¸o
	Earn(nTotalLuong)
	local szTien = FormatTien(nTotalLuong)
	Msg2Player("<color=yellow>[Tói Cµn Kh«n]<color> Giao dÞch hoµn tÊt! Tæng céng <color=green>"..nTotalItem.." mãn ®å r¸c<color>, nhËn vÒ <color=yellow>"..szTien.."<color>!")
end

function HuyBo()
	Msg2Player("§· hñy giao dÞch thanh lý!")
end