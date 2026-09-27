-- ==========================================
-- VËt phÈm: C«ng Tr¹ng LÖnh
-- C«ng dông: T¨ng 150 ®iÓm TÝn Sø
-- ==========================================

function main(nItemIndex)
	local TASK_TINSU = 1205
	local nAddPoints = 150
	
	-- LÊy ®iÓm hiÖn t¹i
	local nCurrentPoints = GetTask(TASK_TINSU)
	
	-- Céng thªm 150 ®iÓm
	local nNewPoints = nCurrentPoints + nAddPoints
	SetTask(TASK_TINSU, nNewPoints)
	
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
	Msg2Player("Sö dông thµnh c«ng <color=yellow>C«ng Tr¹ng LÖnh<color>! NhËn ®­îc <color=green>150 ®iÓm TÝn Sø<color>.")
	Msg2Player("§iÓm TÝn Sø hiÖn t¹i cña ng­¬i lµ: <color=yellow>" .. nNewPoints .. " ®iÓm<color>.")
	
	return 1
end