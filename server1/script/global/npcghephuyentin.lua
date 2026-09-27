-- ==========================================
-- SCRIPT NPC GHEP HUYEN TINH (TU DONG CUON CHIEU TAT CA)
-- ==========================================

function main(sel)
	if sel == 0 then 
		AutoGhepAll()
		return
	elseif sel == 1 then 
		return 
	end

	local szTitle = "<color=yellow>BËc ThÇy GhÐp §å<color>\n\n<color=green>Quy t¾c:<color> 2 viªn cÊp thÊp = 1 viªn cÊp cao.\nTû lÖ: Lªn cÊp 10 lµ <color=yellow>50%<color>, c¸c cÊp kh¸c <color=yellow>100%<color>.\n<color=red>§Æc biÖt:<color> ThÊt b¹i chØ mÊt 1 viªn!\n\nTa cã thÓ gióp ng­¬i <color=green>GhÐp TÊt C¶<color> Huyªn Tinh. HÖ thèng sÏ tù ®éng quÐt vµ ghÐp cuèn chiÕu tõ cÊp 1 lªn tèi ®a cÊp 10 chØ víi 1 lÇn nhÊp chuét!"
	Say(szTitle, 2,
		"Tù §éng GhÐp TÊt C¶",
		"KÕt thóc ®èi tho¹i"
	)
end

function AutoGhepAll()
	local bHasAction = 0
	local szResult = "KÕt qu¶ ghÐp tù ®éng:\n"
	
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "Hµnh trang cña ng­¬i ®· ®Çy, h·y chõa l¹i Ýt nhÊt 1 « trèng ®Ó nhËn ®å!")
		return
	end

	-- Quét vòng l?p t? c?p 1 d?n 9 d? t? d?ng nâng c?p d?n lên
	for lvl = 1, 9 do
		local nTargetLevel = lvl + 1
		local nRate = 100 -- M?c d?nh các c?p là 100%
		
		-- Riêng ghép lên c?p 10 thì t? l? là 50%
		if nTargetLevel == 10 then
			nRate = 20
		end
		
		local co_NL = CalcEquiproomItemCount(6, 1, 147, lvl)
		local max_CanCraft = floor(co_NL / 2)
		
		if max_CanCraft > 0 then
			bHasAction = 1
			local nCount = max_CanCraft
			
			-- Ch?t ch?n an toàn: gi?i h?n 500 l?n ghép m?i c?p cho 1 cú click d? ch?ng lag Server
			if nCount > 500 then nCount = 500 end
			
			local nSuccess = 0
			local nFail = 0
			
			-- Ð? xúc x?c t? d?ng
			for i = 1, nCount do
				if random(1, 100) <= nRate then
					nSuccess = nSuccess + 1
				else
					nFail = nFail + 1
				end
			end
			
			-- N?u thành công tr? 2 viên, n?u th?t b?i ch? tr? 1 viên
			local nConsumed = (nSuccess * 2) + (nFail * 1)
			ConsumeEquiproomItem(nConsumed, 6, 1, 147, lvl)
			
			-- Add thành ph?m (C?ng d?n vào túi)
			if nSuccess > 0 then
				AddStackItem(nSuccess, 6, 1, 147, nTargetLevel, 0, 0, 0)
			end
			
			-- C?p nh?t b?ng thông báo
			szResult = szResult .. "- Lªn CÊp "..nTargetLevel..": Thµnh c«ng <color=green>"..nSuccess.."<color>, XÞt <color=red>"..nFail.."<color>\n"
		end
	end
	
	if bHasAction == 0 then
		Talk(1, "", "Trong hµnh trang kh«ng cã ®ñ 2 viªn Huyªn Tinh cïng cÊp ®Ó ghÐp!")
	else
		Msg2Player("GhÐp tù ®éng hoµn tÊt!")
		Talk(1, "", szResult)
	end
end