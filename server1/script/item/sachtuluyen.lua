-- ==========================================
-- SCRIPT SÁCH TÂM PHÁP BÁT HOANG (ITEM 6-1-5135)
-- ==========================================
Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

function main(nItemIdx)
	local nCanhGioi = GetTask(3400)
	if nCanhGioi == 0 then nCanhGioi = 1 end
	
	local nLevel = GetTask(3401)
	if nLevel == 0 then nLevel = 1 end
	
	local nExp = GetTask(3402)
	
	local nMaxLevel = nCanhGioi * 10
	local nNeedExp = 999999 
	
	if nLevel < nMaxLevel then
		if nLevel < 10 then nNeedExp = 50 + (nLevel * 50)
		elseif nLevel < 20 then nNeedExp = 400 + (nLevel * 100)
		elseif nLevel < 30 then nNeedExp = 800 + (nLevel * 200)
		elseif nLevel < 40 then nNeedExp = 1700 + (nLevel * 300)
		elseif nLevel < 50 then nNeedExp = 2500 + (nLevel * 500)
		elseif nLevel < 60 then nNeedExp = 4000 + (nLevel * 1000)
		end
	end
	
	local nStat = nLevel * 3
	
	-- Tính Bonus EXP bám theo C?nh Gi?i
	local tbExpRate = {100, 200, 300, 400, 500, 600} 
	local nExpRate = tbExpRate[nCanhGioi] or 100
	
	-- Tính Kháng tính t?i da (Ch? hi?n th? ch? ? CG 5 và 6)
	local szMaxResist = ""
	if nCanhGioi == 5 then
		szMaxResist = "Kh¸ng tÝnh tèi ®a: <color=cyan>+5%<color>\n"
	elseif nCanhGioi == 6 then
		szMaxResist = "Kh¸ng tÝnh tèi ®a: <color=cyan>+10%<color>\n"
	end
	
	local szTitle = 
		"C¶nh giíi: <color=yellow>Thø " .. nCanhGioi .. "<color> - CÊp ®é: <color=yellow>" .. nLevel .. " / " .. nMaxLevel .. "<color>\n" ..
		"TiÕn ®é: <color=green>" .. nExp .. "<color> / <color=green>" .. nNeedExp .. "<color>\n" ..
		"Søc m¹nh/Th©n ph¸p/Sinh khÝ/Néi c«ng: <color=cyan>+" .. nStat .. "<color>\n" ..
		"Tû lÖ kinh nghiÖm: <color=cyan>+" .. nExpRate .. "%<color>\n" ..
		szMaxResist .. "\n" ..
		"<color=red>Chó ý: §¹t cÊp tèi ®a ph¶i gÆp Tiªu Dao Tö ®Ó TÊn Th¨ng!<color>"

	local tbOpt = {
		{"KÝch ho¹t t©m ph¸p", KichHoatTamPhap},
		{"Tho¸t"} 
	}

	CreateNewSayEx(szTitle, tbOpt)
	return 1
end

function KichHoatTamPhap()
	local nCanhGioi = GetTask(3400)
	local nLevel = GetTask(3401)
	
	if nCanhGioi == 0 then SetTask(3400, 1) nCanhGioi = 1 end
	if nLevel == 0 then SetTask(3401, 1) nLevel = 1 end
	
	-- Khai báo m?ng 6 ID vòng sáng
	local tbAura = {1508, 1509, 1510, 1511, 1512, 1513}
	local nAuraID = tbAura[nCanhGioi] or 1508
	
	-- Xóa t?t c? các vòng sáng cu d? ch?ng l?i hi?n th? dè hình ?nh
	for i = 1, 6 do
		RemoveSkillState(tbAura[i])
	end
	
	-- Kích ho?t vòng sáng hi?n t?i
	AddSkillState(nAuraID, nLevel, 1, 99999999, 1)
	Msg2Player("<color=yellow>KÝch ho¹t B¸t Hoang cÊp " .. nLevel .. "!<color>")
end