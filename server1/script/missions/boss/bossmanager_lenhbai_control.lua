BOSS_RUNTIME_SWITCH_FILE = "\\script\\missions\\boss\\boss_runtime_switch.lua"

BOSS_MANAGER_MARKER = {
	["HK_TIEU_0400"] = 400,
	["HK_TIEU_1230"] = 1230,
	["HK_TIEU_2000"] = 2000,
	["HK_TIEU_2300"] = 2300,
	["HK_TIEU_MANUAL"] = 9002,
	["HK_DAI_0800"] = 800,
	["HK_DAI_1930"] = 1930,
	["HK_DAI_2200"] = 2200,
	["HK_DAI_MANUAL"] = 9001,
	["DOC_CO_1945"] = 1945,
}

function BossManager_GetState(szKey)
	return DynamicExecute(BOSS_RUNTIME_SWITCH_FILE, "BossRuntime_Get", szKey)
end

function BossManager_Enable(szKey)
	return DynamicExecute(BOSS_RUNTIME_SWITCH_FILE, "BossRuntime_Set", szKey, 1)
end

function BossManager_Disable(szKey)
	DynamicExecute(BOSS_RUNTIME_SWITCH_FILE, "BossRuntime_Set", szKey, 0)
	local nMarker = BOSS_MANAGER_MARKER[szKey]
	if (nMarker == nil) then return 0 end
	local nDeleted = DynamicExecute(BOSS_RUNTIME_SWITCH_FILE, "BossRuntime_DeleteMarker", nMarker)
	if (nDeleted == nil) then nDeleted = 0 end
	return nDeleted
end

function BossManager_Count(szKey)
	local nMarker = BOSS_MANAGER_MARKER[szKey]
	if (nMarker == nil) then return 0 end
	local nCount = DynamicExecute(BOSS_RUNTIME_SWITCH_FILE, "BossRuntime_CountMarker", nMarker)
	if (nCount == nil) then nCount = 0 end
	return nCount
end
