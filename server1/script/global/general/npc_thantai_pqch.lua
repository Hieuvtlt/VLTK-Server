-- Than Tai (Ba Lang Huyen, map 53)
-- [19/09/2026] Da GO su kien 12 thang cu (PGaming / npc_sukien_dieuphoi.lua)
-- de khong trung voi he su kien 12 thang cua nhanh Tieu Dao Tu.
-- NPC nay gio CHI con chuc nang goc: Phu Quy Cam Hap.
-- Phu Quy Cam Hap duoc gan vao qua activitysys/config/34 (ClickNpc "Than Tai"),
-- nen chi can goi G_ACTIVITY:OnMessage la du - khong khai bao gi them o day.
-- Muon bat lai he cu: sua addspreadernpc.lua tro ve npc_sukien_dieuphoi.lua.

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\npcdailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)

	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)

	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)

	tbDailog.szTitleMsg = "<color=yellow>ThÇn Tµi:<color>\nTiÒn tµi nh­ n­íc, duyªn may tù ®Õn."

	tbDailog:AddOptEntry("Ta chØ ghÐ qua", TT_KetThuc)
	tbDailog:Show()
end

function TT_KetThuc()
end