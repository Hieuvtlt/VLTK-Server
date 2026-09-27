-- HUYTRAN Boss Sat Thu runtime controller
-- Called only by Lenh Bai Vi Son Dao through DynamicExecute.
-- This file is NOT included by autoexec.lua.

KILLER_BOSS_HEAD = "\\script\\task\\tollgate\\killbosshead.lua"

function KillerBoss_GetTable()
	local tbBoss = DynamicExecute(KILLER_BOSS_HEAD, "getglobal", "addkillertasknpc");
	return tbBoss;
end;

function KillerBoss_IsEntryNpc(nNpcIndex, tbRow)
	if (nNpcIndex == nil or nNpcIndex <= 0) then
		return 0;
	end;
	if (GetNpcSettingIdx(nNpcIndex) ~= tbRow[1]) then
		return 0;
	end;
	if (GetNpcParam(nNpcIndex, 1) ~= tbRow[10]) then
		return 0;
	end;
	return 1;
end;

function KillerBoss_CountEntry(tbRow)
	local tbNpc = GetMapNpcWithName(tbRow[3], tbRow[7]);
	if (tbNpc == nil) then
		return 0;
	end;
	local nCount = 0;
	for i = 1, getn(tbNpc) do
		if (KillerBoss_IsEntryNpc(tbNpc[i], tbRow) == 1) then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;

function KillerBoss_Count()
	local tbBoss = KillerBoss_GetTable();
	if (tbBoss == nil) then
		return -1;
	end;
	local nCount = 0;
	for i = 1, getn(tbBoss) do
		nCount = nCount + KillerBoss_CountEntry(tbBoss[i]);
	end;
	return nCount;
end;

function KillerBoss_TurnOn()
	local tbBoss = KillerBoss_GetTable();
	if (tbBoss == nil) then
		return -1;
	end;
	local nAdded = 0;
	for i = 1, getn(tbBoss) do
		local tbRow = tbBoss[i];
		if (KillerBoss_CountEntry(tbRow) == 0) then
			local nSubWorld = SubWorldID2Idx(tbRow[3]);
			if (nSubWorld >= 0) then
				local nNpcIndex = AddNpc(tbRow[1], tbRow[2], nSubWorld, tbRow[4] * 32, tbRow[5] * 32, tbRow[6], tbRow[7], tbRow[8]);
				if (nNpcIndex ~= nil and nNpcIndex > 0) then
					SetNpcScript(nNpcIndex, tbRow[9]);
					SetNpcParam(nNpcIndex, 1, tbRow[10]);
					nAdded = nAdded + 1;
				end;
			end;
		end;
	end;
	return nAdded;
end;

function KillerBoss_TurnOff()
	local tbBoss = KillerBoss_GetTable();
	if (tbBoss == nil) then
		return -1;
	end;
	local nDeleted = 0;
	for i = 1, getn(tbBoss) do
		local tbRow = tbBoss[i];
		local tbNpc = GetMapNpcWithName(tbRow[3], tbRow[7]);
		if (tbNpc ~= nil) then
			for j = 1, getn(tbNpc) do
				local nNpcIndex = tbNpc[j];
				if (KillerBoss_IsEntryNpc(nNpcIndex, tbRow) == 1) then
					DelNpc(nNpcIndex);
					nDeleted = nDeleted + 1;
				end;
			end;
		end;
	end;
	return nDeleted;
end;
