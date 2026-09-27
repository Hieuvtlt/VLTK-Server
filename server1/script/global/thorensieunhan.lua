------------------------------------------------------------------------------
-- NPC NANG CAP TRANG SUC (VO DANH - CAN KHON - VO SONG)
-- Ho tro: Gioi Chi, Chi Hoan, Hang Lien, Ngoc Boi, Yeu Truy
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
-- ID NGUYEN LIEU
------------------------------------------------------------------------------
nThienKyThaoID          = 5121
nHoangPhuongNhatNgocID  = 5122
nCanKhonLienHoaID       = 5123
nBanCoThachID           = 5124
nCanKhonNhatThachID     = 5125

------------------------------------------------------------------------------
-- ID TRANG BI (NHAN & DAY CHUYEN)
------------------------------------------------------------------------------
nMinChiHoanID = 5443
nMaxChiHoanID = 5453
nMinGioiChiID = 5454
nMaxGioiChiID = 5464
nMinCanKhonID = 5465
nMaxCanKhonID = 5475
nVoSongID = 5476 -- Vo Song Gioi Chi

nMinHangLienID = 5478   -- Vo Danh Hang Lien
nMaxHangLienID = 5488   
nMinCKHangLienID = 5489 -- Can Khon Hang Lien
nMaxCKHangLienID = 5499 
nVoSongHangLienID = 5500 -- Vo Song Hang Lien

------------------------------------------------------------------------------
-- ID TRANG BI (NGOC BOI & YEU TRUY)
------------------------------------------------------------------------------
nMinNgocBoiID = 5501    -- Vo Danh Ngoc Boi
nMaxNgocBoiID = 5511
nMinCKNgocBoiID = 5512  -- Can Khon Ngoc Boi
nMaxCKNgocBoiID = 5522
nVoSongNgocBoiID = 5523 -- Vo Song Ngoc Boi

nMinYeuTruyID = 5524    -- Vo Danh Yeu Truy
nMaxYeuTruyID = 5534
nMinCKYeuTruyID = 5535  -- Can Khon Yeu Truy
nMaxCKYeuTruyID = 5545
nVoSongYeuTruyID = 5546 -- Vo Song Yeu Truy

------------------------------------------------------------------------------
-- BANG NGUYEN LIEU NANG CAP
------------------------------------------------------------------------------
-- 1. Nâng C?p Vô Danh: {Thiên K? Th?o, Hoàng Phu?ng Nh?t Ng?c, ID_Ti?p_Theo}
tbUpgradeRingReq = {
    [5443] = {1, 0, 5444}, [5444] = {1, 1, 5445}, [5445] = {2, 1, 5446}, [5446] = {2, 2, 5447}, [5447] = {3, 2, 5448},
    [5448] = {3, 3, 5449}, [5449] = {4, 3, 5450}, [5450] = {4, 4, 5451}, [5451] = {5, 4, 5452}, [5452] = {5, 5, 5453},
}

tbUpgradeGioiChiReq = {
    [5454] = {1, 0, 5455}, [5455] = {1, 1, 5456}, [5456] = {2, 1, 5457}, [5457] = {2, 2, 5458}, [5458] = {3, 2, 5459},
    [5459] = {3, 3, 5460}, [5460] = {4, 3, 5461}, [5461] = {4, 4, 5462}, [5462] = {5, 4, 5463}, [5463] = {5, 5, 5464},
}

tbUpgradeHangLienReq = {
    [5478] = {1, 0, 5479}, [5479] = {1, 1, 5480}, [5480] = {2, 1, 5481}, [5481] = {2, 2, 5482}, [5482] = {3, 2, 5483},
    [5483] = {3, 3, 5484}, [5484] = {4, 3, 5485}, [5485] = {4, 4, 5486}, [5486] = {5, 4, 5487}, [5487] = {5, 5, 5488},
}

tbUpgradeNgocBoiReq = {
    [5501] = {1, 0, 5502}, [5502] = {1, 1, 5503}, [5503] = {2, 1, 5504}, [5504] = {2, 2, 5505}, [5505] = {3, 2, 5506},
    [5506] = {3, 3, 5507}, [5507] = {4, 3, 5508}, [5508] = {4, 4, 5509}, [5509] = {5, 4, 5510}, [5510] = {5, 5, 5511},
}

tbUpgradeYeuTruyReq = {
    [5524] = {1, 0, 5525}, [5525] = {1, 1, 5526}, [5526] = {2, 1, 5527}, [5527] = {2, 2, 5528}, [5528] = {3, 2, 5529},
    [5529] = {3, 3, 5530}, [5530] = {4, 3, 5531}, [5531] = {4, 4, 5532}, [5532] = {5, 4, 5533}, [5533] = {5, 5, 5534},
}

-- 2. Nâng C?p Càn Khôn: {Càn Khôn Liên Hoa, Càn Khôn Nh?t Th?ch, ID_Ti?p_Theo}
tbUpgradeCanKhonReq = {
    [5465] = {1, 0, 5466}, [5466] = {1, 1, 5467}, [5467] = {2, 1, 5468}, [5468] = {2, 2, 5469}, [5469] = {3, 2, 5470},
    [5470] = {3, 3, 5471}, [5471] = {4, 3, 5472}, [5472] = {4, 4, 5473}, [5473] = {5, 4, 5474}, [5474] = {5, 5, 5475},
}

tbUpgradeCKHangLienReq = {
    [5489] = {1, 0, 5490}, [5490] = {1, 1, 5491}, [5491] = {2, 1, 5492}, [5492] = {2, 2, 5493}, [5493] = {3, 2, 5494},
    [5494] = {3, 3, 5495}, [5495] = {4, 3, 5496}, [5496] = {4, 4, 5497}, [5497] = {5, 4, 5498}, [5498] = {5, 5, 5499},
}

tbUpgradeCKNgocBoiReq = {
    [5512] = {1, 0, 5513}, [5513] = {1, 1, 5514}, [5514] = {2, 1, 5515}, [5515] = {2, 2, 5516}, [5516] = {3, 2, 5517},
    [5517] = {3, 3, 5518}, [5518] = {4, 3, 5519}, [5519] = {4, 4, 5520}, [5520] = {5, 4, 5521}, [5521] = {5, 5, 5522},
}

tbUpgradeCKYeuTruyReq = {
    [5535] = {1, 0, 5536}, [5536] = {1, 1, 5537}, [5537] = {2, 1, 5538}, [5538] = {2, 2, 5539}, [5539] = {3, 2, 5540},
    [5540] = {3, 3, 5541}, [5541] = {4, 3, 5542}, [5542] = {4, 4, 5543}, [5543] = {5, 4, 5544}, [5544] = {5, 5, 5545},
}

------------------------------------------------------------------------------
-- CAC HAM HO TRO CHECK NGUYEN LIEU CHUNG
------------------------------------------------------------------------------
function GetMaterialCount(nCount)
    local nThienKyThao, nHoangPhuong, nCanKhonLienHoa, nCanKhonNhatThach, nBanCoThach = 0, 0, 0, 0, 0

    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        if not nItemIndex or nItemIndex <= 0 then return end

        local g, d, p, l = GetItemProp(nItemIndex)
        local nStack = GetItemStackCount(nItemIndex)
        if not nStack or nStack <= 0 then nStack = 1 end

        if g == 6 and d == 1 then
            if p == nThienKyThaoID then nThienKyThao = nThienKyThao + nStack
            elseif p == nHoangPhuongNhatNgocID then nHoangPhuong = nHoangPhuong + nStack
            elseif p == nCanKhonLienHoaID then nCanKhonLienHoa = nCanKhonLienHoa + nStack
            elseif p == nCanKhonNhatThachID then nCanKhonNhatThach = nCanKhonNhatThach + nStack
            elseif p == nBanCoThachID then nBanCoThach = nBanCoThach + nStack
            end
        end
    end
    return nThienKyThao, nHoangPhuong, nCanKhonLienHoa, nCanKhonNhatThach, nBanCoThach
end

function RemoveGiveItems(nCount)
    for i = 1, nCount do
        RemoveItemByIndex(GetGiveItemUnit(i))
    end
end

------------------------------------------------------------------------------
-- MAIN NPC (MENU 3 MUC)
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

    tbDailog.szTitleMsg = "Ta cã thÓ gióp ®¹i hiÖp chÕ t¹o vµ n©ng cÊp c¸c lo¹i trang søc tuyÖt ®Ønh."

    tbDailog:AddOptEntry("1. Trang søc V« Danh", Menu_VoDanh)
    tbDailog:AddOptEntry("2. Trang søc Cµn Kh«n", Menu_CanKhon)
    tbDailog:AddOptEntry("3. Trang søc V« Song", Menu_VoSong)
    tbDailog:AddOptEntry("KÕt thóc", ketthuc)

    tbDailog:Show()
end

function ketthuc()
end

------------------------------------------------------------------------------
-- MENU CON: VO DANH
------------------------------------------------------------------------------
function Menu_VoDanh()
    local nNpcIndex = GetLastDiagNpc()
    local szNpcName = GetNpcName(nNpcIndex)
    if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end

    local tbDailog = DailogClass:new(szNpcName)
    tbDailog.szTitleMsg = "H·y chän lo¹i trang søc V« Danh ngµi muèn n©ng cÊp:"
    
    tbDailog:AddOptEntry("1. N©ng cÊp Tinh X¶o V« Danh ChØ Hoµn", nangcap_chihoan)
    tbDailog:AddOptEntry("2. N©ng cÊp Tinh X¶o V« Danh Giíi ChØ", nangcap_gioichi)
    tbDailog:AddOptEntry("3. N©ng cÊp Tinh X¶o V« Danh H¹ng Liªn", nangcap_hanglien)
    tbDailog:AddOptEntry("4. N©ng cÊp Tinh X¶o V« Danh Ngäc Béi", nangcap_ngocboi)
    tbDailog:AddOptEntry("5. N©ng cÊp Tinh X¶o V« Danh Yªu Trôy", nangcap_yeutruy)
    tbDailog:AddOptEntry("Quay l¹i", main)
    tbDailog:Show()
end

function nangcap_chihoan()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("N©ng CÊp ChØ Hoµn", "§Æt Tinh X¶o V« Danh ChØ Hoµn vµ nguyªn liÖu vµo ®©y.", {xuly_nangcap_chihoan}, {ketthuc})
end
function nangcap_gioichi()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("N©ng CÊp Giíi ChØ", "§Æt Tinh X¶o V« Danh Giíi ChØ vµ nguyªn liÖu vµo ®©y.", {xuly_nangcap_gioichi}, {ketthuc})
end
function nangcap_hanglien()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("N©ng CÊp H¹ng Liªn", "§Æt Tinh X¶o V« Danh H¹ng Liªn vµ nguyªn liÖu vµo ®©y.", {xuly_nangcap_hanglien}, {ketthuc})
end
function nangcap_ngocboi()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("N©ng CÊp Ngäc Béi", "§Æt Tinh X¶o V« Danh Ngäc Béi vµ nguyªn liÖu vµo ®©y.", {xuly_nangcap_ngocboi}, {ketthuc})
end
function nangcap_yeutruy()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("N©ng CÊp Yªu Trôy", "§Æt Tinh X¶o V« Danh Yªu Trôy vµ nguyªn liÖu vµo ®©y.", {xuly_nangcap_yeutruy}, {ketthuc})
end

function xuly_nangcap_chihoan(nCount) XuLyNangCapChung(nCount, nMinChiHoanID, nMaxChiHoanID, tbUpgradeRingReq, "Tinh X¶o V« Danh ChØ Hoµn") end
function xuly_nangcap_gioichi(nCount) XuLyNangCapChung(nCount, nMinGioiChiID, nMaxGioiChiID, tbUpgradeGioiChiReq, "Tinh X¶o V« Danh Giíi ChØ") end
function xuly_nangcap_hanglien(nCount) XuLyNangCapChung(nCount, nMinHangLienID, nMaxHangLienID, tbUpgradeHangLienReq, "Tinh X¶o V« Danh H¹ng Liªn") end
function xuly_nangcap_ngocboi(nCount) XuLyNangCapChung(nCount, nMinNgocBoiID, nMaxNgocBoiID, tbUpgradeNgocBoiReq, "Tinh X¶o V« Danh Ngäc Béi") end
function xuly_nangcap_yeutruy(nCount) XuLyNangCapChung(nCount, nMinYeuTruyID, nMaxYeuTruyID, tbUpgradeYeuTruyReq, "Tinh X¶o V« Danh Yªu Trôy") end

------------------------------------------------------------------------------
-- MENU CON: CAN KHON
------------------------------------------------------------------------------
function Menu_CanKhon()
    local nNpcIndex = GetLastDiagNpc()
    local szNpcName = GetNpcName(nNpcIndex)
    if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end

    local tbDailog = DailogClass:new(szNpcName)
    tbDailog.szTitleMsg = "H·y chän thao t¸c ®èi víi trang søc Cµn Kh«n:"
    
    tbDailog:AddOptEntry("1. ChÕ t¹o Cµn Kh«n Giíi ChØ", chetao_cankhon)
    tbDailog:AddOptEntry("2. N©ng cÊp Tinh X¶o Cµn Kh«n Giíi ChØ", nangcap_cankhon)
    tbDailog:AddOptEntry("3. ChÕ t¹o Cµn Kh«n H¹ng Liªn", chetao_ckhanglien)
    tbDailog:AddOptEntry("4. N©ng cÊp Tinh X¶o Cµn Kh«n H¹ng Liªn", nangcap_ckhanglien)
    tbDailog:AddOptEntry("5. ChÕ t¹o Cµn Kh«n Ngäc Béi", chetao_ckngocboi)
    tbDailog:AddOptEntry("6. N©ng cÊp Tinh X¶o Cµn Kh«n Ngäc Béi", nangcap_ckngocboi)
    tbDailog:AddOptEntry("7. ChÕ t¹o Cµn Kh«n Yªu Trôy", chetao_ckyeutruy)
    tbDailog:AddOptEntry("8. N©ng cÊp Tinh X¶o Cµn Kh«n Yªu Trôy", nangcap_ckyeutruy)
    tbDailog:AddOptEntry("Quay l¹i", main)
    tbDailog:Show()
end

function chetao_cankhon()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("ChÕ T¹o Cµn Kh«n", "§Æt Tinh X¶o V« Danh ChØ Hoµn & Giíi ChØ (CÊp 10) vµo.", {xuly_chetao_cankhon}, {ketthuc})
end
function nangcap_cankhon()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("N©ng CÊp Cµn Kh«n", "§Æt Tinh X¶o Cµn Kh«n Giíi ChØ vµ nguyªn liÖu.", {xuly_nangcap_cankhon}, {ketthuc})
end

function chetao_ckhanglien()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("ChÕ T¹o Cµn Kh«n", "§Æt 2 sîi Tinh X¶o V« Danh H¹ng Liªn CÊp 10 vµo.", {xuly_chetao_ckhanglien}, {ketthuc})
end
function nangcap_ckhanglien()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("N©ng CÊp Cµn Kh«n", "§Æt Tinh X¶o Cµn Kh«n H¹ng Liªn vµ nguyªn liÖu.", {xuly_nangcap_ckhanglien}, {ketthuc})
end

function chetao_ckngocboi()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("ChÕ T¹o Cµn Kh«n", "§Æt 2 Tinh X¶o V« Danh Ngäc Béi CÊp 10 vµo.", {xuly_chetao_ckngocboi}, {ketthuc})
end
function nangcap_ckngocboi()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("N©ng CÊp Cµn Kh«n", "§Æt Tinh X¶o Cµn Kh«n Ngäc Béi vµ nguyªn liÖu.", {xuly_nangcap_ckngocboi}, {ketthuc})
end

function chetao_ckyeutruy()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("ChÕ T¹o Cµn Kh«n", "§Æt 2 Tinh X¶o V« Danh Yªu Trôy CÊp 10 vµo.", {xuly_chetao_ckyeutruy}, {ketthuc})
end
function nangcap_ckyeutruy()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("N©ng CÊp Cµn Kh«n", "§Æt Tinh X¶o Cµn Kh«n Yªu Trôy vµ nguyªn liÖu.", {xuly_nangcap_ckyeutruy}, {ketthuc})
end

------------------------------------------------------------------------------
-- MENU CON: VO SONG
------------------------------------------------------------------------------
function Menu_VoSong()
    local nNpcIndex = GetLastDiagNpc()
    local szNpcName = GetNpcName(nNpcIndex)
    if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end

    local tbDailog = DailogClass:new(szNpcName)
    tbDailog.szTitleMsg = "H·y chän thao t¸c ®èi víi trang søc V« Song:"
    
    tbDailog:AddOptEntry("1. ChÕ t¹o V« Song Giíi ChØ", chetao_vosong)
    tbDailog:AddOptEntry("2. ChÕ t¹o V« Song H¹ng Liªn", chetao_vshanglien)
    tbDailog:AddOptEntry("3. ChÕ t¹o V« Song Ngäc Béi", chetao_vsngocboi)
    tbDailog:AddOptEntry("4. ChÕ t¹o V« Song Yªu Trôy", chetao_vsyeutruy)
    tbDailog:AddOptEntry("Quay l¹i", main)
    tbDailog:Show()
end

function chetao_vosong()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("ChÕ T¹o V« Song", "§Æt 2 Tinh X¶o Cµn Kh«n Giíi ChØ CÊp 10 + Nguyªn liÖu.", {xuly_chetao_vosong}, {ketthuc})
end
function chetao_vshanglien()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("ChÕ T¹o V« Song", "§Æt 2 Tinh X¶o Cµn Kh«n H¹ng Liªn CÊp 10 + Nguyªn liÖu.", {xuly_chetao_vshanglien}, {ketthuc})
end
function chetao_vsngocboi()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("ChÕ T¹o V« Song", "§Æt 2 Tinh X¶o Cµn Kh«n Ngäc Béi CÊp 10 + Nguyªn liÖu.", {xuly_chetao_vsngocboi}, {ketthuc})
end
function chetao_vsyeutruy()
    if CalcFreeItemCellCount() < 1 then return Msg2Player("Hµnh trang kh«ng ®ñ chç trèng!") end
    g_GiveItemUI("ChÕ T¹o V« Song", "§Æt 2 Tinh X¶o Cµn Kh«n Yªu Trôy CÊp 10 + Nguyªn liÖu.", {xuly_chetao_vsyeutruy}, {ketthuc})
end

------------------------------------------------------------------------------
-- HAM XU LY CHUNG NANG CAP (Dung de len cap Vo Danh, Can Khon tu 0 -> 10)
------------------------------------------------------------------------------
function XuLyNangCapChung(nCount, nMinID, nMaxID, tbReqTable, szTen)
    if not nCount or nCount < 2 then return Msg2Player("Ph¶i ®Æt trang bÞ vµ nguyªn liÖu!") end

    local nEquipIndex, nGoldID = 0, 0
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        local g, d, p, l = GetItemProp(nItemIndex)
        if not (g == 6 and d == 1) then
            local nTempID = GetGlodEqIndex(nItemIndex)
            if nTempID >= nMinID and nTempID <= nMaxID then
                if nEquipIndex ~= 0 then return Msg2Player("ChØ ®­îc ®Æt 1 " .. szTen .. "!") end
                nEquipIndex, nGoldID = nItemIndex, nTempID
            else
                return Msg2Player("VËt phÈm kh«ng hîp lÖ!")
            end
        end
    end

    if nEquipIndex == 0 then return Msg2Player("Ch­a ®Æt " .. szTen .. " vµo!") end
    if nGoldID == nMaxID then return Msg2Player(szTen .. " ®· ®¹t cÊp tèi ®a!") end

    local tbReq = tbReqTable[nGoldID]
    local nThienKy, nHoangPhuong, nLienHoa, nNhatThach, _ = GetMaterialCount(nCount)

    -- Neu la Can Khon thi can Lien Hoa, Nhat Thach. Neu la Vo Danh thi can Thien Ky, Hoang Phuong
    local bIsCanKhon = false
    if nMinID == nMinCanKhonID or nMinID == nMinCKHangLienID or nMinID == nMinCKNgocBoiID or nMinID == nMinCKYeuTruyID then
        bIsCanKhon = true
    end

    if bIsCanKhon then
        if nLienHoa ~= tbReq[1] or nNhatThach ~= tbReq[2] then
            return Msg2Player(format("CÇn %d Cµn Kh«n Liªn Hoa vµ %d Cµn Kh«n NhÊt Th¹ch.", tbReq[1], tbReq[2]))
        end
    else
        if nThienKy ~= tbReq[1] or nHoangPhuong ~= tbReq[2] then
            return Msg2Player(format("CÇn %d Thiªn Ký Th¶o vµ %d Hoµng Ph­îng NhÊt Ngäc.", tbReq[1], tbReq[2]))
        end
    end

    RemoveGiveItems(nCount)
    AddGoldItem(0, tbReq[3])
    Msg2Player("N©ng cÊp thµnh c«ng " .. szTen .. "!")
end

------------------------------------------------------------------------------
-- LOGIC CÀN KHÔN (CH? T?O T? VÔ DANH C?P 10)
------------------------------------------------------------------------------
function xuly_chetao_cankhon(nCount)
    if not nCount or nCount ~= 2 then return Msg2Player("Yªu cÇu ph¶i ®Æt ®óng 2 chiÕc nhÉn cÊp 10!") end
    local nChiHoan, nGioiChi = 0, 0
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        if nItemIndex and nItemIndex > 0 then
            local nGoldID = GetGlodEqIndex(nItemIndex)
            if nGoldID == nMaxChiHoanID then nChiHoan = nItemIndex
            elseif nGoldID == nMaxGioiChiID then nGioiChi = nItemIndex end
        end
    end
    if nChiHoan == 0 or nGioiChi == 0 then return Msg2Player("CÇn 1 Tinh X¶o V« Danh ChØ Hoµn vµ 1 Tinh X¶o V« Danh Giíi ChØ (CÊp 10)!") end
    RemoveGiveItems(nCount) AddGoldItem(0, nMinCanKhonID) Msg2Player("ChÕ t¹o Cµn Kh«n Giíi ChØ thµnh c«ng!")
end

function xuly_nangcap_cankhon(nCount) XuLyNangCapChung(nCount, nMinCanKhonID, nMaxCanKhonID, tbUpgradeCanKhonReq, "Tinh X¶o Cµn Kh«n Giíi ChØ") end

function xuly_chetao_ckhanglien(nCount)
    if not nCount or nCount ~= 2 then return Msg2Player("Yªu cÇu ph¶i ®Æt ®óng 2 sîi Tinh X¶o V« Danh H¹ng Liªn cÊp 10!") end
    local nDem = 0
    for i = 1, nCount do
        if GetGiveItemUnit(i) > 0 and GetGlodEqIndex(GetGiveItemUnit(i)) == nMaxHangLienID then nDem = nDem + 1 end
    end
    if nDem ~= 2 then return Msg2Player("CÇn ®Æt ®óng 2 sîi Tinh X¶o V« Danh H¹ng Liªn (cÊp 10)!") end
    RemoveGiveItems(nCount) AddGoldItem(0, nMinCKHangLienID) Msg2Player("ChÕ t¹o Cµn Kh«n H¹ng Liªn thµnh c«ng!")
end

function xuly_nangcap_ckhanglien(nCount) XuLyNangCapChung(nCount, nMinCKHangLienID, nMaxCKHangLienID, tbUpgradeCKHangLienReq, "Tinh X¶o Cµn Kh«n H¹ng Liªn") end

function xuly_chetao_ckngocboi(nCount)
    if not nCount or nCount ~= 2 then return Msg2Player("Yªu cÇu ph¶i ®Æt ®óng 2 Tinh X¶o V« Danh Ngäc Béi cÊp 10!") end
    local nDem = 0
    for i = 1, nCount do
        if GetGiveItemUnit(i) > 0 and GetGlodEqIndex(GetGiveItemUnit(i)) == nMaxNgocBoiID then nDem = nDem + 1 end
    end
    if nDem ~= 2 then return Msg2Player("CÇn ®Æt ®óng 2 Tinh X¶o V« Danh Ngäc Béi (cÊp 10)!") end
    RemoveGiveItems(nCount) AddGoldItem(0, nMinCKNgocBoiID) Msg2Player("ChÕ t¹o Cµn Kh«n Ngäc Béi thµnh c«ng!")
end

function xuly_nangcap_ckngocboi(nCount) XuLyNangCapChung(nCount, nMinCKNgocBoiID, nMaxCKNgocBoiID, tbUpgradeCKNgocBoiReq, "Tinh X¶o Cµn Kh«n Ngäc Béi") end

function xuly_chetao_ckyeutruy(nCount)
    if not nCount or nCount ~= 2 then return Msg2Player("Yªu cÇu ph¶i ®Æt ®óng 2 Tinh X¶o V« Danh Yªu Trôy cÊp 10!") end
    local nDem = 0
    for i = 1, nCount do
        if GetGiveItemUnit(i) > 0 and GetGlodEqIndex(GetGiveItemUnit(i)) == nMaxYeuTruyID then nDem = nDem + 1 end
    end
    if nDem ~= 2 then return Msg2Player("CÇn ®Æt ®óng 2 Tinh X¶o V« Danh Yªu Trôy (cÊp 10)!") end
    RemoveGiveItems(nCount) AddGoldItem(0, nMinCKYeuTruyID) Msg2Player("ChÕ t¹o Cµn Kh«n Yªu Trôy thµnh c«ng!")
end

function xuly_nangcap_ckyeutruy(nCount) XuLyNangCapChung(nCount, nMinCKYeuTruyID, nMaxCKYeuTruyID, tbUpgradeCKYeuTruyReq, "Tinh X¶o Cµn Kh«n Yªu Trôy") end

------------------------------------------------------------------------------
-- LOGIC VÔ SONG (CH? T?O T? CÀN KHÔN C?P 10)
------------------------------------------------------------------------------
function xuly_chetao_vosong_chung(nCount, nReqID, nTargetID, szTen)
    if not nCount or nCount < 3 then return Msg2Player("Ph¶i ®Æt nguyªn liÖu vµ 2 trang bÞ!") end

    local nDem = 0
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        if nItemIndex and nItemIndex > 0 then
            if GetGlodEqIndex(nItemIndex) == nReqID then
                nDem = nDem + 1
            end
        end
    end

    if nDem ~= 2 then return Msg2Player("Yªu cÇu ph¶i cã ®óng 2 Tinh X¶o Cµn Kh«n " .. szTen .. " CÊp 10!") end

    local _, _, nLienHoa, nNhatThach, nBanCo = GetMaterialCount(nCount)
    if nLienHoa ~= 10 or nNhatThach ~= 5 or nBanCo ~= 1 then
        return Msg2Player("CÇn 10 Cµn Kh«n Liªn Hoa, 5 Cµn Kh«n NhÊt Th¹ch vµ 1 Bµn Cæ Th¹ch!")
    end

    RemoveGiveItems(nCount)
    AddGoldItem(0, nTargetID)
    Msg2Player("ChÕ t¹o V« Song " .. szTen .. " thµnh c«ng!")
end

function xuly_chetao_vosong(nCount) xuly_chetao_vosong_chung(nCount, nMaxCanKhonID, nVoSongID, "Giíi ChØ") end
function xuly_chetao_vshanglien(nCount) xuly_chetao_vosong_chung(nCount, nMaxCKHangLienID, nVoSongHangLienID, "H¹ng Liªn") end
function xuly_chetao_vsngocboi(nCount) xuly_chetao_vosong_chung(nCount, nMaxCKNgocBoiID, nVoSongNgocBoiID, "Ngäc Béi") end
function xuly_chetao_vsyeutruy(nCount) xuly_chetao_vosong_chung(nCount, nMaxCKYeuTruyID, nVoSongYeuTruyID, "Yªu Trôy") end