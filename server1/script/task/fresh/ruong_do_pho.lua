-- Ho Tro nhiem vu mon phai By Vo Lam Cu Chuoi
--Include("\\script\\global\\repute_head.lua")
--Include("\\script\\global\\skills_table.lua")

function main(nItemIndex)
	local player_Faction = GetFaction() 
	
	if (player_Faction == "shaolin") then
		Say ("Chän §å phæ hoing kim ! ! !", 4,
			"§å phæ Méng Long Kim Cang La Hln Thn/Done_ThieuLam_1",
			"§å phæ Phôc Ma Tö Kim CTn/Done_ThieuLam_2",
			"§å phæ Tø KhTng Gilng Ma Giíi §ao/Done_ThieuLam_3",
			"KÕt Thóc §ci Thodi/OnCancel");
	elseif (player_Faction == "tianwang") then
		Say ("Chän §å phæ ! ! !", 4,
			"§å phæ Hlm ThiŠn Kim Hoin §di Nh·n ThIn Chïy/Done_ThienVuong_1",
			"§å phæ KÕ NghiÖp BTn LTi Toin Long Th­Žng/Done_ThienVuong_2",
			"§å phæ Ngu Long L­îng NgÐn Bko §ao/Done_ThienVuong_3",
			"KÕt Thóc §ci Thodi/OnCancel");
	elseif (player_Faction == "tangmen") then
		Say ("Chän §å phæ ! ! !", 4,
			"§å phæ BLng Hin §Žn ChØ Phi §ao/Done_DuongMon_1",
			"§å phæ ThiŠn Quang Hoa Vo Mdn ThiŠn/Done_DuongMon_2",
			"§å phæ SÐm Hoang Phi Tinh §odt Hån/Done_DuongMon_3",
			"KÕt Thóc §ci Thodi/OnCancel");
	elseif (player_Faction == "wudu") then
		Say ("Chän §å phæ ! ! !", 3,
			"§å phæ U Lung NgÐn ThiOm Vdn NiŠn §éc Thn/Done_NguDoc_1", 
			"§å phæ Minh ko Ti Slt §éc NhËn/Done_NguDoc_2",
			"KÕt Thóc §ci Thodi/OnCancel");
	elseif (player_Faction == "emei") then
		Say ("Chän §å phæ ! ! !", 3,
			"§å phæ VT Gian û ThiŠn KiÕm/Done_NgaMy_1",
			"§å phæ VT Ma BLng S­Žng TrEn Ti KiÕm/Done_NgaMy_2",
			"KÕt Thóc §ci Thodi/OnCancel");
	elseif (player_Faction == "cuiyan") then
		Say ("Chän §å phæ ! ! !", 3,
			"§å phæ TŠ Hoing Phông Nghi §ao/Done_ThuyYen_1",
			"§å phæ BÝch Hki UyŠn KŽng LiŠn Hoin §ao/Done_ThuyYen_2",
			"KÕt Thóc §ci Thodi/OnCancel");
	elseif (player_Faction == "gaibang") then
		Say ("Chän §å phæ ! ! !", 3,
			"§å phæ §ång Cõu CCm Long Hé Thn/Done_CaiBang_1",
			"§å phæ §Þch Khli Lôc Ngäc Truîng/Done_CaiBang_2",
			"KÕt Thóc §ci Thodi/OnCancel");
	elseif (player_Faction == "tianren") then
		Say ("Chän §å phæ ! ! !", 3,
			"§å phæ Ma Slt Quû Ccc U Minh Th­Žng/Done_ThienNhan_1",
			"§å phæ Ma ThÞ ThiŠu Hån LiÖt Hok §ao/Done_ThienNhan_2",
			"KÕt Thóc §ci Thodi/OnCancel");
	elseif (player_Faction == "wudang") then
		Say ("Chän §å phæ ! ! !", 3,
			"§å phæ LLng Nhdc Thli Cuc KiÕm/Done_VoDang_1",
			"§å phæ CËp Phong ChÐn Vo KiÕm/Done_VoDang_2",
			"KÕt Thóc §ci Thodi/OnCancel");
	elseif (player_Faction == "kunlun") then
		Say ("Chän §å phæ ! ! !", 3,
			"§å phæ S­Žng Tinh ThiŠn NiŠn Hin ThiÕt/Done_ConLon_1",
			"§å phæ LTi Khung Cöu ThiŠn DÉn LTi KiÕm/Done_ConLon_2",
			"KÕt Thóc §ci Thodi/OnCancel");
	else
		Say("H×nh nh­ quyÓn s¸ch nµy ghi chÐp vâ c«ng cao cÊp cña c¸c §¹i m«n ph¸i, ng­¬i ch­a gia nhËp ph¸i nªn kh«ng thÓ hiÓu sù huyÒn c¬ cña nã.", 0)
		return 1
	end
	
	-- C?C K? QUAN TR?NG: Return 1 d? Game không t? xóa d? khi v?a click
	return 1
end

function OnCancel()
end

-- QUAY L?I S? D?NG HÀM ConsumeItem CHUYÊN D?NG CHO Ð? X?P CH?NG
function Done_ConLon_1()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5108, 1, 0, 0)
	end
end
function Done_ConLon_2()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5113, 1, 0, 0)
	end
end

function Done_VoDang_1()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5098, 1, 0, 0)	
	end	
end
function Done_VoDang_2()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5103, 1, 0, 0)
	end
end

function Done_ThienNhan_1()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5088, 1, 0, 0)
	end
end
function Done_ThienNhan_2()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5093, 1, 0, 0)
	end
end

function Done_CaiBang_1()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5081, 1, 0, 0)
	end
end
function Done_CaiBang_2()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5083, 1, 0, 0)
	end
end

function Done_ThuyYen_1()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5043, 1, 0, 0)
	end
end
function Done_ThuyYen_2()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5048, 1, 0, 0)
	end
end

function Done_NgaMy_1()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5033, 1, 0, 0)
	end
end
function Done_NgaMy_2()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5040, 1, 0, 0)
	end
end

function Done_NguDoc_1()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5056, 1, 0, 0)
	end
end
function Done_NguDoc_2()
	if (ConsumeItem(3, 1, 6, 1, 5001, -1) == 1) then
		AddItem(6, 1, 5058, 1, 0, 0)
	end
end
