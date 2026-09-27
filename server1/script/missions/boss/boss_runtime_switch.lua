BOSS_RUNTIME_SWITCH = BOSS_RUNTIME_SWITCH or {}
BOSS_RUNTIME_NPCS = BOSS_RUNTIME_NPCS or {}

-- V5.34 SAFE: luu trang thai Boss Hoang Kim bang file server.
-- Khong dung Task nhan vat, khong dung SkillState, khong timer.
-- File nam trong /home/jxser/server1/settings va ton tai qua restart.
BOSS_RUNTIME_STATE_PREFIX = "/home/jxser/server1/settings/boss_runtime_"

function BossRuntime_StateFile(szKey)
	return BOSS_RUNTIME_STATE_PREFIX..szKey..".cfg"
end

function BossRuntime_ReadSaved(szKey)
	local f = openfile(BossRuntime_StateFile(szKey), "r")
	if (f == nil) then return nil end
	local line = read(f, "*l")
	closefile(f)
	if (line == nil) then return nil end
	local nValue = tonumber(line)
	if (nValue == 0) then return 0 end
	if (nValue == 1) then return 1 end
	return nil
end

function BossRuntime_WriteSaved(szKey, nValue)
	local f = openfile(BossRuntime_StateFile(szKey), "w+")
	if (f == nil) then return 0 end
	write(f, tostring(nValue).."\n")
	closefile(f)
	return 1
end

function BossRuntime_Get(szKey)
	-- Doc file moi lan Get: an toan neu co nhieu world/process cung dung chung cay /home/jxser.
	local nSaved = BossRuntime_ReadSaved(szKey)
	if (nSaved ~= nil) then
		BOSS_RUNTIME_SWITCH[szKey] = nSaved
		return nSaved
	end
	-- Tuong thich V5.33: neu chua tung luu thi mac dinh BAT.
	if (BOSS_RUNTIME_SWITCH[szKey] == nil) then
		BOSS_RUNTIME_SWITCH[szKey] = 1
	end
	return BOSS_RUNTIME_SWITCH[szKey]
end

function BossRuntime_Set(szKey, nValue)
	local nState = 1
	if (nValue == 0) then nState = 0 end
	BOSS_RUNTIME_SWITCH[szKey] = nState
	BossRuntime_WriteSaved(szKey, nState)
	return nState
end

function BossRuntime_ResetMarker(nMarker)
	if (nMarker == nil or nMarker <= 0) then
		return 0
	end
	if (BOSS_RUNTIME_NPCS[nMarker] ~= nil) then
		BossRuntime_DeleteMarker(nMarker)
	end
	BOSS_RUNTIME_NPCS[nMarker] = {}
	return 1
end

function BossRuntime_Register(nMarker, nNpcIndex, nBossId)
	if (nMarker == nil or nMarker <= 0 or nNpcIndex == nil or nNpcIndex <= 0) then
		return 0
	end
	if (BOSS_RUNTIME_NPCS[nMarker] == nil) then
		BOSS_RUNTIME_NPCS[nMarker] = {}
	end
	local dwNpcId = GetNpcId(nNpcIndex)
	if (dwNpcId == nil or dwNpcId <= 0) then
		return 0
	end
	tinsert(BOSS_RUNTIME_NPCS[nMarker], {nNpcIndex, nBossId, dwNpcId})
	return 1
end

function BossRuntime_IsAlive(tbNpc, nMarker)
	if (tbNpc == nil) then return 0 end
	local nNpcIndex = tbNpc[1]
	local nBossId = tbNpc[2]
	local dwNpcId = tbNpc[3]
	if (nNpcIndex == nil or nNpcIndex <= 0) then return 0 end
	if (GetNpcId(nNpcIndex) ~= dwNpcId) then return 0 end
	if (GetNpcSettingIdx(nNpcIndex) ~= nBossId) then return 0 end
	if (GetNpcParam(nNpcIndex, 2) ~= nMarker) then return 0 end
	return 1
end

function BossRuntime_CountMarker(nMarker)
	local tbList = BOSS_RUNTIME_NPCS[nMarker]
	if (tbList == nil) then return 0 end
	local nCount = 0
	for i = 1, getn(tbList) do
		if (BossRuntime_IsAlive(tbList[i], nMarker) == 1) then
			nCount = nCount + 1
		end
	end
	return nCount
end

function BossRuntime_DeleteMarker(nMarker)
	if (nMarker == nil or nMarker <= 0) then return 0 end
	local tbList = BOSS_RUNTIME_NPCS[nMarker]
	if (tbList == nil) then return 0 end
	local nDeleted = 0
	for i = getn(tbList), 1, -1 do
		local tbNpc = tbList[i]
		if (BossRuntime_IsAlive(tbNpc, nMarker) == 1) then
			DelNpc(tbNpc[1])
			nDeleted = nDeleted + 1
		end
		tremove(tbList, i)
	end
	BOSS_RUNTIME_NPCS[nMarker] = {}
	return nDeleted
end
