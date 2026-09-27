IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
--Include("\\script\\global\\hotrothem.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")


function main() 
dofile("script/global/pgaming/hoason.lua");
dialog_main()	
end


function dialog_main()
	local szTitle = "<npc>LÇn nµy ph¸i <color=blue>Hoa S¬n<color> ta t¸i suÊt,  giang hå l¹i thªm nhiÒu biÕn ®éng"
	local tbOpt =
	{
		{"Hái chuyÖn", noi},
		{"Tho¸t"},
	}
	
	CreateNewSayEx(szTitle, tbOpt)
end




function noi()
if (GetCamp() == 0) and (GetSeries() == 2) and (GetLevel() >= 10) and  (GetTask(169) ~= 10)	  then		
Say("<color=red>Hoa S¬n L·o §Çu<color>: Ph¸i <color=cyan>Hoa S¬n<color> ta ®· kh«ng tham gia giang hå h¬n 10 n¨m nay, lÇn nµy t¸i xuÊt ¾t sÏ khiÕn bän giang hå tµ ph¸i ph¶i khiÕp sî!",2, "Gia nhËp Hoa S¬n/go", "§Ó ta suy nghÜ kü l¹i xem/no")
elseif (GetCamp() == 0) and (GetSeries() ~= 2) and (GetLevel() >= 10) and (GetSex() == 0) and  (GetTask(169) ~= 10) then
Say("<color=red>Hoa S¬n L·o §Çu<color>: Ph¸i <color=cyan>Hoa S¬n<color> ta ®· kh«ng tham gia giang hå h¬n 10 n¨m nay, lÇn nµy t¸i xuÊt ¾t sÏ khiÕn bän giang hå tµ ph¸i ph¶i khiÕp sî!",2, "Gia nhËp Hoa S¬n/go2", "§Ó ta suy nghÜ kü l¹i xem/no")
elseif (GetTask(169) >= 10)  then
local szTitle = "<npc>Ng­¬i muèn vÒ ph¸i h¶ "
	local tbOpt =
	{
		{"PhiÒn l·o ®­a ta ®i 1 chuyÕn",vep},
		{"Kh«ng cÇn"},
	}
	
	CreateNewSayEx(szTitle, tbOpt)
else
Talk(1,"","ChØ cã ng­êi hÖ thñy míi cã thÓ gia nhËp Hoa S¬n ta")	
end
end


function go() 
Talk(1,"","Chóc mõng c¸c h¹ ®· gia nhËp <color=blue>Hoa S¬n<color>")
NewWorld(987,167*8+7,196*16)
AddMagic(1347)
AddMagic(1372)
SetTask(169,10)
SetCamp(3)
SetCurCamp(3)
SetRank(82)	
SetFaction("huashan")  
SetLastFactionNumber(10)
--SetSex(0)
Msg2Player("ChÝnh thøc gia nhËp Hoa S¬n ph¸i, häc ® kiÕm ph¸p c¬ b¶n")
--KickOutSelf()
end 

function go2() 
Talk(1,"","Chóc mõng c¸c h¹ ®· gia nhËp <color=blue>Hoa S¬n<color>")
NewWorld(987,167*8+7,196*16)
SetSeries(2)
SetFaction("huashan")  
SetLastFactionNumber(10)
AddMagic(1347)
AddMagic(1372)
SetTask(169,10)
SetCamp(3)
SetCurCamp(3)
SetRank(82)	
Msg2Player("ChÝnh thøc gia nhËp Hoa S¬n ph¸i, häc ®ipcù kiÕm ph¸p c¬ b¶n")
KickOutSelf()
end 

function vep() 
Msg2Player("Ngêi yªn, chóng ta ®i Hoa S¬n ph¸i")
NewWorld(987,167*8+7,196*16)
end 

function no() 
end 

