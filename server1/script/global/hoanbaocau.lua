------------------------------------------------------------------------------
-- hoanbaocau.lua
-- Nang cap Ngua Hoang Kim 5433 -> 5442
------------------------------------------------------------------------------

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\system\\task_string.lua")

-- GIU TABLE O PHAM VI GLOBAL DE TUONG THICH VOI SOURCE CU
tbUpgradeReq = {
    -- Can bang lai 19/09/2026: muc tieu hoan thanh Mua 1 trong ~45 ngay.
    -- Cot 1 (That Tinh Thao) GIU NGUYEN - mua bang ngan luong, nguon doi dao.
    -- Cot 2 (Van Nien) va cot 3 (Ca Rot) ha xuong con ~1/4.
    -- {That Tinh Thao, Van Nien Tinh Thao, Ca Rot, ID ngua ke tiep}
    [5433] = {10,   0,   0,   5434},
    [5434] = {20,   10,  0,   5435},
    [5435] = {40,   15,  5,   5436},
    [5436] = {80,   25,  10,  5437},
    [5437] = {160,  40,  15,  5438},
    [5438] = {320,  60,  25,  5439},
    [5439] = {640,  90,  35,  5440},
    [5440] = {999,  125, 50,  5441},
    [5441] = {999,  175, 70,  5442},
}

-- Ten hien thi cua tung cap ngua
-- ID trong Lua tuong ung dong Excel + 1
tbHorseName = {
    [5433] = "TiÓu b¹ch m·",
    [5434] = "ChiÕu D¹",
    [5435] = "Phi V©n",
    [5436] = "B«n Tiªu",
    [5437] = "Du Huy",
    [5438] = "XÝch Long",
    [5439] = "§»ng Vô",
    [5440] = "Phiªu Vò",
    [5441] = "Siªu Quang",
    [5442] = "TuyÖt §Þa Ho¶ V­¬ng",
}

nMinHorseID = 5433
nMaxHorseID = 5442

nDryGrassID = 5118
nFreshGrassID = 5119
nCarrotID = 5120

------------------------------------------------------------------------------
-- CAP DO YEU CAU CUA TUNG CON NGUA (cot AJ cua settings/item/goldequip.txt)
-- Sua o goldequip thi phai sua lai bang nay.
------------------------------------------------------------------------------
-- Lay tu settings/item/004/goldequip.txt (ban 004 moi la ban dang dung),
-- KHONG phai tu goldequip.txt goc - hai ban lech nhau o 34 dong.
tbHorseLevel = {
    [5433] = 60,  [5434] = 80,  [5435] = 90,  [5436] = 100, [5437] = 110,
    [5438] = 120, [5439] = 130, [5440] = 140, [5441] = 150, [5442] = 150,
}

-- Nguoi da bam Dong y vuot cap (theo tung nguoi choi)
tbDaDongYVuotCap = tbDaDongYVuotCap or {}

------------------------------------------------------------------------------
-- MA NGOAI HINH (cot 1 cua settings/item/goldequipres.txt, tra theo ID)
-- Dua vao SetItemNewFeature(idx, ma). Dung -1 de tra ve ngoai hinh goc.
------------------------------------------------------------------------------
tbHorseRes = {
    -- Ma hinh dang cho SetItemNewFeature. DO TRONG GAME 19/09/2026,
    -- da xac nhan CA 10 con doi dung hinh dang huyet mach.
    -- Bang goc cua tac gia lech deu -2 o moi dong, da sua het.
    -- ! KHONG suy tu horseres.txt: bang do mo ta mot he danh so khac.
    [5433] = 78,   -- Tieu bach ma
    [5434] = 79,   -- Chieu Da
    [5435] = 80,   -- Phi Van
    [5436] = 81,   -- Bon Tieu
    [5437] = 82,   -- Du Huy
    [5438] = 83,   -- Xich Long
    [5439] = 84,   -- Dang Vu
    [5440] = 85,   -- Phieu Vu
    [5441] = 86,   -- Sieu Quang
    [5442] = 87,   -- Tuyet Dia Hoa Vuong
}

-- Ngoai hinh nguoi choi vua chon (chua ap dung)
tbChonHinhDang = tbChonHinhDang or {}

------------------------------------------------------------------------------
-- MAIN: GIU NGUYEN CACH CUA BAN DA TEST THANH CONG
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

    tbDailog.szTitleMsg = "Hoµng B¶o C©u: §©y lµ hËu duÖ cña <color=yellow>TuyÖt §Þa Ho¶ V­¬ng<color> trong truyÒn thuyÕt nÕu cung cÊp ®ñ nguyªn liÖu ta sÏ gióp ®¹i hiÖp khai ph¸ huyÕt m¹ch cña nã."

    tbDailog:AddOptEntry("PhiÒn ngµi khai ph¸ huyÕt m¹ch", nangcapngua)
    tbDailog:AddOptEntry("Xem ®iÒu kiÖn th¨ng cÊp", xemdieukien)
    tbDailog:AddOptEntry("Thay ®æi h×nh d¹ng", HBC_MenuHinhDang)
    tbDailog:AddOptEntry("Ta kh«ng tin", ketthuc)

    tbDailog:Show()
end

------------------------------------------------------------------------------
-- CANH BAO NANG CAP VUOT CAP DO NHAN VAT
------------------------------------------------------------------------------
function HBC_CanhBaoVuotCap(nCapNgua, nCapNguoi, nIDMoi)
    local szMsg = "<color=red>C¶nh b¸o<color><enter><enter>"
    szMsg = szMsg .. "<color=yellow>" .. tbHorseName[nIDMoi] .. "<color> ®ßi <color=yellow>cÊp " .. nCapNgua .. "<color>,<enter>"
    szMsg = szMsg .. "ng­¬i míi <color=red>cÊp " .. nCapNguoi .. "<color>.<enter><enter>"
    szMsg = szMsg .. "Khai ph¸ xong ng­¬i vÉn ch­a c­ìi ®­îc nã,<enter>"
    szMsg = szMsg .. "ph¶i ®îi ®ñ cÊp. Nguyªn liÖu th× mÊt råi.<enter><enter>"
    szMsg = szMsg .. "<color=gray>BÊm §ång ý råi ®Æt l¹i nguyªn liÖu<enter>"
    szMsg = szMsg .. "mét lÇn n÷a ®Ó khai ph¸.<color>"
    local tbOpt = {
        {"§ång ý, ta cø khai ph¸", HBC_DongYVuotCap},
        {"§Ó ta suy nghÜ l¹i", ketthuc},
    }
    CreateNewSayEx(szMsg, tbOpt)
end

function HBC_DongYVuotCap()
    tbDaDongYVuotCap[PlayerIndex] = 1
    nangcapngua()
end

------------------------------------------------------------------------------
-- THAY DOI HINH DANG
-- Chi cho mang ngoai hinh cua ngua BANG hoac THAP hon con dang co.
-- Chon ngoai hinh TRUOC roi moi dat ngua vao: chi so vat pham cua GiveItemUI
-- chi song trong lan goi lai, khong giu qua duoc.
------------------------------------------------------------------------------
function HBC_MenuHinhDang()
    local szMsg = "<color=yellow>Thay ®æi h×nh d¹ng<color><enter><enter>"
    szMsg = szMsg .. "Ta cã thÓ kho¸c cho ngùa ng­¬i d¸ng vÎ cña<enter>"
    szMsg = szMsg .. "mét con ®êi thÊp h¬n. Søc vãc gi÷ nguyªn,<enter>"
    szMsg = szMsg .. "chØ c¸i m· bªn ngoµi lµ ®æi.<enter><enter>"
    szMsg = szMsg .. "<color=gray>Chän d¸ng tr­íc, råi ®Æt ngùa vµo.<color>"
    local tbOpt = {}
    local i
    for i = nMinHorseID, nMaxHorseID do
        tbOpt[getn(tbOpt)+1] = {tbHorseName[i], HBC_ChonHinhDang, {i}}
    end
    tbOpt[getn(tbOpt)+1] = {"Tr¶ l¹i d¸ng gèc", HBC_ChonHinhDang, {-1}}
    tbOpt[getn(tbOpt)+1] = {"Th«i", ketthuc}
    CreateNewSayEx(szMsg, tbOpt)
end

function HBC_ChonHinhDang(nID)
    tbChonHinhDang[PlayerIndex] = nID
    -- Dung GiveItemUI goc + tham so 1 o cuoi de cho phep bo ngua DA KHOA
    GiveItemUI(
        "Thay ®æi h×nh d¹ng",
        "§Æt con ngùa cÇn ®æi d¸ng vµo ®©y.",
        "HBC_XuLyHinhDang",
        "ketthuc",
        1
    )
end

function HBC_XuLyHinhDang(nCount)
    local nChon = tbChonHinhDang[PlayerIndex]
    tbChonHinhDang[PlayerIndex] = nil
    if not nChon then return end
    if not nCount or nCount ~= 1 then
        Msg2Player("<color=red>ChØ ®Æt ®óng mét con ngùa th«i.<color>") return
    end

    local nItemIndex = GetGiveItemUnit(1)
    if not nItemIndex or nItemIndex <= 0 then return end

    local nGoldID = GetGlodEqIndex(nItemIndex)
    if nGoldID < nMinHorseID or nGoldID > nMaxHorseID then
        Msg2Player("<color=red>§©y kh«ng ph¶i hËu duÖ TuyÖt §Þa Ho¶ V­¬ng.<color>") return
    end

    if nChon == -1 then
        SetItemNewFeature(nItemIndex, -1)
        Msg2Player("<color=yellow>§· tr¶ l¹i d¸ng gèc cho " .. tbHorseName[nGoldID] .. ".<color>")
        return
    end

    if nChon > nGoldID then
        Msg2Player("<color=red>" .. tbHorseName[nGoldID] .. " ch­a ®ñ t­ c¸ch mang<enter>"
            .. "d¸ng cña " .. tbHorseName[nChon] .. ".<enter>ChØ m­în ®­îc d¸ng ®êi thÊp h¬n.<color>")
        return
    end

    SetItemNewFeature(nItemIndex, tbHorseRes[nChon])
    Msg2Player("<color=yellow>" .. tbHorseName[nGoldID] .. " nay mang d¸ng " .. tbHorseName[nChon] .. ".<color>")
    Msg2Player("<color=gray>Xuèng ngùa råi c­ìi l¹i ®Ó thÊy.<color>")
end

function ketthuc()
end

function xemdieukien()
    local n1 = CalcEquiproomItemCount(6, 1, nDryGrassID, -1)
    local n2 = CalcEquiproomItemCount(6, 1, nFreshGrassID, -1)
    local n3 = CalcEquiproomItemCount(6, 1, nCarrotID, -1)

    local szMsg = "<color=yellow>B¶ng khai ph¸ huyÕt m¹ch<color><enter>"
    szMsg = szMsg .. "Nguyªn liÖu ®ang mang: " .. "<color=green>" .. n1 .. "<color> ThÊt Tinh Th¶o, <color=green>" .. n2 .. "<color> V¹n Niªn Tinh Th¶o, <color=green>" .. n3 .. "<color> Cµ Rèt §Æc BiÖt" .. "<enter><enter>"

    for i = nMinHorseID, nMaxHorseID - 1 do
        local tb = tbUpgradeReq[i]
        if tb then
            szMsg = szMsg .. tbHorseName[i] .. " -> " .. tbHorseName[tb[4]] .. ": " .. tb[1] .. " / " .. tb[2] .. " / " .. tb[3] .. "<enter>"
        end
    end

    szMsg = szMsg .. "<enter><color=cyan>Thø tù: ThÊt Tinh Th¶o / V¹n Niªn Tinh Th¶o / Cµ Rèt §Æc BiÖt<color><enter>"
    szMsg = szMsg .. "Cø ®Æt d­ còng ®­îc, ta chØ lÊy ®ñ phÇn cÇn vµ tr¶ l¹i phÇn thõa."

    CreateNewSayEx(szMsg, {{"Ta ®· râ", ketthuc}})
end


------------------------------------------------------------------------------
-- MO GIAO DIEN
------------------------------------------------------------------------------

function nangcapngua()
    if CalcFreeItemCellCount() < 1 then
        Msg2Player("Hanh trang khong du cho trong!")
        return
    end

    -- Dã d?i sang GiveItemUI g?c và thêm tham s? 1 ? cu?i d? cho phép b? d? khóa
    GiveItemUI(
        "Khai ph¸ huyÕt m¹ch",
        "§­a ngùa vµ thÇn d­îc vµo ®©y. §Æt d­ còng ®­îc, ta chØ lÊy ®ñ phÇn cÇn.",
        "xuly_nangcapngua",
        "ketthuc",
        1
    )
end

------------------------------------------------------------------------------
-- XU LY
------------------------------------------------------------------------------

function xuly_nangcapngua(nCount)
    if not nCount or nCount < 2 then
        Msg2Player("Ph¶i lµ hËu duÖ cña <color=yellow>TuyÖt §Þa Ho¶ V­¬ng<color> vµ cã kÌm nguyªn liÖu!")
        return
    end

    local nHorseIndex = 0
    local nHorseID = 0
    local nDryGrass = 0
    local nFreshGrass = 0
    local nCarrot = 0

    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)

        if not nItemIndex or nItemIndex <= 0 then
            Msg2Player("Khong doc duoc vat pham!")
            return
        end

        local g, d, p, l = GetItemProp(nItemIndex)
        local nStack = GetItemStackCount(nItemIndex)

        if not nStack or nStack <= 0 then
            nStack = 1
        end

        if g == 6 and d == 1 and p == nDryGrassID then
            nDryGrass = nDryGrass + nStack

        elseif g == 6 and d == 1 and p == nFreshGrassID then
            nFreshGrass = nFreshGrass + nStack

        elseif g == 6 and d == 1 and p == nCarrotID then
            nCarrot = nCarrot + nStack

        else
            local nGoldID = GetGlodEqIndex(nItemIndex)

            if nGoldID >= nMinHorseID and nGoldID <= nMaxHorseID then
                if nHorseIndex ~= 0 then
                    Msg2Player("Mçi lÇn ta chØ cã thÓ khai ph¸ mét con!")
                    return
                end

                nHorseIndex = nItemIndex
                nHorseID = nGoldID
            else
                Msg2Player("Vat pham khong hop le!")
                return
            end
        end
    end

    -- PHAT HIEN NGUA KHONG NAM TRONG 5433 -> 5442
    if nHorseIndex == 0 then
        Msg2Player("§©y kh«ng ph¶i lµ hËu duÖ cña <color=yellow>TuyÖt §Þa Ho¶ V­¬ng<color>!")
        return
    end

    if nHorseID < nMinHorseID or nHorseID > nMaxHorseID then
        Msg2Player("Ngua nay khong nam trong cap do duoc phep nang cap!")
        return
    end

    -- 5442 la cap cuoi
    if nHorseID == nMaxHorseID then
        Msg2Player("§©y lµ <color=yellow>TuyÖt §Þa Ho¶ V­¬ng<color> trong truyÒn thuyÕt!")
        return
    end

    -- LAY ARRAY THEO NGUA HIEN TAI
    local tbReq = tbUpgradeReq[nHorseID]

    if not tbReq then
        Msg2Player("Kh«ng ®ñ nguyªn liÖu thøc tØnh!")
        return
    end

    -- KIEM TRA CHINH XAC 3 NGUYEN LIEU
    if nDryGrass < tbReq[1]
        or nFreshGrass < tbReq[2]
        or nCarrot < tbReq[3] then

        Msg2Player(
            format(
                "Can %d ThÊt Tinh Th¶o, %d V¹n Niªn Tinh Th¶o, %d Ca Rot §Æc BiÖt. Hien tai %d, %d, %d.",
                tbReq[1],
                tbReq[2],
                tbReq[3],
                nDryGrass,
                nFreshGrass,
                nCarrot
            )
        )
        return
    end

    -- ID NGUA KE TIEP
    local nNextHorseID = tbReq[4]

    if nNextHorseID < nMinHorseID or nNextHorseID > nMaxHorseID then
        Msg2Player("ID ngua moi khong hop le!")
        return
    end

    --------------------------------------------------------------------------
    -- DUNG LOGIC BAN YEU CAU:
    --
    -- 5433 + 10 Co Kho
    -- -> Remove 5433 + nguyen lieu
    -- -> AddGoldItem(0, 5434)
    --------------------------------------------------------------------------

    -- Tru dung so nguyen lieu can dung, phan du giu nguyen trong hanh trang.
    -- ===== CANH BAO VUOT CAP =====
    -- Chi so vat pham cua GiveItemUI chi song trong lan goi nay, khong the
    -- hoi roi lam tiep, nen: canh bao -> khong tru gi -> nguoi choi dat lai.
    local nCapNguoi = GetLevel()
    local nCapNgua = tbHorseLevel[tbReq[4]] or 0
    if nCapNgua > nCapNguoi and tbDaDongYVuotCap[PlayerIndex] ~= 1 then
        HBC_CanhBaoVuotCap(nCapNgua, nCapNguoi, tbReq[4])
        return
    end
    tbDaDongYVuotCap[PlayerIndex] = nil

    local nConLai1 = tbReq[1]
    local nConLai2 = tbReq[2]
    local nConLai3 = tbReq[3]

    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        if nItemIndex and nItemIndex > 0 then
            if nItemIndex == nHorseIndex then
                RemoveItemByIndex(nItemIndex)
            else
                local g, d2, p, l = GetItemProp(nItemIndex)
                local nStack = GetItemStackCount(nItemIndex)
                if not nStack or nStack <= 0 then nStack = 1 end

                local nCan = 0
                if p == nDryGrassID then nCan = nConLai1
                elseif p == nFreshGrassID then nCan = nConLai2
                elseif p == nCarrotID then nCan = nConLai3
                end

                if nCan >= nStack then
                    RemoveItemByIndex(nItemIndex)
                    nCan = nStack
                elseif nCan > 0 then
                    SetItemStackCount(nItemIndex, nStack - nCan)
                end

                if p == nDryGrassID then nConLai1 = nConLai1 - nCan
                elseif p == nFreshGrassID then nConLai2 = nConLai2 - nCan
                elseif p == nCarrotID then nConLai3 = nConLai3 - nCan
                end
            end
        end
    end

    local nIdxNgua = AddGoldItem(0, nNextHorseID)
    if nIdxNgua ~= nil and nIdxNgua > 0 then SetItemBindState(nIdxNgua, -2) end

    local szOldHorseName = tbHorseName[nHorseID] or tostring(nHorseID)
    local szNewHorseName = tbHorseName[nNextHorseID] or tostring(nNextHorseID)

    Msg2Player(format(
        "Khai th«ng huyÕt m¹ch thµnh c«ng! %s -> %s.",
        szOldHorseName,
        szNewHorseName
    ))
end