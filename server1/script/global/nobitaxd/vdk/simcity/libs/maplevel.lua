-- ==========================================================
-- SimCity - Bang cap quai theo map (dung cho bot luyen cong)
-- Nguon: settings\maplist.ini, khoa NpcAutoLevelMin
-- File nay SINH TU DU LIEU SERVER - khong go tay.
-- Bot level = capQuai - 5 .. capQuai + 4  (quai 45 -> bot 40..49)
-- ==========================================================

SimMapLevel = {}

-- [mapId] = capQuai
SimMapLevel.MOB_LEVEL = {

	---- cap quai 25  =>  bot 20..29
	[3] = 25,	-- Field

	---- cap quai 35  =>  bot 30..39
	[4] = 35,	-- Cave

	---- cap quai 45  =>  bot 40..49
	[5] = 45,	-- Cave
	[6] = 45,	-- Cave

	---- cap quai 25  =>  bot 20..29
	[7] = 25,	-- Field

	---- cap quai 35  =>  bot 30..39
	[8] = 35,	-- Cave

	---- cap quai 75  =>  bot 70..79
	[9] = 75,	-- Cave

	---- cap quai 85  =>  bot 80..89
	[10] = 85,	-- Cave

	---- cap quai 55  =>  bot 50..59
	[12] = 55,	-- Cave

	---- cap quai 25  =>  bot 20..29
	[14] = 25,	-- Cave
	[19] = 25,	-- Field

	---- cap quai 45  =>  bot 40..49
	[21] = 45,	-- Field

	---- cap quai 35  =>  bot 30..39
	[22] = 35,	-- Cave

	---- cap quai 45  =>  bot 40..49
	[23] = 45,	-- Cave

	---- cap quai 55  =>  bot 50..59
	[24] = 55,	-- Cave

	---- cap quai 45  =>  bot 40..49
	[41] = 45,	-- Field

	---- cap quai 55  =>  bot 50..59
	[42] = 55,

	---- cap quai 25  =>  bot 20..29
	[43] = 25,	-- Field

	---- cap quai 15  =>  bot 10..19
	[50] = 15,	-- Cave

	---- cap quai 65  =>  bot 60..69
	[51] = 65,	-- Cave
	[52] = 65,	-- Cave

	---- cap quai 75  =>  bot 70..79
	[55] = 75,	-- Others

	---- cap quai 65  =>  bot 60..69
	[56] = 65,	-- Field
	[60] = 65,	-- Tien Dien (map luyen lv60)

	---- cap quai 55  =>  bot 50..59
	[66] = 55,	-- Cave

	---- cap quai 65  =>  bot 60..69
	[68] = 65,	-- Field

	---- cap quai 75  =>  bot 70..79
	[69] = 75,	-- Cave

	---- cap quai 25  =>  bot 20..29
	[70] = 25,	-- Field
	[71] = 25,	-- Cave

	---- cap quai 75  =>  bot 70..79
	[72] = 75,	-- Cave

	---- cap quai 25  =>  bot 20..29
	[73] = 25,	-- Cave

	---- cap quai 35  =>  bot 30..39
	[74] = 35,	-- Field

	---- cap quai 95  =>  bot 90..99
	[75] = 95,	-- Cave

	---- cap quai 75  =>  bot 70..79
	[76] = 75,	-- Cave

	---- cap quai 35  =>  bot 30..39
	[77] = 35,	-- Cave

	---- cap quai 25  =>  bot 20..29
	[83] = 25,	-- Cave

	---- cap quai 35  =>  bot 30..39
	[90] = 35,	-- Field

	---- cap quai 45  =>  bot 40..49
	[91] = 45,	-- Cave

	---- cap quai 35  =>  bot 30..39
	[92] = 35,	-- Field

	---- cap quai 95  =>  bot 90..99
	[93] = 95,	-- Cave

	---- cap quai 75  =>  bot 70..79
	[94] = 75,	-- Cave

	---- cap quai 45  =>  bot 40..49
	[113] = 45,

	---- cap quai 65  =>  bot 60..69
	[114] = 65,

	---- cap quai 25  =>  bot 20..29
	[115] = 25,	-- Tong

	---- cap quai 55  =>  bot 50..59
	[116] = 55,

	---- cap quai 65  =>  bot 60..69
	[117] = 65,

	---- cap quai 75  =>  bot 70..79
	[120] = 75,

	---- cap quai 45  =>  bot 40..49
	[122] = 45,	-- Field

	---- cap quai 75  =>  bot 70..79
	[123] = 75,

	---- cap quai 95  =>  bot 90..99
	[124] = 95,

	---- cap quai 55  =>  bot 50..59
	[125] = 55,

	---- cap quai 75  =>  bot 70..79
	[129] = 75,

	---- cap quai 55  =>  bot 50..59
	[132] = 55,

	---- cap quai 45  =>  bot 40..49
	[135] = 45,

	---- cap quai 15  =>  bot 10..19
	[140] = 15,	-- Cave

	---- cap quai 95  =>  bot 90..99
	[144] = 95,

	---- cap quai 55  =>  bot 50..59
	[163] = 55,
	[164] = 55,
	[165] = 55,

	---- cap quai 45  =>  bot 40..49
	[167] = 45,	-- Field
	[168] = 45,

	---- cap quai 35  =>  bot 30..39
	[170] = 35,

	---- cap quai 45  =>  bot 40..49
	[171] = 45,
	[172] = 45,
	[173] = 45,

	---- cap quai 25  =>  bot 20..29
	[179] = 25,	-- Field

	---- cap quai 45  =>  bot 40..49
	[180] = 45,

	---- cap quai 55  =>  bot 50..59
	[182] = 55,
	[194] = 55,

	---- cap quai 15  =>  bot 10..19
	[195] = 15,	-- Field

	---- cap quai 85  =>  bot 80..89
	[198] = 85,
	[199] = 85,
	[200] = 85,
	[201] = 85,
	[202] = 85,
	[203] = 85,
	[204] = 85,
	[205] = 85,
	[224] = 85,	-- Cave

	---- cap quai 95  =>  bot 90..99
	[225] = 95,
	[226] = 95,
	[227] = 95,

	---- cap quai 75  =>  bot 70..79
	[319] = 75,	-- Field

	---- cap quai 85  =>  bot 80..89
	[320] = 85,	-- Field

	---- cap quai 95  =>  bot 90..99
	[321] = 95,
	[322] = 95,
	[340] = 95,	-- Cave
	[341] = 95,	-- Cave
	[342] = 95,	-- Field
	[875] = 95,

	---- cap quai 85  =>  bot 80..89
	[919] = 85,	-- Cave
	[920] = 85,	-- Cave

	---- cap quai 95  =>  bot 90..99
	[921] = 95,
	[922] = 95,
	[923] = 95,
	[924] = 95,
}

-- Tra cap quai cua map. nil = khong phai map luyen cap.
function SimMapLevel:GetMobLevel(nW)
	if not nW then return nil end
	return self.MOB_LEVEL[nW]
end

-- Sinh cap bot ngau nhien quanh cap quai: [mob-5, mob+4]
function SimMapLevel:RollBotLevel(nW, nDefault)
	local mob = self:GetMobLevel(nW)
	if not mob then return nDefault or 95 end
	local lv = mob - 5 + random(0, 9)
	if lv < 1 then lv = 1 end
	if lv > 150 then lv = 150 end
	return lv
end

-- Map co phai map luyen cap khong
function SimMapLevel:IsTrainMap(nW)
	return self:GetMobLevel(nW) ~= nil
end

-- [Dot 1a] Cap cao nhat cua nguoi choi tren map (tu playerTracker). nil neu it hon nMin nguoi.
function SimMapLevel:PlayerMaxLevel(worldInfo, nMin)
	if not worldInfo or not worldInfo.playerTracker then return nil end
	if not CallPlayerFunction or not GetLevel then return nil end
	local maxLv, cnt = 0, 0
	for pid, info in worldInfo.playerTracker do
		local lv = CallPlayerFunction(pid, GetLevel)   -- doc cap PLAYER dung cach (NPCINFO_GetLevel chi cho quai)
		if lv and lv > 0 and lv < 200 then
			cnt = cnt + 1
			if lv > maxLv then maxLv = lv end
		end
	end
	if cnt < (nMin or 1) then return nil end
	return maxLv
end

-- [Dot 1a] Player duoi NEWBIE_PROTECT_LEVEL -> can bao ve (bot khong chu dong danh). 1=newbie, nil=khong.
function SimMapLevel:IsNewbiePlayer(pID)
	if not NEWBIE_PROTECT_LEVEL or NEWBIE_PROTECT_LEVEL <= 0 then return nil end
	if not CallPlayerFunction or not GetLevel then return nil end
	local lv = CallPlayerFunction(pID, GetLevel)
	if lv and lv > 0 and lv < NEWBIE_PROTECT_LEVEL then return 1 end
	return nil
end
