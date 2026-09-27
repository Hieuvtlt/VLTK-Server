Include("\\script\\dailogsys\\g_dialog.lua")

-- ==========================================
-- KHAI BÁO BI?N NHI?M V? (TASK)
-- ==========================================
TASK_NEWBIE_REWARD = 3005 

-- Khai b¸o Task tró¬ng sinh cña server (Th­êng lµ 99, h·y chØnh l¹i nÕu server b¹n dïng Task kh¸c)
TASK_TRUNGSINH = 99 

-- ==========================================
-- B?NG PH?N THU?NG THEO C?P
-- ==========================================
-- C?u trúc: [C?p] = { Bit_Luu_Task, { {Lo?i_Item, ID, S?_lu?ng}, ... } }
-- Lo?i_Item = 0: Ð? Hoàng Kim (Dùng AddGoldItem)
-- Lo?i_Item = 6: V?t ph?m thông thu?ng x?p ch?ng
tbReward = {
	[20]  = { 6, { {0, 10, 1} } }, 
	[50]  = { 1, { {6, 5118, 10} } },
	[60]  = { 2, { {6, 5118, 20} } },
	[70]  = { 3, { {6, 5119, 10} } },
	[80]  = { 4, { {6, 5118, 40}, {6, 5119, 20}, {6, 5120, 10} } },
	[90]  = { 7, { {0, 168, 1}, {0, 169, 1}, {0, 170, 1}, {0, 171, 1}, {0, 172, 1}, {0, 173, 1}, {0, 174, 1}, {0, 175, 1}, {0, 176, 1} } },
	[100] = { 5, { {6, 5118, 80}, {6, 5119, 40}, {6, 5120, 20} } },
	[120] = { 8, { {6, 1125, 1} } }
}

function main()
	Say(
		"Ta lµ Sø Gi¶ T©n Thñ. §Ó khÝch lÖ c¸c vÞ ®¹i hiÖp trªn con ®­êng hµnh tÈu giang hå, hÖ thèng sÏ tÆng phÇn th­ëng gi¸ trÞ khi ®¹t mçi mèc cÊp ®é nhÊt ®Þnh.\n\nNg­¬i cÇn gióp ®ì g×?", 
		13,
		"NhËn th­ëng ®¹t cÊp/nhanthuong_menu",
		"Huû vËt phÈm bÞ kho¸/xoa_item_khoa_menu",
		"NhËn cÈm nang t©n thñ/camnangtanthu",
		"Nh©n cÈm nang hµnh tÈu/camnanghanhtau",
		"NhËn lÖnh bµi qu¸i vËt/lenhbaiquaivat",
		"NhËn lÖnh bµi GMBOSS/lenhbaigmboss",
		"NhËn lÖnh bµi vi s¬n ®¶o (mod)/visondao",
		"NhËn tói cµn kh«n/tuicankhon",
		"NhËn mÆt n¹ v­¬ng gi¶/matnavuonggia",
		"NhËn mÆt n¹ VIP/matnavip",
		"NhËn thÇn hµnh phï/thanhanhphu",
		"NhËn thæ ®Þa phï (v« h¹n)/thodiaphu",
		"KÕt thóc/no"
	)
end

-- ==========================================
-- TÍNH NANG 1: NH?N THU?NG TÂN TH?
-- ==========================================
function nhanthuong_menu()
	if GetTask(TASK_TRUNGSINH) > 0 then
		Say("Ng­¬i ®· c¶i l·o hoµn ®ång, b­íc vµo hµng ngò cao thñ, kh«ng cßn lµ t©n thñ ®Ó nhËn th­ëng n÷a!", 0)
		return
	end

	Say(
		"Ng­¬i muèn nhËn th­ëng ë mèc cÊp ®é nµo?", 
		9,
		"PhÇn th­ëng cÊp 20/nhan_20",
		"PhÇn th­ëng cÊp 50/nhan_50",
		"PhÇn th­ëng cÊp 60/nhan_60",
		"PhÇn th­ëng cÊp 70/nhan_70",
		"PhÇn th­ëng cÊp 80/nhan_80",
		"PhÇn th­ëng cÊp 90/nhan_90",
		"PhÇn th­ëng cÊp 100/nhan_100",
		"PhÇn th­ëng cÊp 120/nhan_120",
		"KÕt thóc/no"
	)
end

function nhan_20() xuly_nhanthuong(20) end
function nhan_50() xuly_nhanthuong(50) end
function nhan_60() xuly_nhanthuong(60) end
function nhan_70() xuly_nhanthuong(70) end
function nhan_80() xuly_nhanthuong(80) end
function nhan_90() xuly_nhanthuong(90) end
function nhan_100() xuly_nhanthuong(100) end
function nhan_120() xuly_nhanthuong(120) end

function xuly_nhanthuong(nLevel)
	local nMyLevel = GetLevel()
	if nMyLevel < nLevel then
		Say("Ng­¬i ch­a ®¹t ®Õn cÊp <color=yellow>"..nLevel.."<color>, h·y tiÕp tôc tu luyÖn!", 0)
		return
	end

	local tbData = tbReward[nLevel]
	local nBit = tbData[1]
	local tbItems = tbData[2]

	local nTaskVal = GetTask(TASK_NEWBIE_REWARD)
	local nDaNhan = GetBit(nTaskVal, nBit)

	if nDaNhan == 1 then
		Say("Ng­¬i ®· nhËn phÇn th­ëng ë mèc cÊp <color=yellow>"..nLevel.."<color> råi, kh«ng thÓ nhËn l¹i!", 0)
		return
	end

	local nCellNeed = 0
	for i = 1, getn(tbItems) do
		local nType = tbItems[i][1]
		local nSL = tbItems[i][3]
		
		if nType == 0 then
			nCellNeed = nCellNeed + nSL
		else
			local nO = floor(nSL / 100)
			if mod(nSL, 100) > 0 then
				nO = nO + 1
			end
			nCellNeed = nCellNeed + nO
		end
	end

	if CalcFreeItemCellCount() < nCellNeed then
		Say("Hµnh trang cña ng­¬i cÇn tèi thiÓu <color=yellow>"..nCellNeed.." « trèng<color> ®Ó nhËn th­ëng mèc nµy!", 0)
		return
	end

	for i = 1, getn(tbItems) do
		local nType = tbItems[i][1]
		local nID = tbItems[i][2]
		local nSL = tbItems[i][3]
		
		if nType == 0 then
			-- D? lo?i 0 (Trang b?): Không khóa ? m?c 30 và 90
			local bLockEquip = true
			if nLevel == 30 or nLevel == 90 then
				bLockEquip = false
			end
			
			for j = 1, nSL do
				local nItemIdx = AddGoldItem(0, nID)
				if nItemIdx > 0 and bLockEquip then
					SetItemBindState(nItemIdx, -2)
				end
			end
		else
			-- D? lo?i 6 (V?t ph?m x?p ch?ng): Cho phép x?p ch?ng t? nhiên r?i m?i khóa
			local tbStackedIndices = {}
			for j = 1, nSL do
				local nItemIdx = AddItem(nType, 1, nID, 1, 0, 0)
				if nItemIdx > 0 then
					-- Luu l?i ID c?a ô (stack) d? khóa
					local bExists = false
					for k = 1, getn(tbStackedIndices) do
						if tbStackedIndices[k] == nItemIdx then
							bExists = true
							break
						end
					end
					if not bExists then
						tinsert(tbStackedIndices, nItemIdx)
					end
				end
			end
			
			-- Ti?n hành khóa toàn b? các stack dã luu (Khóa vinh vi?n)
			for k = 1, getn(tbStackedIndices) do
				SetItemBindState(tbStackedIndices[k], -2)
			end
		end
	end

	nTaskVal = SetBit(nTaskVal, nBit, 1)
	SetTask(TASK_NEWBIE_REWARD, nTaskVal)

	Msg2Player("Chóc mõng ng­¬i ®· nhËn thµnh c«ng phÇn th­ëng cÊp "..nLevel.."!")
end

-- ==========================================
-- TÍNH NANG 2: H?Y V?T PH?M B? KHÓA
-- ==========================================
function xoa_item_khoa_menu()
	Say("VËt phÈm khi ®· ®­a vµo ®Ó huû th× <color=red>kh«ng thÓ phôc håi<color>. Ng­¬i cã ch¾c ch¾n muèn huû vËt phÈm chø?", 2,
		"Ta ch¾c ch¾n, tiÕn hµnh huû/xoa_item_khoa_ui",
		"§Ó ta suy nghÜ l¹i/no"
	)
end

function xoa_item_khoa_ui()
	GiveItemUI("Huû vËt phÈm", "H·y ®Æt vËt phÈm cÇn huû vµo ®©y:", "xoa_item_khoa_ok", "xoa_item_khoa_cancel", 1)
end

function xoa_item_khoa_ok(nCount)
	if nCount == nil or nCount <= 0 then
		Msg2Player("Ng­¬i ch­a ®Æt vËt phÈm nµo vµo!")
		return
	end

	local nDeleted = 0
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		if nItemIndex and nItemIndex > 0 then
			RemoveItemByIndex(nItemIndex) 
			nDeleted = nDeleted + 1
		end
	end

	if nDeleted > 0 then
		Msg2Player("§· huû thµnh c«ng "..nDeleted.." vËt phÈm!")
	end
end

function xoa_item_khoa_cancel()
end

function no()
end

-- ==========================================
-- TÍNH NANG 3: NHAN CÈM NANG Vµ LÖNH BµI
-- ==========================================

function camnangtanthu()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(6,1,4258,1,0,0)
    Msg2Player("Nhan Cam Nang Tan Thu thanh cong!")
end

function camnanghanhtau()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(6,1,4391,1,0,0)
    Msg2Player("Nhan Cam Nang Hanh Tau thanh cong!")
end

function lenhbaiquaivat()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(6,1,4946,1,0,0)
    Msg2Player("Nhan 1 Lenh Bai Quai Vat!")
end

function lenhbaigmboss()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(6,1,2526,1,0,0)
    Msg2Player("Nhan 1 Lenh Bai GM BOSS!")
end

function visondao()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(6,1,2432,1,0,0)
    Msg2Player("Nhan 1 Lenh Bai Vi S¬n §¶o!")
end

function tuicankhon()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(6,1,5171,1,0,0)
    Msg2Player("Nhan 1 Tói cµn kh«n!")
end

function matnavuonggia()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(0,11,561,1,0,0)
    Msg2Player("Nhan 1 c¸i mÆt n¹ v­¬ng gi¶!")
end

function matnavip()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(0,11,839,1,0,0)
    Msg2Player("Nhan 1 c¸i mÆt n¹ VIP!")
end

function thanhanhphu()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(6,1,1266,1,0,0)
    Msg2Player("Nhan 1 tÊm thÇn hµnh phï")
end

function thodiaphu()
    if CalcFreeItemCellCount() < 1 then
        Say("Hanh trang khong du o trong!",0)
        return
    end
    AddItem(6,1,438,1,0,0)
    Msg2Player("Nhan 1 tÊm thæ ®Þa phï")
end