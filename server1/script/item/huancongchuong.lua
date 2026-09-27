-- ==========================================
-- VËt phÈm: Hu©n C«ng Ch­¬ng
-- C«ng dông: T¨ng 50 ®iÓm tÝch lòy Tèng Kim
-- ==========================================

function main(nItemIndex)
	local TASK_TONGKIM = 747 
	local nAddPoints = 50
	
	-- LÊy ®iÓm hiÖn t¹i
	local nCurrentPoints = GetTask(TASK_TONGKIM)
	
	-- Céng thªm 50 ®iÓm
	local nNewPoints = nCurrentPoints + nAddPoints
	SetTask(TASK_TONGKIM, nNewPoints)
	SyncTaskValue(TASK_TONGKIM) -- §ång bé liÒn cho ch¾c ¡n
	
	-- [FIXED] Ðp xãa 1 vËt phÈm (Hç trî c¶ vËt phÈm xÕp chång)
	if nItemIndex ~= nil and nItemIndex > 0 then
		local nStack = GetItemStackCount(nItemIndex)
		if type(nStack) == "number" and nStack > 1 then
			SetItemStackCount(nItemIndex, nStack - 1)
		else
			RemoveItemByIndex(nItemIndex)
		end
	end
	
	-- Th«ng b¸o cho ng­êi ch¬i
	Msg2Player("Sö dông thµnh c«ng <color=yellow>Hu©n C«ng Ch­¬ng<color>! NhËn ®­îc <color=green>50 ®iÓm Tèng Kim<color>.")
	Msg2Player("§iÓm Tèng Kim hiÖn t¹i cña ng­¬i lµ: <color=yellow>" .. nNewPoints .. " ®iÓm<color>.")
	
	return 1
end