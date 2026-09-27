function main(nItemIndex)
	-- 1. Ki?m tra hành trang có ch? ch?a không
	if CalcFreeItemCellCount() < 1 then
		Msg2Player("<color=yellow>Hành trang dã d?y! Hãy ch?a l?i ít nh?t 1 ô tr?ng.<color>")
		return 0 -- Tr? v? 0 d? h?y thao tác, không m?t túi
	end

	-- 2. L?y thông tin ID c?a chính cái túi máu bác dang b?m
	-- (Dùng d? phòng h? tru?ng h?p b? Core t? d?ng xóa)
	local nGenre, nDetail, nParticular = GetItemProp(nItemIndex)
	
	local nLevel = GetLevel()

	-- 3. X? lý nh?n thu?c theo c?p d?
	if nLevel < 120 then
		-- Nh?n 999 Tân Th? Ðan (ID 5131)
		AddStackItem(999, 6, 1, 5131, 1, 0, 0, 0)
		--Msg2Player("S? d?ng thành công! Nh?n du?c 999 <color=green>Tân Th? Ðan<color>.")
	else
		-- Nh?n 999 Càn Khôn Ðan (ID 5000)
		AddStackItem(999, 6, 1, 5000, 1, 0, 0, 0)
		--Msg2Player("S? d?ng thành công! Nh?n du?c 999 <color=green>Càn Khôn Ðan<color>.")
	end

	-- 4. BÍ KÍP GI? TÚI MÁU B?T T?
	-- M?c d?nh ch? c?n return 0 là h? th?ng s? gi? l?i v?t ph?m.
	-- NHUNG, n?u Server c?a bác b?m vào v?n b? m?t, bác hãy XÓA d?u (--) ? dòng AddItem bên du?i di nhé!
	
	 AddItem(nGenre, nDetail, nParticular, 1, 0, 0) 

	return 0 
end