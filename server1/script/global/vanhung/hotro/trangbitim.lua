-- 
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\dailogsys\\dailogsay.lua");


TAB_OPTION = {
	["Vò khÝ"] = {
		["KiÕm"] 			= {0,0,0},
		["§ao"] 				= {0,0,1},
		["Bæng"] 			= {0,0,2},
		["Th­¬ng"] 		= {0,0,3},
		["Chïy"] 			= {0,0,4},
		["Song §ao"] 	= {0,0,5},
		["Phi Tiªu"] 		= {0,1,0},
		["Phi §ao"] 		= {0,1,1},
		["Tô TiÔn"] 		= {0,1,2},
	},
	
	["Y Phôc"] = {
		["ThÊt B¶o Cµ Sa"] 						= {0,2,0},
		["Ch©n Vò Th¸nh Y"] 					= {0,2,1},
		["Thiªn NhÉn MËt Trang"] 		= {0,2,2},
		["Gi¸ng Sa Bµo"] 							= {0,2,3},
		["§­êng Nghª Gi¸p"] 					= {0,2,4},
		["V¹n L­u Quy T«ng Y"] 			= {0,2,5},
		["TuyÒn Long Bµo"] 					= {0,2,6},
		["Long Tiªu §¹o Y"] 					= {0,2,8},
		["Cöu VÜ B¹ch Hå Trang"] 		= {0,2,9},
		["TrÇm H­¬ng Sam"] 					= {0,2,10},
		["TÝch LÞch Kim Phông Gi¸p"] 	= {0,2,11},
		["V¹n Chóng TÒ T©m Y"] 			= {0,2,12},
		["L­u Tiªn QuÇn"] 						= {0,2,13},
	},
	
	["Nãn"] = {
		["Tú L« M·o"] 								=	{0,7,0},
		["Ngò L·o Qu¸n"] 						=	{0,7,1},
		["Tu La Ph¸t KÕt"] 						=	{0,7,2},
		["Th«ng Thiªn Ph¸t Qu¸n"] 		=	{0,7,3},
		["YÓm NhËt Kh«i"] 						=	{0,7,4},
		["TrÝch Tinh Hoµn"] 					=	{0,7,5},
		["¤ Tµm M·o"]								=	{0,7,6},
		["Quan ¢m Ph¸t Qu¸n"]				=	{0,7,7},
		["¢m D­¬ng V« Cùc Qu¸n"]		=	{0,7,8},
		["HuyÒn Tª DiÖn Tr¸o"]				=	{0,7,9},
		["Long HuyÕt §Çu Hoµn"]			=	{0,7,10},
		["Long L©n Kh«i"]						=	{0,7,11},
		["Thanh Tinh Thoa"] 					=	{0,7,12},
		["Kim Phông TriÓn SÝ"] 				=	{0,7,13},
	},
	
	["Hé UyÓn"] = {
		["Long Phông HuyÕt Ngäc Tr¹c"]		=	{0,8,0},
		["Thiªn Tµm Hé UyÓn"]						=	{0,8,1},
	},
	
	["Th¾t l­ng"] = {
		["Thiªn Tµm Yªu §¸i"]				=	{0,6,0},
		["B¹ch Kim Yªu §¸i"]					=	{0,6,1},
	},
	
	["Giµy"] = {
		["Cöu TiÕt X­¬ng VÜ Ngoa"]		=	{0,5,0},
		["Thiªn Tµm Ngoa"]					=	{0,5,1},
		["Kim Lò Hµi"]								=	{0,5,2},
		["Phi Phông Ngoa"]						=	{0,5,3},
	},
};
---------------------------------------------------------
function AddEquipPurpleNoParam()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang cña b¹n kh«ng ®ñ 20 « trèng.")
	return end
	local tbEquip = TAB_OPTION;
	local szTitle = "Ng­¬i muèn nhËn lo¹i nµo?"
	local tbOption = {};
	for x, y in tbEquip do
		tinsert(tbOption, {format("%s", x), EquipPurpleConfirm,{tbEquip[x]}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function EquipPurpleConfirm(tbEquip)
	local szTitle = "Ng­¬i muèn nhËn lo¹i nµo?"
	local tbOption = {};
	for x, y in tbEquip do
		tinsert(tbOption, {format("%s", x), EquipPurpleOK,{tbEquip[x]}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function EquipPurpleOK(tbEquip)
	for i = 0, 4 do
		AddQualityItem(2,tbEquip[1], tbEquip[2], tbEquip[3], 10, i, 0, -1,-1,-1,-1,-1,-1)
	end
end