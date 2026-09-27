-- ==========================================
-- SCRIPT SACH TAM PHAP TIEU VO TUONG CONG (ITEM 6-1-5164)
-- ==========================================
Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

TVO_CANHGIOI = 3410
TVO_LEVEL    = 3411
TVO_EXP      = 3412
TVO_AURA     = {1526, 1527, 1528, 1529, 1530, 1531}

function TVO_NeedExp(nLevel)
	if nLevel < 10 then return 200 + (nLevel * 200) end
	if nLevel < 20 then return 1600 + (nLevel * 400) end
	if nLevel < 30 then return 3200 + (nLevel * 800) end
	if nLevel < 40 then return 6800 + (nLevel * 1200) end
	if nLevel < 50 then return 10000 + (nLevel * 2000) end
	if nLevel < 60 then return 16000 + (nLevel * 4000) end
	return 999999
end

function main(nItemIdx)
	local nCanhGioi = GetTask(TVO_CANHGIOI)
	if nCanhGioi == 0 then nCanhGioi = 1 end

	local nLevel = GetTask(TVO_LEVEL)
	if nLevel == 0 then nLevel = 1 end

	local nExp = GetTask(TVO_EXP)
	local nMaxLevel = nCanhGioi * 10

	local nNeedExp = 999999
	if nLevel < nMaxLevel then
		nNeedExp = TVO_NeedExp(nLevel)
	end

	local nSpeed = floor(nLevel * 100 / 60)

	local szWarning = ""
	if nLevel >= nMaxLevel then
		szWarning = "\n<color=red>Chó ý: §¹t cÊp tèi ®a ph¶i gÆp Tiªu Dao Tö ®Ó TÊn Th¨ng!<color>"
	else
		szWarning = "\n<color=gray>Tr¹ng th¸i: ®ang tu luyÖn...<color>"
	end

	local szTitle =
		"C¶nh giíi: <color=yellow>Thø " .. nCanhGioi .. "<color> - CÊp ®é: <color=yellow>" .. nLevel .. " / " .. nMaxLevel .. "<color>\n" ..
		"TiÕn ®é: <color=green>" .. nExp .. "<color> / <color=green>" .. nNeedExp .. "<color>\n" ..
		"Tèc ®é ®¸nh vµ xuÊt chiªu: <color=cyan>+" .. nSpeed .. "%<color>\n" ..
		"Kh¾c ph¶n ®ßn: <color=cyan>+" .. nLevel .. "%<color>" .. szWarning

	local tbOpt = {
		{"KÝch ho¹t t©m ph¸p", KichHoatTieuVo},
		{"Tho¸t"}
	}

	CreateNewSayEx(szTitle, tbOpt)
	return 1
end

function KichHoatTieuVo()
	local nCanhGioi = GetTask(TVO_CANHGIOI)
	local nLevel = GetTask(TVO_LEVEL)

	if nCanhGioi == 0 then
		SetTask(TVO_CANHGIOI, 1)
		nCanhGioi = 1
	end

	if nLevel == 0 then
		SetTask(TVO_LEVEL, 1)
		nLevel = 1
	end

	local nAuraID = TVO_AURA[nCanhGioi] or TVO_AURA[1]

	for i = 1, 6 do
		RemoveSkillState(TVO_AURA[i])
	end

	AddSkillState(nAuraID, nLevel, 1, 99999999, 1)
	Msg2Player("<color=yellow>KÝch ho¹t TiÓu V« T­íng C«ng cÊp " .. nLevel .. "!<color>")
end
