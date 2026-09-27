---------------  Bo dieu phoi su kien 12 thang (PGaming)  ---------------
-- Mot NPC dung quanh nam: tu chon thang<N>/npc_sukien.lua.
--   EventThangLuaChon = 0      -> chay theo thang hien tai
--   EventThangLuaChon = 1..12  -> co dinh mot thang
-- (cau hinh trong global/pgaming/configserver/configall.lua)

Include("\\script\\global\\pgaming\\configserver\\configall.lua")

function main()
	-- Chan de quy: neu dofile that bai, main van la ham nay.
	if (EVENTPG_DISPATCH_BUSY == 1) then
		return
	end

	local nThang = 0
	if (EventThangLuaChon) then
		nThang = tonumber(EventThangLuaChon)
	end
	if (not nThang) then
		nThang = 0
	end
	if (nThang < 1 or nThang > 12) then
		nThang = tonumber(date("%m"))
	end

	EVENTPG_DISPATCH_BUSY = 1
	dofile("script/vng_event/eventpgaming/thang"..nThang.."/npc_sukien.lua")
	main()
	EVENTPG_DISPATCH_BUSY = nil
end
