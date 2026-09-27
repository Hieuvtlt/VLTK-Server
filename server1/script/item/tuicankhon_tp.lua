Include("\\script\\lib\\common.lua")
Include("\\script\\item\\tuicankhon_gia.lua")

-- =========================================================================
-- TUI CAN KHON (ban Thien Phuc) - BAM MOT CAI, QUET SACH HANH TRANG
-- [23/09/2026] Ghep tu update 23.9.2026, co ba thay doi so voi ban goc:
--   1. Dung chung bang gia voi tui me (tuicankhon_gia.lua)
--   2. THEM chan do Hoang Kim bang GetGlodEqIndex - ban goc KHONG co,
--      no chi chan gian tiep qua quality nen ngua/mat na CHUA KHOA co the lot.
--   3. Co TCK_BAN_DO_TRANG do TUI ME bat/tat, la bien toan cuc ca server.
-- Item: 6/1/5180. Goi ra va thu hoi tu tui me 5171.
-- =========================================================================

-- 1 = ban ca do trang (0 dong xanh, 100 luong). 0 = bo qua do trang.
-- Gia tri nay do tui me dieu khien, KHONG sua tay o day.
if TCK_BAN_DO_TRANG == nil then TCK_BAN_DO_TRANG = 1 end

function main(nItemIdx)
	local tbEquip = GetRoomItems(0)
	if not tbEquip or type(tbEquip) ~= "table" then
		Msg2Player("<color=red>[Tói Cµn Kh«n]<color> Hµnh trang trèng hoÆc lçi ®äc d÷ liÖu!")
		return 1
	end

	local nTongLuong, nTongItem = 0, 0
	local nBoQuaHK = 0
	local tbXoa = {}

	for _, v in tbEquip do
		if v and v > 0 then
			local G, D, P = GetItemProp(v)
			if G then
				local bindState = GetItemBindState(v)
				local quality   = GetItemQuality(v)
				local nCount    = GetItemCount(v)

				-- Bo loc an toan cua ban goc: bo do khoa vinh vien, mot so pham chat,
				-- thuoc (G=1), tien (G=4), vat pham magicscript (G=6) va do xep chong.
				if (bindState ~= -2
					and quality ~= 1 and quality ~= 2 and quality ~= 4
					and G ~= 6 and G ~= 4 and G ~= 1
					and nCount <= 1
					and G >= 0 and G <= 11)
				then
					-- [THEM] Chan do Hoang Kim: ngua huyet mach, mat na Tieu Dao...
					local nGoldId = 0
					if type(GetGlodEqIndex) == "function" then
						nGoldId = GetGlodEqIndex(v) or 0
					end

					if nGoldId > 0 then
						nBoQuaHK = nBoQuaHK + 1
					else
						local nSoDongXanh, nGia = TinhGiaItemTui(v)
						-- Do trang (0 dong xanh) chi ban khi tui me bat co
						if nSoDongXanh == 0 and TCK_BAN_DO_TRANG ~= 1 then
							nGia = 0
						end
						if nGia and nGia > 0 then
							nTongLuong = nTongLuong + nGia
							nTongItem  = nTongItem + 1
							tinsert(tbXoa, v)
						end
					end
				end
			end
		end
	end

	if nTongItem > 0 then
		for i = 1, getn(tbXoa) do
			RemoveItemByIndex(tbXoa[i])
		end
		Earn(nTongLuong)
		Msg2Player("<color=yellow>[Tói Cµn Kh«n]<color> §· thanh lý <color=green>" .. nTongItem .. " mãn<color>, nhËn vÒ <color=yellow>" .. FormatTien(nTongLuong) .. "<color>!")
	else
		Msg2Player("<color=red>[Tói Cµn Kh«n]<color> Kh«ng cã mãn nµo ®¹t chuÈn thu mua!")
	end

	if nBoQuaHK > 0 then
		Msg2Player("<color=green>[Tói Cµn Kh«n]<color> §· gi÷ l¹i <color=yellow>" .. nBoQuaHK .. "<color> mãn Trang BÞ Hoµng Kim.")
	end

	return 1
end
