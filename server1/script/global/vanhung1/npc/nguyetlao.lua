Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\valentine2007\\event.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName);
	end
	
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<color=yellow>Tõ 13/02/2007 ®Õn hÕt 15/02/2050<color>, c¸c nh©n sü vâ l©m cÊp trªn 80 míi cã thÓ t×m l·o phu ®Ó nhËn <color=yellow>1<color> h¹t hoa hång, b¹n muèn nhËn kh«ng?";
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog:AddOptEntry("NhËn h¹t hoa hång.", Valentine2007_main)
	

	
	tbDailog:Show();
end