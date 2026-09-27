Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\missions\\leaguematch\\head.lua")

-- ==========================================
-- NPC SHOP VINH D? (TCVN3)
-- ==========================================

function main()
	-- L?y s? di?m vinh d? hi?n t?i c?a nhân v?t
	local nPoints = GetTask(WLLS_TASKID_HONOUR)
	
	local szMsg = "Ta lµ Sø Gi¶ Vinh Dù. Ng­¬i lµ bËc anh hïng träng nghÜa chèn vâ l©m, cã muèn dïng §iÓm Vinh Dù ®Ó ®æi lÊy c¸c kú tr©n dÞ b¶o nµy kh«ng?\n\n§iÓm vinh dù hiÖn t¹i cña ng­¬i lµ: <color=yellow>"..nPoints.." ®iÓm<color>"
	
	Say(szMsg, 7,
		"Mua 50 V« Danh Th¹ch (50.00 ®iÓm)/mua_vd_thach",
		"V« Danh ChØ Hoµn (1 triÖu ®iÓm)/mua_chihoan",
		"V« Danh Giíi ChØ (1 triÖu ®iÓm)/mua_gioichi",
		"V« Danh H¹ng Liªn (1 triÖu ®iÓm)/mua_hanglien",
		"V« Danh Ngäc Béi (1 triÖu ®iÓm)/mua_ngocboi",
		"V« Danh Yªu Trôy (1 triÖu ®iÓm)/mua_yeutruy",
		"KÕt thóc/no"
	)
end

-- ==========================================
-- X? LÝ MUA VÔ DANH TH?CH (GÓI 50 C?C)
-- ==========================================
function mua_vd_thach()
	local nPoints = GetTask(WLLS_TASKID_HONOUR)
	local nCost = 5000 -- 50 c?c x 1000 di?m
	
	if nPoints < nCost then
		return Say("Ng­¬i kh«ng ®ñ <color=yellow>50.00 ®iÓm vinh dù<color> ®Ó mua 50 V« Danh Th¹ch!", 0)
	end
	
	if CalcFreeItemCellCount() < 50 then
		return Say("Hµnh trang cña ng­¬i cÇn Ýt nhÊt 50 « trèng ®Ó chøa V« Danh Th¹ch!", 0)
	end
	
	-- Tr? di?m vinh d? và d?ng b? d? li?u
	SetTask(WLLS_TASKID_HONOUR, nPoints - nCost)
	SyncTaskValue(WLLS_TASKID_HONOUR)
	
	-- Add 50 c?c Vô Danh Th?ch (Genre 6, Detail 1, Particular 5134)
	for i = 1, 50 do
		AddItem(6, 1, 5134, 1, 0, 0)
	end
	
	Msg2Player("Mua thµnh c«ng 50 V« Danh Th¹ch!")
end

-- ==========================================
-- HÀM X? LÝ CHUNG CHO MUA TRANG B? VÔ DANH
-- ==========================================
function mua_trangbi(nGoldID, nCost, szName)
	local nPoints = GetTask(WLLS_TASKID_HONOUR)
	
	if nPoints < nCost then
		return Say("Ng­¬i kh«ng ®ñ <color=yellow>"..nCost.." ®iÓm vinh dù<color> ®Ó ®æi "..szName.."!", 0)
	end
	
	if CalcFreeItemCellCount() < 1 then
		return Say("Hµnh trang ®· ®Çy, vui lßng chõa l¹i Ýt nhÊt 1 « trèng!", 0)
	end
	
	-- Tr? di?m vinh d? và d?ng b? d? li?u
	SetTask(WLLS_TASKID_HONOUR, nPoints - nCost)
	SyncTaskValue(WLLS_TASKID_HONOUR)
	
	-- Add Trang b? Hoàng Kim theo Gold ID
	AddGoldItem(0, nGoldID)
	
	Msg2Player("§æi thµnh c«ng "..szName.."!")
end

-- ==========================================
-- CÁC L?A CH?N MUA TRANG B?
-- ==========================================
function mua_chihoan() 
	mua_trangbi(5443, 1000000, "V« Danh ChØ Hoµn") 
end

function mua_gioichi() 
	mua_trangbi(5454, 1000000, "V« Danh Giíi ChØ") 
end

function mua_hanglien() 
	mua_trangbi(5478, 1000000, "V« Danh H¹ng Liªn") 
end

function mua_ngocboi() 
	mua_trangbi(5501, 1000000, "V« Danh Ngäc Béi") 
end

function mua_yeutruy() 
	mua_trangbi(5524, 1000000, "V« Danh Yªu Trôy") 
end

function no()
end