
-- ¹ÖÎïµØÍ¼ÒÔ¼°É½ºÓÉçð¢Í¼²ÐÆ¬µôÂä½Å±¾
-- Edited by peres
-- 2004/12/25 Ê¥µ®½ÚÍíÉÏ

IncludeLib("BATTLE");
Include("\\script\\task\\newtask\\newtask_head.lua"); 
Include("\\script\\task\\newtask\\map_index.lua"); -- ÓÃÓÚ»ñÈ¡µØÍ¼µÄÐÅÏ¢
Include("\\script\\task\\newtask\\lib_setmembertask.lua"); -- ÓÃÓÚÑ­»·¸Ä±ä¶ÓÓÑµÄÈÎÎñ±äÁ¿
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua"); -- HUY TRAN V9.0 dependency
Include("\\script\\tasktrace\\tasktrace.lua"); -- HUY TRAN V9.0 dependency




-- HUY TRAN V9.4R1: local random-all selector.
-- Kept inside the item script so tasklink_head.lua can remain 100% ORIGINAL.
function HuyTran_SelectAnyFindMapRowV94R1()
    if (type(TabFile_GetRowCount) ~= "function") or
       (type(TabFile_GetCell) ~= "function") or
       (type(random) ~= "function") then
        return 0
    end
    local nRowCount = tonumber(TabFile_GetRowCount(TL_FINDMAPS)) or 0
    if nRowCount < 2 then return 0 end
    local nDataCount = nRowCount - 1
    local nStart = tonumber(random(2,nRowCount)) or 2
    if (nStart < 2) or (nStart > nRowCount) then nStart = 2 end
    local i = 0
    local nRow = nStart
    for i = 1,nDataCount do
        local nTaskID = tonumber(TabFile_GetCell(TL_FINDMAPS,nRow,"TaskID"))
        local nMapID = tonumber(TabFile_GetCell(TL_FINDMAPS,nRow,"MapID"))
        local nMapType = tonumber(TabFile_GetCell(TL_FINDMAPS,nRow,"MapType"))
        local nMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS,nRow,"Num"))
        if (nTaskID ~= nil) and (nTaskID > 0) and
           (nMapID ~= nil) and (nMapID > 0) and
           (nMapType ~= nil) and ((nMapType == 1) or (nMapType == 2)) and
           (nMapNum ~= nil) and (nMapNum > 0) and (nMapNum <= 255) then
            return nRow
        end
        nRow = nRow + 1
        if nRow > nRowCount then nRow = 2 end
    end
    return 0
end

-- HUY TRAN V9.0: item scripts run in their own script context.
-- Load and initialize the minimum TaskLink tables required by the live server's forced FindMap path.
function HuyTran_InitTasklinkContextV92()
	if (type(tl_addPlayerExp) ~= "function") or
	   (type(AssignValue) ~= "function") or
	   (type(AssignValue_TaskLink) ~= "function") or
	   (type(AssignValue_TaskTalk) ~= "function") or
	   (type(open_task_trace) ~= "function") or
	   (type(TabFile_GetCell) ~= "function") or
	   (type(TabFile_GetRowCount) ~= "function") or
	   (type(HuyTran_SelectAnyFindMapRowV94R1) ~= "function") or
	   (type(random) ~= "function") or
	   (type(floor) ~= "function") or
	   (type(getn) ~= "function") or
	   (type(TL_FINDMAPS) ~= "string") or
	   (type(TL_LEVELLINK) ~= "string") or
	   (type(TL_TASKFINDMAPS) ~= "string") then
		Msg2Player("<color=red>HUY TRAN V9.2 [E21]: Thieu ham/bang TaskLink trong item context.<color>")
		return 0
	end

	if HUYTRAN_TASKLINK_READY_V92 ~= 1 then
		Task_FindMaps = AssignValue(Task_FindMaps,TL_FINDMAPS)
		Task_MainTaskLink = AssignValue_TaskLink(Task_MainTaskLink,TL_LEVELLINK)
		Task_TalkFind = AssignValue_TaskTalk(Task_TalkFind,TL_TASKFINDMAPS)
		HUYTRAN_TASKLINK_READY_V92 = 1
	end

	if (type(Task_FindMaps) ~= "table") or
	   (type(Task_MainTaskLink) ~= "table") or
	   (type(Task_MainTaskLink[1]) ~= "table") or
	   (type(Task_TalkFind) ~= "table") or
	   (type(Task_TalkFind[1]) ~= "table") or
	   (type(Task_TalkFind[4]) ~= "table") or
	   (type(Task_TalkFind[6]) ~= "table") or
	   (getn(Task_TalkFind[1]) <= 0) or
	   (getn(Task_TalkFind[4]) <= 0) or
	   (getn(Task_TalkFind[6]) <= 0) then
		HUYTRAN_TASKLINK_READY_V92 = 0
		Msg2Player("<color=red>HUY TRAN V9.2 [E22]: Khong khoi tao duoc FindMap/Level/Talk.<color>")
		return 0
	end
	return 1
end
function PickUp( nItemIndex, nPlayerIndex )

local nPreservedPlayerIndex = PlayerIndex
local nMemCount = GetTeamSize()

	if (nMemCount == 0) then
	
		AddMapValues();
	
	else
	
		for i = 1, nMemCount do -- ÔÚÕâÀï¿ªÊ¼Ñ­»·±éÀúÃ¿¸öÍæ¼Ò
		
			PlayerIndex = GetTeamMember(i);
		
			AddMapValues();

		end
	
		PlayerIndex = nPreservedPlayerIndex; -- Ñ­»·½áÊøºóÔÚÕâÀï¹é»¹Ö÷Íæ¼Ò ID
	
	end
	
	return 0

end


-- ¸ù¾Ý¸÷ÖÖÌõ¼þ¸øÓèÍæ¼Ò²»Í¬ÀàÐÍµÄµØÍ¼Ö¾
function AddMapValues()

local myMapID, myMapName, myMapX, myMapY -- ÓÃÓÚ»ñÈ¡µØÍ¼Ö¾ÐÅÏ¢µÄ±äÁ¿
local myTaskType = nt_getTask(1021)
local nWorldMaps = nt_getTask(1027) -- ¿´¿´Íæ¼ÒÉíÉÏÓÐ¶àÉÙ¸öÉ½ºÓÉçð¢Í¼
local myMapNum = nt_getTask(1025) -- ÅÐ¶ÏÍæ¼ÒÉíÉÏÓÐ¶àÉÙÕÅµØÍ¼Ö¾
local nHuyTranMode = GetByte(nt_getTask(1032),3)

myMapID = SubWorldIdx2ID( SubWorld )

	if (myTaskType == 4) and ((nHuyTranMode == 1) or (nHuyTranMode == 2)) and (GetByte(nt_getTask(1032),1) == 2) then
		local nNeed = GetByte(nt_getTask(1032),2)
		if nNeed <= 0 then return 0 end
		-- Neu nhan vat dang ket o 5/5, 12/12 hoac 16/12, xu ly ngay khi nhat them 1 vat pham.
		if myMapNum >= nNeed then
			if myMapNum > nNeed then nt_setTask(1025,nNeed) end
			HuyTran_ItemFinish()
			return 0
		end
		myMapNum = myMapNum + 1
		if myMapNum > nNeed then myMapNum = nNeed end
		nt_setTask(1025,myMapNum)
		nt_setTask(5123,1)
		open_task_trace()
		myMapName, myMapX, myMapY = tl_getMapInfo(nt_getTask(1031))
		if (myMapName == 0) or (myMapName == nil) then myMapName = "" end
		Msg2Player("B¹n nhËn ®­îc mét tÊm"..myMapName.."§Þa §å chÝ! HiÖn t¹i b¹n cã tæng céng"..myMapNum.." tÊm.")
		if myMapNum >= nNeed then HuyTran_ItemFinish() end
		return 0
	end

	if (myTaskType == 4) then
		
		myMapName, myMapX, myMapY = tl_getMapInfo(myMapID)
		
		if (myMapName == 0) or (myMapName == nil) then -- ·ÀÖ¹¿Õ×Ö·û´¦Àí
			myMapName = ""
		end
		
		-- ¸øÍæ¼ÒÔö¼ÓÒ»¾íµ±Ç°µØÍ¼µÄµØÍ¼Ö¾
		if (nt_getTask(1031) == myMapID) then
				
			if (GetByte(nt_getTask(1032),1) == 2) then
			
				myMapNum = myMapNum + 1
				nt_setTask(1025,myMapNum)
				nt_setTask(5123,1)
				open_task_trace()
				Msg2Player("B¹n nhËn ®­îc mét tÊm"..myMapName.."§Þa §å chÝ! HiÖn t¹i b¹n cã tæng céng"..myMapNum.." tÊm.");
				
				return 0
				
			end
			
		end
		
		-- ¸øÍæ¼ÒÔö¼ÓÒ»¸öÉ½ºÓÉçð¢Í¼²ÐÆ¬
		nWorldMaps = nWorldMaps + 1
		nt_setTask(1027,nWorldMaps)
		Msg2Player("B¹n nhËn ®­îc mét m¶nh b¶n ®å S¬n Hµ X· T¾c! HiÖn t¹i b¹n cã tæng céngt"..nWorldMaps.." m¶nh b¶n ®å S¬n Hµ X· T¾c.");
		
	else
		-- ¸øÍæ¼ÒÔö¼ÓÒ»¸öÉ½ºÓÉçð¢Í¼²ÐÆ¬
		nWorldMaps = nWorldMaps + 1
		nt_setTask(1027,nWorldMaps)
		Msg2Player("B¹n nhËn ®­îc mét m¶nh b¶n ®å S¬n Hµ X· T¾c! HiÖn t¹i b¹n cã tæng céngt"..nWorldMaps.." m¶nh b¶n ®å S¬n Hµ X· T¾c.");
	end


end

-- HUY TRAN V9.1: calculate only the native EXP branch; never open the three-choice award UI.
-- Live tasklink_award.lua formula:
-- EXP = floor((TaskValue1 + TaskValue2*(1+(links+times)*0.1) + loops*0.2) * 0.36 * random(80,120)/100)
-- If any source value is unavailable, return the proven V9.0 fallback of 10,000 EXP.
function HuyTran_CalcNativeExpV91()
	local nFallback = 10000
	if (type(TabFile_GetCell) ~= "function") or
	   (type(tl_counttasklinknum) ~= "function") or
	   (type(tl_gettaskstate) ~= "function") or
	   (type(floor) ~= "function") or
	   (type(TL_FINDMAPS) ~= "string") then
		return nFallback,0
	end

	local nTaskCol = tonumber(nt_getTask(1030))
	if (nTaskCol == nil) or (nTaskCol < 2) then return nFallback,0 end

	local nValue1 = tonumber(TabFile_GetCell(TL_FINDMAPS,nTaskCol,"TaskValue1"))
	local nValue2 = tonumber(TabFile_GetCell(TL_FINDMAPS,nTaskCol,"TaskValue2"))
	if (nValue1 == nil) or (nValue2 == nil) then return nFallback,0 end

	local nLinks = tonumber(tl_counttasklinknum(2)) or 0
	local nTimes = tonumber(tl_gettaskstate(1)) or 0
	local nLoops = tonumber(tl_gettaskstate(3)) or 0
	if nLinks < 0 then nLinks = 0 end
	if nTimes < 0 then nTimes = 0 end
	if nLoops < 0 then nLoops = 0 end

	local nRate = 100
	if type(C_Random) == "function" then
		nRate = tonumber(C_Random(80,120)) or 100
	elseif type(random) == "function" then
		nRate = tonumber(random(80,120)) or 100
	end
	if nRate < 80 then nRate = 80 end
	if nRate > 120 then nRate = 120 end

	local nMainValue = nValue1 + (nValue2 * (1 + (nLinks + nTimes) * 0.1) + nLoops * 0.2)
	local nAward = floor((nMainValue * 0.36) * (nRate * 0.01))

	-- The live TireReduce() forces TireDegree=0, so it has no effective reduction.
	-- Do not Include tasklink_award.lua and do not call greatnight_huang_event() from item context.
	if (nAward == nil) or (nAward <= 0) or (nAward > 100000000) then
		return nFallback,0
	end
	return nAward,1
end


-- HUY TRAN V9.2: local progression and direct FindMap assignment.
-- This removes the hidden dependency on a globally modified tl_gettasktype().
function HuyTran_FindLinkLevelV92(nLink)
	local i = 0
	if type(Task_MainTaskLink) ~= "table" then return 0 end
	for i = 1,getn(Task_MainTaskLink) do
		local tb = Task_MainTaskLink[i]
		if type(tb) == "table" then
			local nStart = tonumber(tb[2])
			local nEnd = tonumber(tb[3])
			if (nStart ~= nil) and (nEnd ~= nil) and (nLink >= nStart) and (nLink <= nEnd) then
				return i
			end
		end
	end
	return 0
end

function HuyTran_GetFirstLinkV92()
	local i = 0
	local nLevel = tonumber(GetLevel()) or 0
	local nFirst = 1
	for i = 1,getn(Task_MainTaskLink) do
		local tb = Task_MainTaskLink[i]
		if type(tb) == "table" then
			local nNeedLevel = tonumber(tb[1])
			local nStart = tonumber(tb[2])
			if (nNeedLevel ~= nil) and (nStart ~= nil) and (nLevel >= nNeedLevel) then
				nFirst = nStart
			end
		end
	end
	return nFirst
end

function HuyTran_GetLinkQuotaV92(nLink)
	local nRow = HuyTran_FindLinkLevelV92(nLink)
	if nRow <= 0 then return 0 end
	local nStart = tonumber(Task_MainTaskLink[nRow][2]) or 0
	local nEnd = tonumber(Task_MainTaskLink[nRow][3]) or 0
	local nLinkNum = nEnd - nStart + 1
	if nLinkNum <= 0 then return 0 end
	local nBase = floor(20 / nLinkNum)
	if nLink == nEnd then
		return 20 - ((nLinkNum - 1) * nBase)
	end
	return nBase
end

function HuyTran_CountFinishedLinksV92(nLink,nLinkCount)
	local nRow = HuyTran_FindLinkLevelV92(nLink)
	if nRow <= 0 then return -1 end
	local nStart = tonumber(Task_MainTaskLink[nRow][2]) or 0
	local nTotal = tonumber(nLinkCount) or 0
	local i = 0
	if nTotal < 0 then nTotal = 0 end
	for i = nStart,nLink - 1 do
		local nQuota = HuyTran_GetLinkQuotaV92(i)
		if nQuota <= 0 then return -1 end
		nTotal = nTotal + nQuota
	end
	return nTotal
end

function HuyTran_CountTotalTasksV92(nTimes,nLink,nLoops,nLinkCount)
	local nFinishedLinks = HuyTran_CountFinishedLinksV92(nLink,nLinkCount)
	if nFinishedLinks < 0 then return -1 end
	return (nFinishedLinks * 20) + nTimes + (nLoops * 400)
end

function HuyTran_AdvanceTaskStateV92()
	local nState = nt_getTask(1020)
	local nTimes = GetByte(nState,1)
	local nLink = GetByte(nState,2)
	local nLoops = GetByte(nState,3)
	local nLinkCount = tonumber(nt_getTask(1035)) or 0
	local nFirst = HuyTran_GetFirstLinkV92()

	if HuyTran_FindLinkLevelV92(nLink) <= 0 then
		nTimes = 0
		nLink = nFirst
		nLinkCount = 0
	end
	if nTimes < 0 or nTimes > 19 then nTimes = 0 end
	if nLoops < 0 or nLoops >= 20 then nLoops = 0 end
	if nLinkCount < 0 then nLinkCount = 0 end

	nTimes = nTimes + 1
	if nTimes >= 20 then
		nTimes = 0
		nLinkCount = nLinkCount + 1
		local nFinishedLinks = HuyTran_CountFinishedLinksV92(nLink,nLinkCount)
		if nFinishedLinks < 0 then
			Msg2Player("<color=red>HUY TRAN V9.2 [E23]: Trang thai chuoi nhiem vu khong hop le.<color>")
			return 0
		end
		if nFinishedLinks >= 20 then
			nLink = nFirst
			nLinkCount = 0
			nLoops = nLoops + 1
			if nLoops >= 20 then nLoops = 0 end
		else
			local nQuota = HuyTran_GetLinkQuotaV92(nLink)
			if nQuota <= 0 then
				Msg2Player("<color=red>HUY TRAN V9.2 [E24]: Khong doc duoc quota chuoi nhiem vu.<color>")
				return 0
			end
			if nLinkCount >= nQuota then
				nLink = nLink + 1
				nLinkCount = 0
			end
		end
	end

	if HuyTran_FindLinkLevelV92(nLink) <= 0 then
		Msg2Player("<color=red>HUY TRAN V9.2 [E25]: Link moi nam ngoai bang LevelLink.<color>")
		return 0
	end

	nState = SetByte(nState,1,nTimes)
	nState = SetByte(nState,2,nLink)
	nState = SetByte(nState,3,nLoops)
	nt_setTask(1020,nState)
	nt_setTask(1035,nLinkCount)
	local nTotal = HuyTran_CountTotalTasksV92(nTimes,nLink,nLoops,nLinkCount)
	if nTotal >= 0 then nt_setTask(1044,nTotal) end
	return 1
end

function HuyTran_SelectFindMapV92(nTaskLevel)
	local tb = Task_FindMaps[nTaskLevel]
	if type(tb) ~= "table" then return 0 end
	local i = 0
	local nTotalRate = 0
	local nFirstTask = 0
	for i = 1,getn(tb) do
		if type(tb[i]) == "table" then
			local nTaskID = tonumber(tb[i][1]) or 0
			local nRate = tonumber(tb[i][2]) or 0
			if (nTaskID > 0) and (nRate > 0) then
				if nFirstTask == 0 then nFirstTask = nTaskID end
				nTotalRate = nTotalRate + nRate
			end
		end
	end
	if (nFirstTask == 0) or (nTotalRate <= 0) then return 0 end
	local nRoll = tonumber(random(1,nTotalRate)) or 1
	local nCount = 0
	for i = 1,getn(tb) do
		if type(tb[i]) == "table" then
			local nTaskID = tonumber(tb[i][1]) or 0
			local nRate = tonumber(tb[i][2]) or 0
			if (nTaskID > 0) and (nRate > 0) then
				nCount = nCount + nRate
				if nRoll <= nCount then return nTaskID end
			end
		end
	end
	return nFirstTask
end

function HuyTran_DealFindMapV92()
	local nHuyTranMode = GetByte(nt_getTask(1032),3)
	local nTaskID = 0

	if nHuyTranMode == 2 then
		-- Random-all mode: do not read the character/task level and ignore every TaskRate column.
		nTaskID = HuyTran_SelectAnyFindMapRowV94R1()
	else
		-- V9.3-compatible mode: keep the existing level-chain weighted selection exactly.
		local nTaskLevel = GetByte(nt_getTask(1020),2)
		if HuyTran_FindLinkLevelV92(nTaskLevel) <= 0 then
			nTaskLevel = HuyTran_GetFirstLinkV92()
			nt_setTask(1020,SetByte(nt_getTask(1020),2,nTaskLevel))
		end
		nTaskID = HuyTran_SelectFindMapV92(nTaskLevel)
	end

	if nTaskID <= 0 then
		Msg2Player("<color=red>HUY TRAN V9.2 [E26]: Khong chon duoc dong FindMap moi.<color>")
		return 0
	end

	local nMapID = tonumber(TabFile_GetCell(TL_FINDMAPS,nTaskID,"MapID"))
	local nMapType = tonumber(TabFile_GetCell(TL_FINDMAPS,nTaskID,"MapType"))
	local nMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS,nTaskID,"Num"))
	if (nMapID == nil) or (nMapType == nil) or (nMapNum == nil) or
	   (nMapID <= 0) or (nMapType < 1) or (nMapType > 2) or (nMapNum <= 0) or (nMapNum > 255) then
		Msg2Player("<color=red>HUY TRAN V9.2 [E27]: Dong FindMap moi co du lieu sai.<color>")
		return 0
	end

	local nTalk1 = getn(Task_TalkFind[1])
	local nTalk4 = getn(Task_TalkFind[4])
	local nTalk6 = getn(Task_TalkFind[6])
	if (nTalk1 <= 0) or (nTalk4 <= 0) or (nTalk6 <= 0) then
		Msg2Player("<color=red>HUY TRAN V9.2 [E28]: Bang hoi thoai FindMap rong.<color>")
		return 0
	end

	nt_setTask(1021,4)
	nt_setTask(1030,nTaskID)
	nt_setTask(1038,random(2,nTalk1 + 1))
	nt_setTask(1041,random(2,nTalk4 + 1))
	nt_setTask(1043,random(2,nTalk6 + 1))
	nt_setTask(1031,nMapID)
	local nModeTask = nt_getTask(1032)
	nModeTask = SetByte(nModeTask,1,nMapType)
	nModeTask = SetByte(nModeTask,2,nMapNum)
	if (nHuyTranMode ~= 1) and (nHuyTranMode ~= 2) then nHuyTranMode = 1 end
	nModeTask = SetByte(nModeTask,3,nHuyTranMode)
	nModeTask = SetByte(nModeTask,4,0)
	nt_setTask(1032,nModeTask)
	nt_setTask(1025,0)
	nt_setTask(1028,1)
	return 1
end

-- HUY TRAN V9.4R1: MODE does not touch normal daily quota task IDs 2419/2420.

-- HUY TRAN V9.2: idempotent reward -> local chain advance -> direct FindMap assignment.
function HuyTran_ItemFinish()
	local nModeTask = nt_getTask(1032)
	local nNeed = GetByte(nModeTask,2)
	local nProgress = nt_getTask(1025)
	local nCourse = nt_getTask(1028)
	local nPhase = GetByte(nModeTask,4)
	local nAward = 10000
	local nNativeAward = 0

	if nt_getTask(1021) ~= 4 then return 0 end
	local nHuyTranMode = GetByte(nModeTask,3)
	if (nHuyTranMode ~= 1) and (nHuyTranMode ~= 2) then return 0 end
	if (nNeed <= 0) or (nProgress < nNeed) then return 0 end
	if nProgress > nNeed then nt_setTask(1025,nNeed) end
	if HuyTran_InitTasklinkContextV92() ~= 1 then return 0 end

	-- Reward exactly once. Course 3 is the persistent anti-duplicate marker.
	if nCourse ~= 3 then
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô D· TÈu.")
		nAward,nNativeAward = HuyTran_CalcNativeExpV91()
		if nCourse ~= 1 then nt_setTask(1028,1) end
		tl_addPlayerExp(nAward)
		Msg2Player("B¹n nhËn ®­îc <color=green>"..nAward.."<color> ®iÓm kinh nghiÖm")
		if nNativeAward ~= 1 then Msg2Player("<color=yellow>HUY TRAN V9.2 [F01]: Du lieu EXP goc khong hop le, da dung 10000 EXP du phong.<color>") end
		nt_setTask(1028,3)
		nModeTask = SetByte(nt_getTask(1032),4,1)
		nt_setTask(1032,nModeTask)
		nPhase = 1
	else
		-- Legacy V9.1 stuck state: EXP was already paid and its first failure point
		-- is after progression, while dealing the next task. Skip reward/progression
		-- and recover by assigning a new FindMap directly.
		if nPhase == 0 then
			nModeTask = SetByte(nt_getTask(1032),4,2)
			nt_setTask(1032,nModeTask)
			nPhase = 2
			Msg2Player("<color=yellow>HUY TRAN V9.2: Dang phuc hoi nhiem vu bi ket tu V9.1.<color>")
		end
	end

	-- Phase 1: reward exists, advance the chain once.
	if nPhase == 1 then
		if HuyTran_AdvanceTaskStateV92() ~= 1 then return 0 end
		-- V9.4R1: no normal daily-quota increment in MODE.
		nModeTask = SetByte(nt_getTask(1032),4,2)
		nt_setTask(1032,nModeTask)
		nPhase = 2
	end

	-- Phase 2: chain is advanced, only create the next FindMap task.
	if nPhase == 2 then
		if HuyTran_DealFindMapV92() ~= 1 then return 0 end
		nt_setTask(1045,1)
		nt_setTask(5123,1)
		open_task_trace()
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô D· TÈu vµ tõ ®éng nhËn nhiÖm vô tiÕp theo.")
		return 1
	end
	return 0
end;
