
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\38\\award.lua")
Include("\\script\\activitysys\\config\\38\\extend.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\activitysys\\config\\2\\award.lua")

local AWARD_TABLE = tbAwardList["Gift_npc"] 
local nHideTime = 20

local _limit = function()
	
	if CalcEquiproomItemCount(6,1,3198,1) <= 0 then
		
		Talk(1,"","Ng­¬i kh«ng mang theo l­ìi liÒm b¹c.")	
		
		return 1
	end	
end

local _OnBreak = function()
	Msg2Player("Thu thËp ®· bÞ gi¸n ®o¹n.")
end


local _GetAward = function(nNpcIndex, dwNpcId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
	
		return
	end
	
	if IsNpcHide(nNpcIndex) == 1 then
--		Msg2Player("ÄãµÄ²É¼¯Ê§°ÜÁË¡£")
		return 0
	end

	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	if %_limit() then
		return
	end
	
local nRandomKeyValue = random(1, 100)

if (nRandomKeyValue < 20) then
nrace = 1
i = 3200
end
if
(nRandomKeyValue <= 100 and nRandomKeyValue>20)then
nrace = 2
i = 3199
end


	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,i,0,0,0},nCount = nrace}, "test", 1);
	ConsumeEquiproomItem(1,6,1,3198,-1)
	HideNpc(nNpcIndex, %nHideTime * 18)
	
end 


function main()

	local nNpcIndex = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIndex)
	
	if pActivity:ExpiredTime() == 1 then
		DelNpc(nNpcIndex)
		return 
	end
	
	if %_limit() then
		return
	end
	tbProgressBar:OpenByConfig(1000, %_GetAward, {nNpcIndex, dwNpcId}, %_OnBreak)
	
end



