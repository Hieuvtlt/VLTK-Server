--Edit by Youtube PGaming--

IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")

function main ()
OnClick()	
	
end


function OnClick()
if (GetTask(69) == 20) then
Talk(2,"","Ng­êi ch¬i: Ng­¬i lµ ai?","Ng­êi ThÇn BÝ: §õng nhiÒu lêi, h·y ®ì kiÕm!")	 
nhantieu()
elseif (GetTask(69) > 20) then
Talk(1,"","Ng­êi ch¬i: N¬i nµy kh«ng nªn ë l©u.")
else
Talk(1,"","Ng­êi ch¬i: HuyÕt Y thËt kú l¹...")	 
end

end

function nhantieu() 
	W,X,Y = GetWorldPos();
	local nCamp = GetCurCamp();

    CallSjNpc( 607, 90, 340, 1881, 3290, "Ng­êi thÇn bÝ",5,0,50000,nil,nil,nil,nil,nil,nil,100); 
end  

function CallSjNpc(NpcId, NpcLevel, W, X, Y, Name,nCamp)
	W,X,Y = GetWorldPos();
local nCamp = 5;
	local nTaskId =5333
	local playername = GetName();
		NPC_PARAM_TASK_ID = 3
		nNpcIndex=AddNpc( 607, 90, SubWorldID2Idx(W), ( 1474 -  3 ) * 32, 3567 * 32, 1, Name, 100);
		if nNpcIndex > 0 then
		SetNpcScript(nNpcIndex, "\\script\\global\\pgaming\\npchoason\\nguoithanbi.lua")
		SetNpcAI(nNpcIndex, 2)
		SetNpcKind(nNpcIndex, 0)	
		SetNpcCurCamp(nNpcIndex, nCamp)		
		SetNpcParam(nNpcIndex, %NPC_PARAM_POS, 2)	
		SetNpcTimer(nNpcIndex, 1)		
		return nNpcIndex
		end

end