Include("\\script\\dailogsys\\g_dialog.lua")

-- ==========================================
-- CAU HINH ID NGUYEN LIEU
-- ==========================================
ITEM_TIENDONG_GENRE = 4
ITEM_TIENDONG_DETAIL = 417
ITEM_TIENDONG_PART = 1

ITEM_MANHHK_GENRE = 6
ITEM_MANHHK_DETAIL = 1
ITEM_MANHHK_PART = 5128

ITEM_MANHVD_GENRE = 6
ITEM_MANHVD_DETAIL = 1
ITEM_MANHVD_PART = 5134

-- Cau hinh ID Huyen Tinh Cap 10
ITEM_HT_GENRE = 6
ITEM_HT_DETAIL = 1
ITEM_HT_PART = 147
ITEM_HT_LEVEL = 10

-- ==========================================
-- BANG LUU TRANG THAI NGUOI CHOI
-- ==========================================
tbChosenItem = {}
tbChosenName = {}
tbPlayerAction = {} 
tbPlayerPhai = {}   
tbPlayerNhanh = {}

-- ==========================================
-- DANH SACH ITEM HKMP GOC (ID 5314 -> 5429) (TCVN3)
-- ==========================================
tbHKMP = {
	[1] = {
		{"Méng Long Kim Cang La H¸n Thñ", 5314},
		{"Méng Long ChÝnh Hång T¨ng M·o", 5315},
		{"Méng Long Kim Ti ChÝnh Hång Cµ Sa", 5316},
		{"Méng Long HuyÒn Ti Ph¸t §¸i", 5317},
		{"Méng Long §¹t Ma T¨ng Hµi", 5318},
	},
	[2] = {
		{"Phôc Ma Tö Kim C«n", 5319},
		{"Phôc Ma HuyÒn Hoµng Cµ Sa", 5320},
		{"Phôc Ma ¤ Kim NhuyÔn §iÒu", 5321},
		{"Phôc Ma Phæ §é T¨ng Hµi", 5322},
		{"Phôc Ma V« L­îng Kim Cang UyÓn", 5323},
	},
	[3] = {
		{"Tø Kh«ng Gi¸ng Ma Giíi §ao", 5324},
		{"Tø Kh«ng Tö Kim Cµ Sa", 5325},
		{"Tø Kh«ng Hé ph¸p Yªu §¸i", 5326},
		{"Tø Kh«ng NhuyÔn B× Hé UyÓn", 5327},
		{"Tø Kh«ng §¹t Ma T¨ng Hµi", 5328},
	},
	[4] = {
		{"H¸m Thiªn Kim Hoµn §¹i Nh·n ThÇn Chïy", 5329},
		{"H¸m Thiªn Vò ThÇn T­¬ng Kim Gi¸p", 5330},
		{"H¸m Thiªn Uy Vò Thóc Yªu §¸i", 5331},
		{"H¸m Thiªn Hæ §Çu ChiÕn Kh«i", 5332},
		{"H¸m Thiªn Thõa Long ChiÕn Ngoa", 5333},
	},
	[5] = {
		{"KÕ NghiÖp B«n L«i Toµn Long Th­¬ng", 5334},
		{"KÕ NghiÖp HuyÒn Vò Hoµng Kim Kh¶i", 5335},
		{"KÕ NghiÖp B¹ch Hæ V« Song KhÊu", 5336},
		{"KÕ NghiÖp Háa Kú L©n ChiÕn Kh«i", 5337},
		{"KÕ NghiÖp Chu T­íc L¨ng V©n Ngoa", 5338},
	},
	[6] = {
		{"Ngù Long L­îng Ng©n B¶o §ao", 5339},
		{"Ngù Long ChiÕn ThÇn Phi Qu¶i", 5340},
		{"Ngù Long Thiªn M«n Thóc Yªu Hoµn", 5341},
		{"Ngù Long TÊn Phong Hé YÓn", 5342},
		{"Ngù Long TrÊn M«n Hoµng Kim Kh¶i", 5343},
		{"Ngù Long TÊn Phong Ph¸t C¬", 5344},
	},
	[7] = {
		{"V« Gian û Thiªn KiÕm", 5345},
		{"V« Gian Thanh Phong Truy Y", 5346},
		{"V« Gian PhÊt V©n Ti §¸i", 5347},
		{"V« Gian CÇm VËn Hé UyÓn", 5348},
		{"V« Gian Thanh Phong NhuyÔn KÞch", 5349},
	},
	[8] = {
		{"V« Ma Ma Ni Qu¸n", 5350},
		{"V« Ma Tö Kh©m Cµ Sa", 5351},
		{"V« Ma B¨ng S­¬ng TrÊn Tµ KiÕm", 5352},
		{"V« Ma Hång Truy NhuyÔn Th¸p Hµi", 5353},
		{"V« YÓm Thu Thñy L­u Quang §¸i", 5354},
	},
	[9] = {
		{"Tª Hoµng Phông Nghi §ao", 5355},
		{"Tª Hoµng TuÖ T©m Khinh Sa Y", 5356},
		{"Tª Hoµng Phong TuyÕt B¹ch V©n Thóc §¸i", 5357},
		{"Tª Hoµng B¨ng Tung CÈm UyÓn", 5358},
		{"Tª Hoµng HuÖ T©m Tr­êng Sinh KhÊu", 5359},
	},
	[10] = {
		{"BÝch H¶i Uyªn ¦¬ng Liªn Hoµn §ao", 5360},
		{"BÝch H¶i Hoµn Ch©u Vò Liªn", 5361},
		{"BÝch H¶i Hång Linh Kim Ti §¸i", 5362},
		{"BÝch H¶i Hång L¨ng Ba", 5363},
		{"BÝch H¶i Hoµn Ch©u Tuyªn Thanh C©n", 5364},
	},
	[11] = {
		{"U Lung Kim Xµ Ph¸t §¸i", 5365},
		{"U Lung XÝch YÕt MËt Trang", 5366},
		{"U Lung Thanh Ng« TriÒn Yªu", 5367},
		{"U Lung Ng©n ThÒm V¹n Niªn §éc Thñ", 5368},
		{"U Lung MÆc Thï NhuyÔn Lý", 5369},
	},
	[12] = {
		{"Minh ¶o Tµ S¸t §éc NhËn", 5370},
		{"Minh ¶o U §éc ¸m Y", 5371},
		{"Minh ¶o Hñ Cèt Hé UyÓn", 5372},
		{"Minh ¶o Song Hoµn Xµ Hµi", 5373},
		{"Minh ¶o Song Hoµn Xµ KhÊu", 5374},
	},
	[13] = {
		{"B¨ng Hµn §¬n ChØ Phi §ao", 5375},
		{"B¨ng Hµn HuyÒn Y Thóc Gi¸p", 5376},
		{"B¨ng Hµn T©m TiÔn Yªu KhÊu", 5377},
		{"B¨ng Hµn HuyÒn Thiªn B¨ng Háa Phï", 5378},
		{"B¨ng Hµn NguyÖt ¶nh Ngoa", 5379},
	},
	[14] = {
		{"Thiªn Quang Hoa Vò M¹n Thiªn", 5380},
		{"Thiªn Quang §Þnh T©m Ng­ng ThÇn Phï", 5381},
		{"Thiªn Quang S©m La Thóc §¸i", 5382},
		{"Thiªn Quang Song B¹o Hµn ThiÕt Y", 5383},
		{"Thiªn Quang §Þa Hµnh Thiªn Lý Ngoa", 5384},
	},
	[15] = {
		{"S©m Hoang Phi Tinh §o¹t Hån", 5385},
		{"S©m Hoang Kim TiÒn Liªn Hoµn Gi¸p", 5386},
		{"S©m Hoang Hån Gi¶o Yªu Thóc", 5387},
		{"S©m Hoang HuyÒn ThiÕt T­¬ng Ngäc Phï", 5388},
		{"S©m Hoang Tinh VÉn Phi Lý", 5389},
	},
	[16] = {
		{"§ång Cõu Phi Long §Çu Hoµn", 5390},
		{"§ång Cõu Gi¸ng Long C¸i Y", 5391},
		{"§ång Cõu TiÒm Long Yªu §¸i", 5392},
		{"§ång Cõu CÇm Long Hé Thñ", 5393},
		{"§ång Cõu Ngù Long Ngäc Béi", 5394},
	},
	[17] = {
		{"§Þch Kh¸i Lôc Ngäc Tr­îng", 5395},
		{"§Þch Kh¸i Cöu §¹i C¸i Y", 5396},
		{"§Þch Kh¸i TriÒn M·ng Yªu ®¸i", 5397},
		{"§Þch Kh¸i CÈu TÝch B× Hé UyÓn", 5398},
		{"§Þch Kh¸i Trõ Gian §Çu Hoµn", 5399},
	},
	[18] = {
		{"Ma S¸t Quû Cèc U Minh Th­¬ng", 5400},
		{"Ma S¸t Tµn D­¬ng ¶nh HuyÕt Gi¸p", 5401},
		{"Ma S¸t XÝch Ký Táa Yªu KhÊu", 5402},
		{"Ma S¸t Cö Háa Liªu Thiªn UyÓn", 5403},
		{"Ma S¸t Cö Háa Liªu Thiªn Hoµn", 5404},
	},
	[19] = {
		{"Ma ThÞ Thiªu Hån LiÖt Háa §ao", 5405},
		{"Ma ThÞ LiÖt DiÖm Qu¸n MiÖn", 5406},
		{"Ma ThÞ Th«i S¬n ThiÕt HuyÕt Gi¸p", 5407},
		{"Ma ThÞ S¬n H¶i Phi Hång Lý", 5408},
		{"Ma ThÞ LÖ Ma PhÖ T©m §¸i", 5409},
	},
	[20] = {
		{"L¨ng Nh¹c Th¸i Cùc KiÕm", 5410},
		{"L¨ng Nh¹c V« Ng· §¹o Bµo", 5411},
		{"L¨ng Nh¹c ThuÇn D­¬ng Hé UyÓn", 5412},
		{"L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi", 5413},
		{"L¨ng Nh¹c V« Ng· Thóc §¸i", 5414},
	},
	[21] = {
		{"CËp Phong Ch©n Vò KiÕm", 5415},
		{"CËp Phong Tam Thanh Phï", 5416},
		{"CËp Phong HuyÒn Ti Tam §o¹n CÈm", 5417},
		{"CËp Phong Thóy Ngäc HuyÒn Hoµng Béi", 5418},
		{"CËp Phong Thóy Ngäc HuyÒn Hoµng UyÓn", 5419},
	},
	[22] = {
		{"S­¬ng Tinh Thiªn Niªn Hµn ThiÕt", 5420},
		{"S­¬ng Tinh Ng¹o S­¬ng §¹o Bµo", 5421},
		{"S­¬ng Tinh Thanh Phong Lò §¸i", 5422},
		{"S­¬ng Tinh Thiªn Tinh B¨ng Tinh Thñ", 5423},
		{"S­¬ng Tinh L­u Tinh C¶n NguyÖt KhÊu", 5424},
	},
	[23] = {
		{"L«i Khung Cöu Thiªn DÉn L«i KiÕm", 5425},
		{"L«i Khung Thiªn §Þa Hé Phï", 5426},
		{"L«i Khung Phong L«i Thanh CÈm §¸i", 5427},
		{"L«i Khung Linh Ngäc UÈn L«i", 5428},
		{"L«i Khung Linh Ngäc Èn L«i UyÓn", 5429},
	},
}

tbTenHKMP = {
	"Méng Long", "Phôc Ma", "Tø Kh«ng", "H¸m Thiªn", "KÕ NghiÖp",
	"Ngù Long", "V« Gian", "V« Ma (Nga Mi)", "Tª Hoµng", "BÝch H¶i",
	"U Lung", "Minh ¶o", "B¨ng Hµn", "Thiªn Quang", "S©m Hoang",
	"§ång Cõu", "§Þch Kh¸i", "Ma S¸t", "Ma ThÞ", "L¨ng Nh¹c",
	"CËp Phong", "S­¬ng Tinh", "L«i Khung"
}

-- ==========================================
-- DANH SACH ITEM VO DANH (Ma TCVN3)
-- ==========================================
tbVoDanh = {
	[1] = { -- ThiÕu L©m
		[1] = { -- §¹t Ma
			{"V« Danh §¹t Ma TriÒn Thñ", 5547},
			{"V« Danh §¹t Ma T¨ng M·o", 5548},
			{"V« Danh §¹t Ma Cµ Sa", 5549},
			{"V« Danh §¹t Ma Hé Thñ", 5550},
			{"V« Danh §¹t Ma T¨ng Hµi", 5551},
		},
		[2] = { -- Vi §µ
			{"V« Danh Vi §µ Hé Tr­îng", 5552},
			{"V« Danh Vi §µ Hé Ph¸p M·o", 5553},
			{"V« Danh Vi §µ ThiÒn Y", 5554},
			{"V« Danh Vi §µ Hµnh Gi¶ Ngoa", 5555},
			{"V« Danh Vi §µ Hµn Ma Thñ", 5556},
		},
		[3] = { -- V« T­íng
			{"V« Danh V« T­íng Giíi §ao", 5557},
			{"V« Danh V« T­íng T¨ng M·o", 5558},
			{"V« Danh V« T­íng B¸ch N¹p Y", 5559},
			{"V« Danh V« T­íng Hé UyÓn", 5560},
			{"V« Danh V« T­íng Thiªn Lý Ngoa", 5561},
		},
	},
	[2] = { -- Thiªn V­¬ng
		[1] = { -- ChiÕn ThÇn
			{"V« Danh ChiÕn ThÇn Kim Chïy", 5562},
			{"V« Danh ChiÕn ThÇn Hæ §Çu Kh«i", 5563},
			{"V« Danh ChiÕn ThÇn Hæ Th©n Gi¸p", 5564},
			{"V« Danh ChiÕn ThÇn Hæ UyÓn", 5565},
			{"V« Danh ChiÕn ThÇn Hæ Ngoa", 5566},
		},
		[2] = { -- B¸ch ChiÕn
			{"V« Danh B¸ch ChiÕn Long Th­¬ng", 5567},
			{"V« Danh B¸ch ChiÕn Long Kh«i", 5568},
			{"V« Danh B¸ch ChiÕn Long Kh¶i", 5569},
			{"V« Danh B¸ch ChiÕn Long UyÓn", 5570},
			{"V« Danh B¸ch ChiÕn Long Ngoa", 5571},
		},
		[3] = { -- B¸ V­¬ng
			{"V« Danh B¸ V­¬ng Kim §ao", 5572},
			{"V« Danh B¸ V­¬ng §Çu Kh«i", 5573},
			{"V« Danh B¸ V­¬ng Hoµng Gi¸p", 5574},
			{"V« Danh B¸ V­¬ng Hé UyÓn", 5575},
			{"V« Danh B¸ V­¬ng ChiÕn Ngoa", 5576},
		},
	},
	[3] = { -- Nga Mi
		[1] = { -- Minh NguyÖt
			{"V« Danh Minh NguyÖt û Thiªn KiÕm", 5577},
			{"V« Danh Minh NguyÖt Ni Qu¸n", 5578},
			{"V« Danh Minh NguyÖt Truy Y", 5579},
			{"V« Danh Minh NguyÖt CÈm UyÓn", 5580},
			{"V« Danh Minh NguyÖt Ph¸p Hµi", 5581},
		},
		[2] = { -- B¨ng S­¬ng
			{"V« Danh B¨ng S­¬ng TrÊn Tµ KiÕm", 5582},
			{"V« Danh B¨ng S­¬ng Ni Qu¸n", 5583},
			{"V« Danh B¨ng S­¬ng Truy Y", 5584},
			{"V« Danh B¨ng S­¬ng Hé UyÓn", 5585},
			{"V« Danh B¨ng S­¬ng Th¸p Hµi", 5586},
		},
	},
	[4] = { -- Thóy Yªn
		[1] = { -- TuyÕt ¶nh
			{"V« Danh TuyÕt ¶nh §ao", 5587},
			{"V« Danh TuyÕt ¶nh C©n", 5588},
			{"V« Danh TuyÕt ¶nh Sam", 5589},
			{"V« Danh TuyÕt ¶nh CÈm UyÓn", 5590},
			{"V« Danh TuyÕt ¶nh CÈm Hµi", 5591},
		},
		[2] = { -- BÝch H¶i
			{"V« Danh BÝch H¶i Uyªn ¦¬ng §ao", 5592},
			{"V« Danh BÝch H¶i C©n", 5593},
			{"V« Danh BÝch H¶i Sam", 5594},
			{"V« Danh BÝch H¶i TuyÕt UyÓn", 5595},
			{"V« Danh BÝch H¶i CÈm Hµi", 5596},
		},
	},
	[5] = { -- Ngò §éc
		[1] = { -- U Minh
			{"V« Danh U Minh §éc Thñ", 5597},
			{"V« Danh U Minh Ph¸t §¸i", 5598},
			{"V« Danh U Minh MËt Trang", 5599},
			{"V« Danh U Minh TriÒn Thñ", 5600},
			{"V« Danh U Minh NhuyÔn Lý", 5601},
		},
		[2] = { -- HuyÒn ¢m
			{"V« Danh HuyÒn ¢m §éc §ao", 5602},
			{"V« Danh HuyÒn ¢m Ph¸t §¸i", 5603},
			{"V« Danh HuyÒn ¢m ¸m Y", 5604},
			{"V« Danh HuyÒn ¢m Hé UyÓn", 5605},
			{"V« Danh HuyÒn ¢m Xµ Hµi", 5606},
		},
	},
	[6] = { -- §­êng M«n
		[1] = { -- Ng©n Vò
			{"V« Danh Ng©n Vò Phi §ao", 5607},
			{"V« Danh Ng©n Vò ThiÕt M¹o", 5608},
			{"V« Danh Ng©n Vò ThiÕt Sam", 5609},
			{"V« Danh Ng©n Vò B¨ng Tr¹c", 5610},
			{"V« Danh Ng©n Vò ¶nh Ngoa", 5611},
		},
		[2] = { -- ThiÕt Vò
			{"V« Danh ThiÕt Vò Tô TiÔn", 5612},
			{"V« Danh ThiÕt Vò Qu¸n", 5613},
			{"V« Danh ThiÕt Vò B¹o Y", 5614},
			{"V« Danh ViÕt Vò B¹o UyÓn", 5615},
			{"V« Danh ThiÕt Vò Ngoa", 5616},
		},
		[3] = { -- Truy Hån
			{"V« Danh Truy Hån Tiªu", 5617},
			{"V« Danh Truy Hån DiÖn", 5618},
			{"V« Danh Truy Hån Kim TiÒn Gi¸p", 5619},
			{"V« Danh Truy Hån UyÓn", 5620},
			{"V« Danh Truy Hån VÉn Phi Lý", 5621},
		},
	},
	[7] = { -- C¸i Bang
		[1] = { -- Háa Long
			{"V« Danh Háa Long Hé UyÓn", 5622},
			{"V« Danh Háa Long §Çu Hoµn", 5623},
			{"V« Danh Háa Long C¸i Y", 5624},
			{"V« Danh Háa Long Hé Thñ", 5625},
			{"V« Danh Háa Long Ngoa", 5626},
		},
		[2] = { -- Trõng Giíi
			{"V« Danh Trõng Giíi Tr­îng", 5627},
			{"V« Danh Trõng Giíi §Çu Hoµn", 5628},
			{"V« Danh Trõng Giíi C¸i Y", 5629},
			{"V« Danh Trõng Giíi Hé UyÓn", 5630},
			{"V« Danh Trõng Giíi Ngoa", 5631},
		},
	},
	[8] = { -- Thiªn NhÉn
		[1] = { -- XÝch Minh
			{"V« Danh XÝch Minh Th­¬ng", 5632},
			{"V« Danh XÝch Minh Thiªn Hoµn", 5633},
			{"V« Danh XÝch Minh HuyÕt Gi¸p", 5634},
			{"V« Danh XÝch Minh Thiªn UyÓn", 5635},
			{"V« Danh XÝch Minh Phi Ngoa", 5636},
		},
		[2] = { -- S¸t Viªm
			{"V« Danh S¸t Viªm LiÖt Háa §ao", 5637},
			{"V« Danh S¸t Viªm Qu¸n MiÖn", 5638},
			{"V« Danh S¸t Viªm ThiÕt HuyÕt Gi¸p", 5639},
			{"V« Danh S¸t Viªm PhÖ T©m §¸i", 5640},
			{"V« Danh S¸t Viªm Phi Hång Lý", 5641},
		},
	},
	[9] = { -- Vâ §ang
		[1] = { -- Lôc Hîp
			{"V« Danh Lôc Hîp KiÕm", 5642},
			{"V« Danh Lôc Hîp §¹o M·o", 5643},
			{"V« Danh Lôc Hîp §¹o Bµo", 5644},
			{"V« Danh Lôc Hîp Hé UyÓn", 5645},
			{"V« Danh Lôc Hîp §¹o Ngoa", 5646},
		},
		[2] = { -- Th¸i Hßa
			{"V« Danh Th¸i Hßa KiÕm", 5647},
			{"V« Danh Th¸i Hßa §¹o M·o", 5648},
			{"V« Danh Th¸i Hßa §¹o Bµo", 5649},
			{"V« Danh Th¸i Hßa Hoµng UyÓn", 5650},
			{"V« Danh Th¸i Hßa §¹o Ngoa", 5651},
		},
	},
	[10] = { -- C«n L«n
		[1] = { -- Cµn Viªn
			{"V« Danh Cµn Viªn Phong §ao", 5652},
			{"V« Danh Cµn Viªn §¹o M·o", 5653},
			{"V« Danh Cµn Viªn §¹o Bµo", 5654},
			{"V« Danh Cµn Viªn Tinh Thñ", 5655},
			{"V« Danh Cµn Viªn Phi Ngoa", 5656},
		},
		[2] = { -- Tr­êng Kh«ng
			{"V« Danh Tr­êng Kh«ng DÉn L«i KiÕm", 5657},
			{"V« Danh Tr­êng Kh«ng §¹o M·o", 5658},
			{"V« Danh Tr­êng Kh«ng §¹o Bµo", 5659},
			{"V« Danh Tr­êng Kh«ng L«i UyÓn", 5660},
			{"V« Danh Tr­êng Kh«ng Ngoa", 5661},
		},
	},
}

tbTenPhai = {
	"1. ThiÕu L©m", "2. Thiªn V­¬ng", "3. Nga Mi", "4. Thóy Yªn", "5. Ngò §éc",
	"6. §­êng M«n", "7. C¸i Bang", "8. Thiªn NhÉn", "9. Vâ §ang", "10. C«n L«n"
}

tbTenNhanh = {
	[1] = {"§¹t Ma (QuyÒn)", "Vi §µ (C«n)", "V« T­íng (§ao)"},
	[2] = {"ChiÕn ThÇn (Chïy)", "B¸ch ChiÕn (Th­¬ng)", "B¸ V­¬ng (§ao)"},
	[3] = {"Minh NguyÖt (KiÕm)", "B¨ng S­¬ng (Ch­ëng)"},
	[4] = {"TuyÕt ¶nh (§ao)", "BÝch H¶i (Song §ao)"},
	[5] = {"U Minh (Ch­ëng)", "HuyÒn ¢m (§ao)"},
	[6] = {"Ng©n Vò (Phi §ao)", "ThiÕt Vò (Ná)", "Truy Hån (Phi Tiªu)"},
	[7] = {"Háa Long (Ch­ëng)", "Trõng Giíi (C«n)"},
	[8] = {"XÝch Minh (Th­¬ng)", "S¸t Viªm (§ao)"},
	[9] = {"Lôc Hîp (QuyÒn)", "Th¸i Hßa (KiÕm)"},
	[10] = {"Cµn Viªn (§ao)", "Tr­êng Kh«ng (KiÕm)"},
}

-- ==========================================
-- MAIN MENU
-- ==========================================
function main()
	Say(
		"Ta lµ bËc thÇy rÌn ®óc. Ng­êi muèn dïng dÞch vô g×?", 3,
		"ChÕ t¹o Hoµng Kim M«n Ph¸i/menu_che_hkmp",
		"ChÕ t¹o trang bÞ V« Danh/menu_che_vodanh",
		"KÕt thóc/no"
	)
end

-- ==========================================
-- CHUC NANG: CHE TAO HKMP
-- ==========================================
function menu_che_hkmp()
	menu_hkmp_trang1()
end

function menu_hkmp_trang1()
	Say(
		"Chän bé Hoµng Kim mµ ng­êi muèn chÕ t¹o (Trang 1/4):", 7,
		tbTenHKMP[1].."/chon_set_hkmp_1",
		tbTenHKMP[2].."/chon_set_hkmp_2",
		tbTenHKMP[3].."/chon_set_hkmp_3",
		tbTenHKMP[4].."/chon_set_hkmp_4",
		tbTenHKMP[5].."/chon_set_hkmp_5",
		"Trang tiÕp theo/menu_hkmp_trang2",
		"Quay l¹i/main"
	)
end

function menu_hkmp_trang2()
	Say(
		"Chän bé Hoµng Kim mµ ng­êi muèn chÕ t¹o (Trang 2/4):", 8,
		tbTenHKMP[6].."/chon_set_hkmp_6",
		tbTenHKMP[7].."/chon_set_hkmp_7",
		tbTenHKMP[8].."/chon_set_hkmp_8",
		tbTenHKMP[9].."/chon_set_hkmp_9",
		tbTenHKMP[10].."/chon_set_hkmp_10",
		tbTenHKMP[11].."/chon_set_hkmp_11",
		"Trang tiÕp theo/menu_hkmp_trang3",
		"Quay l¹i/menu_hkmp_trang1"
	)
end

function menu_hkmp_trang3()
	Say(
		"Chän bé Hoµng Kim mµ ng­êi muèn chÕ t¹o (Trang 3/4):", 8,
		tbTenHKMP[12].."/chon_set_hkmp_12",
		tbTenHKMP[13].."/chon_set_hkmp_13",
		tbTenHKMP[14].."/chon_set_hkmp_14",
		tbTenHKMP[15].."/chon_set_hkmp_15",
		tbTenHKMP[16].."/chon_set_hkmp_16",
		tbTenHKMP[17].."/chon_set_hkmp_17",
		"Trang tiÕp theo/menu_hkmp_trang4",
		"Quay l¹i/menu_hkmp_trang2"
	)
end

function menu_hkmp_trang4()
	Say(
		"Chän bé Hoµng Kim mµ ng­êi muèn chÕ t¹o (Trang 4/4):", 8,
		tbTenHKMP[18].."/chon_set_hkmp_18",
		tbTenHKMP[19].."/chon_set_hkmp_19",
		tbTenHKMP[20].."/chon_set_hkmp_20",
		tbTenHKMP[21].."/chon_set_hkmp_21",
		tbTenHKMP[22].."/chon_set_hkmp_22",
		tbTenHKMP[23].."/chon_set_hkmp_23",
		"Quay l¹i/menu_hkmp_trang3",
		"KÕt thóc/no"
	)
end

function chon_set_hkmp_1() tbPlayerPhai[PlayerIndex] = 1; menu_chon_item_hkmp() end
function chon_set_hkmp_2() tbPlayerPhai[PlayerIndex] = 2; menu_chon_item_hkmp() end
function chon_set_hkmp_3() tbPlayerPhai[PlayerIndex] = 3; menu_chon_item_hkmp() end
function chon_set_hkmp_4() tbPlayerPhai[PlayerIndex] = 4; menu_chon_item_hkmp() end
function chon_set_hkmp_5() tbPlayerPhai[PlayerIndex] = 5; menu_chon_item_hkmp() end
function chon_set_hkmp_6() tbPlayerPhai[PlayerIndex] = 6; menu_chon_item_hkmp() end
function chon_set_hkmp_7() tbPlayerPhai[PlayerIndex] = 7; menu_chon_item_hkmp() end
function chon_set_hkmp_8() tbPlayerPhai[PlayerIndex] = 8; menu_chon_item_hkmp() end
function chon_set_hkmp_9() tbPlayerPhai[PlayerIndex] = 9; menu_chon_item_hkmp() end
function chon_set_hkmp_10() tbPlayerPhai[PlayerIndex] = 10; menu_chon_item_hkmp() end
function chon_set_hkmp_11() tbPlayerPhai[PlayerIndex] = 11; menu_chon_item_hkmp() end
function chon_set_hkmp_12() tbPlayerPhai[PlayerIndex] = 12; menu_chon_item_hkmp() end
function chon_set_hkmp_13() tbPlayerPhai[PlayerIndex] = 13; menu_chon_item_hkmp() end
function chon_set_hkmp_14() tbPlayerPhai[PlayerIndex] = 14; menu_chon_item_hkmp() end
function chon_set_hkmp_15() tbPlayerPhai[PlayerIndex] = 15; menu_chon_item_hkmp() end
function chon_set_hkmp_16() tbPlayerPhai[PlayerIndex] = 16; menu_chon_item_hkmp() end
function chon_set_hkmp_17() tbPlayerPhai[PlayerIndex] = 17; menu_chon_item_hkmp() end
function chon_set_hkmp_18() tbPlayerPhai[PlayerIndex] = 18; menu_chon_item_hkmp() end
function chon_set_hkmp_19() tbPlayerPhai[PlayerIndex] = 19; menu_chon_item_hkmp() end
function chon_set_hkmp_20() tbPlayerPhai[PlayerIndex] = 20; menu_chon_item_hkmp() end
function chon_set_hkmp_21() tbPlayerPhai[PlayerIndex] = 21; menu_chon_item_hkmp() end
function chon_set_hkmp_22() tbPlayerPhai[PlayerIndex] = 22; menu_chon_item_hkmp() end
function chon_set_hkmp_23() tbPlayerPhai[PlayerIndex] = 23; menu_chon_item_hkmp() end

function menu_chon_item_hkmp()
	local nSet = tbPlayerPhai[PlayerIndex]
	local strMenu = "H·y chän vËt phÈm mµ ng­êi muèn t¹o:"
	local tbMenu = {}
	
	for i = 1, getn(tbHKMP[nSet]) do
		local strName = tbHKMP[nSet][i][1]
		tinsert(tbMenu, strName.."/chon_item_hkmp_chitiet_"..i)
	end
	
	tinsert(tbMenu, "Quay l¹i/menu_che_hkmp")
	tinsert(tbMenu, "KÕt thóc/no")
	Say(strMenu, getn(tbMenu), tbMenu)
end

function chon_item_hkmp_chitiet_1() xac_nhan_item_hkmp(1) end
function chon_item_hkmp_chitiet_2() xac_nhan_item_hkmp(2) end
function chon_item_hkmp_chitiet_3() xac_nhan_item_hkmp(3) end
function chon_item_hkmp_chitiet_4() xac_nhan_item_hkmp(4) end
function chon_item_hkmp_chitiet_5() xac_nhan_item_hkmp(5) end
function chon_item_hkmp_chitiet_6() xac_nhan_item_hkmp(6) end

function xac_nhan_item_hkmp(nIndex)
	local nSet = tbPlayerPhai[PlayerIndex]
	local strName = tbHKMP[nSet][nIndex][1]
	local nID = tbHKMP[nSet][nIndex][2]
	
	tbChosenItem[PlayerIndex] = nID
	tbChosenName[PlayerIndex] = strName
	GiveItemUI("ChÕ T¹o HKMP", "H·y ®Æt vµo 20 M¶nh Hoµng Kim vµ 5 HuyÒn Tinh Kho¸ng Th¹ch cÊp 10 ®Ó t¹o "..strName, "xuly_tao_hkmp", "no", 1)
end

function xuly_tao_hkmp(nCount)
	if nCount <= 0 then return end
	local nManh = 0
	local nHT10 = 0
	local tbValidItems = {}

	for i = 1, nCount do
		local nItemIdx = GetGiveItemUnit(i)
		local nG, nD, nP, nL = GetItemProp(nItemIdx)
		local nStack = GetItemStackCount(nItemIdx)
		if type(nStack) ~= "number" or nStack <= 0 then nStack = 1 end

		if nG == ITEM_MANHHK_GENRE and nD == ITEM_MANHHK_DETAIL and nP == ITEM_MANHHK_PART then
			nManh = nManh + nStack
			tinsert(tbValidItems, nItemIdx)
		elseif nG == ITEM_HT_GENRE and nD == ITEM_HT_DETAIL and nP == ITEM_HT_PART and nL == ITEM_HT_LEVEL then
			nHT10 = nHT10 + nStack
			tinsert(tbValidItems, nItemIdx)
		else
			return Say("VËt phÈm kh«ng hîp lÖ! ChØ ®­îc ®Æt M¶nh HK (5128) vµ HuyÒn Tinh cÊp 10.", 0)
		end
	end

	if nManh ~= 20 or nHT10 ~= 5 then
		return Say("Sè l­îng kh«ng ®óng! HÖ thèng ®Õm ®­îc: <color=yellow>"..nManh.." M¶nh HK<color> vµ <color=yellow>"..nHT10.." HuyÒn Tinh 10<color>.\nYªu cÇu: 20 M¶nh HK vµ 5 HuyÒn Tinh 10.", 0)
	end

	if CalcFreeItemCellCount() < 1 then return Say("Hµnh trang ®· ®Çy!", 0) end

	for i = 1, getn(tbValidItems) do
		RemoveItemByIndex(tbValidItems[i])
	end

	local targetID = tbChosenItem[PlayerIndex]
	AddGoldItem(0, targetID)
	Msg2Player("ChÕ t¹o thµnh c«ng "..tbChosenName[PlayerIndex].."!")
end

-- ==========================================
-- MENU VO DANH
-- ==========================================
function menu_che_vodanh()
	menu_phai_trang1()
end

function menu_phai_trang1()
	Say(
		"Ng­êi ®· thu thËp ®ñ M¶nh V« Danh Kú Th¹ch ch­a? H·y chän m«n ph¸i ng­êi muèn n©ng cÊp:", 7,
		tbTenPhai[1].."/chon_phai_vd_1",
		tbTenPhai[2].."/chon_phai_vd_2",
		tbTenPhai[3].."/chon_phai_vd_3",
		tbTenPhai[4].."/chon_phai_vd_4",
		tbTenPhai[5].."/chon_phai_vd_5",
		"Trang tiÕp theo/menu_phai_trang2",
		"KÕt thóc/no"
	)
end

function menu_phai_trang2()
	Say(
		"Ng­êi muèn n©ng cÊp trang bÞ V« Danh cña m«n ph¸i nµo?", 7,
		tbTenPhai[6].."/chon_phai_vd_6",
		tbTenPhai[7].."/chon_phai_vd_7",
		tbTenPhai[8].."/chon_phai_vd_8",
		tbTenPhai[9].."/chon_phai_vd_9",
		tbTenPhai[10].."/chon_phai_vd_10",
		"Quay l¹i/menu_che_vodanh",
		"KÕt thóc/no"
	)
end

function chon_phai_vd_1() tbPlayerPhai[PlayerIndex] = 1; menu_chon_nhanh_vodanh() end
function chon_phai_vd_2() tbPlayerPhai[PlayerIndex] = 2; menu_chon_nhanh_vodanh() end
function chon_phai_vd_3() tbPlayerPhai[PlayerIndex] = 3; menu_chon_nhanh_vodanh() end
function chon_phai_vd_4() tbPlayerPhai[PlayerIndex] = 4; menu_chon_nhanh_vodanh() end
function chon_phai_vd_5() tbPlayerPhai[PlayerIndex] = 5; menu_chon_nhanh_vodanh() end
function chon_phai_vd_6() tbPlayerPhai[PlayerIndex] = 6; menu_chon_nhanh_vodanh() end
function chon_phai_vd_7() tbPlayerPhai[PlayerIndex] = 7; menu_chon_nhanh_vodanh() end
function chon_phai_vd_8() tbPlayerPhai[PlayerIndex] = 8; menu_chon_nhanh_vodanh() end
function chon_phai_vd_9() tbPlayerPhai[PlayerIndex] = 9; menu_chon_nhanh_vodanh() end
function chon_phai_vd_10() tbPlayerPhai[PlayerIndex] = 10; menu_chon_nhanh_vodanh() end

function menu_chon_nhanh_vodanh()
	local nPhai = tbPlayerPhai[PlayerIndex]
	local strTenPhaiGoc = strsub(tbTenPhai[nPhai], 4)
	local strMenu = "H·y chän hÖ ph¸i nghiªn cøu cña " .. strTenPhaiGoc .. ":"
	local tbMenu = {}
	
	for i = 1, getn(tbTenNhanh[nPhai]) do
		local strName = tbTenNhanh[nPhai][i]
		tinsert(tbMenu, strName.."/chon_nhanh_vd_"..i)
	end
	
	tinsert(tbMenu, "Quay l¹i/menu_che_vodanh")
	tinsert(tbMenu, "KÕt thóc/no")
	Say(strMenu, getn(tbMenu), tbMenu)
end

function chon_nhanh_vd_1() tbPlayerNhanh[PlayerIndex] = 1; menu_chon_item_vodanh() end
function chon_nhanh_vd_2() tbPlayerNhanh[PlayerIndex] = 2; menu_chon_item_vodanh() end
function chon_nhanh_vd_3() tbPlayerNhanh[PlayerIndex] = 3; menu_chon_item_vodanh() end

function menu_chon_item_vodanh()
	local nPhai = tbPlayerPhai[PlayerIndex]
	local nNhanh = tbPlayerNhanh[PlayerIndex]
	local strMenu = "H·y chän trang bÞ V« Danh mµ ng­êi muèn n©ng cÊp:"
	local tbMenu = {}
	
	for i = 1, getn(tbVoDanh[nPhai][nNhanh]) do
		local strName = tbVoDanh[nPhai][nNhanh][i][1]
		tinsert(tbMenu, strName.."/chon_item_vd_"..i)
	end
	
	tinsert(tbMenu, "Quay l¹i/menu_chon_nhanh_vodanh")
	tinsert(tbMenu, "KÕt thóc/no")
	Say(strMenu, getn(tbMenu), tbMenu)
end

function chon_item_vd_1() xac_nhan_item_vd(1) end
function chon_item_vd_2() xac_nhan_item_vd(2) end
function chon_item_vd_3() xac_nhan_item_vd(3) end
function chon_item_vd_4() xac_nhan_item_vd(4) end
function chon_item_vd_5() xac_nhan_item_vd(5) end

function xac_nhan_item_vd(nIndex)
	local nPhai = tbPlayerPhai[PlayerIndex]
	local nNhanh = tbPlayerNhanh[PlayerIndex]
	
	local strName = tbVoDanh[nPhai][nNhanh][nIndex][1]
	local nID = tbVoDanh[nPhai][nNhanh][nIndex][2]
    
	tbChosenItem[PlayerIndex] = nID
	tbChosenName[PlayerIndex] = strName
	
	-- Gioi han ID HKMP lam phoi (Dong 5135 den 5430 trong Excel)
	HKMP_ID_MIN = 5134
	HKMP_ID_MAX = 5429
	
	GiveItemUI("N©ng cÊp V« Danh", "H·y ®Æt vµo 1 Trang bÞ HKMP bÊt kú (lo¹i míi tï 5134 ®Õn 5429), 100 M¶nh HK (5128) vµ 100 M¶nh V« Danh Kú Th¹ch (5134) ®Ó n©ng cÊp "..strName, "xuly_nangcap_vodanh", "no", 1)
end

function xuly_nangcap_vodanh(nCount)
	if nCount <= 0 then return end
	local nPhaiHKMP = 0
	local nManhHK = 0
	local nManhVD = 0
	local tbValidItems = {}

	for i = 1, nCount do
		local nItemIdx = GetGiveItemUnit(i)
		local nGoldID = GetGlodEqIndex(nItemIdx) or 0
		local nG, nD, nP = GetItemProp(nItemIdx)
		local nStack = GetItemStackCount(nItemIdx)
		if type(nStack) ~= "number" or nStack <= 0 then nStack = 1 end

		if nGoldID >= HKMP_ID_MIN and nGoldID <= HKMP_ID_MAX then
			nPhaiHKMP = nPhaiHKMP + 1
			tinsert(tbValidItems, nItemIdx)
		elseif nG == ITEM_MANHHK_GENRE and nD == ITEM_MANHHK_DETAIL and nP == ITEM_MANHHK_PART then
			nManhHK = nManhHK + nStack
			tinsert(tbValidItems, nItemIdx)
		elseif nG == ITEM_MANHVD_GENRE and nD == ITEM_MANHVD_DETAIL and nP == ITEM_MANHVD_PART then
			nManhVD = nManhVD + nStack
			tinsert(tbValidItems, nItemIdx)
		else
			return Say("VËt phÈm kh«ng hîp lÖ! Yªu cÇu: 1 mãn HKMP (5134-5429), 100 M¶nh HK (5128) vµ 100 M¶nh V« Danh (5134).", 0)
		end
	end

	if nPhaiHKMP ~= 1 or nManhHK ~= 100 or nManhVD ~= 100 then
		return Say("Sè l­îng kh«ng hîp lÖ! HÖ thèng ®Õm ®­îc: <color=yellow>"..nPhaiHKMP.." HKMP<color>, <color=yellow>"..nManhHK.." M¶nh HK<color> vµ <color=yellow>"..nManhVD.." M¶nh V« Danh<color>.\nYªu cÇu chÝnh x¸c: 1 HKMP, 100 M¶nh HK vµ 100 M¶nh V« Danh.", 0)
	end

	if CalcFreeItemCellCount() < 1 then return Say("Hµnh trang ®· ®Çy! Vui lßng dän dÑp tr­íc khi n©ng cÊp.", 0) end

	for i = 1, getn(tbValidItems) do
		RemoveItemByIndex(tbValidItems[i])
	end

	local targetID = tbChosenItem[PlayerIndex]
	AddGoldItem(0, targetID)
	Msg2Player("N©ng cÊp thµnh c«ng " .. tbChosenName[PlayerIndex] .. "!")
end

function no()
end