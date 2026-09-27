Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\task\\task_addplayerexp.lua")

-- ==========================================
-- C?U HÌNH TASK ID
-- ==========================================
TASK_DATE      = 3101 -- L­u ngµy thùc hiÖn
TASK_CHAOCO    = 3102 -- L­u tr¹ng th¸i Chµo Cê
TASK_HACO      = 3103 -- L­u tr¹ng th¸i H¹ Cê
TASK_TICH_LUY  = 3104 -- L­u chuçi ngµy c«ng dån
TASK_DIEM_NGAY = 3105 -- Thanh tiÕn ®é N¨ng §éng
TASK_NHAN_100  = 3106 -- Tr¹ng th¸i nhËn quµ mèc 100 ®iÓm
TASK_NHAN_50   = 3107 -- Tr¹ng th¸i nhËn quµ mèc 50 ®iÓm

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	local nLastDate = GetTask(TASK_DATE)

	if nDate ~= nLastDate then
		SetTask(TASK_DATE, nDate)
		SetTask(TASK_CHAOCO, 0)
		SetTask(TASK_HACO, 0)
		SetTask(TASK_DIEM_NGAY, 0)
		SetTask(TASK_NHAN_100, 0)
		SetTask(TASK_NHAN_50, 0)
	end
	
	local nDayCount = GetTask(TASK_TICH_LUY)
	local nDiem = GetTask(TASK_DIEM_NGAY)

	Say(
		"Ho¹t ®éng mçi ngµy - TÝch lòy N¨ng §éng:\n" ..
		"- Chµo Cê/H¹ Cê: <color=green>+20 ®iÓm<color>\n" ..
		"- D· TÈu (1 Q): <color=green>+1 ®iÓm<color>\n" ..
		"- S¸t Thñ (1 Boss): <color=green>+2 ®iÓm<color>\n\n" ..
		"Sè ngµy ®· c«ng dån hiÖn t¹i: <color=green>"..nDayCount.." ngµy<color>.\n" ..
		"TiÕn ®é N¨ng §éng h«m nay: <color=pink>"..nDiem.."/100 ®iÓm<color>.\n" ..
		"<color=yellow>Chµo Cê<color> tr­íc 12h  |  <color=yellow>H¹ Cê<color> sau 18h",
		5,
		"Thùc hiÖn Chµo Cê (S¸ng)/chao_co",
		"Thùc hiÖn H¹ Cê (Tèi)/ha_co",
		"NhËn quµ N¨ng §éng (50 ®iÓm)/nhan_thuong_50",
		"NhËn quµ N¨ng §éng (100 ®iÓm)/nhan_thuong_100",
		"KÕt thóc/no"
	)
end

-- ==========================================
-- CH?C NANG 1: CHÀO C? (SÁNG)
-- ==========================================
function chao_co()
	local nHour = tonumber(GetLocalDate("%H"))
	
	if nHour >= 12 then
		Say("§· qu¸ giê Chµo Cê! Nghi thøc chØ diÔn ra <color=yellow>tr­íc 12h00 tr­a<color> mçi ngµy.", 0)
		return
	end

	if GetTask(TASK_CHAOCO) == 1 then
		Say("S¸ng nay ng­¬i ®· thùc hiÖn Chµo Cê råi, h·y quay l¹i H¹ Cê vµo chiÒu tèi.", 0)
		return
	end

	SetTask(TASK_DIEM_NGAY, GetTask(TASK_DIEM_NGAY) + 20)
	nhan_thuong("Chµo Cê")
	SetTask(TASK_CHAOCO, 1)
end

-- ==========================================
-- CH?C NANG 2: H? C? (T?I)
-- ==========================================
function ha_co()
	local nHour = tonumber(GetLocalDate("%H"))
	
	if nHour < 18 then
		Say("Ch­a ®Õn giê H¹ Cê! Nghi thøc chØ ®­îc thùc hiÖn <color=yellow>sau 18h00 tèi<color>.", 0)
		return
	end

	if GetTask(TASK_HACO) == 1 then
		Say("Tèi nay ng­¬i ®· thùc hiÖn H¹ Cê råi, nghØ ng¬i sím ®i!", 0)
		return
	end

	SetTask(TASK_DIEM_NGAY, GetTask(TASK_DIEM_NGAY) + 20)
	nhan_thuong("H¹ Cê")
	SetTask(TASK_HACO, 1)
end

-- ==========================================
-- CH?C NANG 3: NH?N QUÀ 50 DI?M
-- ==========================================
function nhan_thuong_50()
	if GetTask(TASK_DIEM_NGAY) < 50 then
		Say("Ng­¬i ch­a tÝch ®ñ 50 ®iÓm N¨ng §éng! H·y lµm thªm D· TÈu hoÆc S¸t thñ ®Ó tÝch lòy.", 0)
		return
	end

	if GetTask(TASK_NHAN_50) == 1 then
		Say("Ng­¬i ®· nhËn phÇn th­ëng N¨ng §éng mèc 50 ®iÓm cña h«m nay råi!", 0)
		return
	end

	if CalcFreeItemCellCount() < 2 then
		Say("Hµnh trang cÇn Ýt nhÊt 2 « trèng ®Ó nhËn TiÒn §ång!", 0)
		return
	end

	tl_addPlayerExp(300000)
	for i = 1, 2 do
		AddItem(4, 417, 1, 1, 0, 0)
	end

	SetTask(TASK_NHAN_50, 1)
	Msg2Player("<color=yellow>NhËn th­ëng N¨ng §éng thµnh c«ng! B¹n nhËn ®­îc 3 triÖu EXP vµ 2 TiÒn §ång.<color>")
end

-- ==========================================
-- CH?C NANG 4: NH?N QUÀ 100 DI?M
-- ==========================================
function nhan_thuong_100()
	if GetTask(TASK_DIEM_NGAY) < 100 then
		Say("Ng­¬i ch­a tÝch ®ñ 100 ®iÓm N¨ng §éng! H·y lµm thªm D· TÈu hoÆc S¸t thñ ®Ó tÝch lòy.", 0)
		return
	end

	if GetTask(TASK_NHAN_100) == 1 then
		Say("Ng­¬i ®· nhËn phÇn th­ëng N¨ng §éng mèc 100 ®iÓm cña h«m nay råi!", 0)
		return
	end

	if CalcFreeItemCellCount() < 3 then
		Say("Hµnh trang cÇn Ýt nhÊt 3 « trèng ®Ó nhËn TiÒn §ång!", 0)
		return
	end

	tl_addPlayerExp(300000)
	for i = 1, 3 do
		AddItem(4, 417, 1, 1, 0, 0)
	end

	SetTask(TASK_NHAN_100, 1)
	Msg2Player("<color=yellow>NhËn th­ëng N¨ng §éng thµnh c«ng! B¹n nhËn ®­îc 7 triÖu EXP vµ 3 TiÒn §ång.<color>")
end

-- ==========================================
-- HÀM X? LÝ PH?N THU?NG C?NG D?N THEO NGÀY
-- ==========================================
function nhan_thuong(szLoaiNghiThuc)
	local nDayCount = GetTask(TASK_TICH_LUY)

	if GetTask(TASK_CHAOCO) == 0 and GetTask(TASK_HACO) == 0 then
		nDayCount = nDayCount + 1
		if nDayCount > 7 then
			nDayCount = 1 
		end
		SetTask(TASK_TICH_LUY, nDayCount)
	end

	local nExp = 0
	if nDayCount == 1 then nExp = 200000   
	elseif nDayCount == 2 then nExp = 200000   
	elseif nDayCount == 3 then nExp = 200000   
	elseif nDayCount == 4 then nExp = 200000   
	elseif nDayCount == 5 then nExp = 200000   
	elseif nDayCount == 6 then nExp = 200000  
	elseif nDayCount >= 7 then nExp = 200000  
	end

	tl_addPlayerExp(nExp)
	
	Msg2Player("Thùc hiÖn <color=yellow>" .. szLoaiNghiThuc .. "<color> thµnh c«ng! N¨ng ®éng +20.")
	Msg2Player("Ngµy tham gia c«ng dån thø <color=green>"..nDayCount.."<color>. B¹n nhËn ®­îc <color=yellow>" .. nExp .. " EXP<color>.")
end

function no()
end