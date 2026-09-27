--==================================================
-- TUI TRANG BI RANDOM 3 CAP
-- 5135 = trang bi cap 1 -> 5
-- 5136 = trang bi cap 6 -> 9
-- 5137 = trang bi cap 10
--
-- Moi lan mo tui chi nhan 1 mon.
--
-- Luu y:
-- tbProp = {0, DetailType, ParticularType, Level, Series, Luck}
-- tbParam = cac gia tri option theo format server cua ban.
--==================================================

Include("\\script\\dailogsys\\dailogsay.lua")

--==================================================
-- CAU HINH TUI
--==================================================
TUI_5135 = 5135
TUI_5136 = 5136
TUI_5137 = 5137

--==================================================
-- DANH SACH TRANG BI
--
-- Moi dong:
-- { "Ten", DetailType, ParticularType, Level }
--
-- Du lieu duoi day dung theo mau ban da gui:
-- Kiem: 0,0,0, cap 1-10
--
-- Sau khi test duoc co che mo tui, ban co the
-- thay bo sung danh sach cac loai trang bi khac.
--==================================================

tbKiem = {
    {"Thiet Truy ThU", 0, 0, 1},
    {"Cang Kiem",       0, 0, 2},
    {"Thanh Phong Kiem",0, 0, 3},
    {"Long Tuyen Kiem", 0, 0, 4},
    {"Tram Ma Kiem",    0, 0, 5},
    {"O Kim Kiem",      0, 0, 6},
    {"Xi Khiep",        0, 0, 7},
    {"That Xich Kiem",  0, 0, 8},
    {"Thien Nhan Kiem", 0, 0, 9},
    {"Huyen Thiet Kiem",0, 0, 10},
}

--==================================================
-- TAM THOI DUNG THEM 1 LOAI DE TEST:
-- Ao: 0,2, cap 1-10
--
-- Ban co the them cac loai khac vao day.
--==================================================

tbAo = {
    {"Sa Di Phuc",       0, 2, 1},
    {"Dao Si Vo Bao",    0, 2, 2},
    {"Can Y",             0, 2, 3},
    {"Tho Bo Truong Bao",0, 2, 4},
    {"Lan Bo Y",          0, 2, 5},
    {"Ao Vai Tho",       0, 2, 6},
    {"Sa Di Phuc",       0, 2, 7},
    {"Nu Thuc Dao Y",    0, 2, 8},
    {"Thuc Cam Y",       0, 2, 9},
    {"Cam Sam",          0, 2, 10},
}

--==================================================
-- GOM DANH SACH
--==================================================
tbTrangBi = {}

for i = 1, getn(tbKiem) do
    tinsert(tbTrangBi, tbKiem[i])
end

for i = 1, getn(tbAo) do
    tinsert(tbTrangBi, tbAo[i])
end

--==================================================
-- RANDOM
--==================================================
function TuiTB_Random(nMin, nMax)
    return random(nMin, nMax)
end

--==================================================
-- XAC DINH CAP TUI
--==================================================
function TuiTB_GetRange(nItemID)
    if nItemID == TUI_5135 then
        return 1, 5
    elseif nItemID == TUI_5136 then
        return 6, 9
    elseif nItemID == TUI_5137 then
        return 10, 10
    end

    return nil, nil
end

--==================================================
-- TIM TRANG BI PHU HOP CAP
--==================================================
function TuiTB_GetRandomEquip(nMinLevel, nMaxLevel)
    local tbList = {}

    for i = 1, getn(tbTrangBi) do
        local tbEquip = tbTrangBi[i]

        if tbEquip[4] >= nMinLevel and tbEquip[4] <= nMaxLevel then
            tinsert(tbList, tbEquip)
        end
    end

    if getn(tbList) <= 0 then
        return nil
    end

    local nIndex = random(1, getn(tbList))
    return tbList[nIndex]
end

--==================================================
-- TAO TRANG BI
--
-- Cap 10 dung mau ban dua:
-- tbProp = {0,0,0,10,random(0,4),25}
-- tbParam = {10,10,10,10,10,10}
--
-- Cap 1-9 cung dung co che, chi thay Level.
--==================================================
function TuiTB_CreateEquip(tbEquip)
    local szName       = tbEquip[1]
    local nDetailType  = tbEquip[2]
    local nParticular  = tbEquip[3]
    local nLevel       = tbEquip[4]

    local nSeries = random(0, 4)
    local nLuck = 25

    local tbProp = {
        0,
        nDetailType,
        nParticular,
        nLevel,
        nSeries,
        nLuck
    }

    local tbParam = {
        10,10,10,10,10,10
    }

    --==================================================
    -- PHAN TAO ITEM
    --
    -- Day la ham test theo he thong AddItem ma ban
    -- dang dung trong file cu.
    --==================================================
    AddItem(
        tbProp[1],
        tbProp[2],
        tbProp[3],
        tbProp[4],
        tbProp[5],
        tbProp[6],
        tbParam[1]
    )

    return szName, nLevel
end

--==================================================
-- MO TUI
--==================================================
function TuiTB_Open(nItemID)
    local nMinLevel, nMaxLevel = TuiTB_GetRange(nItemID)

    if not nMinLevel then
        return 0
    end

    -- Tim item truoc, neu khong co thi KHONG xoa tui
    local tbEquip = TuiTB_GetRandomEquip(nMinLevel, nMaxLevel)

    if not tbEquip then
        Msg2Player("Khong tim thay trang bi phu hop de mo tui!")
        return 0
    end

    -- Tao trang bi
    local szName, nLevel = TuiTB_CreateEquip(tbEquip)

    -- Xoa 1 tui sau khi tao thanh cong
    -- Neu core cua ban khong ho tro ham nay,
    -- thay bang ham xoa item theo index cua server.
    --
    -- Neu script item cua ban truyen nItemIdx:
    -- DelItemByIndex(nItemIdx, 1)

    Msg2Player(format("Ban mo tui nhan duoc: %s - cap %d", szName, nLevel))

    return 1
end

--==================================================
-- HO TRO 2 KIEU ITEM SCRIPT THUONG GAP
--==================================================
function OnUse(nItemID)
    return TuiTB_Open(nItemID)
end

function main(nItemID)
    return TuiTB_Open(nItemID)
end
