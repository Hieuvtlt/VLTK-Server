SimCityNgoaiTrang = {}

SimCityNgoaiTrang.ALLTRANGBI_DATA = {
	ao = {
		nam = {},
		nam_count = 0,
		nu = {},
		nu_count = 0,
	},
	non = {
		nam = {},
		nam_count = 0,
		nu = {},
		nu_count = 0,
	},
	vukhi = {
		nam = {},
		nam_count = 0,
		nu = {},
		nu_count = 0,
	},
	ngua = {
		nam = {},
		nam_count = 0,
		nu = {},
		nu_count = 0,
	}
}

SimCityNgoaiTrang.found = 0

function SimCityNgoaiTrang:init()
	if TabFile_Load and GetTabFileData and self.found == 0 then
		local toLoadData = {
			{
				"\\settings\\npcres_simple\\����������.txt",
				self.ALLTRANGBI_DATA.ao.nam,
				self.ALLTRANGBI_DATA.ao.nam_count
			},
			{
				"\\settings\\npcres_simple\\Ů��������.txt",
				self.ALLTRANGBI_DATA.ao.nu,
				self.ALLTRANGBI_DATA.ao.nu_count
			},
			{
				"\\settings\\npcres_simple\\������ͷ��.txt",
				self.ALLTRANGBI_DATA.non.nam,
				self.ALLTRANGBI_DATA.non.nam_count
			},
			{
				"\\settings\\npcres_simple\\Ů����ͷ��.txt",
				self.ALLTRANGBI_DATA.non.nu,
				self.ALLTRANGBI_DATA.non.nu_count
			},
			{
				"\\settings\\npcres_simple\\������δ����������.txt",
				self.ALLTRANGBI_DATA.vukhi.nam,
				self.ALLTRANGBI_DATA.vukhi.nam_count
			},
			{
				"\\settings\\npcres_simple\\Ů����δ����������.txt",
				self.ALLTRANGBI_DATA.vukhi.nu,
				self.ALLTRANGBI_DATA.vukhi.nu_count
			},
			{
				"\\settings\\npcres_simple\\����������.txt",
				self.ALLTRANGBI_DATA.ngua.nam,
				self.ALLTRANGBI_DATA.ngua.nam_count,
				1
			},
			{
				"\\settings\\npcres_simple\\Ů��������.txt",
				self.ALLTRANGBI_DATA.ngua.nu,
				self.ALLTRANGBI_DATA.ngua.nu_count,
				1
			}
		}

		for j = 1, getn(toLoadData) do
			local info = toLoadData[j]

			local tbData, nCount = GetTabFileData(info[1], "temp" .. j, 2, 4)
			for i = 1, nCount do
				local name = tbData[i][2]
				if info[4] or (name and name ~= "") then
					tinsert(info[2], i)
				end
			end

			info[3] = getn(info[2])
		end

		self.found = 1
	end
end

SimCityNgoaiTrang.used = {}

-- BLACKLIST index ngoai trang THIEU res (mat dau/than/vk/ngua). makeup se TRANH cac index nay.
-- Key: <objectName>_<gioitinh>. nam = charType -1, nu = -2.
-- VD: non_nam = {5, 12} = index DAU (head) nam bi loi -> bot se ko lay nua.
SimCityNgoaiTrang.BLACKLIST = {
	non_nam = {22,23,28}, non_nu = {22,23,28},     -- dau (head / helm)
	ao_nam = {18,38}, ao_nu = {18,38,54},       -- than (body / armor). 18=ao mac dinh (bo), 38=ban phi phong cua 18
	vukhi_nam = {}, vukhi_nu = {}, -- vu khi (weapon)
	ngua_nam = {}, ngua_nu = {},   -- ngua (horse)
}

-- chi dung cac id ngua nay (user loc qua test_res_item.lua)
SimCityNgoaiTrang.HORSE_WL = {0,1,2,3,4,5,6,9,10,11,12}

-- bot chi mac 13 trang phuc (6 nu + 7 nam), random ban thuong/cape (res cao = co phi phong).
SimCityNgoaiTrang.ARMOR_WL_NU  = {1,2,10,11,12,13,14,19,20,29,32,35,41}
SimCityNgoaiTrang.ARMOR_WL_NAM = {1,2,10,11,12,13,14,19,20,29,32,35,41}
SimCityNgoaiTrang.HELM_WL = {1,2,3,6,7,8,9,10,11,14,17,20,21,24}
SimCityNgoaiTrang.WEAPON_WL = {2,3,5,6,8,9,11,12,14,15,17,18,20,22,24,26,28,30}
-- [2026-07] DO THEO CAP: 4 tang, id deu lay tu whitelist goc
SimCityNgoaiTrang.TIER_BY_LV = {
	{maxLv = 59,  armorNam = {1,9,12,19},      armorNu = {1,9,12,19},  helm = {3,6,9,12,15},      weapon = {2,5,8,11,14,17}},
	{maxLv = 79,  armorNam = {2,10,13,20}, armorNu = {2,10,13,20}, helm = {2,7,10,16,17},   weapon = {3,6,9,12,15,18}},
	{maxLv = 89,  armorNam = {11,14,29,32}, armorNu = {11,14,29,32}, helm = {8,11,14,20}, weapon = {20,22,24,26,28,30}},
	{maxLv = 999, armorNam = {14,29,35,41}, armorNu = {14,29,35,41}, helm = {8,11,14,20},    weapon = {20,22,24,26,28,30}},
}
function SimCityNgoaiTrang:getTier(nLevel)
	if not nLevel then return nil end
	for i = 1, getn(self.TIER_BY_LV) do
		if nLevel <= self.TIER_BY_LV[i].maxLv then return self.TIER_BY_LV[i] end
	end
	return self.TIER_BY_LV[getn(self.TIER_BY_LV)]
end
-- [Dot 1b] chon index TAT DINH tu seed (listId) + salt -> danh tinh on dinh, khong random lai
function SimCityNgoaiTrang:detIndex(seed, salt, n)
	if not seed or not n or n <= 0 then return 1 end
	return mod(seed * 97 + salt * 13, n) + 1
end
function SimCityNgoaiTrang:pickHelm(nLevel, seed)
	local pool = self.HELM_WL
	if NGOAITRANG_THEOCAP == 1 then
		local ti = self:getTier(nLevel)
		if ti then pool = ti.helm end
	end
	if seed then return pool[self:detIndex(seed, 2, getn(pool))] end
	return pool[random(1, getn(pool))]
end
function SimCityNgoaiTrang:pickWeapon(nLevel, seed)
	local pool = self.WEAPON_WL
	if NGOAITRANG_THEOCAP == 1 then
		local ti = self:getTier(nLevel)
		if ti then pool = ti.weapon end
	end
	if seed then return pool[self:detIndex(seed, 4, getn(pool))] end
	return pool[random(1, getn(pool))]
end
function SimCityNgoaiTrang:pickArmor(charType, faction, nLevel, seed)
	if faction == "caibang" then local _f = {17,38}; if seed then return _f[self:detIndex(seed,3,2)] end return _f[random(1, 2)] end
	if faction == "vodang" or faction == "conlon" then local _f = {4,5}; if seed then return _f[self:detIndex(seed,3,2)] end return _f[random(1, 2)] end
	local _wl
	if NGOAITRANG_THEOCAP == 1 then
		local ti = self:getTier(nLevel)
		if ti then _wl = (charType == -2) and ti.armorNu or ti.armorNam end
	end
	if not _wl then _wl = (charType == -2) and self.ARMOR_WL_NU or self.ARMOR_WL_NAM end
	if seed then return _wl[self:detIndex(seed, 3, getn(_wl))] end
	return _wl[random(1, getn(_wl))]
end
function SimCityNgoaiTrang:pickHorse(seed)
	if seed then return self.HORSE_WL[self:detIndex(seed, 5, getn(self.HORSE_WL))] end
	return self.HORSE_WL[random(1, getn(self.HORSE_WL))]
end
function SimCityNgoaiTrang:makeup(config, nNpcIndex)
	local _seed = (STABLE_IDENTITY == 1) and config.id or nil   -- [Dot 1b] seed = listId
	if config.series == 0 then config.nSettingsIdx = -1 elseif config.series == 2 then config.nSettingsIdx = -2 end
	if not config.nSettingsIdx then
		if _seed then config.nSettingsIdx = (mod(_seed, 2) == 0) and -1 or -2
		else config.nSettingsIdx = random(-2, -1) end
	end
	config.nNewHelmType = config.nNewHelmType or self:pickHelm(config.level, _seed)
	config.nNewArmorType = config.nNewArmorType or self:pickArmor(config.nSettingsIdx, config.faction, config.level, _seed)
	if GEAR_MATCH_CLASS == 0 then config.nNewWeaponType = nil end   -- [Dot 1c] tat khop phai -> vu khi theo cap
	config.nNewWeaponType = config.nNewWeaponType or self:pickWeapon(config.level, _seed)
	config.nNewHorseType = config.nNewHorseType or self:pickHorse(_seed)

	ChangeNpcFeature(nNpcIndex, 0, 0, config.nSettingsIdx, config.nNewHelmType, config.nNewArmorType,
		config.nNewWeaponType,
		config.nNewHorseType)

	if SetNpcRideHorse then SetNpcRideHorse(nNpcIndex, 1) end
end

function SimCityNgoaiTrang:getData(charType, objectName)
	local target = {}
	if objectName == "non" then
		target = self.ALLTRANGBI_DATA.non
	end
	if objectName == "ao" then
		target = self.ALLTRANGBI_DATA.ao
	end
	if objectName == "vukhi" then
		target = self.ALLTRANGBI_DATA.vukhi
	end
	if objectName == "ngua" then
		target = self.ALLTRANGBI_DATA.ngua
	end


	local collection = {}
	if charType == -1 then
		collection = target.nam
	elseif charType == -2 then
		collection = target.nu
	else
		return nil
	end

	local N = getn(collection)
	if N > 0 then
		local gkey = objectName .. ((charType == -1) and "_nam" or "_nu")
		local bl = self.BLACKLIST[gkey] or {}
		local bln = getn(bl)
		for try = 1, 30 do
			local idx = collection[random(1, N)]
			idx = tonumber(idx) or 0
			local bad = nil
			if objectName == "ao" then if idx >= 42 then bad = 1 end end
			if objectName == "ngua" then if idx > 11 then bad = 1 end end
			if objectName == "vukhi" then if idx > 32 then bad = 1 end end
			for k = 1, bln do
				if tonumber(bl[k]) == idx then bad = 1 end
			end
			if not bad then return idx end
		end
		return tonumber(collection[random(1, N)]) or 1
	end
	return nil
end


function SimCityNgoaiTrang:doRandom(forceGender)
	local sIdx = forceGender or random(-2, -1)  
	return {
		nSettingsIdx   = sIdx,
		nNewHelmType   = self:pickHelm(),
		nNewArmorType  = self:pickArmor(sIdx),
		nNewWeaponType = self:pickWeapon(),
		nNewHorseType  = self.HORSE_WL[random(1, getn(self.HORSE_WL))],
	}
end
