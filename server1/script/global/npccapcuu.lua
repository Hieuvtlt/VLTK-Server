-- ==========================================
-- SCRIPT NPC: LÃO AN MÀY (H? TR? GÀ)
-- Tên file: npchotroga.lua
-- ==========================================

function main()
	local szTitle = "Khi ®¹i hiÖp qu¸ gµ cÇn ph¶i t×m ®Õn l·o ¨n mµy nµy råi, ®©y ta cho ®¹i hiÖp ph¸p b¶o v­ît qua mäi khã kh¨n!"
	
	-- Cú pháp Say chu?n c?a JX1: Say("N?i dung", S?_Lu?ng_Nút, "Tên Nút 1/Hàm 1", "Tên Nút 2/Hàm 2")
	Say(szTitle, 2, "§©y lµ ph¸p b¶o/NhanPhapBao", "KÕt thóc ®èi tho¹i/no")
end

function NhanPhapBao()
	-- Ki?m tra hành trang có d? 1 ô tr?ng không
	if CalcFreeItemCellCount() < 1 then
		Msg2Player("Hµnh trang cña ngµi ®· ®Çy, vui lßng chõa Ýt nhÊt 1 « trèng!")
		return
	end

	-- Add v?t ph?m (Genre 6, DetailType 1, ParticularType 5133)
	AddItem(6, 1, 5133, 1, 0, 0)
	
	Msg2Player("Ngµi ®· nhËn ®­îc Ph¸p B¶o!")
end

function no()
end