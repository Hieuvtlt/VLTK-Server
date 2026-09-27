Include("\\script\\global\\tieudaotu_story.lua")

function OnDeath(nNpcIndex)
	if not PlayerIndex or PlayerIndex <= 0 then return end
	if GetTask(TDT_TSK_STORY) ~= 3 then return end
	local nBit = GetNpcParam(nNpcIndex, 1)
	if not nBit or nBit <= 0 then return end
	if TDT_LoaConHan() ~= 1 then
		Msg2Player("<color=red>HÕt giê. BÝ phæ ®· bÞ mang ®i.<color>")
		return
	end
	local nCo = GetTask(TDT_TSK_BIPHO)
	if mod(floor(nCo / nBit), 2) >= 1 then return end
	local i
	for i = 1, getn(TDT_BOSS) do
		if TDT_BOSS[i][8] == nBit then
			AddItem(6, 1, TDT_BOSS[i][7], 1, 0, 0)
			SetTask(TDT_TSK_BIPHO, nCo + nBit)
			Msg2Player("<color=yellow>Ng­¬i ®o¹t ®­îc mét trang bÝ phæ!<color>")
			return
		end
	end
end
