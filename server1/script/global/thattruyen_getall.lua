-- Nhan 1 lan TAT CA skill That Truyen - dung cho NPC Hoa Son
-- Dat tai: \script\global\thattruyen_getall.lua
--
-- CHI trao 23 skill CHINH (tang 1). Cac tang con (1219, 1220, 1222, 1225, 1228,
-- 1229, 1231, 1232, 1234, 1236, 1239, 1246, 1247, 1250, 1252, 1254, 1258, 1259,
-- 1261, 1264, 1265, 1267, 1272, 1274, 1276) do engine tu goi qua event chain -
-- neu AddMagic chung se sinh icon rac trong bang ky nang.
--
-- Toan bo van ban o day la tieng Viet KHONG DAU (ASCII) theo yeu cau,
-- nen file nay khong can chuyen sang TCVN3.

TT_ALL_MAXLEVEL = 25		-- MaxLevel cua moi skill That Truyen (da doi chieu skills.txt)

-- 23 skill chinh, xep theo mon phai cho de doi chieu
TT_ALL_MAIN =
{
	1245, 1255, 1256,		-- Thieu Lam
	1271, 1273, 1275,		-- Thien Vuong
	1248, 1251, 1253,		-- Duong Mon
	1257, 1260,				-- Ngu Doc
	1227, 1230,				-- Nga Mi
	1233, 1235,				-- Thuy Yen
	1237, 1238,				-- Cai Bang
	1224, 1226,				-- Thien Nhan
	1218, 1221,				-- Vo Dang
	1262, 1266,				-- Con Lon
	1240,					-- Van Kiem Quy Tong (1)
	1268,					-- Thuong Co Thien Thach (1)
	1277,					-- Thien Hoa Giang Long Tran (1)
}

-- Skill co MaxLevel KHAC 25 (doi chieu cot MaxLevel trong skills.txt).
-- Vuot MaxLevel la du lieu sai, nen phai kep lai theo tung skill.
TT_MAXLV_RIENG =
{
	[1277] = 20,			-- Thien Hoa Giang Long Tran (1) chi toi cap 20
}

-- Trao toan bo skill chinh o cap nLevel.
-- AddMagic(id, lv) GHI DE cap hien tai, nen goi lai voi cap khac se doi cap skill.
function tt_getall(nLevel)

	if (nLevel == nil) then nLevel = 1 end
	if (nLevel < 1) then nLevel = 1 end
	if (nLevel > TT_ALL_MAXLEVEL) then nLevel = TT_ALL_MAXLEVEL end

	local nNew, nUpd = 0, 0

	for i = 1, getn(TT_ALL_MAIN) do
		local nId = TT_ALL_MAIN[i]

		-- kep theo MaxLevel rieng neu skill do khong toi duoc TT_ALL_MAXLEVEL
		local nLv = nLevel
		local nCap = TT_MAXLV_RIENG[nId]
		if (nCap ~= nil) and (nLv > nCap) then nLv = nCap end

		if (HaveMagic(nId) == -1) then
			nNew = nNew + 1
		else
			nUpd = nUpd + 1
		end
		AddMagic(nId, nLv)
	end

	WriteLog(GetLocalDate("%Y-%m-%d %X").."\t[ThatTruyen-GetAll]\tAccount:"..GetAccount()
		.."\tName:"..GetName().."\tLevel:"..nLevel
		.."\tMoi:"..nNew.."\tCapNhat:"..nUpd.."\tTong:"..getn(TT_ALL_MAIN))

	Msg2Player("<color=yellow>Da nhan "..getn(TT_ALL_MAIN)
		.." skill That Truyen o cap "..nLevel.."<color>")

	Say("Da trao toan bo <color=yellow>"..getn(TT_ALL_MAIN)
		.."<color> skill That Truyen o <color=yellow>cap "..nLevel.."<color>."
		.."<enter>Moi hoc: "..nNew.."   Doi cap: "..nUpd,
		1, "Dong/tt_getall_quit")

end

function tt_getall_lv1()
	tt_getall(1)
end

function tt_getall_lv25()
	tt_getall(TT_ALL_MAXLEVEL)
end

function tt_getall_quit()
end

-- Huy TOAN BO skill That Truyen (chi skill chinh - tang 1).
-- Dung DelMagic(id) - API xoa skill cua engine (dung 370 lan trong server nay).
function tt_delall()

	local nDel = 0

	for i = 1, getn(TT_ALL_MAIN) do
		local nId = TT_ALL_MAIN[i]
		if (HaveMagic(nId) ~= -1) then
			DelMagic(nId)
			nDel = nDel + 1
		end
	end

	WriteLog(GetLocalDate("%Y-%m-%d %X").."\t[ThatTruyen-DelAll]\tAccount:"..GetAccount()
		.."\tName:"..GetName().."\tDaXoa:"..nDel.."\tTong:"..getn(TT_ALL_MAIN))

	Msg2Player("<color=yellow>Da huy "..nDel.." skill That Truyen<color>")

	-- Dem lai THUC TE, khong suy tu nDel (goi lan 2 khi da trong se ra sai)
	local nLeft = 0
	for i = 1, getn(TT_ALL_MAIN) do
		if (HaveMagic(TT_ALL_MAIN[i]) ~= -1) then nLeft = nLeft + 1 end
	end

	Say("Da huy <color=yellow>"..nDel.."<color> skill That Truyen."
		.."<enter>Con lai: "..nLeft.."/"..getn(TT_ALL_MAIN),
		1, "Dong/tt_getall_quit")

end

-- Hoi xac nhan truoc khi huy
function tt_delall_confirm()
	Say("Huy TOAN BO skill That Truyen dang co? Thao tac nay khong hoan tac duoc.",
		2, "Dung, huy het/tt_delall", "Thoi/tt_getall_quit")
end
