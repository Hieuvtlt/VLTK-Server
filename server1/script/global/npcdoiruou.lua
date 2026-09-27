-- ==========================================
-- SCRIPT NPC GHEP 100 BAU RUOU (ID 2013)
-- ==========================================

function main(sel)
	-- X? lý khi ngu?i choi b?m vào các dòng l?a ch?n (0 = dòng d?u, 1 = dòng hai)
	if sel == 0 then
		GhepRuou100()
		return
	elseif sel == 1 then
		return -- B?m dòng 2 s? K?t thúc d?i tho?i, dóng NPC ngay l?p t?c
	end

	-- N?u chua b?m gì (sel là nil), thì hi?n B?ng tho?i này
	local szTitle = "<color=yellow>Sø Gi¶ Sù KiÖn<color>\nNg­¬i mang ®ñ nguyªn liÖu råi chø? Ta sÏ ghÐp tÆng ng­¬i 100 BÇu R­îu (miÔn phÝ) mét lÇn cho nhanh!"
	Say(szTitle, 2, "GhÐp 100 BÇu R­îu", "KÕt thóc ®èi tho¹i")
end

function GhepRuou100()
	-- 1. Ð?nh m?c nguyên li?u cho 100 bình B?u Ru?u (ID 2013)
	local sl_Gao = 200   -- 2 x 100 Bao G?o (ID 2010)
	local sl_Nuoc = 300  -- 3 x 100 Nu?c tinh khi?t (ID 2011)
	local sl_Men = 100   -- 1 x 100 Men ru?u (ID 2012)

	-- 2. Ki?m tra s? lu?ng nguyên li?u dang có trong ngu?i
	local co_Gao = CalcEquiproomItemCount(6, 1, 2010, -1)
	local co_Nuoc = CalcEquiproomItemCount(6, 1, 2011, -1)
	local co_Men = CalcEquiproomItemCount(6, 1, 2012, -1)

	-- 3. Báo l?i n?u không d? nguyên li?u
	if co_Gao < sl_Gao or co_Nuoc < sl_Nuoc or co_Men < sl_Men then
		Talk(1, "", "Nguyªn liÖu kh«ng ®ñ ®Ó ghÐp 100 b×nh! CÇn Ýt nhÊt <color=yellow>"..sl_Gao.." G¹o, "..sl_Nuoc.." N­íc vµ "..sl_Men.." Men<color>.")
		return
	end

	-- 4. Ki?m tra 1 ô tr?ng d? nh?n 1 c?c 100 bình x?p ch?ng
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "Hµnh trang cña ngµi ®· ®Çy, h·y chõa l¹i Ýt nhÊt 1 « trèng ®Ó nhËn r­îu!")
		return
	end

	-- 5. Tr? nguyên li?u (Mi?n phí hoàn toàn, không có hàm tr? ti?n)
	ConsumeEquiproomItem(sl_Gao, 6, 1, 2010, -1)
	ConsumeEquiproomItem(sl_Nuoc, 6, 1, 2011, -1)
	ConsumeEquiproomItem(sl_Men, 6, 1, 2012, -1)

	-- 6. Add 1 c?c x?p ch?ng 100 B?u Ru?u (ID 2013) vào túi
	AddStackItem(100, 6, 1, 2013, 1, 0, 0, 0)

	Msg2Player("Chóc mõng! B¹n ®· ñ thµnh c«ng 100 BÇu R­îu.")
end