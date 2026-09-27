Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")

-- ================= B?NG THU?NG BÓ HOA (GI? NGUYÊN) =================
tb_QuaBoHoa = {
	[1]  = {szName="Tö Thñy Tinh", tbProp={4, 239, 1, 1, 0, 0}, nRate=0},
	[2]  = {szName="Lam Thñy Tinh", tbProp={4, 238, 1, 1, 0, 0}, nRate=0},
	[3]  = {szName="Lôc Thñy Tinh", tbProp={4, 240, 1, 1, 0, 0}, nRate=0},
	[4]  = {szName="Tinh Hång B¶o Th¹ch", tbProp={4, 353, 1, 1, 0, 0}, nRate=0},
	[5]  = {szName="Hu©n C«ng Ch­¬ng", tbProp={6, 1, 5129, 1, 0, 0}, nRate=25},
	[6]  = {szName="C«ng Tr¹ng LÖnh", tbProp={6, 1, 5130, 1, 0, 0}, nRate=25},
	[7]  = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 3", tbProp={6, 1, 147, 3, 0, 0}, nRate=0},
	[8]  = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 4", tbProp={6, 1, 147, 4, 0, 0}, nRate=0},
	[9]  = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 5", tbProp={6, 1, 147, 5, 0, 0}, nRate=0},
	[10] = {szName="VËt phÈm ngÉu nhiªn 1", tbProp={6, 1, 33, 1, 0, 0}, nRate=0}, 
	[11] = {szName="VËt phÈm ngÉu nhiªn 2", tbProp={6, 1, 45, 1, 0, 0}, nRate=0}, 
	[12] = {szName="M¶nh trang bÞ Hoµng Kim", tbProp={6, 1, 5128, 1, 0, 0}, nRate=0},
	[13] = {szName="Phi Tèc Hoµn", tbProp={6, 0, 6, 1, 0, 0}, nRate=50},
	[14] = {szName="§¹i Lùc Hoµn", tbProp={6, 0, 3, 1, 0, 0}, nRate=50},
	[15] = {szName="Phóc Duyªn Lé (§¹i)", tbProp={6, 1, 124, 1, 0, 0}, nRate=25}
}

-- ================= B?NG THU?NG GI? HOA (51 ITEM TÁCH L? C? D?NH) =================
tb_QuaGioHoa = {
	[1]  = {szName="Kim Quang B¸t KÝnh Chi Méng", nQuality=1, tbProp={0, 197}, nRate = 0.02},
	[2]  = {szName="Kim Quang Nh· §iÓn Chi Hån", nQuality=1, tbProp={0, 202}, nRate = 0.02},
	[3]  = {szName="Thiªn S¬n TuyÕt Liªn", tbProp={6,1,1431,1,0,0}, nRate = 0.01},
	[4]  = {szName="Tö Thñy Tinh", tbProp = {4, 239, 1, 1, 0, 0}, nRate = 3},
	[5]  = {szName="Lam Thñy Tinh", tbProp = {4, 238, 1, 1, 0, 0}, nRate = 2},
	[6]  = {szName="Lôc Thñy Tinh", tbProp = {4, 240, 1, 1, 0, 0}, nRate = 2},
	[7]  = {szName="Tinh Hång B¶o Th¹ch", tbProp = {4, 353, 1, 1, 0, 0}, nRate = 1},
	[8]  = {szName="Hu©n C«ng Ch­¬ng", tbProp = {6, 1, 5129, 1, 0, 0}, nRate = 5},
	[9]  = {szName="C«ng Tr¹ng LÖnh", tbProp = {6, 1, 5130, 1, 0, 0}, nRate = 5},
	[10] = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 3", tbProp = {6, 1, 147, 3, 0, 0}, nRate = 20},
	[11] = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 4", tbProp = {6, 1, 147, 4, 0, 0}, nRate = 15},
	[12] = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 5", tbProp = {6, 1, 147, 5, 0, 0}, nRate = 10},
	[13] = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 6", tbProp = {6, 1, 147, 6, 0, 0}, nRate = 5},
	[14] = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 7", tbProp = {6, 1, 147, 7, 0, 0}, nRate = 0.1},
	[15] = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 8", tbProp = {6, 1, 147, 8, 0, 0}, nRate = 0.05},
	[16] = {szName="Phi Tèc Hoµn", tbProp = {6, 0, 6, 1, 0, 0}, nRate = 5},
	[17] = {szName="§¹i Lùc Hoµn", tbProp = {6, 0, 3, 1, 0, 0}, nRate = 5},
	[18] = {szName="Phóc Duyªn Lé (§¹i)", tbProp = {6, 1, 124, 1, 0, 0}, nRate = 5},
	[19] = {szName="Kim Quang TrÝch Tinh Hoµn", nQuality=1, tbProp={0, 194}, nRate = 0.02},
	[20] = {szName="Kim Quang §­êng Nghª Gi¸p", nQuality=1, tbProp={0, 195}, nRate = 0.02},
	[21] = {szName="Kim Quang Lôc Phi Thñy Háa ThÇn Phï", nQuality=1, tbProp={0, 196}, nRate = 0.02},
	[22] = {szName="Kim Quang B¹ch Kim Yªu §¸i", nQuality=1, tbProp={0, 198}, nRate = 0.02},
	[23] = {szName="Kim Quang Thiªn T©m Hé UyÓn", nQuality=1, tbProp={0, 199}, nRate = 0.02},
	[24] = {szName="Kim Quang Ngò S¾c Ngäc Béi", nQuality=1, tbProp={0, 200}, nRate = 0.02},
	[25] = {szName="Kim Quang Thiªn T©m Ngoa", nQuality=1, tbProp={0, 201}, nRate = 0.02},
	[26] = {szName="Vâ L©m MËt TÞch", tbProp={6, 1, 26, 1, 0, 0}, nRate = 0.5},
	[27] = {szName="TÈy Tñy Kinh", tbProp={6, 1, 22, 1, 0, 0}, nRate = 0.5},
	[28] = {szName="Cèng NguyÖt Qu¶ Dung", tbProp={6, 1, 128, 1, 0, 0}, nRate = 0.5},
	[29] = {szName="Phông NguyÖt Qu¶ Dung", tbProp={6, 1, 127, 1, 0, 0}, nRate = 0.5},
	
	-- B? D?NG SÁT
	[30] = {szName="Trang bÞ §éng S¸t", nQuality=1, tbProp={0, 143}, nRate = 0.005},
	[31] = {szName="Trang bÞ §éng S¸t", nQuality=1, tbProp={0, 144}, nRate = 0.005},
	[32] = {szName="Trang bÞ §éng S¸t", nQuality=1, tbProp={0, 145}, nRate = 0.005},
	[33] = {szName="Trang bÞ §éng S¸t", nQuality=1, tbProp={0, 146}, nRate = 0.005},
	
	-- B? D?NH QU?C & AN BANG
	[34] = {szName="Trang bÞ §Þnh Quèc", nQuality=1, tbProp={0, 159}, nRate = 0.004},
	[35] = {szName="Trang bÞ §Þnh Quèc", nQuality=1, tbProp={0, 160}, nRate = 0.004},
	[36] = {szName="Trang bÞ §Þnh Quèc", nQuality=1, tbProp={0, 161}, nRate = 0.004},
	[37] = {szName="Trang bÞ §Þnh Quèc", nQuality=1, tbProp={0, 162}, nRate = 0.004},
	[38] = {szName="Trang bÞ §Þnh Quèc", nQuality=1, tbProp={0, 163}, nRate = 0.004},
	[39] = {szName="Trang bÞ An Bang", nQuality=1, tbProp={0, 164}, nRate = 0.004},
	[40] = {szName="Trang bÞ An Bang", nQuality=1, tbProp={0, 165}, nRate = 0.004},
	[41] = {szName="Trang bÞ An Bang", nQuality=1, tbProp={0, 166}, nRate = 0.004},
	[42] = {szName="Trang bÞ An Bang", nQuality=1, tbProp={0, 167}, nRate = 0.004},
	[43] = {szName="Trang bÞ An Bang", nQuality=1, tbProp={0, 168}, nRate = 0.004},
	
	-- B? NHU TÌNH & HI?P C?T
	[44] = {szName="Trang bÞ Nhu T×nh", nQuality=1, tbProp={0, 186}, nRate = 0.005},
	[45] = {szName="Trang bÞ Nhu T×nh", nQuality=1, tbProp={0, 187}, nRate = 0.005},
	[46] = {szName="Trang bÞ Nhu T×nh", nQuality=1, tbProp={0, 188}, nRate = 0.005},
	[47] = {szName="Trang bÞ Nhu T×nh", nQuality=1, tbProp={0, 189}, nRate = 0.005},
	[48] = {szName="Trang bÞ HiÖp Cèt", nQuality=1, tbProp={0, 190}, nRate = 0.005},
	[49] = {szName="Trang bÞ HiÖp Cèt", nQuality=1, tbProp={0, 191}, nRate = 0.005},
	[50] = {szName="Trang bÞ HiÖp Cèt", nQuality=1, tbProp={0, 192}, nRate = 0.005},
	[51] = {szName="Trang bÞ HiÖp Cèt", nQuality=1, tbProp={0, 193}, nRate = 0.005},
}

-- T? D?NG CHÈN 119 DÒNG HOÀNG KIM MÔN PHÁI (5314 -> 5432) CHO GI? HOA
local nIndex = 52
for nId = 5314, 5432 do
	tb_QuaGioHoa[nIndex] = {szName="Trang bÞ Hoµng Kim M«n Ph¸i", nQuality=1, tbProp={0, nId}, nRate = 0.00002}
	nIndex = nIndex + 1
end

function main()
	local nMonth = tonumber(GetLocalDate("%m"))
	if SKN_ThangMo(3) ~= 1 then   -- sua tu "nMonth ~= 5"
		CreateNewSayEx("<color=pink>Sø Gi¶ T×nh Yªu:<color>\nTh¸ng 3 ®· qua, c¸m ¬n t×nh c¶m cña c¸c vÞ!", {{"Tho¸t", KetThuc}})
		return 1
	end

	local szMsg = "<color=pink>Sø Gi¶ T×nh Yªu:<color>\nH·y trao nh÷ng bã hoa vµ giá hoa t­¬i th¾m nhÊt, ta sÏ tÆng l¹i cho b¹n kinh nghiÖm vµ sù may m¾n!"
	local tbOpt = {
		{"TÆng 1 Bã Hoa (3 tr EXP)", function() NopHoa(1, 1) end},
		{"TÆng 10 Bã Hoa", function() NopHoa(1, 10) end},
		{"TÆng 1 Giá Hoa (5 tr EXP)", function() NopHoa(2, 1) end},
		{"TÆng 10 Giá Hoa", function() NopHoa(2, 10) end},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function NopHoa(nType, nCount)
	local TSK_TONG_EXP = 1314
	local TSK_COUNT_BOHOA = 1317
	local TSK_NAM_EVENT = 1315
	local MAX_EXP = 1500000000
	local nYear = tonumber(GetLocalDate("%Y"))

	if GetTask(TSK_NAM_EVENT) ~= nYear then
		SetTask(TSK_TONG_EXP, 0) 
		SetTask(TSK_COUNT_BOHOA, 0) 
		SetTask(TSK_NAM_EVENT, nYear) 
	end

	local nExpDaNhan = GetTask(TSK_TONG_EXP)
	if nExpDaNhan >= MAX_EXP then
		Msg2Player("<color=red>Ng­êi ®· nhËn tèi ®a 1.5 Tû EXP trong th¸ng nµy!<color>") return
	end

	local nItemId, nExpPerItem, szTitle
	local nNeedSpace = nCount + 5
	
	if nType == 1 then
		nItemId = 5152
		nExpPerItem = 3000000
		szTitle = "Bã Hoa Hång"
	else
		nItemId = 5153
		nExpPerItem = 5000000
		szTitle = "Giá Hoa VÜnh Cöu"
	end

	if CalcFreeItemCellCount() < nNeedSpace then
		Msg2Player("Hµnh trang cÇn Ýt nhÊt " .. nNeedSpace .. " « trèng ®Ó nhËn th­ëng!") return
	end

	if CalcEquiproomItemCount(6, 1, nItemId, -1) < nCount then
		Msg2Player("Hµnh trang kh«ng cã ®ñ " .. nCount .. " " .. szTitle .. "!") return
	end

	local nTotalAdd = nExpPerItem * nCount
	if nExpDaNhan + nTotalAdd > MAX_EXP then
		Msg2Player("<color=red>Sè l­îng " .. szTitle .. " nµy sÏ v­ît qu¸ 1.5 Tû EXP. H·y gi¶m bít!<color>") return
	end

	ConsumeEquiproomItem(nCount, 6, 1, nItemId, -1)
	tl_addPlayerExp(nTotalAdd)
	SetTask(TSK_TONG_EXP, nExpDaNhan + nTotalAdd)
	
	local nOldCount = GetTask(TSK_COUNT_BOHOA)
	local nNewCount = nOldCount

	-- X? lý tr? thu?ng tách bi?t cho 2 lo?i hoa
	for i = 1, nCount do
		if nType == 1 then
			nNewCount = nNewCount + 1
			-- Bó Hoa v?n dùng b?ng cu, sinh random ? v? trí 10 và 11
			tb_QuaBoHoa[10].tbProp[3] = random(33, 43)
			tb_QuaBoHoa[11].tbProp[3] = random(45, 62)
			tbAwardTemplet:GiveAwardByList(tb_QuaBoHoa, szTitle)
		else
			-- Gi? Hoa b?c ph?n thu?ng t? b?ng m?i tb_QuaGioHoa
			tbAwardTemplet:GiveAwardByList(tb_QuaGioHoa, szTitle)
		end
	end

	-- X? lý thu?ng m?c 100 Bó Hoa (Ch? tính cho Lo?i 1)
	if nType == 1 then
		SetTask(TSK_COUNT_BOHOA, nNewCount)
		local nMilestone100 = floor(nNewCount / 100) - floor(nOldCount / 100)
		if nMilestone100 > 0 then
			for m = 1, nMilestone100 do
				AddItem(6, 1, 5128, 1, 0, 0)
				Msg2Player("<color=yellow>Chóc mõng! §¹t mèc 100 Bã Hoa, nhËn 1 M¶nh Hoµng Kim!<color>")
			end
		end
	end
	
	Msg2Player("<color=pink>TÆng thµnh c«ng " .. nCount .. " " .. szTitle .. ", nhËn ®­îc " .. (nTotalAdd/10000) .. " v¹n Kinh NghiÖm!<color>")
end

function KetThuc() end