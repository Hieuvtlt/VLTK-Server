Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\lib\\awardtemplet.lua")

-- ==================== C?U HÌNH H?O C?M & S? KI?N ====================
Include("\\script\\global\\tieudaotu_story.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
Include("\\script\\sukien_nam\\lib_xacnhan.lua")

TSK_JOINED = 3403
TSK_DIEM_HAOCAM = 3406
TSK_CAP_HAOCAM = 3407
TSK_REWARD_HAOCAM = 3408

-- ===================== BANG PHAN THUONG HAO CAM =====================
--   {"I", genre, detail, particular, soluong} : vat pham
--   {"G", loai, chisodong}                     : do hoang kim (goldequip)
--   {"B", soluong_luong}                       : bac  (1 van = 10000)
-- Nguyen lieu ton thang ca 3 tam phap deu la Mau Tuoi (6/1/5136)
tbPhanThuongHaoCam = {
	[1] = {"30 M¸u T­¬i, 60 d­îc th¶o, 5 TiÒn §ång", {{"I", 6, 1, 5136, 30}, {"I", 6, 1, 5118, 20}, {"I", 6, 1, 5119, 20}, {"I", 6, 1, 5120, 5}, {"I", 4, 417, 1, 5}}},
	[2] = {"Tói M¸u V« H¹n, 50 DÞ Dung Th¹ch, 5 TiÒn §ång", {{"I", 6, 1, 5132, 1}, {"I", 6, 1, 5126, 50}, {"I", 4, 417, 1, 5}}},
	[3] = {"Tói Cµn Kh«n, 60 M¸u T­¬i, 60 d­îc th¶o, 5 TiÒn §ång, 10 v¹n", {{"I", 6, 1, 5171, 1}, {"I", 6, 1, 5136, 60}, {"I", 6, 1, 5118, 20}, {"I", 6, 1, 5119, 20}, {"I", 6, 1, 5120, 10}, {"I", 4, 417, 1, 5}, {"B", 100000}}},
	[4] = {"Trang Søc Tiªu Dao, 75 DÞ Dung, 5 TiÒn §ång, 10 v¹n", {{"G", 0, 7129}, {"I", 6, 1, 5126, 75}, {"I", 4, 417, 1, 5}, {"B", 100000}}},
	[5] = {"S¸ch B¾c Minh, 150 d­îc th¶o, 10 TiÒn §ång, 110 v¹n", {{"I", 6, 1, 5142, 1}, {"I", 6, 1, 5118, 50}, {"I", 6, 1, 5119, 50}, {"I", 6, 1, 5120, 15}, {"I", 4, 417, 1, 10}, {"B", 1100000}}},
	[6] = {"Tiªu Dao Ên, 60 M¸u T­¬i, 125 DÞ Dung, 5 TiÒn §ång", {{"G", 0, 7128}, {"I", 6, 1, 5136, 60}, {"I", 6, 1, 5126, 125}, {"I", 4, 417, 1, 5}}},
	[7] = {"S¸ch TiÓu V«, 180 d­îc th¶o, 10 TiÒn §ång", {{"I", 6, 1, 5164, 1}, {"I", 6, 1, 5118, 100}, {"I", 6, 1, 5119, 50}, {"I", 6, 1, 5120, 15}, {"I", 4, 417, 1, 10}}},
	[8] = {"Phi Phong, 60 M¸u T­¬i, 150 DÞ Dung, 1 Ngò Hµnh, 5 TiÒn §ång", {{"G", 0, 7130}, {"I", 6, 1, 5136, 60}, {"I", 6, 1, 5126, 150}, {"I", 6, 1, 5127, 1}, {"I", 4, 417, 1, 5}}},
	[9] = {"Tói B¶o B¶o, 100 M¸u, 240 th¶o, 2 Ngò Hµnh, 200 v¹n", {{"I", 6, 1, 5161, 1}, {"I", 6, 1, 5136, 100}, {"I", 6, 1, 5118, 100}, {"I", 6, 1, 5119, 80}, {"I", 6, 1, 5120, 25}, {"I", 6, 1, 5126, 250}, {"I", 6, 1, 5127, 2}, {"I", 4, 417, 1, 20}, {"B", 2000000}}},
	[10] = {"§¹i lÔ tèi th­îng - gÊp 1.5 lÇn mèc 9", {{"I", 6, 1, 5136, 150}, {"I", 6, 1, 5118, 150}, {"I", 6, 1, 5119, 120}, {"I", 6, 1, 5120, 30}, {"I", 6, 1, 5126, 350}, {"I", 6, 1, 5127, 5}, {"I", 4, 417, 1, 30}, {"B", 3000000}}}
}

-- Task l­u giíi h¹n 2 Tû EXP cho sù kiÖn r­îu (L­u theo hÖ V¹n)
TSK_EXP_RUOU_VAN = 1412 
TSK_YEAR_RUOU = 1413

tbItemHaoCam = {
	{nId = 1894, szName = "B¸nh Ch­ng Th­îng H¹ng", nPt = 5, nExpVan = 0, nThang = 1, szNpc = "ThÇn Tµi"},
	{nId = 5144, szName = "Socola T×nh Yªu", nPt = 5, nExpVan = 0, nThang = 2, szNpc = "NguyÖt L·o"},
	{nId = 5152, szName = "Bã Hoa Hång", nPt = 5, nExpVan = 0, nThang = 3, szNpc = "ChÞ G¸i Gãi Hoa"},
	{nId = 2013, szName = "BÇu r­îu", nPt = 5, nExpVan = 0, nThang = 5, szNpc = "C« Giao Liªn ChiÕn Th¾ng"},
	{nId = 1761, szName = "B¸nh Kem Nh­ ý", nPt = 5, nExpVan = 0, nThang = 6, szNpc = "Qu¶n Trß Sinh NhËt"},
	{nId = 1395, szName = "B¸nh chay ®Æc biÖt", nPt = 5, nExpVan = 0, nThang = 4, szNpc = "Vua Hïng"},
	{nId = 1396, szName = "B¸nh chay th­êng", nPt = 5, nExpVan = 0, nThang = 4, szNpc = "Vua Hïng"},
	{nId = 1397, szName = "B¸nh chay ch­a chÝn", nPt = 5, nExpVan = 0, nThang = 4, szNpc = "Vua Hïng"},
	{nId = 1663, szName = "B¸nh Ch­ng H¶o H¹ng", nPt = 10, nExpVan = 0, nThang = 1, szNpc = "ThÇn Tµi"},
	{nId = 5145, szName = "Socola h¹nh nh©n t×nh yªu", nPt = 10, nExpVan = 0, nThang = 2, szNpc = "NguyÖt L·o"},
	{nId = 5153, szName = "Giá Hoa Hång VÜnh Cöu", nPt = 10, nExpVan = 0, nThang = 3, szNpc = "ChÞ G¸i Gãi Hoa"},
	{nId = 2014, szName = "R­îu Nho", nPt = 10, nExpVan = 0, nThang = 5, szNpc = "C« Giao Liªn ChiÕn Th¾ng"},
	{nId = 1762, szName = "B¸nh Kem C¸t T­êng", nPt = 10, nExpVan = 0, nThang = 6, szNpc = "Qu¶n Trß Sinh NhËt"},
	{nId = 2836, szName = "Ngò S¾c Hoa", nPt = 10, nExpVan = 0, nThang = 7, szNpc = "Ng­êi ®Ñp d©n hoa"},
	{nId = 2097, szName = "ChiÕc Mò Tai BÌo", nPt = 5, nExpVan = 0, nThang = 9, szNpc = "Sø Gi¶ Quèc Kh¸nh"},
	{nId = 1496, szName = "Huy Ch­¬ng Quèc Kh¸nh", nPt = 10, nExpVan = 0, nThang = 9, szNpc = "Sø Gi¶ Quèc Kh¸nh"},
	{nId = 1514, szName = "Hép B¸nh Trung Thu", nPt = 15, nExpVan = 0, nThang = 10, szNpc = "H»ng Nga Tiªn Tö"},
	
	-- VËt phÈm Sù kiÖn Th¸ng 11
	{nId = 5159, szName = "Tiªn Linh Töu", nPt = 10, nExpVan = 600, nThang = 11, szNpc = "Töu D­îc S­"},
	{nId = 5160, szName = "Hæ Cèt Töu", nPt = 50, nExpVan = 700, nThang = 11, szNpc = "Töu D­îc S­"},
	
	-- VËt phÈm Sù kiÖn Th¸ng 12 (Gi¸ng Sinh)
	{nId = 1626, szName = "KÑo gi¸ng sinh (®Æc biÖt)", nPt = 5, nExpVan = 0, nThang = 12, szNpc = "Thiªn Sø Gi¸ng Sinh"},
	{nId = 1627, szName = "Hép Quµ Gi¸ng Sinh", nPt = 10, nExpVan = 0, nThang = 12, szNpc = "Thiªn Sø Gi¸ng Sinh"},
}

tbMocHaoCam = {
	[1] = {nNeed = 500},   [2] = {nNeed = 1500},  [3] = {nNeed = 3000},
	[4] = {nNeed = 5000},  [5] = {nNeed = 8000},  [6] = {nNeed = 12000},
	[7] = {nNeed = 17000}, [8] = {nNeed = 23000}, [9] = {nNeed = 30000}, [10] = {nNeed = 40000}
}

if not TDT_PLAYER_SELECT then TDT_PLAYER_SELECT = {} end
-- ==========================================================

function main()
	if TDT_Story() == 1 then return 1 end
	local nJoined = GetTask(TSK_JOINED)
	
	if nJoined == 0 then
		local szMsg = "Ta lµ Tiªu Dao Tö, s­ tæ Tiªu Dao Ph¸i. §å nhi cã x­¬ng cèt thanh kú, cã muèn gia nhËp b¶n ph¸i kh«ng?"
		local tbOpt = {
			{"§Ö tö nguyÖn ý gia nhËp", GiaNhapTieuDao},
			{"§Ö tö suy nghÜ l¹i", KetThuc}
		}
		CreateNewSayEx(szMsg, tbOpt)
	else
		local szMsg = "§å nhi, ta ®· trao cho con 3 mãn b¶o vËt xem nh­ tÝn  vËt duyªn khëi.Sau nµy hµnh tÈu giang hå nÕu cã ai hái th× kh«ng ®­­îc hÐ miÖng nh¾c ®Õn tªn ta , m«n ph¸i  cña ta vµ n¬i ta ®ang tró ngô !"
		local tbOpt = {}
		
		local nCapHC = tonumber(GetTask(TSK_CAP_HAOCAM)) or 0
		local nDaNhan = tonumber(GetTask(TSK_REWARD_HAOCAM)) or 0
		local nIdx = 1

		-- [23/09/2026] Hien so lieu Hao Cam ngay tren loi chao, de nguoi choi
		-- va ca GM doi chieu duoc: cap hien tai, diem, va moc da nhan thuong toi dau.
		local nDiemHC = tonumber(GetTask(TSK_DIEM_HAOCAM)) or 0
		szMsg = szMsg .. "<enter><enter><color=green>H¶o C¶m: cÊp " .. nCapHC
			.. ", ®iÓm " .. nDiemHC
			.. ", ®· nhËn th­ëng tíi mèc " .. nDaNhan .. "<color>"

		if CFG_TDT_ResetThuong == 1 then
			tbOpt[nIdx] = {"[GM] §Æt l¹i mèc ®· nhËn th­ëng", TDT_ResetMocThuong}; nIdx = nIdx + 1
		end
		if TDT_CoThuongChuaNhan(nCapHC, nDaNhan) == 1 then
			tbOpt[nIdx] = {"NhËn th­ëng H¶o C¶m", NhanThuongHaoCam}; nIdx = nIdx + 1
		end

		tbOpt[nIdx] = {"§Ö tö muèn tiÕn cÊp B¸t Hoang T©m Ph¸p", TienCapBatHoang}; nIdx = nIdx + 1
		if GetTask(3410) > 0 then
			tbOpt[nIdx] = {"§Ö tö muèn tiÕn cÊp TiÓu V« T­íng C«ng", TienCapTieuVo}; nIdx = nIdx + 1
		end
		if CFG_BacMinhCong == 1 and GetTask(3413) > 0 then
			tbOpt[nIdx] = {"§Ö tö muèn tiÕn cÊp B¾c Minh C«ng", TienCapBacMinh}; nIdx = nIdx + 1
		end
		tbOpt[nIdx] = {"Båi d­ìng H¶o C¶m (TÆng Quµ)", MenuHaoCam}; nIdx = nIdx + 1
		tbOpt[nIdx] = {"Xin s­ phô ®iÓm chØ h­íng tu luyÖn", TDT_HuongDan}; nIdx = nIdx + 1
		tbOpt[nIdx] = {"§Ö tö chØ ghÐ th¨m ng­¬i", KetThuc}
		
		CreateNewSayEx(szMsg, tbOpt)
	end
	return 1
end

-- ================= MENU H?O C?M =================
function MenuHaoCam()
	local nLvl = tonumber(GetTask(TSK_CAP_HAOCAM)) or 0
	local nPt = tonumber(GetTask(TSK_DIEM_HAOCAM)) or 0
	local nMonth = tonumber(GetLocalDate("%m"))
	
	local szMsg = "<color=yellow>Tiªu Dao Tö:<color>\n§é h¶o c¶m hiÖn t¹i cña ®å nhi víi ta: <color=green>CÊp " .. nLvl .. "/10<color>\n"
	
	if nLvl < 10 then
		szMsg = szMsg .. "§iÓm h¶o c¶m: <color=pink>" .. nPt .. "/" .. tbMocHaoCam[nLvl + 1].nNeed .. " ®iÓm<color>\n\n§å nhi cã mang theo lÔ vËt g× muèn tÆng kh«ng?"
	else
		szMsg = szMsg .. "§iÓm h¶o c¶m: <color=pink>" .. nPt .. " ®iÓm<color>\n\n<color=yellow>§å nhi ®· trë thµnh t©m phóc cña ta, kh«ng cÇn tÆng thªm n÷a!<color>"
	end
	
	local tbOpt = {}
	local nOptIndex = 1
	if nLvl < 10 or nMonth == 11 then
		local bHasItem = 0
		
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[1].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[1].szName, TangItem_1}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[2].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[2].szName, TangItem_2}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[3].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[3].szName, TangItem_3}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[4].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[4].szName, TangItem_4}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[5].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[5].szName, TangItem_5}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[6].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[6].szName, TangItem_6}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[7].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[7].szName, TangItem_7}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[8].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[8].szName, TangItem_8}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[9].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[9].szName, TangItem_9}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[10].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[10].szName, TangItem_10}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[11].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[11].szName, TangItem_11}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[12].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[12].szName, TangItem_12}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[13].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[13].szName, TangItem_13}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[14].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[14].szName, TangItem_14}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[15].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[15].szName, TangItem_15}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[16].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[16].szName, TangItem_16}; nOptIndex = nOptIndex + 1; end
		if CalcEquiproomItemCount(6, 1, tbItemHaoCam[17].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[17].szName, TangItem_17}; nOptIndex = nOptIndex + 1; end
		
		-- Sù kiÖn Th¸ng 11
		if nMonth == 11 then
			if CalcEquiproomItemCount(6, 1, tbItemHaoCam[18].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[18].szName, TangItem_18}; nOptIndex = nOptIndex + 1; end
			if CalcEquiproomItemCount(6, 1, tbItemHaoCam[19].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[19].szName, TangItem_19}; nOptIndex = nOptIndex + 1; end
		end
		
		-- Sù kiÖn Gi¸ng Sinh (Th¸ng 12)
		if nMonth == 12 then
			if CalcEquiproomItemCount(6, 1, tbItemHaoCam[20].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[20].szName, TangItem_20}; nOptIndex = nOptIndex + 1; end
			if CalcEquiproomItemCount(6, 1, tbItemHaoCam[21].nId, -1) > 0 then bHasItem = 1; tbOpt[nOptIndex] = {"TÆng " .. tbItemHaoCam[21].szName, TangItem_21}; nOptIndex = nOptIndex + 1; end
		end
		
		if bHasItem == 0 then
			szMsg = szMsg .. "\n\n<color=red>Hµnh trang cña ®å nhi hiÖn kh«ng cã lÔ vËt nµo phï hîp!<color>"
		end
	end
	
	if CFG_XemLeVatHaoCam == 1 then
		tbOpt[nOptIndex] = {"Xem lÔ vËt ta ­a thÝch", TDT_XemLeVat}; nOptIndex = nOptIndex + 1
	end
	tbOpt[nOptIndex] = {"Xem phÇn th­ëng H¶o C¶m", TDT_XemPhanThuong}; nOptIndex = nOptIndex + 1
	tbOpt[nOptIndex] = {"§Ó ®Ö tö suy nghÜ thªm", KetThuc}
	CreateNewSayEx(szMsg, tbOpt)
end

function TangItem_1() TDT_PLAYER_SELECT[PlayerIndex] = 1; ChonSoLuong() end
function TangItem_2() TDT_PLAYER_SELECT[PlayerIndex] = 2; ChonSoLuong() end
function TangItem_3() TDT_PLAYER_SELECT[PlayerIndex] = 3; ChonSoLuong() end
function TangItem_4() TDT_PLAYER_SELECT[PlayerIndex] = 4; ChonSoLuong() end
function TangItem_5() TDT_PLAYER_SELECT[PlayerIndex] = 5; ChonSoLuong() end
function TangItem_6() TDT_PLAYER_SELECT[PlayerIndex] = 6; ChonSoLuong() end
function TangItem_7() TDT_PLAYER_SELECT[PlayerIndex] = 7; ChonSoLuong() end
function TangItem_8() TDT_PLAYER_SELECT[PlayerIndex] = 8; ChonSoLuong() end
function TangItem_9() TDT_PLAYER_SELECT[PlayerIndex] = 9; ChonSoLuong() end
function TangItem_10() TDT_PLAYER_SELECT[PlayerIndex] = 10; ChonSoLuong() end
function TangItem_11() TDT_PLAYER_SELECT[PlayerIndex] = 11; ChonSoLuong() end
function TangItem_12() TDT_PLAYER_SELECT[PlayerIndex] = 12; ChonSoLuong() end
function TangItem_13() TDT_PLAYER_SELECT[PlayerIndex] = 13; ChonSoLuong() end
function TangItem_14() TDT_PLAYER_SELECT[PlayerIndex] = 14; ChonSoLuong() end
function TangItem_15() TDT_PLAYER_SELECT[PlayerIndex] = 15; ChonSoLuong() end
function TangItem_16() TDT_PLAYER_SELECT[PlayerIndex] = 16; ChonSoLuong() end
function TangItem_17() TDT_PLAYER_SELECT[PlayerIndex] = 17; ChonSoLuong() end
function TangItem_18() TDT_PLAYER_SELECT[PlayerIndex] = 18; ChonSoLuong() end
function TangItem_19() TDT_PLAYER_SELECT[PlayerIndex] = 19; ChonSoLuong() end
function TangItem_20() TDT_PLAYER_SELECT[PlayerIndex] = 20; ChonSoLuong() end
function TangItem_21() TDT_PLAYER_SELECT[PlayerIndex] = 21; ChonSoLuong() end

function ChonSoLuong()
	local nIndex = TDT_PLAYER_SELECT[PlayerIndex]
	if not nIndex or not tbItemHaoCam[nIndex] then return end
	local tb = tbItemHaoCam[nIndex]
	local tbMat = {
		{szName = tb.szName, tbProp = {6, 1, tb.nId, 1, 0, 0}, nCount = 1},
	}
	SKN_XacNhan("D©ng " .. tb.szName, tbMat, "XuLyTang")
end
-- ================= LOGIC T?NG & X? LÝ EXP =================
function XuLyTang(nCount)
	local nIndex = TDT_PLAYER_SELECT[PlayerIndex]
	if not nIndex or not tbItemHaoCam[nIndex] then return end
	
	local nId = tbItemHaoCam[nIndex].nId
	local szName = tbItemHaoCam[nIndex].szName
	local nPt = tbItemHaoCam[nIndex].nPt
	local nExpVan = tbItemHaoCam[nIndex].nExpVan or 0

	if CalcEquiproomItemCount(6, 1, nId, -1) < nCount then
		Msg2Player("§å nhi kh«ng cã ®ñ " .. nCount .. " " .. szName .. " ®Ó tÆng!") return
	end

	-- Trõ vËt phÈm ngay lËp tøc
	ConsumeEquiproomItem(nCount, 6, 1, nId, -1)
	
	-- 1. X? LÝ KINH NGHI?M (ChØ dµnh cho R­îu Th¸ng 11)
	if nExpVan > 0 then
		local nYear = tonumber(GetLocalDate("%Y"))
		if GetTask(TSK_YEAR_RUOU) ~= nYear then
			SetTask(TSK_EXP_RUOU_VAN, 0)
			SetTask(TSK_YEAR_RUOU, nYear)
		end
		
		local nDaNhanVan = GetTask(TSK_EXP_RUOU_VAN)
		local MAX_VAN = 200000 -- T­¬ng ®­¬ng 2 Tû EXP
		local nTotalAddVan = nExpVan * nCount
		
		if nDaNhanVan < MAX_VAN then
			if nDaNhanVan + nTotalAddVan > MAX_VAN then 
				nTotalAddVan = MAX_VAN - nDaNhanVan 
			end
			tl_addPlayerExp(nTotalAddVan * 10000)
			SetTask(TSK_EXP_RUOU_VAN, nDaNhanVan + nTotalAddVan)
			Msg2Player("<color=yellow>KÝnh lÔ thµnh c«ng! NhËn ®­îc " .. (nTotalAddVan * 10000) .. " Kinh NghiÖm.<color>")
		else
			Msg2Player("<color=yellow>KÝnh lÔ thµnh c«ng! (Kinh nghiÖm ®· ®¹t giíi h¹n 2 tû)<color>")
		end
	end
	
	-- 2. X? LÝ H?O C?M (Lu«n ch¹y cho mäi vËt phÈm)
	local nLvl = tonumber(GetTask(TSK_CAP_HAOCAM)) or 0
	if nLvl < 10 then
		local nOldPt = tonumber(GetTask(TSK_DIEM_HAOCAM)) or 0
		local nCurPt = nOldPt + (nCount * nPt)
		SetTask(TSK_DIEM_HAOCAM, nCurPt)
		
		Msg2Player("<color=green>TÆng thµnh c«ng, t¨ng " .. (nCount * nPt) .. " ®iÓm H¶o C¶m!<color>")

		local nNewLvl = nLvl
		for i = nLvl + 1, 10 do
			if nCurPt >= tbMocHaoCam[i].nNeed then
				nNewLvl = i
			else
				break
			end
		end

		if nNewLvl > nLvl then
			SetTask(TSK_CAP_HAOCAM, nNewLvl)
			Msg2Player("<color=yellow>Chóc mõng! H¶o c¶m víi Tiªu Dao Tö ®¹t CÊp " .. nNewLvl .. "!<color>")
		end
	else
		Msg2Player("<color=pink>H¶o c¶m ®· ®¹t tèi ®a, ®å nhi qu¶ thËt cã hiÕu!<color>")
	end
end

-- ================= BÁT HOANG TÂM PHÁP =================
function GiaNhapTieuDao()
	SetTask(TSK_JOINED, 1)
	tbAwardTemplet:GiveAwardByList({tbProp = {6, 1, 5135, 1, 0, 0}, nCount = 1, nBindState = -2},
		"TieuDaoTu-GiaNhap")
	local nIdxMatNa = AddGoldItem(0, 4493)
	if nIdxMatNa ~= nil and nIdxMatNa > 0 then SetItemBindState(nIdxMatNa, -2) end
	local nIdxNgua = AddGoldItem(0, 5433)
	if nIdxNgua ~= nil and nIdxNgua > 0 then SetItemBindState(nIdxNgua, -2) end
	Msg2Player("<color=yellow>Gia nhËp Tiªu Dao Ph¸i! NhËn ®­îc B¸t Hoang, MÆt N¹ vµ B¹ch M·.<color>")
end

function TienCapBatHoang()
	local nCanhGioi = GetTask(3400)
	local nLevel = GetTask(3401)
	
	if nCanhGioi == 0 then 
		Msg2Player("<color=red>§å nhi ch­a kÝch ho¹t B¸t Hoang T©m Ph¸p!<color>") return 
	end
	
	local nMaxLevel = nCanhGioi * 10
	if nLevel < nMaxLevel then
		Msg2Player("<color=red>B¸t hoang ch­a ®¹t b×nh c¶nh CÊp " .. nMaxLevel .. ", ch­a thÓ tÊn th¨ng!<color>") return
	end
	
	if nCanhGioi >= 6 then
		Msg2Player("<color=yellow>§å nhi ®· ®¹t c¶nh giíi tèi cao!<color>") return
	end
	
	local tbBloodCost = {0, 30, 60, 90, 120}
	local nNeedBlood = tbBloodCost[nCanhGioi]
	
	if nNeedBlood > 0 then
		local nBloodCount = CalcEquiproomItemCount(6, 1, 5136, -1)
		if nBloodCount == 0 then
			nBloodCount = CalcEquiproomItemCount(6, 1, 5136, 1)
		end
		
		if nBloodCount < nNeedBlood then
			Msg2Player("<color=red>CÇn " .. nNeedBlood .. " b×nh M¸u T­¬i ®Ó tÊn th¨ng!<color>") return
		end
		
		if CalcEquiproomItemCount(6, 1, 5136, -1) >= nNeedBlood then
			ConsumeEquiproomItem(nNeedBlood, 6, 1, 5136, -1)
		else
			ConsumeEquiproomItem(nNeedBlood, 6, 1, 5136, 1)
		end
	end
	
	local tbAura = {1508, 1509, 1510, 1511, 1512, 1513}
	local nOldAura = tbAura[nCanhGioi] or 1508
	local nNewAura = tbAura[nCanhGioi + 1] or 1508

	SetTask(3400, nCanhGioi + 1)
	SetTask(3401, 1) 
	SetTask(3402, 0) 
	
	RemoveSkillState(nOldAura)
	AddSkillState(nNewAura, 1, 1, 99999999, 1)
	
	Msg2Player("<color=yellow>§ét ph¸ thµnh c«ng! TiÕn vµo C¶nh giíi " .. (nCanhGioi + 1) .. " - CÊp 1!<color>")
	Msg2Player("<color=red>B¸t hoang t¶n c«ng, ph¶i tu luyÖn l¹i tõ CÊp 1!<color>")
end

function TDT_XemLeVat()
	local szMsg = "<color=yellow>LÔ vËt Tiªu Dao Tö ­a thÝch<color>\n"
	szMsg = szMsg .. "<color=red>Mçi lÔ vËt chØ kiÕm ®­îc trong th¸ng cña nã.<color>\n\n"

	local nThang = 1
	while nThang <= 12 do
		local szNpc = ""
		local szDs = ""
		local i = 1
		while i <= getn(tbItemHaoCam) do
			local q = tbItemHaoCam[i]
			if q.nThang == nThang then
				szNpc = q.szNpc
				local szTh = q.szName .. " (" .. q.nPt .. "®"
				if q.nExpVan > 0 then
					szTh = szTh .. ", +" .. q.nExpVan .. " v¹n EXP"
				end
				szTh = szTh .. ")"
				if szDs == "" then
					szDs = szTh
				else
					szDs = szDs .. ", " .. szTh
				end
			end
			i = i + 1
		end
		if szDs ~= "" then
			szMsg = szMsg .. "<color=green>Th¸ng " .. nThang .. " - " .. szNpc .. ":<color> " .. szDs .. "\n"
		end
		nThang = nThang + 1
	end

	szMsg = szMsg .. "\n<color=gray>B¸nh chay th¸ng 4 lÊy tõ trß nÊu b¸nh BÕp löa nhá, kh«ng ph¶i ®æi.<color>"

	local tbOpt = {
		{"Quay l¹i", MenuHaoCam},
		{"§Ó ®Ö tö suy nghÜ thªm", KetThuc},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function TDT_XemPhanThuong()
	local nCap = tonumber(GetTask(TSK_CAP_HAOCAM)) or 0
	local nDaNhan = tonumber(GetTask(TSK_REWARD_HAOCAM)) or 0
	local szMsg = "<color=yellow>Tiªu Dao Tö:<color>\nB¶ng phÇn th­ëng H¶o C¶m:\n"
	if nDaNhan >= 1 then
		szMsg = szMsg .. "CÊp  1 (  500): <color=gray>30 M¸u T­¬i, 60 d­îc th¶o, 5 TiÒn §ång (®· nhËn)<color>\n"
	elseif nCap >= 1 then
		szMsg = szMsg .. "CÊp  1 (  500): <color=gold>30 M¸u T­¬i, 60 d­îc th¶o, 5 TiÒn §ång (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp  1 (  500): <color=green>30 M¸u T­¬i, 60 d­îc th¶o, 5 TiÒn §ång<color>\n"
	end
	if nDaNhan >= 2 then
		szMsg = szMsg .. "CÊp  2 ( 1500): <color=gray>Tói M¸u V« H¹n, 5 DÞ Dung Th¹ch, 5 TiÒn §ång (®· nhËn)<color>\n"
	elseif nCap >= 2 then
		szMsg = szMsg .. "CÊp  2 ( 1500): <color=gold>Tói M¸u V« H¹n, 5 DÞ Dung Th¹ch, 5 TiÒn §ång (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp  2 ( 1500): <color=green>Tói M¸u V« H¹n, 5 DÞ Dung Th¹ch, 5 TiÒn §ång<color>\n"
	end
	if nDaNhan >= 3 then
		szMsg = szMsg .. "CÊp  3 ( 3000): <color=gray>Tói Cµn Kh«n, 60 M¸u T­¬i, 60 d­îc th¶o, 5 TiÒn §ång, 10 v¹n (®· nhËn)<color>\n"
	elseif nCap >= 3 then
		szMsg = szMsg .. "CÊp  3 ( 3000): <color=gold>Tói Cµn Kh«n, 60 M¸u T­¬i, 60 d­îc th¶o, 5 TiÒn §ång, 10 v¹n (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp  3 ( 3000): <color=green>Tói Cµn Kh«n, 60 M¸u T­¬i, 60 d­îc th¶o, 5 TiÒn §ång, 10 v¹n<color>\n"
	end
	if nDaNhan >= 4 then
		szMsg = szMsg .. "CÊp  4 ( 5000): <color=gray>Trang Søc Tiªu Dao, 5 DÞ Dung, 5 TiÒn §ång, 10 v¹n (®· nhËn)<color>\n"
	elseif nCap >= 4 then
		szMsg = szMsg .. "CÊp  4 ( 5000): <color=gold>Trang Søc Tiªu Dao, 5 DÞ Dung, 5 TiÒn §ång, 10 v¹n (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp  4 ( 5000): <color=green>Trang Søc Tiªu Dao, 5 DÞ Dung, 5 TiÒn §ång, 10 v¹n<color>\n"
	end
	if nDaNhan >= 5 then
		szMsg = szMsg .. "CÊp  5 ( 8000): <color=gray>S¸ch B¾c Minh, 150 d­îc th¶o, 10 TiÒn §ång, 110 v¹n (®· nhËn)<color>\n"
	elseif nCap >= 5 then
		szMsg = szMsg .. "CÊp  5 ( 8000): <color=gold>S¸ch B¾c Minh, 150 d­îc th¶o, 10 TiÒn §ång, 110 v¹n (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp  5 ( 8000): <color=green>S¸ch B¾c Minh, 150 d­îc th¶o, 10 TiÒn §ång, 110 v¹n<color>\n"
	end
	if nDaNhan >= 6 then
		szMsg = szMsg .. "CÊp  6 (12000): <color=gray>Tiªu Dao Ên, 60 M¸u T­¬i, 10 DÞ Dung, 5 TiÒn §ång (®· nhËn)<color>\n"
	elseif nCap >= 6 then
		szMsg = szMsg .. "CÊp  6 (12000): <color=gold>Tiªu Dao Ên, 60 M¸u T­¬i, 10 DÞ Dung, 5 TiÒn §ång (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp  6 (12000): <color=green>Tiªu Dao Ên, 60 M¸u T­¬i, 10 DÞ Dung, 5 TiÒn §ång<color>\n"
	end
	if nDaNhan >= 7 then
		szMsg = szMsg .. "CÊp  7 (17000): <color=gray>S¸ch TiÓu V«, 180 d­îc th¶o, 10 TiÒn §ång (®· nhËn)<color>\n"
	elseif nCap >= 7 then
		szMsg = szMsg .. "CÊp  7 (17000): <color=gold>S¸ch TiÓu V«, 180 d­îc th¶o, 10 TiÒn §ång (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp  7 (17000): <color=green>S¸ch TiÓu V«, 180 d­îc th¶o, 10 TiÒn §ång<color>\n"
	end
	if nDaNhan >= 8 then
		szMsg = szMsg .. "CÊp  8 (23000): <color=gray>Phi Phong, 60 M¸u T­¬i, 10 DÞ Dung, 1 Ngò Hµnh, 5 TiÒn §ång (®· nhËn)<color>\n"
	elseif nCap >= 8 then
		szMsg = szMsg .. "CÊp  8 (23000): <color=gold>Phi Phong, 60 M¸u T­¬i, 10 DÞ Dung, 1 Ngò Hµnh, 5 TiÒn §ång (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp  8 (23000): <color=green>Phi Phong, 60 M¸u T­¬i, 10 DÞ Dung, 1 Ngò Hµnh, 5 TiÒn §ång<color>\n"
	end
	if nDaNhan >= 9 then
		szMsg = szMsg .. "CÊp  9 (30000): <color=gray>Tói B¶o B¶o, 100 M¸u, 240 th¶o, 2 Ngò Hµnh, 200 v¹n (®· nhËn)<color>\n"
	elseif nCap >= 9 then
		szMsg = szMsg .. "CÊp  9 (30000): <color=gold>Tói B¶o B¶o, 100 M¸u, 240 th¶o, 2 Ngò Hµnh, 200 v¹n (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp  9 (30000): <color=green>Tói B¶o B¶o, 100 M¸u, 240 th¶o, 2 Ngò Hµnh, 200 v¹n<color>\n"
	end
	if nDaNhan >= 10 then
		szMsg = szMsg .. "CÊp 10 (40000): <color=gray>§¹i lÔ tèi th­îng - gÊp 1.5 lÇn mèc 9 (®· nhËn)<color>\n"
	elseif nCap >= 10 then
		szMsg = szMsg .. "CÊp 10 (40000): <color=gold>§¹i lÔ tèi th­îng - gÊp 1.5 lÇn mèc 9 (nhËn ®­îc!)<color>\n"
	else
		szMsg = szMsg .. "CÊp 10 (40000): <color=green>§¹i lÔ tèi th­îng - gÊp 1.5 lÇn mèc 9<color>\n"
	end
	szMsg = szMsg .. "H¶o c¶m hiÖn t¹i: <color=pink>CÊp " .. nCap .. "/10<color>"
	local tbOpt = {
		{"Quay l¹i", MenuHaoCam}
	}
	CreateNewSayEx(szMsg, tbOpt)
end
function TDT_DemOTrong(tbQua)
	local n = 0
	local i = 1
	while i <= getn(tbQua) do
		if tbQua[i][1] ~= "B" then n = n + 1 end
		i = i + 1
	end
	return n
end

function TDT_TraoQua(tbQua)
	local i = 1
	while i <= getn(tbQua) do
		local q = tbQua[i]
		if q[1] == "I" then
			tbAwardTemplet:GiveAwardByList({tbProp = {q[2], q[3], q[4], 1, 0, 0}, nCount = q[5], nBindState = -2},
				"TieuDaoTu-HaoCam")
		elseif q[1] == "G" then
			local nIdxG = AddGoldItem(q[2], q[3])
			if nIdxG ~= nil and nIdxG > 0 then
				SetItemBindState(nIdxG, -2)
			end
		elseif q[1] == "B" then
			Earn(q[2])
		end
		i = i + 1
	end
end

function TDT_CoThuongChuaNhan(nCap, nDaNhan)
	local i = nDaNhan + 1
	while i <= nCap do
		if tbPhanThuongHaoCam[i] then return 1 end
		i = i + 1
	end
	return 0
end

-- [23/09/2026] Nut GM: dua moc da nhan thuong ve 0 de nhan lai tu dau.
-- Chi hien khi CFG_TDT_ResetThuong = 1. Dung xong nho dat lai ve 0.
function TDT_ResetMocThuong()
	SetTask(TSK_REWARD_HAOCAM, 0)
	Msg2Player("<color=yellow>§· ®Æt l¹i mèc ®· nhËn th­ëng vÒ 0.<color>")
end

function NhanThuongHaoCam()
	-- [23/09/2026] CHAN LOI DOT MOC: neu bang thuong khong nap duoc (nil/rong),
	-- tuyet doi KHONG duoc SetTask danh dau da nhan, vi se mat thuong vinh vien.
	if not tbPhanThuongHaoCam or getn(tbPhanThuongHaoCam) < 1 then
		Msg2Player("<color=red>B¶ng phÇn th­ëng ch­a n¹p ®­îc. H·y b¸o qu¶n trÞ, ®õng bÊm tiÕp.<color>")
		return
	end

	local nCap = tonumber(GetTask(TSK_CAP_HAOCAM)) or 0
	local nDaNhan = tonumber(GetTask(TSK_REWARD_HAOCAM)) or 0
	local nMoc = nDaNhan + 1

	while nMoc <= nCap do
		local tbRew = tbPhanThuongHaoCam[nMoc]
		if tbRew then
			local nCanO = TDT_DemOTrong(tbRew[2])
			if CalcFreeItemCellCount() < nCanO then
				Msg2Player("<color=red>Hµnh trang cÇn Ýt nhÊt " .. nCanO .. " « trèng ®Ó nhËn th­ëng!<color>")
				return
			end

			TDT_TraoQua(tbRew[2])
			SetTask(TSK_REWARD_HAOCAM, nMoc)
			Msg2Player("<color=yellow>NhËn th­ëng mèc " .. nMoc .. ": " .. tbRew[1] .. "<color>")
			return
		end
		-- Moc nay that su khong co thuong -> bo qua, KHONG danh dau
		nMoc = nMoc + 1
	end

	Msg2Player("<color=pink>HiÖn ch­a cã phÇn th­ëng nµo ®Ó nhËn.<color>")
end

function TDT_TruMauTuoi(nNeed)
	if nNeed <= 0 then return 1 end
	local n = CalcEquiproomItemCount(6, 1, 5136, -1)
	if n == 0 then n = CalcEquiproomItemCount(6, 1, 5136, 1) end
	if n < nNeed then return 0 end
	if CalcEquiproomItemCount(6, 1, 5136, -1) >= nNeed then
		ConsumeEquiproomItem(nNeed, 6, 1, 5136, -1)
	else
		ConsumeEquiproomItem(nNeed, 6, 1, 5136, 1)
	end
	return 1
end

function TienCapBacMinh()
	local nCanhGioi = GetTask(3413)
	local nLevel = GetTask(3414)

	if nCanhGioi == 0 then
		Msg2Player("<color=red>§Ö tö ch­a kÝch ho¹t B¾c Minh C«ng!<color>") return
	end

	local nMaxLevel = nCanhGioi * 10
	if nLevel < nMaxLevel then
		Msg2Player("<color=red>B¾c Minh ch­a ®¹t b×nh c¶nh CÊp " .. nMaxLevel .. ", ch­a thÓ tÊn th¨ng!<color>") return
	end

	if nCanhGioi >= 6 then
		Msg2Player("<color=yellow>§Ö tö ®· ®¹t c¶nh giíi tèi cao!<color>") return
	end

	local tbCost = {0, 60, 120, 180, 240}
	local nNeed = tbCost[nCanhGioi]
	if TDT_TruMauTuoi(nNeed) == 0 then
		Msg2Player("<color=red>CÇn " .. nNeed .. " b×nh M¸u T­¬i ®Ó tÊn th¨ng!<color>") return
	end

	local tbAura = {1520, 1521, 1522, 1523, 1524, 1525}
	local nOld = tbAura[nCanhGioi] or 1520
	local nNew = tbAura[nCanhGioi + 1] or 1520

	SetTask(3413, nCanhGioi + 1)
	SetTask(3414, 1)
	SetTask(3415, 0)

	RemoveSkillState(nOld)
	AddSkillState(nNew, 1, 1, 99999999, 1)

	Msg2Player("<color=yellow>§ét ph¸ thµnh c«ng! B¾c Minh tiÕn vµo C¶nh giíi " .. (nCanhGioi + 1) .. " - CÊp 1!<color>")
	Msg2Player("<color=red>T©m ph¸p t¸n c«ng, ph¶i tu luyÖn l¹i tõ CÊp 1!<color>")
end

function TienCapTieuVo()
	local nCanhGioi = GetTask(3410)
	local nLevel = GetTask(3411)

	if nCanhGioi == 0 then
		Msg2Player("<color=red>§å nhi ch­a kÝch ho¹t TiÓu V« T­íng C«ng!<color>") return
	end

	local nMaxLevel = nCanhGioi * 10
	if nLevel < nMaxLevel then
		Msg2Player("<color=red>TiÓu V« ch­a ®¹t b×nh c¶nh CÊp " .. nMaxLevel .. ", ch­a thÓ tÊn th¨ng!<color>") return
	end

	if nCanhGioi >= 6 then
		Msg2Player("<color=yellow>§å nhi ®· ®¹t c¶nh giíi tèi cao!<color>") return
	end

	local tbCost = {0, 120, 240, 360, 480}
	local nNeed = tbCost[nCanhGioi]
	if TDT_TruMauTuoi(nNeed) == 0 then
		Msg2Player("<color=red>CÇn " .. nNeed .. " b×nh M¸u T­¬i ®Ó tÊn th¨ng!<color>") return
	end

	local tbAura = {1526, 1527, 1528, 1529, 1530, 1531}
	local nOld = tbAura[nCanhGioi] or 1526
	local nNew = tbAura[nCanhGioi + 1] or 1526

	SetTask(3410, nCanhGioi + 1)
	SetTask(3411, 1)
	SetTask(3412, 0)

	RemoveSkillState(nOld)
	AddSkillState(nNew, 1, 1, 99999999, 1)

	Msg2Player("<color=yellow>§ét ph¸ thµnh c«ng! TiÓu V« tiÕn vµo C¶nh giíi " .. (nCanhGioi + 1) .. " - CÊp 1!<color>")
	Msg2Player("<color=red>T©m ph¸p t¶n c«ng, ph¶i tu luyÖn l¹i tõ CÊp 1!<color>")
end
function KetThuc() end