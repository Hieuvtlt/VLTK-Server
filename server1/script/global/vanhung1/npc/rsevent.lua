
Include("\\script\\global\\translife.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\system\\task_string.lua"); 
Include("\\script\\lib\\basic.lua"); 
Include("\\script\\lib\\composeex.lua")
IncludeLib("LEAGUE");
Include("\\script\\dailogsys\\g_dialog.lua")

function main(NpcIndex)
dofile("script/global/pgaming/rsevent.lua");
local tbDialog = 
{ 
"<dec><npc>B¹n muèn Reset Event nµo?", 
" Reset Event Lóa/reseteventlua",
" Reset Event Ph¸o/reseteventphao",
" KÕt thóc ®èi tho¹i /no",
} 
CreateTaskSay(tbDialog) 
end;


---------------Lua--------------------

function reseteventlua()
local tbDialog = 
{ 
"<dec><npc>B¹n muèn Reset Event nµo?", 
" Reset Lóa Vµng - 500 TiÒn §ång/reset_luavang",
" Reset Lóa Xanh - 300 TiÒn §ång/reset_luaxanh",
" KÕt thóc ®èi tho¹i /no",
} 
CreateTaskSay(tbDialog) 
end;


function reset_luavang()
local nGoldPoint = GetExtPoint(1);

if nGoldPoint < 1500 then 
		Talk(1,"",""..GetName().." ch­a ¨n <color=yellow>Max 1.500 Lóa Vµng <color>...! \n<color=red>Kh«ng thÓ Reset...!")
		return
end

	local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
	if(nSilverCount < 500) then 
		Talk(1,"","Trªn ng­êi c¸c h¹ kh«ng cã ®ñ<color=red> 500 TiÒn ®ång.")
	return end
	ConsumeEquiproomItem(500,4,417,1,1) 
	PayExtPoint(1,1500)	
Msg2Player("§· Reset Event Lóa Vµng Thµnh C«ng! ")
Msg2SubWorld("<color=green>Xin chóc mõng  <color>"..GetName().." <color=green> ®·  Reset Event <color=yellow>Lóa Vµng <color> thµnh c«ng !!!")
end

function reset_luaxanh()
local nGoldPoint = GetExtPoint(2);

if nGoldPoint < 4000 then 
		Talk(1,"",""..GetName().." ch­a ¨n <color=yellow>Max 4.000 Lóa Xanh <color>...! \n<color=red>Kh«ng thÓ Reset...!")
		return
end

	local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
	if(nSilverCount < 300) then 
		Talk(1,"","Trªn ng­êi c¸c h¹ kh«ng cã ®ñ<color=red> 500 TiÒn ®ång.")
	return end
	ConsumeEquiproomItem(500,4,417,1,1) 
	PayExtPoint(2,4000)	
Msg2Player("§· Reset Event Lóa Xanh Thµnh C«ng! ")
Msg2SubWorld("<color=green>Xin chóc mõng  <color>"..GetName().." <color=green> ®·  Reset Event <color=yellow>Lóa Xanh <color> thµnh c«ng !!!")
end

-----------Phao--------------


function reseteventphao()
local tbDialog = 
{ 
"<dec><npc>B¹n muèn Reset Event nµo?", 
--" Reset Phong Ph¸o TiÓu Th­êng - 400 TiÒn §ång/reset_phaotieu",
" Reset Phong Ph¸o Trung Th­êng - 500 TiÒn §ång/reset_phaotrung",
" Reset Phong Ph¸o §¹i Th­êng - 600 TiÒn §ång/reset_phaodai",
" Reset Phong Ph¸o TiÓu §Æc BiÖt - 500 TiÒn §ång/reset_phaotieudb",
" Reset Phong Ph¸o Trung §Æc BiÖt - 700 TiÒn §ång/reset_phaotrungdb",
" Reset Phong Ph¸o §¹i §Æc BiÖt - 800 TiÒn §ång/reset_phaodaidb",
" KÕt thóc ®èi tho¹i /no",
} 
CreateTaskSay(tbDialog) 
end;



function reset_phaotieu()
local nGoldPoint = GetExtPoint(3);

if nGoldPoint < 1500 then 
		Talk(1,"",""..GetName().." ch­a ¨n <color=yellow>Max 1.500 Phong Ph¸o TiÓu Th­êng <color>...! \n<color=red>Kh«ng thÓ Reset...!")
		return
end

	local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
	if(nSilverCount < 400) then 
		Talk(1,"","Trªn ng­êi c¸c h¹ kh«ng cã ®ñ<color=red> 400 TiÒn ®ång.")
	return end
	ConsumeEquiproomItem(400,4,417,1,1) 
	PayExtPoint(3,1500)	
Msg2Player("§· Reset Event Phong Ph¸o TiÓu Th­êng Thµnh C«ng! ")
Msg2SubWorld("<color=green>Xin chóc mõng  <color>"..GetName().." <color=green> ®·  Reset Event <color=yellow>Phong Ph¸o TiÓu Th­êng <color> thµnh c«ng !!!")
end

function reset_phaotieudb()
local nGoldPoint = GetExtPoint(4);

if nGoldPoint < 1000 then 
		Talk(1,"",""..GetName().." ch­a ¨n <color=yellow>Max 1.000 Phong Ph¸o TiÓu §Æc BiÖt <color>...! \n<color=red>Kh«ng thÓ Reset...!")
		return
end

	local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
	if(nSilverCount < 500) then 
		Talk(1,"","Trªn ng­êi c¸c h¹ kh«ng cã ®ñ<color=red> 500 TiÒn ®ång.")
	return end
	ConsumeEquiproomItem(500,4,417,1,1) 
	PayExtPoint(4,1000)	
Msg2Player("§· Reset Event Phong Ph¸o TiÓu §Æc BiÖt Thµnh C«ng! ")
Msg2SubWorld("<color=green>Xin chóc mõng  <color>"..GetName().." <color=green> ®·  Reset Event <color=yellow>Phong Ph¸o TiÓu §Æc BiÖt <color> thµnh c«ng !!!")
end

function reset_phaotrung()
local nGoldPoint = GetExtPoint(5);

if nGoldPoint < 700 then 
		Talk(1,"",""..GetName().." ch­a ¨n <color=yellow>Max 700 Phong Ph¸o Trung Th­êng <color>...! \n<color=red>Kh«ng thÓ Reset...!")
		return
end

	local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
	if(nSilverCount < 500) then 
		Talk(1,"","Trªn ng­êi c¸c h¹ kh«ng cã ®ñ<color=red> 500 TiÒn ®ång.")
	return end
	ConsumeEquiproomItem(500,4,417,1,1) 
	PayExtPoint(5,700)	
Msg2Player("§· Reset Event Phong Ph¸o Trung Th­êng Thµnh C«ng! ")
Msg2SubWorld("<color=green>Xin chóc mõng  <color>"..GetName().." <color=green> ®·  Reset Event <color=yellow>Phong Ph¸o Trung Th­êng <color> thµnh c«ng !!!")
end

function reset_phaotrungdb()
local nGoldPoint = GetExtPoint(6);

if nGoldPoint < 500 then 
		Talk(1,"",""..GetName().." ch­a ¨n <color=yellow>Max 500 Phong Ph¸o Trung §Æc BiÖt <color>...! \n<color=red>Kh«ng thÓ Reset...!")
		return
end

	local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
	if(nSilverCount < 700) then 
		Talk(1,"","Trªn ng­êi c¸c h¹ kh«ng cã ®ñ<color=red> 700 TiÒn ®ång.")
	return end
	ConsumeEquiproomItem(700,4,417,1,1) 
	PayExtPoint(6,500)	
Msg2Player("§· Reset Event Phong Ph¸o Trung §Æc BiÖt Thµnh C«ng! ")
Msg2SubWorld("<color=green>Xin chóc mõng  <color>"..GetName().." <color=green> ®·  Reset Event <color=yellow>Phong Ph¸o Trung §Æc BiÖt <color> thµnh c«ng !!!")
end


function reset_phaodai()
local nGoldPoint = GetExtPoint(7);

if nGoldPoint < 700 then 
		Talk(1,"",""..GetName().." ch­a ¨n <color=yellow>Max 700 Phong Ph¸o §¹i Th­êng <color>...! \n<color=red>Kh«ng thÓ Reset...!")
		return
end

	local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
	if(nSilverCount < 600) then 
		Talk(1,"","Trªn ng­êi c¸c h¹ kh«ng cã ®ñ<color=red> 600 TiÒn ®ång.")
	return end
	ConsumeEquiproomItem(600,4,417,1,1) 
	PayExtPoint(7,700)	
Msg2Player("§· Reset Event Phong Ph¸o §¹i Th­êng Thµnh C«ng! ")
Msg2SubWorld("<color=green>Xin chóc mõng  <color>"..GetName().." <color=green> ®·  Reset Event <color=yellow>Phong Ph¸o §¹i Th­êng <color> thµnh c«ng !!!")
end


function reset_phaodaidb()
local nGoldPoint = GetExtPoint(3);

if nGoldPoint < 600 then 
		Talk(1,"",""..GetName().." ch­a ¨n <color=yellow>Max 600 Phong Ph¸o §¹i §Æc BiÖt <color>...! \n<color=red>Kh«ng thÓ Reset...!")
		return
end

	local nSilverCount = CalcEquiproomItemCount(4, 417, 1, 1) ;
	if(nSilverCount < 800) then 
		Talk(1,"","Trªn ng­êi c¸c h¹ kh«ng cã ®ñ<color=red> 800 TiÒn ®ång.")
	return end
	ConsumeEquiproomItem(800,4,417,1,1) 
	PayExtPoint(3,600)	
Msg2Player("§· Reset Event Phong Ph¸o §¹i §Æc BiÖt Thµnh C«ng! ")
Msg2SubWorld("<color=green>Xin chóc mõng  <color>"..GetName().." <color=green> ®·  Reset Event <color=yellow>Phong Ph¸o §¹i §Æc BiÖt <color> thµnh c«ng !!!")
end