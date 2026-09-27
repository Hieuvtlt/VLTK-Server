-- ============================================================
-- T¨ng Nh©n BÝ Èn - Thu Mua ®å xanh
-- ============================================================
Include("\\script\\lib\\common.lua")
IncludeLib("ITEM")
IncludeLib("FILESYS");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\global\\judgeoffline.lua")
Include("\\settings\\trigger_challengeoftime.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

Include("\\script\\global\\autoexec_head.lua")		-- Thªm NPC

-- ============================================================
-- Hµm giíi tÝnh
-- ============================================================

function gioitinh()

	if GetSex() == 1 then
		return "N÷ HiÖp"
	end

	return "§¹i HiÖp"

end

-- ============================================================
-- CÊu h×nh gi¸ thu mua
-- Tªn, Gi¸ TrÞ Min, Gi¸ TiÒn Min, Gi¸ TrÞ Max, Gi¸ TiÒn Max
-- ============================================================

tbThuMua = {

	[85]  = {"Sinh Lùc",100,10,200,50},	-- Thuéc Tinh, Gi¸ TrÞ Min, Gi¸ TiÒn MIn - V¹n, Gi¸ TrÞ Max, Gi¸ TiÒn Max V¹n
	[89]  = {"Néi Lùc",100,10,200,50},
	[88]  = {"Phôc Håi Sinh Lùc",1,5,10,20},
	[92]  = {"Phôc Håi Néi Lùc",1,5,10,20},
	[97]  = {"Søc M¹nh",1,5,20,20},
	[98]  = {"Th©n Ph¸p",1,5,20,20},
	[99]  = {"Sinh KhÝ",1,5,20,20},

	[101] = {"Kh¸ng §éc",15,50,25,100},
	[102] = {"Kh¸ng Háa",15,50,25,100},
	[103] = {"Kh¸ng L«i",20,50,30,150},
	[104] = {"Phßng Thñ VËt Lý",10,50,25,150},
	[105] = {"Kh¸ng B¨ng",10,50,25,100},

	[106] = {"Thêi Gian Lµm ChËm",30,20,40,100},
	[108] = {"Thêi Gian Tróng §éc",30,20,40,100},
	[110] = {"Thêi Gian Cho¸ng",30,20,40,100},

	[114] = {"Kh¸ng TÊt C¶",1,10,20,300},

	[139] = {"Kü N¨ng Vèn Cã",1,500,2,1000},

	[136] = {"Hót Sinh Lùc",1,50,10,300},
	[137] = {"Hót Néi Lùc",1,50,10,300},

	[111] = {"Tèc §é Di ChuyÓn",20,50,40,150},
	[113] = {"Thêi Gian Phôc Håi",30,50,40,150},

	[116] = {"Tèc §é §¸nh Néi C«ng",10,10,30,200},
	[115] = {"Tèc §é §¸nh Ngo¹i C«ng",10,10,30,200},

	[135] = {"May M¾n",1,10,10,300},

	[126] = {"S¸t Th­¬ng VËt Lý %",50,20,100,150},
	[121] = {"S¸t Th­¬ng VËt Lý §iÓm",20,20,50,200},

	[125] = {"§éc S¸t Ngo¹i C«ng",20,20,50,200},
	[123] = {"B¨ng S¸t Ngo¹i C«ng",50,20,100,150},

	[134] = {"ChuyÓn Hãa S¸t Th­¬ng",5,20,10,50},

	[168] = {"S¸t Th­¬ng vËt lý néi c«ng",100,20,200,150},
	[169] = {"B¨ng S¸t Néi C«ng",100,20,200,200},
	[170] = {"Háa S¸t Néi C«ng",100,20,200,200},
	[171] = {"L«i S¸t Néi C«ng",100,20,200,200},
	[172] = {"§éc S¸t Néi C«ng",100,20,200,200},

}

-- ============================================================
-- File TXT trang bÞ
-- Mµu ngò hµnh
-- ============================================================

function ThuMua_GetItemFile(nDetail)

	if nDetail == 0 then return "\\settings\\item\\004\\meleeweapon.txt"
	end

	if nDetail == 1 then return "\\settings\\item\\004\\rangeweapon.txt"
	end

	if nDetail == 2 then return "\\settings\\item\\004\\armor.txt"
	end

	if nDetail == 3 then return "\\settings\\item\\004\\ring.txt"
	end

	if nDetail == 4 then return "\\settings\\item\\004\\amulet.txt"
	end

	if nDetail == 5 then return "\\settings\\item\\004\\boot.txt"
	end

	if nDetail == 6 then return "\\settings\\item\\004\\belt.txt"
	end

	if nDetail == 7 then return "\\settings\\item\\004\\helm.txt"
	end

	if nDetail == 8 then return "\\settings\\item\\004\\cuff.txt"
	end

	if nDetail == 9 then return "\\settings\\item\\004\\pendant.txt"
	end

	return ""

end

function ThuMua_GetNguHanh(nNguHanh)

	if nNguHanh == 0 then return "<color=yellow>Kim<color=white>"
	end

	if nNguHanh == 1 then return "<color=green>Méc<color=white>"
	end

	if nNguHanh == 2 then return "<color=blue>Thñy<color=white>"
	end

	if nNguHanh == 3 then return "<color=red>Háa<color=white>"
	end

	if nNguHanh == 4 then return "<color=gold>Thæ<color=white>"
	end

	return "<color=white>Kh«ng<color>"

end
-- ============================================================
-- CÊu h×nh hiÖn item Trang BÞ
-- ============================================================

function ThuMua_GetImage(nGenre,nDetail,nParticular,nLevel)

	local szFile = ThuMua_GetItemFile(nDetail)

	if szFile == "" then
		return ""
	end

	local szTable = "THUMUA_ITEM_TABLE"

	TabFile_UnLoad(szTable)

	if TabFile_Load(szFile,szTable) == 0 then
		return ""
	end

	local nTotalRow = TabFile_GetRowCount(szTable,"Ãû³Æ")

	if not nTotalRow or nTotalRow < 2 then
		TabFile_UnLoad(szTable)
		return ""
	end

	local szImage = ""

	for i = 2,nTotalRow do

		local nG = tonumber(TabFile_GetCell(szTable,i,"ItemGenre")) or -1
		local nD = tonumber(TabFile_GetCell(szTable,i,"DetailType")) or -1
		local nP = tonumber(TabFile_GetCell(szTable,i,"ParticularType")) or -1
		local nL = tonumber(TabFile_GetCell(szTable,i,"µÈ¼¶")) or -1

		if nG == nGenre and
		   nD == nDetail and
		   nP == nParticular and
		   nL == nLevel then

			szImage = TabFile_GetCell(szTable,i,"¶¯»­ÎÄ¼þÃû") or ""
			break
		end

	end

	TabFile_UnLoad(szTable)

	return szImage

end

-- ============================================================
-- TÝnh gi¸ 1 chØ sè
-- ============================================================

function ThuMua_TinhGiaChiSo(nMagicId,nMagicValue)

	local tbCfg = tbThuMua[nMagicId]

	if not tbCfg then
		return 0
	end

	local nMinValue = tbCfg[2]
	local nMinPrice = tbCfg[3]
	local nMaxValue = tbCfg[4]
	local nMaxPrice = tbCfg[5]

	if nMagicValue < nMinValue then
		return 0
	end

	if nMagicValue >= nMaxValue then
		return nMaxPrice
	end

	if nMaxValue <= nMinValue then
		return nMinPrice
	end

	local nGia = nMinPrice +
		(nMagicValue - nMinValue) *
		(nMaxPrice - nMinPrice) /
		(nMaxValue - nMinValue)

	return floor(nGia)

end


-- ============================================================
-- TÝnh toµn bé gi¸ Trang BÞ
-- ============================================================

function ThuMua_TinhGia(nItemIdx)

	local nSoDongXanh = 0
	local nTongVan = 0
	local tbChiTiet = {}

	for i = 1,6 do

		local nMagicId,nMagicValue = GetItemMagicAttrib(nItemIdx,i)

		nMagicId = tonumber(nMagicId) or 0
		nMagicValue = tonumber(nMagicValue) or 0

		if nMagicId > 0 and nMagicValue > 0 then

			nSoDongXanh = nSoDongXanh + 1

			local tbCfg = tbThuMua[nMagicId]

			if tbCfg then

				local nGia = ThuMua_TinhGiaChiSo(nMagicId,nMagicValue)

				if nGia > 0 then

					tinsert(tbChiTiet,{
						nMagicId = nMagicId,
						szName = tbCfg[1],
						nValue = nMagicValue,
						nGia = nGia,
					})

					nTongVan = nTongVan + nGia

				end
			end
		end
	end

	return nSoDongXanh,nTongVan,tbChiTiet

end

-- ============================================================
-- Giao diÖn NPC
-- ============================================================
function main()


	local szTitle =
		"<npc><enter>"..
		"A Di §µ PhËt !!!<enter>"..
		"Xin Chµo "..gioitinh().." ! BÇn T¨ng chuyªn thu mua Trang BÞ Xanh "

	local tbOpt = {

		{"Ta muèn B¸n Trang BÞ",ThuMuaDoXanh},

		{"KÕt thóc ®èi tho¹i.",no},

	}

	CreateNewSayEx(szTitle,tbOpt)

	return 1

end

-- ============================================================
-- §Æt Trang BÞ vµo khung thu mua
-- ============================================================

function ThuMuaDoXanh()

	GiveItemUI(
		"Thu Mua §å Xanh",
		"§Æt 1 mãn trang bÞ xanh cÇn b¸n vµo ®©y.<enter>"..
		"Yªu cÇu: Trang bÞ ph¶i cã Ýt nhÊt 4 dßng .",
		"ThuMuaDoXanh1"
	)

end

-- ============================================================
-- HiÖn thÞ Trang BÞ
-- ============================================================
function ThuMuaDoXanh1(nCount)

	if nCount ~= 1 then
		Say("BÇn T¨ng chØ thu mua ®óng <color=yellow>1 mãn trang bÞ<color=white> mçi lÇn.",0)

		return
	end

	local nItemIdx = GetGiveItemUnit(1)

	if not nItemIdx or nItemIdx <= 0 then
		Say("Kh«ng t×m thÊy trang bÞ.",0)

		return
	end

	-- ========================================================
	-- TÝnh gi¸ Trang BÞ
	-- ========================================================
	local nSoDongXanh,nTongVan,tbChiTiet =
		ThuMua_TinhGia(nItemIdx)

	if nSoDongXanh < 4 then

		Say(
			"Trang bÞ nµy chØ cã <color=red>"..
			nSoDongXanh..
			" dßng<color=white>.<enter><enter>"..
			"BÇn T¨ng chØ thu mua trang bÞ cã Ýt nhÊt <color=yellow>4 dßng<color=white>.",
			0)

		return
	end

	if nTongVan <= 0 then

		Say(
			"A Di §µ PhËt !!!<enter>"..
			"Trang bÞ nµy cïi qu¸, Ng­¬i vøt ®i lµ ®­îc !<enter>"..
			"ThiÖn Tai, ThiÖn Tai !!!",
			0
		)

		return
	end

	-- ========================================================
	-- LÊy th«ng tin Item
	-- ========================================================

	local nGenre,nDetail,nParticular,nLevel,nNguHanh,nLuck =
		GetItemProp(nItemIdx)

	-- ========================================================
	-- LÊy h×nh Item
	-- ========================================================

	local szImage =
		ThuMua_GetImage(
			nGenre,
			nDetail,
			nParticular,
			nLevel
		)

	-- ========================================================
	-- LÊy Ngò Hµnh
	-- ========================================================
	local szNguHanh = ThuMua_GetNguHanh(nNguHanh)

	--========================================================
	-- HiÖn thÞ th«ng tin Item
	-- ========================================================
	local szMsg = ""
	
	-- H×nh Item
	if szImage and szImage ~= "" then
		szMsg = szMsg.."<#><link=image[0,0]:"..szImage..">"

	end

	-- Tªn + CÊp + Ngò Hµnh
	szMsg = szMsg..
		"<color=white>Trang BÞ :<enter>".."<color=green>"..GetItemName(nItemIdx).."<color=white>".." | CÊp: <color=green>"..nLevel.."<color=white>".." | Ngò Hµnh: "..szNguHanh.."<enter><enter>"

	-- ========================================================
	-- Th«ng tin Thuéc TÝnh
	-- ========================================================

	szMsg = szMsg..
		"<color=white>"..
		"A Di §µ PhËt !!! "..
		"BÇn T¨ng ®· xem qua råi !<enter>"..
		"Trang bÞ nµy cã <color=green>"..
		getn(tbChiTiet)..
		"<color=white> Thuéc TÝnh ®¸ng ®Ó BÇn T¨ng ra gi¸ :<enter>"

	-- ========================================================
	-- HiÖn 6 dßng Opt
	-- ========================================================
	for i = 1,getn(tbChiTiet) do

		local tb = tbChiTiet[i]

		szMsg = szMsg..
			"<color=white> - "..
			tb.szName..
			" : <color=yellow>"..
			tb.nValue..
			"<color=white> - Gi¸ <color=green>"..
			tb.nGia..
			"<color=white> V¹n<enter>"

	end

	-- ========================================================
	-- Gi¸ thu mua
	-- ========================================================
	szMsg = szMsg..
		"<enter>"..
		"<color=white>"..
		"<pic=135> - Gi¸ thu mua: "..
		"<color=green>"..
		nTongVan..
		" V¹n"..
		"<color=white><enter>"..
		gioitinh()..
		" muèn b¸n Trang BÞ nµy chø?"

	-- ========================================================
	-- L­u th«ng tin giao dÞch
	-- ========================================================

	ThuMuaDoXanh_ItemIdx = nItemIdx
	ThuMuaDoXanh_TongVan = nTongVan
	ThuMuaDoXanh_GiaBao = nTongVan
	ThuMuaDoXanh_GiaThuc = nTongVan
	ThuMuaDoXanh_BiLua = 0
	ThuMuaDoXanh_TraCao = 0

	-- ========================================================
	-- Lùa chän
	-- ========================================================

	local tbOpt = {

		{"§ång ý B¸n",ThuMuaDoXanh_XacNhan},
		{"MÆc C¶ Thªm Chót N÷a",ThuMuaDoXanh_MacCa},
		{"Hñy"},

	}
	
	CreateNewSayEx(szMsg,tbOpt)

end


-- ============================================================
-- MÆc c¶
-- Opt cµng thÊp -> cµng dÔ bÞ lõa
-- Opt cµng cao -> cµng khã bÞ lõa
-- Cã Kü N¨ng Vèn Cã -> kh«ng bÞ lõa
-- ============================================================

function ThuMuaDoXanh_MacCa()

	local nItemIdx = ThuMuaDoXanh_ItemIdx
	if not nItemIdx or nItemIdx <= 0 then
		Say("Trang bÞ kh«ng cßn tån t¹i.",0)

		return
	end


	local nSoDongXanh,nTongVan,tbChiTiet =
		ThuMua_TinhGia(nItemIdx)

	if nSoDongXanh < 4 then
		Say("Trang bÞ kh«ng cßn ®ñ 4 dßng.",0)

		return
	end

	if nTongVan <= 0 then
		Say("Trang bÞ kh«ng cßn gi¸ trÞ thu mua.",0)

		return
	end


	-- ========================================================
	-- KiÓm tra Kü N¨ng Vèn Cã
	-- ID 139 -> kh«ng bÞ lõa
	-- ========================================================

	local bCoKyNangVonCo = 0
	
	for i = 1,getn(tbChiTiet) do
		if tbChiTiet[i].nMagicId == 139 then
			bCoKyNangVonCo = 1

			break
		end

	end


	-- ========================================================
	-- TÝnh ®é ®Ñp cña Trang BÞ
	-- ========================================================

	local nTongDoDep = 0
	local nSoDongTinh = 0

	for i = 1,getn(tbChiTiet) do

	local tb = tbChiTiet[i]
	local tbCfg = tbThuMua[tb.nMagicId]

		if tbCfg then
		
	local nMinValue = tbCfg[2]
	local nMaxValue = tbCfg[4]

		if nMaxValue > nMinValue then

	local nDoDep =
			(tb.nValue - nMinValue) * 100 /
			(nMaxValue - nMinValue)

		if nDoDep < 0 then
				nDoDep = 0
		end

		if nDoDep > 100 then
				nDoDep = 100
		end
				nTongDoDep = nTongDoDep + nDoDep
				nSoDongTinh = nSoDongTinh + 1

			end
		end
	end


	local nDoDepTrungBinh = 0
	if nSoDongTinh > 0 then
	
		nDoDepTrungBinh =
			floor(nTongDoDep / nSoDongTinh)

	end


	-- ========================================================
	-- TØ lÖ bÞ lõa
	-- MIN = 50%
	-- MAX = 20%
	-- ========================================================

	local nTiLeLua =
		50 - floor(nDoDepTrungBinh * 30 / 100)

	if nTiLeLua < 20 then
		nTiLeLua = 20
	end

	if nTiLeLua > 50 then
		nTiLeLua = 50
	end

	-- ========================================================
	-- TØ lÖ tr¶ cao
	-- MIN = 25%
	-- MAX = 30%
	-- ========================================================

	local nTiLeTraCao =
		25 + floor(nDoDepTrungBinh * 5 / 100)

	if nTiLeTraCao < 25 then
		nTiLeTraCao = 25
	end

	if nTiLeTraCao > 30 then
		nTiLeTraCao = 30
	end

	-- ========================================================
	-- Cã Kü N¨ng Vèn Cã
	-- Kh«ng bÞ lõa
	-- Tr¶ cao 30%
	-- Gi÷ gi¸ 70%
	-- ========================================================

	if bCoKyNangVonCo == 1 then

		nTiLeLua = 0
		nTiLeTraCao = 30

	end

	-- ========================================================
	-- QuyÕt ®Þnh
	-- ========================================================

	local nRandom = random(1,100)
	
	local nGiaBao = nTongVan
	local nGiaThuc = nTongVan
	local nBiLua = 0
	local nTraCao = 0

	-- ========================================================
	-- BÞ lõa
	-- ========================================================

	if nRandom <= nTiLeLua then
		nBiLua = 1

	local nPhanTram = random(100,150)

		nGiaBao =
			floor(
				nTongVan *
				(100 + nPhanTram) /
				100
			)

		nGiaThuc = 5


	-- ========================================================
	-- Tr¶ gi¸ cao
	-- ========================================================

	elseif nRandom <= nTiLeLua + nTiLeTraCao then
		nTraCao = 1

	local nPhanTram = random(100,150)

		nGiaBao =
			floor(
				nTongVan *
				(100 + nPhanTram) /
				100
			)

		nGiaThuc = nGiaBao

	-- ========================================================
	-- Gi÷ nguyªn gi¸
	-- ========================================================
	else

		nGiaBao = nTongVan
		nGiaThuc = nTongVan

	end

	-- ========================================================
	-- L­u kÕt qu¶
	-- ========================================================
	ThuMuaDoXanh_GiaBao = nGiaBao
	ThuMuaDoXanh_GiaThuc = nGiaThuc
	ThuMuaDoXanh_BiLua = nBiLua
	ThuMuaDoXanh_TraCao = nTraCao

	local szMsg = ""

	-- ========================================================
	-- Gi÷ nguyªn gi¸
	-- ========================================================
	if nBiLua == 0 and nTraCao == 0 then
		szMsg =
			"<npc><enter>"..
			"BÇn T¨ng ®· xem kü mãn hµng nµy.<enter><enter>"..
			"<color=yellow>"..
			"BÇn T¨ng chØ cã thÓ thu mua ®­îc nh­ vËy."..
			"<color><enter><enter>"..
			"<pic=135> - Gi¸ cuèi cïng: <color=green>"..
			nGiaBao..
			" V¹n<color><enter><enter>"..
			gioitinh()..
			" cã muèn b¸n kh«ng?"

	-- ========================================================
	-- Tr¶ gi¸ cao
	-- ========================================================
	elseif nTraCao == 1 then
		szMsg =
			"<npc><enter>"..
			"BÇn T¨ng ®· xem kü mãn hµng nµy.<enter><enter>"..
			"<color=yellow>"..
			"BÇn T¨ng rÊt høng thó víi Trang BÞ nµy.<enter>"..
			"BÇn T¨ng sÏ tr¶ gi¸ cao cho "..gioitinh().." !"..
			"<color><enter><enter>"..
			"<pic=136> - Gi¸ cò: <color=yellow>"..
			nTongVan..
			" V¹n<color><enter>"..
			"<pic=135> - Gi¸ ta tr¶: <color=green>"..
			nGiaBao..
			" V¹n<color><enter><enter>"..
			gioitinh()..
			" cã muèn b¸n kh«ng?"

	-- ========================================================
	-- BÞ lõa
	-- ========================================================
	else
		szMsg =
			"<npc><enter>"..
			"BÇn T¨ng ®· xem kü mãn hµng nµy.<enter><enter>"..
			"<color=yellow>"..
			"BÇn T¨ng rÊt høng thó víi Trang BÞ nµy.<enter>"..
			"BÇn T¨ng sÏ tr¶ gi¸ cao cho "..gioitinh().." !"..
			"<color><enter><enter>"..
			"<pic=136> - Gi¸ cò: <color=yellow>"..nTongVan.." V¹n<color><enter>"..
			"<pic=135> - Gi¸ ta tr¶: <color=green>"..nGiaBao.." V¹n<color><enter><enter>"..gioitinh().." cã muèn b¸n kh«ng?"
	end


	local tbOpt = {
		{"§ång ý B¸n",ThuMuaDoXanh_XacNhan},
		{"TiÕp tôc tr¶ gi¸",ThuMuaDoXanh_MacCa},
		{"Hñy"},
	}

	CreateNewSayEx(szMsg,tbOpt)

end


-- ============================================================
-- Tho¹i khi bÞ lõa
-- ============================================================
function ThuMuaDoXanh_LayThoaiBiLua(nGiaThuc)
	local tbThoai = {

		"MÑ Vî ta ®ang mang thai,Ta cÇn tiÒn ®Ó ch¨m sãc bµ Êy, Ng­¬i cÇm t¹m "..nGiaThuc.." V¹n nµy ®i nhÐ<enter> ThiÖn Tai, ThiÖn Tai !!!",

		"A Di §µ PhËt !!! H«m nay BÇn T¨ng còng khã kh¨n l¾m, chØ cã thÓ ®­a ng­¬i "..nGiaThuc.." V¹n th«i.",

		"BÇn T¨ng còng nghÌo l¾m, trong tói chØ cßn ®óng "..nGiaThuc.." V¹n. Ng­¬i cÇm t¹m nhÐ.",

		"ThiÖn Tai, ThiÖn Tai !!! BÇn T¨ng võa hÕt tiÒn, chØ cßn "..nGiaThuc.." V¹n ®Ó mua Trang BÞ cña ng­¬i.",

		"¥? BÇn T¨ng tÝnh nhÇm µ? Th«i kÖ ®i, ng­¬i cÇm "..nGiaThuc.." V¹n nµy nhÐ.",

		"Ng­¬i ®õng nh×n BÇn T¨ng nh­ thÕ, BÇn T¨ng còng kh«ng biÕt tói tiÒn cña m×nh ë ®©u, hay lµ "..gioitinh().." cÇm t¹m "..nGiaThuc.." V¹n nµy nhÐ.",

		"å... h×nh nh­ BÇn T¨ng võa nh×n nhÇm mét ch÷ sè. Th«i, giao dÞch xong råi.",

		"A Di §µ PhËt !!! BÇn T¨ng kh«ng cè ý ®©u, chØ lµ tÝnh to¸n cña BÇn T¨ng h¬i... ®Æc biÖt.",

		"Ha ha ha... Ng­¬i tin BÇn T¨ng thËt sao?",

		"Ng­¬i tin ng­êi qu¸ ®Êy. A Di §µ PhËt !!!",

		"Ha ha... Trang BÞ ®· vµo tay BÇn T¨ng råi, giê ng­¬i míi nhËn ra µ?",

		"A Di §µ PhËt !!! §­êng ®­êng lµ mét §¹i HiÖp mµ l¹i dÔ tin ng­êi ®Õn thÕ.",

		"Ng­¬i ®õng buån. §©y lµ häc phÝ cho kinh nghiÖm giang hå.",

		"ThiÖn Tai, ThiÖn Tai !!! BÇn T¨ng võa kiÕm ®­îc mét mãn hµng hêi.",

		"Kh«ng ph¶i BÇn T¨ng lõa ng­¬i, lµ do ng­¬i nghe nhÇm gi¸ ®Êy chø.",

		"BÇn T¨ng ®· nãi gi¸ råi, ng­¬i tù nguyÖn b¸n mµ. §õng tr¸ch BÇn T¨ng.",

		"Ng­¬i nghe cho kü nhÐ, BÇn T¨ng nãi lµ tr¶ gi¸ cao... nh­ng cao bao nhiªu th× BÇn T¨ng ch­a nãi.",

		"§©y lµ giao dÞch thuËn mua võa b¸n. BÇn T¨ng cã Ðp ng­¬i ®©u?",

		"Ng­¬i ®· Ên §ång ý B¸n råi. B©y giê cã hái l¹i còng muén.",

		"A Di §µ PhËt !!! TiÒn tµi lµ vËt ngoµi th©n, ®õng qu¸ coi träng.",

		"PhËt d¹y ph¶i biÕt bu«ng bá. H«m nay ng­¬i nªn häc c¸ch bu«ng bá Trang BÞ nµy.",

		"TiÒn tµi kh«ng quan träng, quan träng lµ kinh nghiÖm. Ng­¬i võa cã thªm mét kinh nghiÖm.",

		"ThiÖn Tai, ThiÖn Tai !!! Cña c¶i lµ phï du, nh­ng Trang BÞ cña ng­¬i th× BÇn T¨ng xin nhËn.",

		"Ng­¬i cã vÎ kh«ng vui nhØ? BÇn T¨ng thÊy h«m nay m×nh may m¾n ghª.",

		"§õng tøc, ®õng tøc... tøc giËn còng kh«ng lÊy l¹i ®­îc Trang BÞ ®©u.",

		"Ng­¬i muèn ®¸nh BÇn T¨ng µ? BÇn T¨ng lµ ng­êi xuÊt gia ®Êy nhÐ.",

		"A Di §µ PhËt !!! LÇn sau ng­¬i nªn ®äc kü tr­íc khi Ên §ång ý.",

		"Th«i nµo, cÇm "..nGiaThuc.." V¹n råi rêi ®i. BÇn T¨ng cßn ph¶i tông kinh n÷a !<enter> A Di §µ PhËt ! ThiÖn tai, ThiÖn tai.",

		"Ng­¬i cÇm tiÒn ®i nhÐ. BÇn T¨ng xin phÐp gi÷ l¹i Trang BÞ.",

		"ThiÖn Tai, ThiÖn Tai !!! Giao dÞch ®· hoµn tÊt. Chóc ng­¬i lÇn sau may m¾n h¬n.",

	}

	local n = random(1,getn(tbThoai))

	return tbThoai[n]

end

-- ============================================================
-- X¸c nhËn b¸n
-- ============================================================
function ThuMuaDoXanh_XacNhan()

	local nItemIdx = ThuMuaDoXanh_ItemIdx
	local nGiaThuc = ThuMuaDoXanh_GiaThuc
	local nBiLua = ThuMuaDoXanh_BiLua


	if not nItemIdx or nItemIdx <= 0 then

		Say("Trang bÞ kh«ng cßn tån t¹i.",0)

		return
	end


	if not nGiaThuc or nGiaThuc <= 0 then

		Say("Kh«ng x¸c ®Þnh ®­îc gi¸ thu mua.",0)

		return
	end


	local nSoDongXanh =
		ThuMua_TinhGia(nItemIdx)


	if nSoDongXanh < 4 then
		Say("Trang bÞ kh«ng cßn ®ñ 4 dßng.",0)

		return
	end


	RemoveItemByIndex(nItemIdx)

	Earn(nGiaThuc * 10000)

	-- ========================================================
	-- Th«ng b¸o bÞ lõa
	-- ========================================================

	if nBiLua == 1 then

		Msg2Player(
			"<color=yellow>Ng­¬i ®· bÞ T¨ng Nh©n ThÇn BÝ lõa,H¾n nhÐt vµo tay ng­¬i "..
			nGiaThuc..
			" V¹n råi ch¹y ®i mÊt ! <color><enter>"..
			"LÇn sau Ng­¬i nhí cÈn thËn h¬n !"
			)
			
		Say(ThuMuaDoXanh_LayThoaiBiLua(nGiaThuc),0)

	else
		Msg2Player("Thu mua thµnh c«ng, "..gioitinh().." nhËn ®­îc <color=green>"..nGiaThuc.."<color> V¹n.")

	end

	-- ========================================================
	-- Xãa d÷ liÖu giao dÞch
	-- ========================================================
	ThuMuaDoXanh_ItemIdx = nil
	ThuMuaDoXanh_TongVan = nil
	ThuMuaDoXanh_GiaBao = nil
	ThuMuaDoXanh_GiaThuc = nil
	ThuMuaDoXanh_BiLua = nil
	ThuMuaDoXanh_TraCao = nil

end

-- ========================================================
-- ADD NPC
-- ========================================================

thumuadoxanh_npc = { 
	{71,78,1601,3227,"\\script\\global\\nobitaxd\\thumuadoxanh.lua","T¨ng Nh©n ThÇn BÝ"}, 
}

function add_allnpc_thumuadoxanh()
	add_npc_thumuadoxanh(thumuadoxanh_npc)
end

function add_npc_thumuadoxanh(Tab)
	for i = 1, getn(Tab) do 
		SId = SubWorldID2Idx(Tab[i][2]);
		if (SId >= 0) then
			npcindex = AddNpc(Tab[i][1], 1, SId, Tab[i][3] * 32, Tab[i][4] * 32, 1, Tab[i][6]);
			SetNpcScript(npcindex, Tab[i][5]);
			local ranTimer = random(5,10)		--NPC tù ®éng chat sau 5 - 10 gi©y
			SetNpcTimer(npcindex, ranTimer * 18)
		end;
	end	
end

AutoFunctions:Add(add_allnpc_thumuadoxanh)

function OnTimer(nNpcIndex,nTimeOut)
        local tab_Chat = {
            "<bclr=red><enter>A Di §µ PhËt ! BÇn T¨ng chuyªn thu mua ®å xanh ! <pic=05><color><bclr>",
			"<bclr=red><enter>ThÝ Chñ mang Trang BÞ tíi ®©y ta thu mua hÕt ! <pic=25><color><bclr>",
        }
        local ran = random(1,getn(tab_Chat))
        NpcChat(nNpcIndex,tab_Chat[ran])
        local ranTimer = random(10,20)		-- chê 10 - 20 gi©y míi chat tiÕp
        SetNpcTimer(nNpcIndex,ranTimer*18)
        SetNpcScript(nNpcIndex,"\\script\\global\\nobitaxd\\thumuadoxanh.lua")
end
