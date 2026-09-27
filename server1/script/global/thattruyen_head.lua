-- Bo ky nang That Truyen - trao skill qua su phu mon phai
-- Dat tai: \script\global\thattruyen_head.lua
-- Chi trao skill chinh (tang 1). Cac tang con do engine tu goi qua event chain.
--
-- Luong chay:
--   tt_learn()    -> hien BANG DIEU KIEN (chi doc), co nut xac nhan neu du dieu kien
--   tt_do_learn() -> kiem tra lai TOAN BO, thu hoc phi roi trao BI KIP (khong trao
--                    skill truc tiep nua)
--   Nguoi choi doc bi kip -> \script\global\thattruyen_book.lua moi trao skill

TT_LEVEL_REQUIRE   = 110	-- cap do toi thieu
TT_SKILL_LEVEL     = 1		-- cap khoi diem cua skill That Truyen sau khi hoc
TT_ORIGIN_MAXLEVEL = 20		-- skill goc phai dat cap nay (MaxLevel goc deu = 20)

TT_TONGKIM_POINT = 15000	-- diem tich luy Tong Kim can co (GetTask 751)
TT_DATAU_COUNT   = 40		-- so nhiem vu Da Tau hoan thanh LIEN TUC trong ngay
TT_COST_TIENDONG = 50		-- hoc phi: tien dong
TT_COST_CASH     = 1000000	-- hoc phi: luong (100 van)

-- Task ID cua he thong co san (da doi chieu ma nguon server)
TT_TASKID_TONGKIM = 751		-- diem tich luy Tong Kim (BT_SetType2Task(1, 751))
TT_TASKID_DATAU   = 2064	-- DAILY_STREAK_TASKID trong seasonnpc.lua

-- Tien Dong la vat pham xep chong {4, 417, 1} trong TUI.
-- Dem bang CalcItemCount(3,...) va tru bang ConsumeItem(3,...) - mau lay tu
-- recoin_goldenequip.lua (code that dang chay voi CHINH item nay).
-- KHONG dung GetItemCountEx/ConsumeEquiproomItem: khong nhin thay tien dong trong tui.
TT_ITEM_TIENDONG_D = 417

-- Bi kip Vo hoc That Truyen: vat pham {6, 1, TT_BOOK_P}
-- PHAI khai bao trong settings/item/magicscript.txt (ca ban goc lan 000..004),
-- o CA server LAN client, voi cot script tro toi:
--     \script\global\thattruyen_book.lua
-- !! Truoc khi dung phai KIEM TRA ID nay con trong o ca hai phia.
TT_BOOK_P = 5141

-- "Bac Minh tam phap" - vat pham KHOA (khong co script). Khong co no trong hanh
-- trang thi doc bi kip That Truyen se KHONG hoc duoc, du da du moi dieu kien khac.
TT_KEY_P = 5142

-- index = GetLastFactionNumber()
-- moi dong: {SkillId That Truyen, SkillId goc phai max, ten goc de hien thi}
TT_SKILL_LIST =
{
	[0] = {	-- Thieu Lam
		{1245, 318, "§¹t Ma §é Giang"},
		{1256, 319, "Hoµnh T¶o Thiªn Qu©n"},
		{1255, 321, "V« T­íng Tr¶m"},
	},
	[1] = {	-- Thien Vuong
		{1275, 322, "Ph¸ Thiªn Tr¶m"},
		{1273, 325, "Truy Phong QuyÕt"},
		{1271, 323, "Truy Tinh Trôc NguyÖt"},
	},
	[2] = {	-- Duong Mon
		{1251, 302, "B¹o Vò Lª Hoa"},
		{1253, 342, "Cöu Cung Phi Tinh"},
		{1248, 339, "NhiÕp Hån NguyÖt ¶nh"},
	},
	[3] = {	-- Ngu Doc
		{1257, 355, "HuyÒn ¢m Tr¶m"},
		{1260, 353, "¢m Phong Thùc Cèt"},
	},
	[4] = {	-- Nga Mi
		{1227, 380, "Phong S­¬ng To¸i ¶nh"},
		{1230, 328, "Tam Nga Tø TuyÖt"},
	},
	[5] = {	-- Thuy Yen
		{1233, 336, "B¨ng Tung V« ¶nh"},
		{1235, 337, "B¨ng T©m Tiªn Tö"},
	},
	[6] = {	-- Cai Bang
		{1237, 357, "Phi Long T¹i Thiªn"},
		{1238, 359, "Thiªn H¹ V« CÈu"},
	},
	[7] = {	-- Thien Nhan
		{1224, 362, "Thiªn Ngo¹i L­u Tinh"},
		{1226, 361, "V©n Long KÝch"},
	},
	[8] = {	-- Vo Dang
		{1218, 365, "Thiªn §Þa V« Cùc"},
		{1221, 368, "Nh©n KiÕm Hîp NhÊt"},
	},
	[9] = {	-- Con Lon
		{1262, 375, "L«i §éng Cöu Thiªn"},
		{1266, 372, "Ng¹o TuyÕt Tiªu Phong"},
	},
}

-- Mot dong trong bang dieu kien.
-- Dau tick CO MAU: xanh = da dat, do = chua dat.
-- `Say` cat cut chuoi qua dai nen phai giu duoi ~585 byte; moi cap the mau ton
-- ~20 byte. Bang hien chi ~6 dong (~330 byte) nen con du cho. Neu sau nay bang
-- dai them ma bi cut duoi thi bo bot the mau la cach tiet kiem hieu qua nhat.
function tt_line(bOk, szLabel, szValue, szIndent)
	local szMark = "<color=red>[ ]<color>"
	if (bOk == 1) then szMark = "<color=green>[v]<color>" end
	if (szIndent == nil) then szIndent = "" end
	return "<enter>"..szIndent..szMark.." "..szLabel..": "..szValue
end

-- Doc trang thai hien tai cua nguoi choi
function tt_get_state()
	local t = {}
	t.faction  = GetLastFactionNumber()
	t.level    = GetLevel()
	t.tongkim  = tonumber(GetTask(TT_TASKID_TONGKIM)) or 0
	t.datau    = tonumber(GetTask(TT_TASKID_DATAU)) or 0
	t.tiendong = CalcItemCount(3, 4, TT_ITEM_TIENDONG_D, 1, -1)
	t.cash     = GetCash()
	return t
end

-- Dem trang thai tuyet ky ban mon.
-- Tra ve: so mon da san sang (goc max hoac da hoc TT), so mon da hoc TT,
--         so mon hoc duoc ngay bay gio
function tt_count_origin(tList)
	local nReady, nLearned, nCanLearn = 0, 0, 0
	for i = 1, getn(tList) do
		if (HaveMagic(tList[i][1]) ~= -1) then
			nLearned = nLearned + 1
			nReady   = nReady + 1
		elseif (HaveMagic(tList[i][2]) >= TT_ORIGIN_MAXLEVEL) then
			nReady    = nReady + 1
			nCanLearn = nCanLearn + 1
		end
	end
	return nReady, nLearned, nCanLearn
end

-- BANG DIEU KIEN
-- Giu that NGAN: khung hoi thoai `Say` co chieu cao han che, bang dai se day
-- phan lua chon ra ngoai khung va che mat nut bam. Chi tiet tuyet ky ban mon
-- tach sang man rieng `tt_detail`.
function tt_learn()

	local t = tt_get_state()

	if (t.faction < 0) or (t.faction > 9) then
		Say("Ng­¬i ch­a gia nhËp m«n ph¸i, ta kh«ng thÓ truyÒn thô ®­îc.", 0)
		return
	end

	local tList = TT_SKILL_LIST[t.faction]
	local nTotal = getn(tList)
	local nReady, nLearned, nCanLearn = tt_count_origin(tList)

	local bGate = 1

	-- 1. Cap do - dong DAU TIEN nen khong co <enter>, tranh mot dong trong thua
	local szMark = "<color=red>[ ]<color>"
	if (t.level >= TT_LEVEL_REQUIRE) then szMark = "<color=green>[v]<color>" else bGate = 0 end
	local szText = szMark.." CÊp ®é: "..t.level.."/"..TT_LEVEL_REQUIRE
	local bOk = 0

	-- 2. Diem tich luy Tong Kim
	bOk = 0
	if (t.tongkim >= TT_TONGKIM_POINT) then bOk = 1 else bGate = 0 end
	szText = szText..tt_line(bOk, "§iÓm Tèng Kim", t.tongkim.."/"..TT_TONGKIM_POINT)

	-- 3. Da Tau lien tuc trong ngay
	bOk = 0
	if (t.datau >= TT_DATAU_COUNT) then bOk = 1 else bGate = 0 end
	szText = szText..tt_line(bOk, "D· TÈu h«m nay", t.datau.."/"..TT_DATAU_COUNT)

	-- 4. Tuyet ky ban mon - chi hien tong ket 1 dong
	-- Tick xanh khi CO IT NHAT 1 mon hoc duoc ngay, vi co che 1-1 cho hoc tung phan.
	-- Neu chi tick khi du 3/3 thi nguoi choi tuong minh chua dat dieu kien.
	bOk = 0
	if (nReady >= nTotal) or (nCanLearn > 0) then bOk = 1 end
	szText = szText..tt_line(bOk, "TuyÖt kü bæn m«n", nReady.."/"..nTotal.." luyÖn thµnh")

	local bDone = 0
	if (nLearned >= nTotal) then bDone = 1 end

	-- 5. Hoc phi - gop 1 dong
	local bMoney = 1
	if (bDone == 1) then
		szText = szText..tt_line(1, "LÔ phÝ", "®· tr¶ xong")
	else
		if (t.tiendong < TT_COST_TIENDONG) then bMoney = 0 end
		if (t.cash < TT_COST_CASH) then bMoney = 0 end
		szText = szText..tt_line(bMoney, "LÔ phÝ",
			t.tiendong.."/"..TT_COST_TIENDONG.." T§, "
			..floor(t.cash/10000).."/"..floor(TT_COST_CASH/10000).." v¹n")
	end

	if (bDone == 1) then
		Say(szText.."<enter><color=green>§· l·nh héi trän vÑn c¶ bé.<color>",
			2, "Xem tuyÖt kü bæn m«n/tt_detail", "KÕt thóc ®èi tho¹i/tt_quit")
		return
	end

	-- Cho hoc khi: qua 3 dieu kien chung + du le phi + co it nhat 1 mon san sang.
	-- Khong doi max HET tuyet ky ban mon, vi co che 1-1 cho phep hoc tung phan.
	if (bGate == 1) and (bMoney == 1) and (nCanLearn > 0) then
		-- Le phi thu theo MOI LUOT hoc, khong theo tung mon. Con mon chua mo khoa
		-- thi bao de nguoi choi biet cho luyen xong roi hoc gop cho re.
		local szNote = ""
		if (nCanLearn < (nTotal - nLearned)) then
			szNote = " LuyÖn nèt råi xin mét lÇn sÏ rÎ h¬n."
		end
		Say(szText.."<enter><color=green>§ñ duyªn phËn, bÝ kÝp sÏ chÐp ®­îc "..nCanLearn.." m«n."
			..szNote.."<color>",
			3, "Xin s­ phô ban bÝ kÝp/tt_do_learn",
			   "Xem tuyÖt kü bæn m«n/tt_detail",
			   "§Ó ta chuÈn bÞ thªm/tt_quit")
	else
		Say(szText.."<enter><color=red>Cßn thiÕu ®iÒu kiÖn, ch­a thÓ truyÒn thô.<color>",
			2, "Xem tuyÖt kü bæn m«n/tt_detail", "KÕt thóc ®èi tho¹i/tt_quit")
	end

end

-- MAN CHI TIET: tung tuyet ky ban mon va cap hien tai
function tt_detail()

	local t = tt_get_state()
	if (t.faction < 0) or (t.faction > 9) then
		Say("Ng­¬i ch­a gia nhËp m«n ph¸i.", 0)
		return
	end

	local tList = TT_SKILL_LIST[t.faction]
	local szText = "TuyÖt kü bæn m«n ph¶i luyÖn ®Õn cÊp "..TT_ORIGIN_MAXLEVEL..":"

	for i = 1, getn(tList) do
		if (HaveMagic(tList[i][1]) ~= -1) then
			szText = szText..tt_line(1, tList[i][3], "®· häc")
		else
			local nLv = HaveMagic(tList[i][2])
			if (nLv < 0) then nLv = 0 end
			local bOk = 0
			if (nLv >= TT_ORIGIN_MAXLEVEL) then bOk = 1 end
			szText = szText..tt_line(bOk, tList[i][3], nLv.."/"..TT_ORIGIN_MAXLEVEL)
		end
	end

	Say(szText, 2, "Trë l¹i/tt_learn", "KÕt thóc ®èi tho¹i/tt_quit")

end

function tt_quit()
end

-- HOC THAT SU - kiem tra lai toan bo, khong tin ket qua man hinh truoc
function tt_do_learn()

	local t = tt_get_state()

	if (t.faction < 0) or (t.faction > 9) then
		Say("Ng­¬i ch­a gia nhËp m«n ph¸i, ta kh«ng thÓ truyÒn thô ®­îc.", 0)
		return
	end

	if (t.level < TT_LEVEL_REQUIRE) then
		Say("C¨n c¬ cña ng­¬i cßn non. H·y quay l¹i khi ®· ®¹t cÊp "..TT_LEVEL_REQUIRE..".", 0)
		return
	end

	if (t.tongkim < TT_TONGKIM_POINT) then
		Say("Ch­a tõng vµo sinh ra tö n¬i chiÕn trËn th× lÜnh héi sao ®­îc."
			.."<enter>§iÓm tÝch lòy Tèng Kim: <color=yellow>"..t.tongkim.."/"..TT_TONGKIM_POINT.."<color>", 0)
		return
	end

	if (t.datau < TT_DATAU_COUNT) then
		Say("RÌn luyÖn ch­a ®ñ. H·y ®i lµm viÖc cho D· TÈu thªm ®·."
			.."<enter>D· TÈu hoµn thµnh liªn tôc h«m nay: <color=yellow>"..t.datau.."/"..TT_DATAU_COUNT.."<color>"
			.."<enter><color=red>L­u ý: hñy nhiÖm vô gi÷a chõng sÏ mÊt hÕt sè ®Õm.<color>", 0)
		return
	end

	-- Duyet tung cap: chi hoc duoc khi skill goc da max
	local tList = TT_SKILL_LIST[t.faction]
	local tCanLearn = {}
	local nAlreadyHave = 0

	for i = 1, getn(tList) do
		if (HaveMagic(tList[i][1]) ~= -1) then
			nAlreadyHave = nAlreadyHave + 1
		else
			if (HaveMagic(tList[i][2]) >= TT_ORIGIN_MAXLEVEL) then
				tinsert(tCanLearn, tList[i][1])
			end
		end
	end

	if (getn(tCanLearn) == 0) then
		if (nAlreadyHave >= getn(tList)) then
			Say("Ng­¬i ®· lÜnh héi trän vÑn bé vâ häc thÊt truyÒn cña bæn m«n råi.", 0)
		else
			Say("TuyÖt kü bæn m«n ch­a luyÖn thµnh, kh«ng thÓ kÕ thõa vâ häc thÊt truyÒn.",
				1, "Xem l¹i ®iÒu kiÖn/tt_learn")
		end
		return
	end

	-- Da co bi kip chua doc thi khong cap them (tranh mat tien vo ich)
	if (CalcItemCount(3, 6, 1, TT_BOOK_P, -1) > 0) then
		Say("BÝ kÝp ta trao vÉn cßn trong tay ng­¬i. H·y ®äc nã tr­íc ®·.", 0)
		return
	end

	-- Tui phai con cho: het cho ma da tru tien thi nguoi choi mat trang
	if (CalcFreeItemCellCount() < 1) then
		Say("Hµnh trang cña ng­¬i ®· chËt. H·y dän lÊy mét « trèng råi quay l¹i.", 0)
		return
	end

	-- Hoc phi: kiem tra du CA HAI truoc khi tru bat cu thu gi
	if (t.tiendong < TT_COST_TIENDONG) then
		Say("LÔ nhËp m«n cÇn <color=yellow>"..TT_COST_TIENDONG.." TiÒn §ång<color>. Ng­¬i míi cã "
			..t.tiendong..".", 0)
		return
	end

	if (t.cash < TT_COST_CASH) then
		Say("LÔ nhËp m«n cÇn <color=yellow>"..floor(TT_COST_CASH/10000)
			.." v¹n l­îng<color>. Ng­¬i mang ch­a ®ñ.", 0)
		return
	end

	-- Thu hoc phi
	if (ConsumeItem(3, TT_COST_TIENDONG, 4, TT_ITEM_TIENDONG_D, 1, -1) ~= 1) then
		Msg2Player("<color=yellow>Thu TiÒn §ång thÊt b¹i, xin thö l¹i.<color>")
		WriteLog(GetLocalDate("%Y-%m-%d %X").."\t[ThatTruyen][LOI] Consume TienDong that bai"
			.."\tAccount:"..GetAccount().."\tName:"..GetName())
		return
	end
	Pay(TT_COST_CASH)

	-- Trao BI KIP (khong trao skill truc tiep nua).
	-- Skill se duoc trao khi nguoi choi doc bi kip - xem thattruyen_book.lua
	local idxBook = AddItem(6, 1, TT_BOOK_P, 1, 0, 0)
	if (idxBook == nil) or (idxBook < 0) then
		Msg2Player("<color=yellow>Trao bÝ kÝp thÊt b¹i, xin thö l¹i.<color>")
		WriteLog(GetLocalDate("%Y-%m-%d %X").."\t[ThatTruyen][LOI] AddItem bi kip that bai"
			.."\tAccount:"..GetAccount().."\tName:"..GetName())
		return
	end
	SetItemBindState(idxBook, -1)		-- khoa: khong giao dich/ban duoc

	WriteLog(GetLocalDate("%Y-%m-%d %X").."\t[ThatTruyen-Book]\tAccount:"..GetAccount()
		.."\tName:"..GetName().."\tFaction:"..t.faction
		.."\tSanSangHoc:"..getn(tCanLearn)
		.."\tTongKim:"..t.tongkim.."\tDaTau:"..t.datau
		.."\tPaid:"..TT_COST_TIENDONG.."TD+"..TT_COST_CASH.."L")

	Msg2Player("<color=yellow>Ng­¬i nhËn ®­îc BÝ kÝp Vâ häc ThÊt TruyÒn!<color>")
	Say("Bé vâ häc nµy thÊt truyÒn ®· l©u, ta chÐp l¹i thµnh bÝ kÝp trao cho ng­¬i."
		.."<enter>H·y tù m×nh nghiÒn ngÉm mµ lÜnh héi, chí phô lßng bæn m«n.", 0)

end

-- Giu lai cho tuong thich: mo bang dieu kien
function tt_info()
	tt_learn()
end
