--Event cau ca bang hoi
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\global\\vanhung1\\cauca\\head.lua")
IncludeLib("ITEM")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
MAXCOUNT = 5

local ItemAward = {
	{szName="C¸ hång",tbProp={6,1,4799,1,0,0},nCount=1,nRate=30},
	{szName="C¸ mËp",tbProp={6,1,4800,1,0,0},nCount=1,nRate=25},
	{szName="C¸ rång",tbProp={6,1,4801,1,0,0},nCount=1,nRate=20},
	{szName="C¸ sÊu",tbProp={6,1,4802,1,0,0},nCount=1,nRate=15},
	{szName="Mùc",tbProp={6,1,4803,1,0,0},nCount=1,nRate=10},
	{szName = "Sö dông L­íi ®¸nh c¸ kh«ng may m¾n",
		pFun = function (nItemCount, szLogTitle)
			Msg2Player("LÇn nµy kh«ng may m¾n, ta ph¶i thö thªm lÇn n÷a")
		end,
		nRate = 100,
	}
}
local _GetFruit = function(nItemIndex)
	tbAwardTemplet:Give(%ItemAward, 1)
	SaveNow()
	DemSoLan(nItemIndex)
end
local _OnBreak = function()
	Msg2Player("C©u c¸ thÊt b¹i")
end
function main(nItemIdx)
	local G,D,P,nLevel = GetItemProp(nItemIdx);
	if (G ~= 6) then
		return 1;
	end

	w,x,y=GetWorldPos()
	if w ~= 80 then
		--Talk(1, "", "B¹n h·y ®Õn <color=red>D­¬ng Ch©u (212/193)<color> ®Ó b¾t c¸");
		CreateTaskSay({"B¹n h·y ®Õn <color=red>D­¬ng Ch©u (212/193)<color> ®Ó b¾t c¸","§­a ta ®Õn ®ã./MoveMap","Tho¸t./Cancel",});
		return 1;
	end

	PosId = GetNearstPos(x*32,y*32, GccPos);
	if (PosId == 0) then 
		Say("B¹n ®øng c¸ch khu vùc qu¸ xa <color=red>D­¬ng Ch©u (212/193)<color>, kh«ng thÓ sö dông! ",0)
		return 1
	end;	

	if CalcFreeItemCellCount() < 6 then
		CreateTaskSay({"Xin h·y s¾p xÕp l¹i hµnh trang! Nhí ®Ó trèng 6 « trë lªn nhÐ!",  "§­îc råi./Cancel",});
		return 1;
	end
	if P == 4807 then ----can cau
		tbProgressBar:OpenByConfig(21, %_GetFruit,{nItemIdx}, %_OnBreak)
	end
	return 1
end
function DemSoLan(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx,1)) + 1
	local itemname = "<color=yellow>"..GetItemName(nItemIdx).."<color>"
	SetSpecItemParam(nItemIdx,1,n_param)
	SyncItem(nItemIdx)
	if (n_param >= MAXCOUNT) then
		RemoveItemByIndex(nItemIdx)
	else
		Msg2Player(""..itemname.." cßn sö dông "..(MAXCOUNT - n_param).." lÇn")
	end
end
function MoveMap()
	NewWorld(80, 1702, 3095)
	Msg2Player("B¹n ®· ®Õn khu vùc c©u c¸!")
end
function GetDesc(nItemIdx)
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItemIdx, 1 ))
	szDesc = szDesc..format("\nCã thÓ sö dông <color=yellow>%d<color> lÇn", (MAXCOUNT - n_param));
	return szDesc;
end
