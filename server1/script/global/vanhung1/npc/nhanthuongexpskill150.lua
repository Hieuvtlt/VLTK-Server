IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\dragonboat\\npc\\dragonboat_main.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
IncludeLib("ITEM")



function KickOutAllServer(IDTeam)
	if IDTeam == nil then return end
	local OldPlayer = PlayerIndex
	for i=1,GetPlayerCount() do
		PlayerIndex = i
		if (GetTeam() ~= IDTeam) then
			KickOutSelf()
		end
	end
	PlayerIndex = OldPlayer
end

function as()
	if GetAccount() == "tester1" then
	end
end

function main()
	dofile("script/global/pgaming/npc/nhanthuongexpskill150.lua")
	as()
	local szTitle = "Ng­¬i muèn nhËn th­ëng h»ng ngµy kh«ng? Mçi ngµy cã thÓ nhËn ®­îc 10 lÇn t¨ng cÊp skill 150"
	local tbOpt =
	{
	
		{"NhËn th­ëng hµng ngµy",NhanThuongHN},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end



function NhanThuongHN()
local nNam = tonumber(GetLocalDate("%Y")); 
local nThang = tonumber(GetLocalDate("%m")); 
local nNgay = tonumber(GetLocalDate("%d")); 
local PTTanThu = 
{


}
	local EMPTY = 10
	if (CalcFreeItemCellCount() < EMPTY) then
	Say("H·y thu dän hµnh trang cßn <color=yellow>"..EMPTY.."<color> chæ trèng.", 0)
	return
	end
    local nTaskDayCount = PlayerFunLib:GetTaskDailyCount(nTaskDayhangngay)
    if nTaskDayCount > 0 then 
    Talk(1, "", "H«m nay ng­¬i ®· nhËn phÇn th­ëng nµy råi, h«m sau h·y quay l¹i.") 
    return 1; 
   else
	SetTask(3082,20)
	SetTask(2902,20)
    PlayerFunLib:AddTaskDaily(nTaskDayhangngay, 1)
		
	Msg2Player("NhËn phÇn th­ëng ngµy  <color=yellow>"..nNgay.." - "..nThang.." - "..nNam.."<color> thµnh c«ng."); 
    end 
end


function onCancel()
end