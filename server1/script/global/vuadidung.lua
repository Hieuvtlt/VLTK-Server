------------------------------------------------------------------------------
-- NPC CHUC NANG NANG CAP MAT NA (CHUAN FONT TCVN3 CUA VLTK)
------------------------------------------------------------------------------

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\system\\task_string.lua")

------------------------------------------------------------------------------
-- ID NGUYEN LIEU & TRANG BI
------------------------------------------------------------------------------
nDiDungThachID = 5126
nNguHanhKyThachID = 5127

nMinMatNaID = 4493
nMaxMatNaID = 4502

------------------------------------------------------------------------------
-- TEN 10 BAC MAT NA (lay tu settings/item/goldequip.txt dong 4493-4502)
------------------------------------------------------------------------------
tbMatNaName = {
    [4493] = "T©n Thñ",
    [4494] = "S¬ NhËp",
    [4495] = "Tinh Anh",
    [4496] = "§¹i Thµnh",
    [4497] = "Cao Thñ",
    [4498] = "T«ng S­",
    [4499] = "§¹i T«ng S­",
    [4500] = "TruyÒn ThuyÕt",
    [4501] = "ChÝ T«n",
    [4502] = "V« Song",
}

------------------------------------------------------------------------------
-- CAP NHAN VAT MA TUNG BAC MAT NA DOI HOI
-- Lay tu settings/item/004/goldequip.txt cot 35 (loai yeu cau 36 = cap do).
-- Sua o goldequip thi PHAI sua ca bang nay cho khop.
------------------------------------------------------------------------------
tbMatNaLevel = {
    [4493] = 60,
    [4494] = 70,
    [4495] = 80,
    [4496] = 90,
    [4497] = 100,
    [4498] = 110,
    [4499] = 120,
    [4500] = 130,
    [4501] = 140,
    [4502] = 150,
}

-- Nguoi da bam Dong y vuot cap (theo tung nguoi choi)
tbDaDongYVuotCapMatNa = tbDaDongYVuotCapMatNa or {}

------------------------------------------------------------------------------
-- CANH BAO NANG CAP VUOT CAP DO NHAN VAT
------------------------------------------------------------------------------
function VDD_CanhBaoVuotCap(nCapMatNa, nCapNguoi, nIDMoi)
    local szMsg = "<color=red>C¶nh b¸o<color><enter><enter>"
    szMsg = szMsg .. "<color=yellow>Tiªu Dao HuyÔn DiÖn (" .. tbMatNaName[nIDMoi] .. ")<color><enter>"
    szMsg = szMsg .. "®ßi <color=yellow>cÊp " .. nCapMatNa .. "<color>, ng­¬i míi <color=red>cÊp " .. nCapNguoi .. "<color>.<enter><enter>"
    szMsg = szMsg .. "N©ng xong ng­¬i vÉn ch­a ®eo ®­îc nã,<enter>"
    szMsg = szMsg .. "ph¶i ®îi ®ñ cÊp. Nguyªn liÖu th× mÊt råi.<enter><enter>"
    szMsg = szMsg .. "<color=gray>BÊm §ång ý råi ®Æt l¹i nguyªn liÖu<enter>"
    szMsg = szMsg .. "mét lÇn n÷a ®Ó n©ng cÊp.<color>"
    local tbOpt = {
        {"§ång ý, ta cø n©ng cÊp", VDD_DongYVuotCap},
        {"§Ó ta suy nghÜ l¹i", ketthuc},
    }
    CreateNewSayEx(szMsg, tbOpt)
end

function VDD_DongYVuotCap()
    tbDaDongYVuotCapMatNa[PlayerIndex] = 1
    nangcap_matna()
end

------------------------------------------------------------------------------
-- BANG NGUYEN LIEU NANG CAP MAT NA
-- Format: [Current_Mask_ID] = {DiDungThach_Count, NguHanhKyThach_Count, Next_Mask_ID}
------------------------------------------------------------------------------
tbUpgradeMatNaReq = {
    [4493] = {5,   0, 4494}, 
    [4494] = {15,  0, 4495}, 
    [4495] = {20,  0, 4496}, 
    [4496] = {60,  0, 4497}, 
    [4497] = {120, 0, 4498}, 
    [4498] = {220, 0, 4499}, 
    [4499] = {360, 1, 4500}, 
    [4500] = {500, 2, 4501}, 
    [4501] = {700, 4, 4502}, 
}

------------------------------------------------------------------------------
-- HAM HO TRO CHECK NGUYEN LIEU
------------------------------------------------------------------------------
function GetMatNaMaterialCount(nCount)
    local nDiDungThach, nNguHanhKyThach = 0, 0

    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        if nItemIndex and nItemIndex > 0 then
            local g, d, p, l = GetItemProp(nItemIndex)
            local nStack = GetItemStackCount(nItemIndex)
            if not nStack or nStack <= 0 then nStack = 1 end

            if g == 6 and d == 1 then
                if p == nDiDungThachID then 
                    nDiDungThach = nDiDungThach + nStack
                elseif p == nNguHanhKyThachID then 
                    nNguHanhKyThach = nNguHanhKyThach + nStack
                end
            end
        end
    end
    return nDiDungThach, nNguHanhKyThach
end

function RemoveGiveItems(nCount)
    for i = 1, nCount do
        RemoveItemByIndex(GetGiveItemUnit(i))
    end
end

------------------------------------------------------------------------------
-- MAIN NPC
------------------------------------------------------------------------------
function main()
    local nNpcIndex = GetLastDiagNpc()
    local szNpcName = GetNpcName(nNpcIndex)

    if NpcName2Replace then
        szNpcName = NpcName2Replace(szNpcName)
    end

    local tbDailog = DailogClass:new(szNpcName)

    EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
    G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)

    tbDailog.szTitleMsg = "Ta cã thÓ gióp ®¹i hiÖp n©ng cÊp MÆt N¹."

    tbDailog:AddOptEntry("1. N©ng cÊp MÆt N¹", nangcap_matna)
    tbDailog:AddOptEntry("2. Xem ®iÒu kiÖn n©ng cÊp", xemdieukien_matna)
    tbDailog:AddOptEntry("KÕt thóc", ketthuc)

    tbDailog:Show()
end

------------------------------------------------------------------------------
-- BANG DIEU KIEN NANG CAP MAT NA (giong ben hoanbaocau)
-- Xuong dong trong hoi thoai JX1 la the <enter>, KHONG phai 

------------------------------------------------------------------------------
function xemdieukien_matna()
    local n1 = CalcEquiproomItemCount(6, 1, nDiDungThachID, -1)
    local n2 = CalcEquiproomItemCount(6, 1, nNguHanhKyThachID, -1)

    local szMsg = "<color=yellow>B¶ng n©ng cÊp MÆt N¹<color><enter>"
    szMsg = szMsg .. "§ang mang: <color=green>" .. n1 .. "<color> DÞ Dung Th¹ch,<enter>"
    szMsg = szMsg .. "<color=green>" .. n2 .. "<color> Ngò Hµnh Kú Th¹ch<enter><enter>"

    for i = nMinMatNaID, nMaxMatNaID - 1 do
        local tb = tbUpgradeMatNaReq[i]
        if tb then
            szMsg = szMsg .. tbMatNaName[i] .. " > " .. tbMatNaName[tb[3]]
            szMsg = szMsg .. ": " .. tb[1] .. " / " .. tb[2] .. "<enter>"
        end
    end

    szMsg = szMsg .. "<enter><color=cyan>Thø tù: DÞ Dung Th¹ch /<enter>"
    szMsg = szMsg .. "Ngò Hµnh Kú Th¹ch<color><enter>"
    szMsg = szMsg .. "<color=gray>§Æt d­ còng ®­îc, ta chØ lÊy ®ñ<enter>"
    szMsg = szMsg .. "phÇn cÇn vµ tr¶ l¹i phÇn thõa.<color>"

    CreateNewSayEx(szMsg, {{"Ta ®· râ", ketthuc}})
end

function ketthuc()
end

------------------------------------------------------------------------------
-- NANG CAP MAT NA
------------------------------------------------------------------------------
function nangcap_matna()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    -- [23/09/2026] Tham so thu 5 = 1 cho phep dat vat pham DA KHOA vao o.
    -- Thieu no thi engine bao "khong the nang cap vat pham bi khoa".
    -- hoanbaocau.lua da lam vay tu truoc, nen ngua khoa van nang cap duoc.
    g_GiveItemUI("N©ng CÊp MÆt N¹", "§Æt MÆt N¹ vµ nguyªn liÖu vµo ®©y.", {xuly_nangcap_matna}, {ketthuc}, 1)
end

function xuly_nangcap_matna(nCount)
    if not nCount or nCount < 2 then 
        return Msg2Player("MÆt n¹ nµy kh«ng thÓ n©ng cÊp!") 
    end

    local nEquipIndex, nGoldID = 0, 0
    
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        if nItemIndex and nItemIndex > 0 then
            local g, d, p, l = GetItemProp(nItemIndex)
            if not (g == 6 and d == 1) then
                local nTempID = GetGlodEqIndex(nItemIndex)
                if nTempID >= nMinMatNaID and nTempID <= nMaxMatNaID then
                    if nEquipIndex ~= 0 then 
                        return Msg2Player("MÆt n¹ nµy kh«ng thÓ n©ng cÊp!") 
                    end
                    nEquipIndex, nGoldID = nItemIndex, nTempID
                else
                    return Msg2Player("MÆt n¹ nµy kh«ng thÓ n©ng cÊp!")
                end
            end
        end
    end

    if nEquipIndex == 0 then 
        return Msg2Player("MÆt n¹ nµy kh«ng thÓ n©ng cÊp!") 
    end
    
    if nGoldID == nMaxMatNaID then 
        return Msg2Player("MÆt n¹ nµy kh«ng thÓ n©ng cÊp!") 
    end

    local tbReq = tbUpgradeMatNaReq[nGoldID]
    local nDiDung, nNguHanh = GetMatNaMaterialCount(nCount)

    if nDiDung < tbReq[1] or nNguHanh < tbReq[2] then
        Msg2Player(
            format(
                "CÇn %d DÞ Dung Th¹ch, %d Ngò Hµnh Kú Th¹ch. §ang cã %d, %d.",
                tbReq[1],
                tbReq[2],
                nDiDung,
                nNguHanh
            )
        )
        return
    end

    -- ===== CANH BAO VUOT CAP =====
    -- Giong hoanbaocau.lua: canh bao -> khong tru gi -> nguoi choi dat lai.
    local nCapNguoi = GetLevel()
    local nCapMatNa = tbMatNaLevel[tbReq[3]] or 0
    if nCapMatNa > nCapNguoi and tbDaDongYVuotCapMatNa[PlayerIndex] ~= 1 then
        VDD_CanhBaoVuotCap(nCapMatNa, nCapNguoi, tbReq[3])
        return
    end
    tbDaDongYVuotCapMatNa[PlayerIndex] = nil

    -- Tru DUNG phan can, tra lai phan thua (cung cach voi hoanbaocau.lua)
    local nConLaiDiDung = tbReq[1]
    local nConLaiNguHanh = tbReq[2]

    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        if nItemIndex and nItemIndex > 0 then
            if nItemIndex == nEquipIndex then
                RemoveItemByIndex(nItemIndex)
            else
                local g, d2, p, l = GetItemProp(nItemIndex)
                local nStack = GetItemStackCount(nItemIndex)
                if not nStack or nStack <= 0 then nStack = 1 end

                local nCan = 0
                if p == nDiDungThachID then nCan = nConLaiDiDung
                elseif p == nNguHanhKyThachID then nCan = nConLaiNguHanh
                end

                if nCan >= nStack then
                    RemoveItemByIndex(nItemIndex)
                    nCan = nStack
                elseif nCan > 0 then
                    SetItemStackCount(nItemIndex, nStack - nCan)
                end

                if p == nDiDungThachID then nConLaiDiDung = nConLaiDiDung - nCan
                elseif p == nNguHanhKyThachID then nConLaiNguHanh = nConLaiNguHanh - nCan
                end
            end
        end
    end
    local nIdxMatNa = AddGoldItem(0, tbReq[3])
    if nIdxMatNa ~= nil and nIdxMatNa > 0 then SetItemBindState(nIdxMatNa, -2) end
    Msg2Player("N©ng cÊp MÆt N¹ thµnh c«ng!")
end