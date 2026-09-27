-- [23/09/2026] BANG GIA DUNG CHUNG cho ca hai Tui Can Khon.
-- Tui me (tuicankhon.lua) va Tui Thien Phuc (tuicankhon_tp.lua) cung Include file nay,
-- de chinh gia chi phai sua MOT noi.
-- TinhGiaItemTui(v) tra ve: so dong xanh, gia (luong).

-- Dinh dang tien: 12345 -> "1 Van 2345 Luong". Dung chung ca hai tui.
function FormatTien(nLuong)
	if nLuong >= 10000 then
		local nVan = floor(nLuong / 10000)
		local nLe = mod(nLuong, 10000)
		if nLe == 0 then return nVan .. " V¹n" else return nVan .. " V¹n " .. nLe .. " L­îng" end
	else
		return nLuong .. " L­îng"
	end
end

tbThuMuaTui = {
	[85]  = {"Sinh Lùc",100,10,200,50},
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

function TinhGiaItemTui(v)
	local nSoDongXanh = 0
	local nTongVan = 0

	for i = 1,6 do
		local nMagicId, nMagicValue = GetItemMagicAttrib(v, i)
		nMagicId = tonumber(nMagicId) or 0
		nMagicValue = tonumber(nMagicValue) or 0

		if nMagicId > 0 and nMagicValue > 0 then
			nSoDongXanh = nSoDongXanh + 1
			local tbCfg = tbThuMuaTui[nMagicId]
			if tbCfg then
				local nMinV = tbCfg[2]
				local nMinP = tbCfg[3]
				local nMaxV = tbCfg[4]
				local nMaxP = tbCfg[5]
				local nGia = 0
				
				if nMagicValue >= nMaxV then nGia = nMaxP
				elseif nMagicValue > nMinV then nGia = nMinP + (nMagicValue - nMinV) * (nMaxP - nMinP) / (nMaxV - nMinV) end
				
				if nGia > 0 then nTongVan = nTongVan + floor(nGia) end
			end
		end
	end

	local nTongTienLuong = 0
	if nSoDongXanh == 0 then nTongTienLuong = 100
	elseif nSoDongXanh == 1 then nTongTienLuong = 10000
	elseif nSoDongXanh == 2 then nTongTienLuong = 20000
	elseif nSoDongXanh == 3 then nTongTienLuong = 30000
	else nTongTienLuong = nTongVan * 10000 end

	return nSoDongXanh, nTongTienLuong
end
