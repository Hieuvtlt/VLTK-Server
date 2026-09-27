-- ==========================================
-- SCRIPT SACH TAM PHAP BAC MINH CONG (ITEM 6-1-5163)
-- ==========================================
Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")

BMH_CANHGIOI = 3413
BMH_LEVEL    = 3414
BMH_EXP      = 3415
BMH_AURA     = {1520, 1521, 1522, 1523, 1524, 1525}

function BMH_NeedExp(nLevel)
	if nLevel < 10 then return 100 + (nLevel * 100) end
	if nLevel < 20 then return 800 + (nLevel * 200) end
	if nLevel < 30 then return 1600 + (nLevel * 400) end
	if nLevel < 40 then return 3400 + (nLevel * 600) end
	if nLevel < 50 then return 5000 + (nLevel * 1000) end
	if nLevel < 60 then return 8000 + (nLevel * 2000) end
	return 999999
end

function main(nItemIdx)
	if CFG_BacMinhCong ~= 1 then
		Msg2Player("<color=gray>T©m ph¸p nµy ch­a l­u hµnh.<color>")
		return 1
	end
	local nCanhGioi = GetTask(BMH_CANHGIOI)
	if nCanhGioi == 0 then nCanhGioi = 1 end

	local nLevel = GetTask(BMH_LEVEL)
	if nLevel == 0 then nLevel = 1 end

	local nExp = GetTask(BMH_EXP)
	local nMaxLevel = nCanhGioi * 10

	local nNeedExp = 999999
	if nLevel < nMaxLevel then
		nNeedExp = BMH_NeedExp(nLevel)
	end

	local nLifeMana = nLevel * 40

	local szWarning = ""
	if nLevel >= nMaxLevel then
		szWarning = "\n<color=red>Chó ý: §¹t cÊp tèi ®a ph¶i gÆp Tiªu Dao Tö ®Ó TÊn Th¨ng!<color>"
	else
		szWarning = "\n<color=gray>Tr¹ng th¸i: ®ang tu luyÖn...<color>"
	end

	local szTitle =
		"C¶nh giíi: <color=yellow>Thø " .. nCanhGioi .. "<color> - CÊp ®é: <color=yellow>" .. nLevel .. " / " .. nMaxLevel .. "<color>\n" ..
		"TiÕn ®é: <color=green>" .. nExp .. "<color> / <color=green>" .. nNeedExp .. "<color>\n" ..
		"Sinh lùc vµ Néi lùc: <color=cyan>+" .. nLifeMana .. "<color>\n" ..
		"May m¾n: <color=cyan>+" .. nLevel .. "<color>" .. szWarning

	local tbOpt = {
		{"KÝch ho¹t t©m ph¸p", KichHoatBacMinh},
		{"Tho¸t"}
	}

	CreateNewSayEx(szTitle, tbOpt)
	return 1
end

function KichHoatBacMinh()
	local nCanhGioi = GetTask(BMH_CANHGIOI)
	local nLevel = GetTask(BMH_LEVEL)

	if nCanhGioi == 0 then
		SetTask(BMH_CANHGIOI, 1)
		nCanhGioi = 1
	end

	if nLevel == 0 then
		SetTask(BMH_LEVEL, 1)
		nLevel = 1
	end

	local nAuraID = BMH_AURA[nCanhGioi] or BMH_AURA[1]

	for i = 1, 6 do
		RemoveSkillState(BMH_AURA[i])
	end

	AddSkillState(nAuraID, nLevel, 1, 99999999, 1)
	Msg2Player("<color=yellow>KÝch ho¹t B¾c Minh C«ng cÊp " .. nLevel .. "!<color>")
end
