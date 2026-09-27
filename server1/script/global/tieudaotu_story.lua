-- =====================================================================
-- COT TRUYEN TIEU DAO TU  -  tao 13/09/2026
-- Ba de tu phan boi: Vo Nhai Tu / Ly Thu Thuy / Thien Son Dong Lao
-- Lua 4: KHONG dung 'local' o cap file (ham khong doc duoc).
-- =====================================================================

TDT_TSK_STORY = 3404   -- 0 chua bat dau | 1..4 dang lam | 9 xong
TDT_TSK_LOA   = 3405   -- phut (GetCurrentTime/60) luc phat Loa
TDT_TSK_BIPHO = 3408   -- bitmask 3 bi pho: 1|2|4

TDT_I_THIT = 3366
TDT_I_THAO = 5133
TDT_I_LOA  = 5134

TDT_CAN_THIT = 50
TDT_CAN_TIEN = 20000
TDT_CAN_THAO = 10
TDT_PHUT_LOA = 60

TDT_MAP_THANH = 53
TDT_LOA_X = 1720      -- toa do phat Loa: hien thi 215 x 8
TDT_LOA_Y = 3280      -- toa do phat Loa: hien thi 205 x 16
TDT_LOA_R = 3         -- sai so cho phep, tinh theo don vi hien thi

-- res, cap, map, X, Y, ten, vat pham bi pho, bit
-- res, cap, map, X, Y, ten boss, vat pham, bit, ten map, ten bi pho
-- X,Y o he logic (hien thi *8 va *16). AddNpc con nhan them *32 nua.
TDT_BOSS = {
	{777, 45,  5, 1646, 3255, "Hµn B¨ng Sø",   5137, 1, "Kinh Hoµng ®éng", "B¾c Minh ThÇn C«ng"},
	{778, 45, 23, 1667, 3166, "L¹c Mai Sø",    5139, 2, "ThÇn Tiªn ®éng",  "TiÓu V« T­íng C«ng"},
	{779, 45,  6, 1544, 3488, "Linh Thøu Sø",  5140, 4, "Táa V©n ®éng",    "B¸t Hoang Lôc Hîp"},
}

-- ---------------------------------------------------------------- tien ich
function TDT_DaXuatSu()
	if GetTask(1404) > 0 then return 1 end
	return 0
end

function TDT_Phut()
	if not GetCurrentTime then return 0 end
	return floor(GetCurrentTime() / 60)
end

function TDT_LoaConHan()
	local nBatDau = GetTask(TDT_TSK_LOA)
	if nBatDau <= 0 then return 0 end
	if TDT_Phut() - nBatDau < TDT_PHUT_LOA then return 1 end
	return 0
end

function TDT_ConLai()
	local n = TDT_PHUT_LOA - (TDT_Phut() - GetTask(TDT_TSK_LOA))
	if n < 0 then n = 0 end
	return n
end

function TDT_KetThuc() end

-- tra ve chuoi liet ke 3 sao huyet, danh dau cai da lay
-- hop thoai Loa. bConHan=1: dang trong 60 phut | 0: tin da nguoi
-- nTrangThai: 1 = dang con han | 0 = het han (da tung tin) | -1 = chua tung tin lan nao
function TDT_HienDanhSach(bConHan)
	local szMsg
	if bConHan < 0 then
		szMsg = "<color=gray>Ng­¬i ch­a h« tiÕng nµo. Ba tªn ®Ö tö vÉn ngåi yªn trong hang.<color><enter>"
		szMsg = szMsg .. "<color=gray>Ra Ba L¨ng huyÖn <color=yellow>215/205<color><color=gray> mµ tung tin, chóng nã míi chÞu rêi ®i.<color><enter><enter>"
	elseif bConHan == 1 then
		szMsg = "<color=yellow>Tin ®· tung. Ba tªn ®Ö tö ®ang rêi hang.<color><enter>"
		szMsg = szMsg .. "<color=red>Cßn l¹i " .. TDT_ConLai() .. " phót.<color><enter><enter>"
	else
		szMsg = "<color=gray>Tin ®· nguéi. Ba tªn ®Ö tö ®· vÒ hang.<color><enter>"
		szMsg = szMsg .. "<color=gray>Muèn tung tin lÇn n÷a th× ra Ba L¨ng huyÖn <color=yellow>215/205<color><color=gray> mµ h«.<color><enter><enter>"
	end
	szMsg = szMsg .. TDT_DanhSachSaoHuyet()
	CreateNewSayEx(szMsg, {})
end

-- du 3 bi pho trong hanh trang? (khong phu thuoc co bit, nen cong cu test cung dung duoc)
function TDT_CoDuBiPho()
	if CalcItemCount(3, 6, 1, 5137, -1) < 1 then return 0 end
	if CalcItemCount(3, 6, 1, 5139, -1) < 1 then return 0 end
	if CalcItemCount(3, 6, 1, 5140, -1) < 1 then return 0 end
	return 1
end

function TDT_DanhSachSaoHuyet()
	local nBit = GetTask(TDT_TSK_BIPHO)
	local sz = ""
	local i
	for i = 1, getn(TDT_BOSS) do
		local t = TDT_BOSS[i]
		if mod(floor(nBit / t[8]), 2) >= 1 then
			sz = sz .. "<color=gray>[xong] " .. t[10] .. "<color><enter>"
		else
			sz = sz .. "<color=yellow>" .. t[10] .. "<color><enter>"
			sz = sz .. "   " .. t[6] .. " - " .. t[9] .. " <color=green>" .. floor(t[4]/8) .. "/" .. floor(t[5]/16) .. "<color><enter>"
		end
	end
	return sz
end

-- ------------------------------------------------- cong vao cot truyen
function TDT_Story()
	local nB = GetTask(TDT_TSK_STORY)
	if nB == 0 and GetTask(TSK_JOINED) == 1 then
		SetTask(TDT_TSK_STORY, 9)
		return 0
	end
	if nB >= 9 then return 0 end
	if nB == 0 then TDT_C0() return 1 end
	if nB == 1 then TDT_C1() return 1 end
	if nB == 2 then TDT_C2() return 1 end
	if nB == 3 then TDT_C3() return 1 end
	if nB == 4 then TDT_C4() return 1 end
	return 0
end

TDT_THAN = {
	"Lßng ng­êi... cßn b¹c h¬n n­íc ch¶y.",
	"Ba ®øa nã quú tr­íc mÆt ta m­êi n¨m. M­êi n¨m, råi mét nh¸t.",
	"Ng­¬i cho ta miÕng ¨n, ngµy mai ng­¬i còng ®ßi l¹i th«i.",
	"Vâ c«ng mÊt råi th× cßn ai gäi ta mét tiÕng s­ phô.",
	"§i ®i. Ta kh«ng xin cña kÎ l¹.",
}

function TDT_C0()
	local nLv = GetLevel()
	if nLv < 60 then
		local i = random(1, getn(TDT_THAN))
		Talk(1, "", TDT_THAN[i])
		Msg2Player("<color=gray>¤ng ta kh«ng buån ngÈng ®Çu lªn nh×n ng­¬i.<color>")
		return
	end
	local szMsg = "<color=gray>Kh¸c víi nh÷ng lÇn tr­íc ®ã ,lÇn ®Çu tiªn «ng ta chÞu nh×n ng­¬i. M¾t «ng ta kh«ng gièng m¾t kÎ phµm tôc.<color><enter><enter>"
	szMsg = szMsg .. "Ng­¬i ®· tõng b¸i s­ , ®· tõng xuÊt s­ , kÎ biÕt ®¹o  thÇy trß m­êi n¨m råi ta míi gÆp. §­îc, ta hái mét c©u th«i:<enter>Ng­¬i cã tin lßng ng­êi kh«ng?"
	local tbOpt = {
		{"V·n bèi kh«ng tin. Nh­ng tin viÖc m×nh lµm.", TDT_NhanNV},
		{"V·n bèi ch­a nghÜ ra.", TDT_KetThuc},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function TDT_NhanNV()
	SetTask(TDT_TSK_STORY, 1)
	local szMsg = "Ha... c©u tr¶ lêi ®ã nghe ®­îc.<enter><enter>"
	szMsg = szMsg .. "Ta lµ <color=yellow>Tiªu Dao Tö<color>. Ba ®øa ®å ®Ö hîp søc phÕ ®an ®iÒn ta, c­íp s¹ch bÝ phæ. Giê ta ngåi ®©y, ba ngµy ch­a cã g× vµo bông.<enter><enter>"
	szMsg = szMsg .. "Ra khái thµnh mµ s¨n thó, lÊy cho ta <color=yellow>" .. TDT_CAN_THIT .. " ThÞt t­¬i<color>, thªm <color=yellow>2 v¹n l­îng<color> mua chót gia vÞ. Ta ¨n nh¹t quen råi, nh­ng thÞt sèng th× nuèt kh«ng tr«i."
	CreateNewSayEx(szMsg, {})
end

function TDT_C1()
	local szMsg = "§­îc bao nhiªu råi? Ta cÇn <color=yellow>" .. TDT_CAN_THIT .. " ThÞt t­¬i<color> vµ <color=yellow>2 v¹n l­îng<color>."
	local tbOpt = {
		{"V·n bèi nép ®ñ råi.", TDT_NopC1},
		{"V·n bèi ®i tiÕp ®©y.", TDT_KetThuc},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function TDT_NopC1()
	if GetCash() < TDT_CAN_TIEN then
		Msg2Player("<color=red>Ch­a ®ñ 2 v¹n l­îng.<color>") return
	end
	if ConsumeItem(3, TDT_CAN_THIT, 6, 1, TDT_I_THIT, -1) ~= 1 then
		Msg2Player("<color=red>Ch­a ®ñ " .. TDT_CAN_THIT .. " ThÞt t­¬i.<color>") return
	end
	Pay(TDT_CAN_TIEN)
	SetTask(TDT_TSK_STORY, 2)
	local szMsg = "<color=gray>¤ng ta ¨n. ¡n rÊt chËm, nh­ sî hÕt.<color><enter><enter>"
	szMsg = szMsg .. "§an ®iÒn ta vì, nh­ng kinh m¹ch chØ bÕ chø ch­a ®øt. Cã mét thø th«ng ®­îc: <color=yellow>Hoµng Tinh Th¶o<color>, mäc chç Èm thÊp ? Thanh Loa §¶o.<enter><enter>"
	szMsg = szMsg .. "LÊy cho ta <color=yellow>" .. TDT_CAN_THAO .. " c©y<color>. Nhæ c¶ rÔ, ®õng lµm ®øt."
	CreateNewSayEx(szMsg, {})
end

-- ------------------------------------------------------------- chuong 2
function TDT_C2()
	local szMsg = "<color=yellow>" .. TDT_CAN_THAO .. " c©y Hoµng Tinh Th¶o<color>. ë Thanh Loa §¶o Cã ch­a?"
	local tbOpt = {
		{"Cã ®©y, th­a tiÒn bèi.", TDT_NopC2},
		{"V·n bèi ®i t×m tiÕp.", TDT_KetThuc},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function TDT_NopC2()
	if ConsumeItem(3, TDT_CAN_THAO, 6, 1, TDT_I_THAO, -1) ~= 1 then
		Msg2Player("<color=red>Ch­a ®ñ " .. TDT_CAN_THAO .. " Hoµng Tinh Th¶o.<color>") return
	end
	SetTask(TDT_TSK_STORY, 3)
	SetTask(TDT_TSK_BIPHO, 0)
	AddItem(6, 1, TDT_I_LOA, 1, 0, 0)
	local szMsg = "<color=gray>¤ng ta nh¾m m¾t rÊt l©u. Khi më ra, trong ®ã cã thø g× ®ã s¾c h¬n tr­íc.<color><enter><enter>"
	szMsg = szMsg .. "Ba phÇn c«ng lùc. §ñ ®Ó ta nhí ra tªn chóng nã.<enter><enter>"
	szMsg = szMsg .. "<color=yellow>V« Nhai Tö<color> gi÷ <color=yellow>B¾c Minh ThÇn C«ng<color>.<enter>"
	szMsg = szMsg .. "<color=yellow>Lý Thu Thuû<color> gi÷ <color=yellow>TiÓu V« T­íng C«ng<color>.<enter>"
	szMsg = szMsg .. "<color=yellow>Thiªn S¬n §ång L·o<color> gi÷ <color=yellow>B¸t Hoang Lôc Hîp Duy Ng· §éc T«n<color>.<enter><enter>"
	szMsg = szMsg .. "Ba ®øa nã kh«ng tù gi÷. Mçi ®øa giao cho mét tªn thñ h¹ tr«ng. Ng­¬i ®¸nh thñ h¹ th× ®­îc, ®ông vµo ba ®øa nã th× ng­¬i chÕt.<enter><enter>"
	szMsg = szMsg .. "CÇm c¸i <color=yellow>Loa TruyÒn Tin<color> nµy. Ra to¹ ®é <color=yellow>215/205<color> ë Ba L¨ng huyÖn mµ h« lªn r»ng ta ®ang ë ®ã. Chóng nã thï ta tíi x­¬ng, nghe lµ bá hang mµ ch¹y.<enter><enter>"
	szMsg = szMsg .. "<color=red>Ng­¬i cã ®óng " .. TDT_PHUT_LOA .. " phót.<color>"
	CreateNewSayEx(szMsg, {})
end

-- ------------------------------------------------------------- chuong 3
function TDT_C3()
	local nBit = GetTask(TDT_TSK_BIPHO)
	-- du bi pho (du co bit hay khong) thi chuyen thang sang hoi thoai giao.
	-- KHONG doi trang thai o day: doi het trong TDT_NopC4, tranh ket giua chung.
	if nBit >= 7 or TDT_CoDuBiPho() == 1 then
		TDT_C4() return
	end
	local szMsg = "BÝ phæ ®©u? Ta cßn thiÕu:<enter>"
	szMsg = szMsg .. TDT_DanhSachSaoHuyet()
	local tbOpt = {}
	if TDT_LoaConHan() == 1 then
		szMsg = szMsg .. "<enter><color=red>Chóng nã cßn ®ang ch¹y. Ng­¬i cßn " .. TDT_ConLai() .. " phót.<color>"
	else
		szMsg = szMsg .. "<enter><color=gray>Ba ®øa nã ®· vÒ hang. Giê tíi ®ã th× ng­¬i chØ chuèc lÊy c¸i chÕt.<color>"
	end
	-- luon cho xin Loa neu trong tay khong con cai nao
	if CalcItemCount(3, 6, 1, TDT_I_LOA, -1) < 1 then
		tbOpt[1] = {"Cho v·n bèi xin c¸i Loa kh¸c.", TDT_XinLoa}
	end
	tbOpt[getn(tbOpt)+1] = {"V·n bèi ®i ®©y.", TDT_KetThuc}
	CreateNewSayEx(szMsg, tbOpt)
end

function TDT_XinLoa()
	SetTask(TDT_TSK_LOA, 0)
	AddItem(6, 1, TDT_I_LOA, 1, 0, 0)
	Msg2Player("<color=yellow>Tiªu Dao Tö ®­a ng­¬i mét c¸i Loa TruyÒn Tin n÷a. ¤ng ta kh«ng lÊy tiÒn.<color>")
end

-- ------------------------------------------------------------- chuong 4
function TDT_C4()
	local szMsg = "<color=gray>Ba trang giÊy cò n¸t n»m trong tay ng­¬i.<color><enter><enter>"
	szMsg = szMsg .. "§­a ta. <color=yellow>B¾c Minh<color> vµ <color=yellow>TiÓu V« T­íng<color> lµ cña ta, ta lÊy l¹i sau nµy cßn tuú duyªn thÇy trß ta sÏ truyÒn cho con.<enter><enter>"
	szMsg = szMsg .. "Cßn <color=yellow>B¸t Hoang Lôc Hîp Duy Ng· §éc T«n<color>... ta giµ råi. Nã nªn n»m trong tay kÎ cßn ®i ®­îc ®­êng dµi."
	local tbOpt = {
		{"V·n bèi xin d©ng c¶ ba.", TDT_NopC4},
		{"V·n bèi xin phÐp sau.", TDT_KetThuc},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function TDT_NopC4()
	-- kiem du ca ba TRUOC khi tru, tranh mat bi pho khi con thieu
	if CalcItemCount(3, 6, 1, 5137, -1) < 1 or CalcItemCount(3, 6, 1, 5139, -1) < 1 or CalcItemCount(3, 6, 1, 5140, -1) < 1 then
		Msg2Player("<color=red>Ph¶i cã ®ñ c¶ ba trang bÝ phæ.<color>")
		return
	end
	ConsumeItem(3, 1, 6, 1, 5137, -1)
	ConsumeItem(3, 1, 6, 1, 5139, -1)
	ConsumeItem(3, 1, 6, 1, 5140, -1)
	-- xong chuong 3+4: Loa het nhiem vu
	ConsumeItem(3, 1, 6, 1, TDT_I_LOA, -1)
	SetTask(TDT_TSK_BIPHO, 7)
	SetTask(TDT_TSK_STORY, 9)
	SetTask(TDT_TSK_LOA, 0)
	Msg2Player("<color=yellow>Tiªu Dao Tö ®øng dËy. TÊm ¸o r¸ch r¬i xuèng ®Êt.<color>")
	GiaNhapTieuDao()
end


-- ------------------------------------------------------ trieu boss
function TDT_TrieuBoss()
	local i
	local nOK = 0
	for i = 1, getn(TDT_BOSS) do
		local t = TDT_BOSS[i]
		local nIdx = SubWorldID2Idx(t[3])
		if nIdx < 0 then
			Msg2Player("<color=red>[chan doan] map " .. t[3] .. " chua nap, SubWorldID2Idx = " .. nIdx .. "<color>")
		else
			-- AddNpc nhan toa do he tinh = he logic * 32 (xem add_killertasknpc)
			local n = AddNpc(t[1], t[2], nIdx, t[4] * 32, t[5] * 32, 0, t[6], 1)
			if not n or n <= 0 then
				Msg2Player("<color=red>[chan doan] AddNpc that bai o map " .. t[3] .. ", tra ve " .. (n or -99) .. "<color>")
			else
				SetNpcDeathScript(n, "\\script\\global\\tdt_bossdeath.lua")
				SetNpcParam(n, 1, t[8])
				SetNpcTimer(n, TDT_PHUT_LOA * 60 * 18)
				nOK = nOK + 1
			end
		end
	end
	return nOK
end


-- =====================================================================
-- HUONG DAN TU LUYEN. So lieu lay tu: hoanbaocau.lua (ngua),
-- vuadidung.lua (mat na), tieudaotu.lua TienCapBatHoang + g_npcdeath.lua
-- (bat hoang). Sua so o cac file do thi phai sua lai bang nay.
-- LUU Y: TCVN3 khong co nguyen am HOA co dau -> tieu de dung chu thuong.
-- =====================================================================
function TDT_HuongDan()
	local szMsg = "<color=yellow>Tiªu Dao Tö:<color> Thiªn h¹ cã ba con ®­êng ®¸ng ®i.<enter>"
	szMsg = szMsg .. "Ng­¬i muèn ta chØ con nµo?<enter>"
	local tbOpt = {
		{"HuyÕt m¹ch TuyÖt §Þa Ho¶ V­¬ng", TDT_HD_Ngua},
		{"MÆt n¹ Tiªu Dao", TDT_HD_MatNa},
		{"B¸t Hoang T©m Ph¸p", TDT_HD_BatHoang},
		{"Th«i, ®Ó sau", TDT_KetThuc},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function TDT_HD_Ngua()
	local s = "<color=yellow>HuyÕt m¹ch TuyÖt §Þa Ho¶ V­¬ng<color><enter>"
	s = s .. "T×m <color=green>Hoµng B¶o C©u<color>:<enter>"
	s = s .. "   BiÖn Kinh 219/192<enter>"
	s = s .. "   T­¬ng D­¬ng 197/200<enter>"
	s = s .. "Nguyªn liÖu: ThÊt Tinh Th¶o / V¹n Niªn<enter>"
	s = s .. "Tinh Th¶o / Cµ Rèt §Æc BiÖt<enter><enter>"
	s = s .. "<color=green>§êi ngùa - liÖu ®Ó lªn ®êi sau<color><enter>"
	s = s .. " 1 TiÓu b¹ch m·    10 /  0 /  0<enter>"
	s = s .. " 2 ChiÕu D¹        20 / 10 /  0<enter>"
	s = s .. " 3 Phi V©n         40 / 20 / 10<enter>"
	s = s .. " 4 B«n Tiªu        80 / 40 / 20<enter>"
	s = s .. " 5 Du Huy         160 / 80 / 40<enter>"
	s = s .. " 6 XÝch Long      320 /160 / 80<enter>"
	s = s .. " 7 §»ng Vô        640 /320 /160<enter>"
	s = s .. " 8 Phiªu Vò       999 /450 /225<enter>"
	s = s .. " 9 Siªu Quang     999 /999 /450<enter>"
	s = s .. "10 <color=yellow>TuyÖt §Þa Ho¶ V­¬ng<color> - tét ®Ønh<enter><enter>"
		CreateNewSayEx(s, {{"Xem ®­êng kh¸c", TDT_HuongDan}, {"§ñ råi", TDT_KetThuc}})
end

function TDT_HD_MatNa()
	local s = "<color=yellow>Tiªu Dao HuyÔn DiÖn<color><enter>"
	s = s .. "T×m <color=green>B¸c Thñy DÞ Dung<color>:<enter>"
	s = s .. "   T­¬ng D­¬ng 200/202<enter>"
	s = s .. "Nguyªn liÖu: DÞ Dung Th¹ch /<enter>"
	s = s .. "Ngò Hµnh Kú Th¹ch<enter><enter>"
	s = s .. "<color=green>BËc mÆt n¹ - liÖu ®Ó lªn bËc sau<color><enter>"
	s = s .. " 1 T©n Thñ          5 / 0<enter>"
	s = s .. " 2 S¬ NhËp         15 / 0<enter>"
	s = s .. " 3 Tinh Anh        20 / 0<enter>"
	s = s .. " 4 §¹i Thµnh       60 / 0<enter>"
	s = s .. " 5 Cao Thñ        120 / 0<enter>"
	s = s .. " 6 T«ng S­        220 / 0<enter>"
	s = s .. " 7 §¹i T«ng S­    360 / 1<enter>"
	s = s .. " 8 TruyÒn ThuyÕt  500 / 2<enter>"
	s = s .. " 9 ChÝ T«n        700 / 4<enter>"
	s = s .. "10 <color=yellow>V« Song<color> - tét ®Ønh<enter>"
	CreateNewSayEx(s, {{"Xem ®­êng kh¸c", TDT_HuongDan}, {"§ñ råi", TDT_KetThuc}})
end

function TDT_HD_BatHoang()
	local s = "<color=yellow>B¸t Hoang T©m Ph¸p<color><enter>"
	s = s .. "GiÕt qu¸i <color=green>®óng d¶i cÊp<color> th× t©m<enter>"
	s = s .. "ph¸p tù lªn cÊp. KÞch cÊp th× vÒ<enter>"
	s = s .. "gÆp ta ®Ó t«n th¨ng c¶nh giíi.<enter><enter>"
	s = s .. "<color=green>C¶nh giíi - cÊp tèi ®a - d¶i qu¸i<color><enter>"
	s = s .. "C¶nh giíi 1    cÊp 10    qu¸i  10-39<enter>"
	s = s .. "C¶nh giíi 2    cÊp 20    qu¸i  40-69<enter>"
	s = s .. "C¶nh giíi 3    cÊp 30    qu¸i  70-99<enter>"
	s = s .. "C¶nh giíi 4    cÊp 40    qu¸i 100-129<enter>"
	s = s .. "C¶nh giíi 5    cÊp 50    qu¸i 130-159<enter>"
	s = s .. "C¶nh giíi 6    cÊp 60    qu¸i 160-180<enter><enter>"
	s = s .. "<color=green>M¸u T­¬i cÇn ®Ó t«n th¨ng<color><enter>"
	
	CreateNewSayEx(s, {{"Xem ®­êng kh¸c", TDT_HuongDan}, {"§ñ råi", TDT_KetThuc}})
end

