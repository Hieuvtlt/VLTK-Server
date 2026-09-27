Include("\\script\\lib\\common.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	local szMsg = "Ta lµ Tæng Qu¶n Sù KiÖn. Ng­¬i cã muèn vµo th¼ng b¶ng test Sù kiÖn Th¸ng 1 kh«ng?"
	local tbOpt = {
		{"Test Sù kiÖn Th¸ng 1", KichHoat_Test},
		{"Tho¸t", KetThuc}
	}
	CreateNewSayEx(szMsg, tbOpt)
	return 1
end

function KichHoat_Test()
	-- T?m b? check tháng, ép g?i th?ng file Tháng 1 d? test ch?c nang ghép d?
	local szScriptPath = "script/sukien_nam/thang1/npc_thang1.lua"
	
	local bOK, err = pcall(dofile, szScriptPath)
	if not bOK then
		Msg2Player("<color=red>Lçi load file: " .. err .. "<color>")
		return
	end
	
	if Menu_SuKien_Thang then
		Menu_SuKien_Thang()
	else
		Msg2Player("<color=red>Lçi: Kh«ng t×m thÊy hµm Menu_SuKien_Thang<color>")
	end
end

function KetThuc() end