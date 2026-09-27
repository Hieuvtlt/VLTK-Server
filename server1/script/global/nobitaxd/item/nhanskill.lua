------NhËn SKILL-----------
Include("\\script\\global\\skills_table.lua");
function NhanSkill()
local szTitle = "Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Trùc tuyÕn: <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
	{		
		{"Vµo ph¸i vµ häc kü n¨ng 120",choose_faction12x},
		{"Häc kü n¨ng 150 m«n ph¸i",knang150},
		{"Häc kü n¨ng 180 m«n ph¸i",knang180},
		{"NhËn Maxskill", NhanMaxSkill},
		{"NhËn bé skill Phong ThÇn", NhanSkillPhongThan},
		-- [2026-08-14] Da bo muc "Luyen skill 150": chuc nang "Nhan Maxskill"
		-- da bao gom day du cac cap 90/120/150/180 can thiet.
		-- [2026-08-14] Da bo muc "Luyen skill 180": skill 180 la HO TRO BI DONG,
		-- theo thiet ke phai tu luyen dan theo thoi gian (tich luy exp khi chien
		-- dau), KHONG duoc nang cap thu cong tuc thi. Xem chan trong LuyenSkillExpMax.
		{"TÈy Tñy",clear_attibute_point},
		{"Céng ®iÓm tiÒm n¨ng", congdiemtiemnang},
		{"Céng ®iÓm kü n¨ng", congdiemkynang},
		{"Xo¸ toµn bé kü n¨ng", XoaToanBoSkill},
		{"LÊy kü n¨ng theo ID", LaySkillID},
		{"§æi Tªn Nh©n VËt", doiten},	
		{"ChuyÓn ®æi ngò hµnh", nguhanh},
		{"Trë L¹i",testserver},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function testserver()
	return main()
end

------------------------Cong Diem Ky Nang------------------------------
	----------------------
tb_skill_add = {    [0] = { --thiÕu l©m
        [1] = {10,14,4,6,8,15,16,20,11,19,271,21,273},
        [2] = {"ThiÕu L©m QuyÒn","QuyÒn Ph¸p",14,8,271,273},
        [3] = {"ThiÕu L©m §ao","§ao Ph¸p",6,19,273},
        [4] = {"ThiÕu L©m C«n","C«n Ph¸p",10,4,11,273},
    },
    [1] = { --thiªn v­¬ng
        [1] = {29,30,34,23,24,26,33,31,35,3740,42,32,36,41,324},
        [2] = {"Thiªn V­¬ng Th­¬ng","Th­¬ng Ph¸p",30,23,35,41,36},
        [3] = {"Thiªn V­¬ng Chïy","Chïy Ph¸p",29,26,31,324,36},
        [4] = {"Thiªn V­¬ng §ao","§ao Ph¸p",34,24,32,37,36},
    },
    [2] = { --®­êng m«n
        [1] = {45,43,347,303,47,50,54,343,345,349,48,58,249,341},
        [2] = {"§­êng M«n - Phi Tiªu","Phi Tiªu ThuËt",45,43,47,341,48},
        [3] = {"§­êng M«n - Phi §ao","Phi §ao ThuËt",45,43,50,249,48},
        [4] = {"§­êng M«n - Tô TiÔn","Tô TiÔn ThuËt",45,43,54,58,48},
        [5] = {"§­êng M«n - BÉy","H·m TÜnh ThuËt",303,347,343,349,345,48},
    },
    [3] = { --ngò ®éc
        [1] = {63,65,60,62,67,66,70,64,68,69,384,73,356,72,71,74,75},
        [2] = {"Ngò §éc §ao","§ao Ph¸p",65,60,384,74,75},
        [3] = {"Ngò §éc Ch­ëng","Ch­ëng Ph¸p",63,62,68,71,75},
        [4] = {"Ngò §éc Bïa","Bïa Chó",67,70,64,356,72,75},
    },
    [4] = { --nga mi
        [1] = {80,85,77,79,93,82,89,385,86,92,88,91,252,282},
        [2] = {"Nga Mi KiÕm","KiÕm Ph¸p",85,77,385,88,252},
        [3] = {"Nga Mi Ch­ëng","Ch­ëng Ph¸p",80,79,82,91,252},
        [4] = {"Nga Mi Phô Trî","Phô Trî",93,89,86,92,282,252},
    },
    [5] = { --thóy yªn
        [1] = {99,102,95,97,269,105,113,100,109,108,111,114},
        [2] = {"Thóy Yªn §ao","§ao Ph¸p",99,95,105,109,108,114},
        [3] = {"Thóy Yªn Song §ao","Ch­ëng Ph¸p",102,97,113,111, 114},
    },
    [6] = { --c¸i bang
        [1] = {119,122,115,116,129,124,274,277,125,128,130,360},
        [2] = {"C¸i Bang Bæng","Bæng Ph¸p",119,115,124,125,360,130},
        [3] = {"C¸i Bang Rång","Ch­ëng Ph¸p",122,116,274,128,360,130},
    },
    [7] = { --thiªn nhÉn
        [1] = {135,145,131,132,136,137,138,140,141,364,143,142,148,150},
        [2] = {"Thiªn NhÉn M©u","M©u Ph¸p",135,132,141,142,150},
        [3] = {"Thiªn NhÉn §ao Ph¸p","§ao Ph¸p",145,131,138,148,150},
        [4] = {"Thiªn NhÉn Bïa","Bïa Chó",136,137,140,364,143,150},
    },
    [8] = { --vâ ®ang
        [1] = {153,155,151,152,159,158,164,160,157,165,166,267},
        [2] = {"Vâ §ang KiÕm","KiÕm Ph¸p",155,151,158,267,166},
        [3] = {"Vâ §ang KhÝ","QuyÒn Ph¸p",153,152,164,165,166},
    },
    [9] = { --c«n l«n
        [1] = {169,179,167,168,171,392,174,172,173,178,393,175,181,90,176,182,275,630},
        [2] = {"C«n L«n §ao","§ao Ph¸p",169,167,178,176,275},
        [3] = {"C«n L«n KiÕm","KiÕm Ph¸p",179,168,172,182,275},
        [4] = {"C«n L«n Bïa","Bïa Chó",392,174,393,175,90,275},
    },
}
NpcName = "<color=yellow>Hç Trî Céng §iÓm Kü N¨ng<color>: "
function congdiemkynang()
    local nFaction = GetLastFactionNumber()
    if GetLevel() < 10 or nFaction < 0 then
        Say("Nh©n vËt ®¹t cÊp 10 vµ ®· gia nhËp m«n ph¸i míi dïng ®­îc chøc n¨ng nµy.", 1, "Tho¸t/Quit")
        return
    end
    Say("Ng­êi muèn céng kü n¨ng thÕ nµo?", 5,
        "Céng theo tõng kü n¨ng/#Add_PointMagic(1,"..nFaction..")",
        "Céng theo h­íng luyÖn c«ng/#Add_PointMagic(2,"..nFaction..")",
        "Céng toµn bé kü n¨ng lªn cÊp cao nhÊt/#Add_PointMagic(3,"..nFaction..")",
        "Quay l¹i/NhanSkill",
        "Tho¸t/Quit"
    )
end
function add_magic(nFaction)
    if nFaction < 0 then
        nMonPhai = "Ch­a Gia NhËp Ph¸i"
    elseif nFaction == 0 then
        nMonPhai = "ThiÕu L©m"
    elseif nFaction == 1 then
        nMonPhai = "Thiªn V­¬ng"
    elseif nFaction == 2 then
        nMonPhai = "§­êng M«n"
    elseif nFaction == 3 then
        nMonPhai = "Ngò §éc"
    elseif nFaction == 4 then
        nMonPhai = "Nga My"
    elseif nFaction == 5 then
        nMonPhai = "Thóy Yªn"
    elseif nFaction == 6 then
        nMonPhai = "C¸i Bang"
    elseif nFaction == 7 then
        nMonPhai = "Thiªn NhÉn"
    elseif nFaction == 8 then
        nMonPhai = "Vâ §ang"
    elseif nFaction == 9 then
        nMonPhai = "C«n L«n"
    end
    if GetLevel()< 10 or nFaction < 0 then
        local tab_Content = {
        "Quay l¹i/main",
        "Tho¸t/Quit",
        }
        Say(NpcName.."Nh©n vËt ®¹t ®¼ng cÊp 10 trë lªn ®· gia nhËp m«n ph¸i míi cã thÓ sö dông chøc n¨ng nµy.", getn(tab_Content),tab_Content);
    return
    end
    local tab_Content = {
    "Céng theo tõng kü n¨ng/#Add_PointMagic(1,"..nFaction..")",
    "Céng theo h­íng luyÖn c«ng/#Add_PointMagic(2,"..nFaction..")",
    "Céng toµn bé kü n¨ng lªn cÊp cao nhÊt./#Add_PointMagic(3,"..nFaction..")",
    "Quay l¹i/main",
    "Tho¸t/Quit",
    }
    Say(NpcName.."Ng­êi ®· gia nhËp m«n ph¸i <color=yellow>"..nMonPhai.."<color>, ng­êi muèn céng kü n¨ng thÕ nµo?", getn(tab_Content),tab_Content);
end
function Add_PointMagic(nId,nFaction)
    if nFaction < 0 then
        nMonPhai = "Ch­a Gia NhËp Ph¸i"
    elseif nFaction == 0 then
        nMonPhai = "ThiÕu L©m"
    elseif nFaction == 1 then
        nMonPhai = "Thiªn V­¬ng"
    elseif nFaction == 2 then
        nMonPhai = "§­êng M«n"
    elseif nFaction == 3 then
        nMonPhai = "Ngò §éc"
    elseif nFaction == 4 then
        nMonPhai = "Nga My"
    elseif nFaction == 5 then
        nMonPhai = "Thóy Yªn"
    elseif nFaction == 6 then
        nMonPhai = "C¸i Bang"
    elseif nFaction == 7 then
        nMonPhai = "Thiªn NhÉn"
    elseif nFaction == 8 then
        nMonPhai = "Vâ §ang"
    elseif nFaction == 9 then
        nMonPhai = "C«n L«n"
    end
    if nId == 1 then
        local tb_Desc = {}; 
        for i = 1, getn(tb_skill_add[nFaction][1]) do
            local skillcur = HaveMagic(tb_skill_add[nFaction][1][i]);
            local skillmax = GetSkillMaxLevel(tb_skill_add[nFaction][1][i]) + GetSkillMaxLevelAddons()
            if skillcur >= 0 and skillcur < skillmax then
                local nPointAdd = skillmax - skillcur
                tinsert(tb_Desc, format("Th¨ng cÊp ".."%s".."[Max: ".."%s".."]/#Add_PointMagic_Type1(%d,%d,%d,%d,%d)", GetSkillName(tb_skill_add[nFaction][1][i]),skillmax, tb_skill_add[nFaction][1][i],nPointAdd,nFaction,i,skillmax)); 
            end
        end
        tinsert(tb_Desc, 1,NpcName.."Lùa chän kü n¨ng th¨ng cÊp"); 
        tinsert(tb_Desc,"Quay l¹i/#add_magic("..nFaction..")"); 
        tinsert(tb_Desc,"Tho¸t/OnCancel"); 
        CreateTaskSay(tb_Desc); 
    elseif nId == 2 then
        local HuongLC = getn(tb_skill_add[nFaction])-1
        local TongSkill1 = 0
        local TongSkill2 = 0
        for i=3,getn(tb_skill_add[nFaction][2]) do
            TongSkill1 = TongSkill1 + GetSkillMaxLevel(tb_skill_add[nFaction][2][i]) + GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][2][i]);
        end
        for i=3,getn(tb_skill_add[nFaction][3]) do
            TongSkill2 = TongSkill2 + GetSkillMaxLevel(tb_skill_add[nFaction][3][i]) + GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][3][i]);
        end
        if HuongLC == 2 then
            local tab_Content = {
            "Céng theo "..tb_skill_add[nFaction][2][2]..", cÇn tæng céng ["..TongSkill1.."] ®iÓm Kü N¨ng/#AddHuongLC(2,"..nFaction..","..TongSkill1..")",
            "Céng theo "..tb_skill_add[nFaction][3][2]..", cÇn tæng céng ["..TongSkill2.."] ®iÓm Kü N¨ng/#AddHuongLC(3,"..nFaction..","..TongSkill2..")",
            "Quay l¹i/#add_magic("..nFaction..")",
            "Tho¸t/Quit",
            }
            Say(NpcName.."M«n ph¸i "..nMonPhai.." cã "..HuongLC.." h­íng luyÖn c«ng ®ã lµ: "..tb_skill_add[nFaction][2][2].." vµ "..tb_skill_add[nFaction][3][2]..".<enter>"..tb_skill_add[nFaction][2][2].." bao gåm "..(getn(tb_skill_add[nFaction][2])-2).." Kü N¨ng.<enter>"..tb_skill_add[nFaction][3][2].." bao gåm "..(getn(tb_skill_add[nFaction][3])-2).." Kü N¨ng.",getn(tab_Content),tab_Content);
        elseif HuongLC == 3 then
            --local TongSkill3 = (    (getn(tb_skill_add[nFaction][4])-3)*20+30    ) + (getn(tb_skill_add[nFaction][4])-2)*GetSkillMaxLevelAddons()
            local TongSkill3 = 0
            for i=3,getn(tb_skill_add[nFaction][4]) do
                TongSkill3 = TongSkill3 + GetSkillMaxLevel(tb_skill_add[nFaction][4][i]) + GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][4][i]);
            end
            local tab_Content = {
            "Céng theo "..tb_skill_add[nFaction][2][2]..", cÇn tæng céng ["..TongSkill1.."] ®iÓm Kü N¨ng/#AddHuongLC(2,"..nFaction..","..TongSkill1..")",
            "Céng theo "..tb_skill_add[nFaction][3][2]..", cÇn tæng céng ["..TongSkill2.."] ®iÓm Kü N¨ng/#AddHuongLC(3,"..nFaction..","..TongSkill2..")",
            "Céng theo "..tb_skill_add[nFaction][4][2]..", cÇn tæng céng ["..TongSkill3.."] ®iÓm Kü N¨ng/#AddHuongLC(4,"..nFaction..","..TongSkill3..")",
            "Quay l¹i/#add_magic("..nFaction..")",
            "Tho¸t/Quit",
            }
            Say(NpcName.."M«n ph¸i "..nMonPhai.." cã "..HuongLC.." h­íng luyÖn c«ng ®ã lµ: "
            ..tb_skill_add[nFaction][2][2]..", "..tb_skill_add[nFaction][3][2]..".vµ "..tb_skill_add[nFaction][4][2].."<enter>"
            ..tb_skill_add[nFaction][2][2].." bao gåm "..(getn(tb_skill_add[nFaction][2])-2).." Kü N¨ng.<enter>"
            ..tb_skill_add[nFaction][3][2].." bao gåm "..(getn(tb_skill_add[nFaction][3])-2).." Kü N¨ng.<enter>"
            ..tb_skill_add[nFaction][4][2].." bao gåm "..(getn(tb_skill_add[nFaction][4])-2).." Kü N¨ng.",
            getn(tab_Content),tab_Content
            );
        elseif HuongLC == 4 then
            --local TongSkill3 = (    (getn(tb_skill_add[nFaction][4])-3)*20+30    ) + (getn(tb_skill_add[nFaction][4])-2)*GetSkillMaxLevelAddons()
            --local TongSkill4 = (    (getn(tb_skill_add[nFaction][5])-3)*20+30    ) + (getn(tb_skill_add[nFaction][5])-2)*GetSkillMaxLevelAddons()
            local TongSkill3 = 0
            local TongSkill4 = 0
            for i=3,getn(tb_skill_add[nFaction][4]) do
                TongSkill3 = TongSkill3 + GetSkillMaxLevel(tb_skill_add[nFaction][4][i]) + GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][4][i]);
            end
            for i=3,getn(tb_skill_add[nFaction][5]) do
                TongSkill4 = TongSkill4 + GetSkillMaxLevel(tb_skill_add[nFaction][5][i]) + GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][5][i]);
            end
            local tab_Content = {
            "Céng theo "..tb_skill_add[nFaction][2][2]..", cÇn tæng céng ["..TongSkill1.."] ®iÓm Kü N¨ng/#AddHuongLC(2,"..nFaction..","..TongSkill1..")",
            "Céng theo "..tb_skill_add[nFaction][3][2]..", cÇn tæng céng ["..TongSkill2.."] ®iÓm Kü N¨ng/#AddHuongLC(3,"..nFaction..","..TongSkill2..")",
            "Céng theo "..tb_skill_add[nFaction][4][2]..", cÇn tæng céng ["..TongSkill3.."] ®iÓm Kü N¨ng/#AddHuongLC(4,"..nFaction..","..TongSkill3..")",
            "Céng theo "..tb_skill_add[nFaction][5][2]..", cÇn tæng céng ["..TongSkill4.."] ®iÓm Kü N¨ng/#AddHuongLC(5,"..nFaction..","..TongSkill4..")",
            "Quay l¹i/#add_magic("..nFaction..")",
            "Tho¸t/Quit",
            }
            Say(NpcName.."M«n ph¸i "..nMonPhai.." cã "..HuongLC.." h­íng luyÖn c«ng ®ã lµ: "
            ..tb_skill_add[nFaction][2][2]..", "..tb_skill_add[nFaction][3][2]..", "..tb_skill_add[nFaction][4][2].." vµ "..tb_skill_add[nFaction][5][2].."<enter>"
            ..tb_skill_add[nFaction][2][2].." bao gåm "..(getn(tb_skill_add[nFaction][2])-2).." Kü N¨ng.<enter>"
            ..tb_skill_add[nFaction][3][2].." bao gåm "..(getn(tb_skill_add[nFaction][3])-2).." Kü N¨ng.<enter>"
            ..tb_skill_add[nFaction][4][2].." bao gåm "..(getn(tb_skill_add[nFaction][4])-2).." Kü N¨ng.<enter>"
            ..tb_skill_add[nFaction][5][2].." bao gåm "..(getn(tb_skill_add[nFaction][5])-2).." Kü N¨ng.",
            getn(tab_Content),tab_Content
            );
        end
    elseif nId == 3 then
        local nTongSoSkill = getn(tb_skill_add[nFaction][1])
        local nTongSoPoint_Need = 0
        local CheckFullSkill = 0
        for i=1,nTongSoSkill do
        local nSkillHienTai = HaveMagic(tb_skill_add[nFaction][1][i]);
            if nSkillHienTai >= 0 then
                CheckFullSkill = CheckFullSkill + 1
            end
        local nSkillToiDa = GetSkillMaxLevel(tb_skill_add[nFaction][1][i]) + GetSkillMaxLevelAddons()
        local nPointNeed = nSkillToiDa - nSkillHienTai
            nTongSoPoint_Need = nTongSoPoint_Need + nPointNeed
        end
        if CheckFullSkill < nTongSoSkill then --NÕu ch­a häc ®ñ skill
            local tab_Content = {
            "Quay l¹i/#add_magic("..nFaction..")",
            "Tho¸t/Quit",
            }
            Say(NpcName.."Ng­êi lµ mét ®Ö tö cña ph¸i <color=yellow>"..nMonPhai.."<color>. M«n ph¸i cã tæng céng <color=green>"..nTongSoSkill.."<color> Kü n¨ng cã thÓ th¨ng cÊp. Ng­êi míi chØ l·nh gi¸o ®­îc <color=green>"..CheckFullSkill.."<color> Kü n¨ng. H·y cè g¾ng tu luyÖn thªm, khi nµo ®Çy ®ñ <color=green>"..nTongSoSkill.."<color> Kü N¨ng míi cã thÓ sö dông chøc n¨ng nµy.", getn(tab_Content),tab_Content);
            return
        end
        if GetMagicPoint() < nTongSoPoint_Need then --NÕu sè ®iÓm yªu cÇu kh«ng ®ñ ®Ó céng.
            local tab_Content = {
            "Quay l¹i/#add_magic("..nFaction..")",
            "Tho¸t/Quit",
            }
            Say(NpcName.."Ng­êi lµ mét ®Ö tö cña ph¸i <color=yellow>"..nMonPhai.."<color>. M«n ph¸i cã tæng céng <color=green>"..nTongSoSkill.."<color> Kü n¨ng, yªu cÇu ph¶i cã Ýt nhÊt <color=green>"..nTongSoPoint_Need.."<color> ®iÓm Kü N¨ng míi cã thÓ n©ng cÊp. H·y tu luyÖn thªm ®i.", getn(tab_Content),tab_Content);
            return
        end
        for i=1,nTongSoSkill do
            local nIdSkill = tb_skill_add[nFaction][1][i]
            local SkillCaoNhat = GetSkillMaxLevel(nIdSkill) + GetSkillMaxLevelAddons()
            local SkillPointNeed = GetSkillMaxLevel(nIdSkill) + GetSkillMaxLevelAddons() - HaveMagic(nIdSkill);
            AddMagic(nIdSkill,SkillCaoNhat)
            AddMagicPoint(-SkillPointNeed)
            Msg2Player("N©ng thµnh c«ng <color=yellow>"..GetSkillName(nIdSkill).."<color> lªn cÊp <color=green>"..SkillCaoNhat.."<color>. §iÓm Kü N¨ng cßn l¹i <color=yellow>"..GetMagicPoint().."<color> ®iÓm.")
        end
    end
end
function AddHuongLC(nId,nFaction,nTotalSkillNeed)
    if GetMagicPoint() < nTotalSkillNeed then
        local tab_Content = {
        "Quay l¹i/#Add_PointMagic(2,"..nFaction..")",
        "Tho¸t/Quit",
        }
        Say(NpcName.."L­îng ®iÓm Kü N¨ng cßn l¹i kh«ng ®ñ ®Ó n©ng kü n¨ng theo h­íng <color=yellow>"..tb_skill_add[nFaction][nId][2].."<color>. CÇn tèi thiÓu "..nTotalSkillNeed.." ®iÓm kü n¨ng", getn(tab_Content),tab_Content);
        return
    end
    for i=3,getn(tb_skill_add[nFaction][nId]) do
        local Id_Skill = tb_skill_add[nFaction][nId][i]
        if HaveMagic(Id_Skill) < 0 then
            Msg2Player("Ch­a häc ®Çy ®ñ c¸c kÜ n¨ng ch­a sö dông ®­îc chøc n¨ng nµy.")
        return
        end
        local DiemCong = GetSkillMaxLevel(Id_Skill) - HaveMagic(Id_Skill);
        local TenSkill = GetSkillName(Id_Skill)
        local Skill_CaoNhat = GetSkillMaxLevel(Id_Skill) + GetSkillMaxLevelAddons()
        AddMagic(Id_Skill,Skill_CaoNhat)
        AddMagicPoint(-DiemCong)
        Msg2Player("N©ng thµnh c«ng <color=yellow>"..TenSkill.."<color> lªn cÊp <color=green>"..GetSkillMaxLevel(Id_Skill).."<color>. §iÓm Kü N¨ng cßn l¹i <color=yellow>"..GetMagicPoint().."<color> ®iÓm.")
    end
end
function Add_PointMagic_Type1(nIdSkill,nPointAdd,nFaction,nViTri,nMaxSkill)
    local SkillName = GetSkillName(tb_skill_add[nFaction][1][nViTri])
    if GetMagicPoint() < nPointAdd then
        local tab_Content = {
        "Quay l¹i/#Add_PointMagic(1,"..nFaction..")",
        "Tho¸t/Quit",
        }
        Say(NpcName.."L­îng ®iÓm Kü N¨ng cßn l¹i kh«ng ®ñ ®Ó n©ng <color=yellow>"..SkillName.."<color> lªn cÊp <color=yellow>"..nMaxSkill.."<color>.", getn(tab_Content),tab_Content);
    else
        AddMagic(nIdSkill,nMaxSkill)
        AddMagicPoint(-nPointAdd)
        Msg2Player("N©ng thµnh c«ng <color=yellow>"..SkillName.."<color> lªn cÊp <color=green>"..nMaxSkill.."<color>. §iÓm Kü N¨ng cßn l¹i <color=yellow>"..GetMagicPoint().."<color> ®iÓm.")
    end
end
-----------------------------------------------------------------------tbFaction------------------------------------------------------------------------
local tbFaction =
{
	[1] =
	{
		szShowName = "ThiÕu L©m",
		szFaction = "shaolin",
		nShortFaction = "sl",
		tbSkill = {318, 319, 321, 709},
		tbRank={72},
	},
	[2] =
	{
		szShowName = "Thiªn V­¬ng Bang",
		szFaction = "tianwang",
		nShortFaction = "tw",
		tbSkill = {322, 325, 323, 708},
		tbRank={69},
	},
	[3] =
	{
		szShowName = "§­êng M«n",
		szFaction = "tangmen",
		nShortFaction = "tm",
		tbSkill = {339, 302, 342, 710},
		tbRank={76},
	},
	[4] =
	{
		szShowName = "Ngò §éc Gi¸o",
		szFaction = "wudu",
		nShortFaction = "wu",
		tbSkill = {353, 355, 711},
		tbRank={80},
	},
	[5] =
	{
		szShowName = "Nga Mi",
		szFaction = "emei",
		nShortFaction = "em",
		tbSkill = {380, 328, 712},
		tbRank={64},
	},
	[6] =
	{
		szShowName = "Thóy Yªn",
		szFaction = "cuiyan",
		nShortFaction = "cy",
		tbSkill = {336, 337, 713},
		tbRank={67},
	},
	[7] =
	{
		szShowName = "C¸i Bang",
		szFaction = "gaibang",
		nShortFaction = "gb",
		tbSkill = {357, 359, 714},
		tbRank={78},
	},
	[8] =
	{
		szShowName = "Thiªn NhÉn Gi¸o",
		szFaction = "tianren",
		nShortFaction = "tr",
		tbSkill = {361, 362, 715},
		tbRank={81},
	},
	[9] =
	{
		szShowName = "Vâ §ang",
		szFaction = "wudang",
		nShortFaction = "wd",
		tbSkill = {365, 368, 716},
		tbRank={73},
	},
	[10] =
	{
		szShowName = "C«n L«n",
		szFaction = "kunlun",
		nShortFaction = "kl",
		tbSkill = {372, 375, 717},
		tbRank={75},
	},
}
local tbFactionSeries =
{
[1] = {1, 2},
[2] = {3, 4},
[3] = {5, 6},
[4] = {7, 8},
[5] = {9, 10},
}

function doiten()
	AskClientForString("doitennv", "", 1, 100, "Xin nhËp tªn míi");
end
function doitennv(strings)
	RenameRole(strings)
end

function nguhanh()
local szTitle = "<npc>Ng­êi cÇn g×?"
	local tbOpt =
	{
		{"ChuyÓn ®æi sang n÷ hÖ Kim", nukim},
		{"Chuyªn ®æi sang nam hÖ Thuû", namthuy},
		{"Tho¸t"},
	}

	CreateNewSayEx(szTitle, tbOpt)
end
function nukim()
if GetSex() == 1 then
SetSeries(0)
KickOutSelf()
	else
	Talk(1,"","Ng­êi lµ Pª §ª µ ?")
end
end

function namthuy()
if GetSex() == 0 then
SetSeries(2)
KickOutSelf()
	else
	Talk(1,"","Vui lßng kiÓm tra l¹i giíi tÝnh")
end
end

--function check_faction()
--	local szCurFaction = GetFaction()
--	if szCurFaction ~= nil and szCurFaction ~= "" then
--		return
--	end
--	return 1
--end

SKILL_90 = {
    [0] = {318, 319, 321},
    [1] = {322, 325, 323},
    [2] = {339, 302, 342, 351},
    [3] = {353, 355, 390},
    [4] = {380, 328, 332},
    [5] = {336, 337},
    [6] = {357, 359},
    [7] = {361, 362, 391},
    [8] = {365, 368},
    [9] = {372, 375, 394},
}

SKILL_120 = {
    [0] = {709},
    [1] = {708},
    [2] = {710},
    [3] = {711},
    [4] = {712},
    [5] = {713},
    [6] = {714},
    [7] = {715},
    [8] = {716},
    [9] = {717},
}

SKILL_150 = {
    [0] = {1055, 1056, 1057},
    [1] = {1058, 1059, 1060},
    [2] = {1069, 1070, 1071, 1110},
    [3] = {1066, 1067},                     -- [2026-08-14] bo 1068: trung datakey daowudu150
                                    -- voi 1067 (U Hon Phe Anh) - la ban sao, khong phai
                                    -- skill rieng -> khong AddMagic de khong hien icon trung.
    [4] = {1061, 1062, 1114},
    [5] = {1063, 1065},                      -- [2026-08-14] bo 1064 (Bang Ngung Han Yen):
                                    -- datakey daocuiyan150_2 = du lieu tang 2 cua 1063
                                    -- (Bang Tuoc Hoat Ky) -> khong AddMagic de no khong hien
                                    -- icon rieng. Hieu ung tang 2 van chay qua
                                    -- skill_collideevent cua daocuiyan150.
    [6] = {1073, 1074},                -- [2026-08-14] bo 1072 (Ngu Dieu Can Khon): la tang
                                    -- phu cua 1073 (Thoi Thang Luc Long), khong phai skill
                                    -- rieng -> khong AddMagic de no khong hien icon rieng
                                    -- trong bang ky nang. Hieu ung tang 2 van chay binh
                                    -- thuong qua skill_collideevent cua zhanggaibang150.
    [7] = {1075, 1076},
    [8] = {1078, 1079},
    [9] = {1080, 1081},
}

-- [2026-08-14] Doi chieu voi server tham khao SVMEL (script/vng_event/
-- tochieukynang150/head.lua : tbTrainSkill150.tbFactionList_150) - danh
-- sach do KHONG bao gom 1064/1068/1072 (cac skill "_2"/tang 2, la hieu
-- ung phu di kem theo skill goc, khong co duong cong kinh nghiem rieng o
-- ca 2 server) -> day la ly do luyen thu cong bi dung/khong len duoc cap
-- toi da khi chon nham cac skill nay. Dung rieng danh sach nay cho menu
-- Luyen skill 150 (ChonSkillLuyenTier), giu nguyen SKILL_150 o tren cho
-- luong hoc skill tu dong (knang150) vi nguoi choi van can duoc HOC du ca
-- skill phu.
SKILL_150_TRAINABLE = {
    [0] = {1055, 1056, 1057},
    [1] = {1058, 1059, 1060},
    [2] = {1069, 1070, 1071, 1110},
    [3] = {1066, 1067},
    [4] = {1061, 1062, 1114},
    [5] = {1063, 1065},
    [6] = {1073, 1074},
    [7] = {1075, 1076},
    [8] = {1078, 1079},
    [9] = {1080, 1081},
}

-- [2026-08-14] Cac skill "ban sao" dung CHUNG datakey voi skill goc:
--   326  Pha Thien Tram      <-> 322  (potian_zhan)       - Thien Vuong Dao 90
--   1064 Bang Ngung Han Yen  <-> 1063 (daocuiyan150_2)    - Thuy Yen Dao 150
--   1068 U Hon Phe Anh 2     <-> 1067 (daowudu150)        - Ngu Doc Dao 150
--   1072 Ngu Dieu Can Khon   <-> 1073 (zhanggaibang150_2) - Cai Bang Chuong 150
-- Chung KHONG dang ky addskilldamage nen khong nhan +% tu cac skill thap
-- hon, chi lam trung icon/ten trong bang ky nang. Hieu ung tang phu van
-- chay binh thuong qua skill_startevent/skill_collideevent cua skill goc,
-- khong phu thuoc vao viec nguoi choi co "so huu" cac id nay hay khong.
HIDDEN_DUP_SKILLS = {326, 1064, 1068, 1072}

function RemoveHiddenDupSkills()
    for i = 1, getn(HIDDEN_DUP_SKILLS) do
        if HaveMagic(HIDDEN_DUP_SKILLS[i]) ~= -1 then
            DelMagic(HIDDEN_DUP_SKILLS[i])
            WriteLog("[SkillLearn] "..GetName().." go skill trung "..HIDDEN_DUP_SKILLS[i])
        end
    end
end

function learn_skill150_list(tbSkill, nLevel, szTag)
    local szLearned = ""
    if not tbSkill then
        return szLearned
    end
    for i = 1, getn(tbSkill) do
        if HaveMagic(tbSkill[i]) == -1 then
            AddMagic(tbSkill[i], nLevel)
        end
        if szLearned ~= "" then
            szLearned = szLearned.."<enter>"
        end
        szLearned = szLearned.."<color=yellow>"..GetSkillName(tbSkill[i]).."<color>"
        WriteLog("[SkillLearn] "..GetName().." hoc "..szTag.." skill "..tbSkill[i].." cap "..nLevel)
    end
    return szLearned
end

function NhanMaxSkill()
    local tbOpt = {
        {"Max Skill 90", TanThu_MaxSkill, {90}},
        {"Max Skill 120", TanThu_MaxSkill, {120}},
        {"Max Skill 150", TanThu_MaxSkill, {150}},
        {"Max Skill 180", TanThu_MaxSkill, {180}},
        {"Trë L¹i", NhanSkill},
        {"Tho¸t"},
    }
    CreateNewSayEx("NhËn Maxskill", tbOpt)
end

function TanThu_MaxSkillList(tbSkill, nLevel, szTag)
    if not tbSkill then
        return 0
    end
    local nCount = 0
    for i = 1, getn(tbSkill) do
        AddMagic(tbSkill[i], nLevel)
        nCount = nCount + 1
        WriteLog("[MaxSkill] "..GetName().." max "..szTag.." skill "..tbSkill[i].." cap "..nLevel)
    end
    return nCount
end

function TanThu_MaxSkill(nType)
    local nFaction = GetLastFactionNumber()
    if nFaction < 0 or nFaction > 9 then
        Say("B¹n ph¶i gia nhËp mét trong 10 m«n ph¸i tr­íc khi nhËn Maxskill.", 0)
        return
    end
    RemoveHiddenDupSkills()
    local nCount = 0
    if nType == 90 then
        nCount = TanThu_MaxSkillList(SKILL_90[nFaction], 20, "90")
    elseif nType == 120 then
        nCount = TanThu_MaxSkillList(SKILL_120[nFaction], 20, "120")
    elseif nType == 150 then
        nCount = TanThu_MaxSkillList(SKILL_150[nFaction], 20, "150")
    elseif nType == 180 then
        nCount = TanThu_MaxSkillList({SKILL_180[nFaction + 1]}, 20, "180")
    end
    Say("§· nhËn Maxskill "..nType..", tæng "..nCount.." kü n¨ng lªn cÊp 20.", 0)
end

function knang150()
    local nFaction = GetLastFactionNumber()
    if nFaction < 0 or nFaction > 9 then
        Say("B¹n ph¶i gia nhËp mét trong 10 m«n ph¸i tr­íc khi häc kü n¨ng 150.", 0)
        return
    end

    if GetLevel() < 150 then
        Say("Nh©n vËt ph¶i ®¹t cÊp 150 míi häc ®­îc kü n¨ng 150.", 0)
        return
    end

    if not SKILL_150[nFaction] then
        Say("Kh«ng t×m thÊy cÊu h×nh kü n¨ng 150 cho m«n ph¸i nµy.", 0)
        return
    end

    RemoveHiddenDupSkills()
    local szLearned = learn_skill150_list(SKILL_150[nFaction], 1, "150")
    Say("§· häc kü n¨ng 150 m«n ph¸i:<enter>"..szLearned, 0)
end

function knang150xx()
    return knang150()
end

SKILL_180 = {1281,1282,1284,1283,1285,1286,1288,1287,1289,1290 } --1235, 138, 
--------------------------------------------------------1296 tang toc do di chuye
local tbEquipFreeCell =
{
{2, 1}, {2, 2}, {1, 1}, {1, 2}, {2, 1},
{2, 3}, {2, 4}, {2, 2}, {1, 2}, {1, 1},
}

function knang180()
    if GetLevel() < 180 then
        Say("Nh©n vËt ph¶i ®¹t cÊp 180 míi häc ®­îc kü n¨ng 180 m«n ph¸i.", 0)
        return
    end

    local nFaction = GetLastFactionNumber()
    if nFaction < 0 or nFaction > 9 then
        Say("B¹n ph¶i gia nhËp mét trong 10 m«n ph¸i tr­íc khi häc kü n¨ng 180.", 0)
        return
    end

    local nSkillId = SKILL_180[nFaction + 1]
    local nCurrentLevel = HaveMagic(nSkillId)
    if nCurrentLevel >= 1 then
        Say("B¹n ®· häc kü n¨ng 180 <color=yellow>"..GetSkillName(nSkillId).."<color>.", 0)
        return
    end

    AddMagic(nSkillId, 1)

    local nLevelAfter = HaveMagic(nSkillId)
    if nLevelAfter >= 0 then
        Say("§· häc kü n¨ng 180 <color=yellow>"..GetSkillName(nSkillId).."<color>, cÊp hiÖn t¹i: "..nLevelAfter..".", 0)
        WriteLog(format("[Skill180] Account:%s Name:%s Faction:%d Skill:%d Level:%d", GetAccount(), GetName(), nFaction, nSkillId, nLevelAfter))
    else
        Say("Kh«ng thÓ thªm kü n¨ng 180. H·y b¸o Admin kiÓm tra b¶ng skills.txt.", 0)
        WriteLog(format("[Skill180-FAILED] Account:%s Name:%s Faction:%d Skill:%d", GetAccount(), GetName(), nFaction, nSkillId))
    end
end
-- [2026-08-11] FIX: skill 150/180 khong tang cap luyen khi danh quai (engine
-- khong tu dong cong skillexp qua combat cho cac ID ky nang tuy bien nay,
-- khac voi skill goc 90/120). Thay vi kich hoat lai he thong Bia cu (da gay
-- crash khi thu truoc do), them 1 duong luyen thu cong an toan ngay trong
-- menu NhanSkill dang hoat dong san, dung chung co che AddSkillExp nhu
-- skillexp_150_main.lua nhung khong dung NPC/map rieng -> khong co rui ro
-- boot-time nhu lan truoc.
LUYEN_SKILLEXP_COST = LUYEN_SKILLEXP_COST or 1000000  -- kinh nghiem nhan vat can cho 1 don vi exp luyen
LUYEN_SKILLEXP_AMOUNT = LUYEN_SKILLEXP_AMOUNT or 50   -- don vi quy doi (xem LUYEN_SKILLEXP_RATE ben duoi)
-- [2026-08-11] Nang cap luyen cang nhieu cang tot trong 1 lan bam, tru dung
-- luong EXP nhan vat tuong ung voi luong EXP luyen thuc nhan (khong phai gia
-- co dinh moi lan bam) - dung lai vong lap AddSkillExp cua skillexp_150_main.lua
-- (GetSkillNextExp/GetSkillExp) nhung chay lien tuc toi khi het cap hoac het
-- EXP nhan vat, thay vi dung lai sau 1 buoc nho.
LUYEN_SKILLEXP_RATE = LUYEN_SKILLEXP_RATE or floor(LUYEN_SKILLEXP_COST / LUYEN_SKILLEXP_AMOUNT) -- EXP nhan vat / 1 don vi EXP luyen

function ChonSkillLuyen150()
    ChonSkillLuyenTier(150)
end

function ChonSkillLuyen180()
    ChonSkillLuyenTier(180)
end

function ChonSkillLuyenTier(nTier)
    local nFaction = GetLastFactionNumber()
    if nFaction < 0 or nFaction > 9 then
        Say("Ban phai gia nhap mot trong 10 mon phai truoc.", 0)
        return
    end

    local tbSkillList
    if nTier == 150 then
        tbSkillList = SKILL_150_TRAINABLE[nFaction]
    else
        tbSkillList = { SKILL_180[nFaction + 1] }
    end
    if not tbSkillList then
        Say("Khong tim thay cau hinh ky nang cho mon phai nay.", 0)
        return
    end

    local tbOpt = {}
    for i = 1, getn(tbSkillList) do
        local nSkillId = tbSkillList[i]
        if HaveMagic(nSkillId) ~= -1 then
            local nLv = GetCurrentMagicLevel(nSkillId, 0)
            tinsert(tbOpt, { GetSkillName(nSkillId).." (cap luyen hien tai: "..nLv..")", LuyenSkillExpMax, {nSkillId} })
        end
    end
    if getn(tbOpt) == 0 then
        Say("Ban chua hoc ky nang nao thuoc nhom nay.", 0)
        return
    end
    tinsert(tbOpt, {"Quay lai", NhanSkill})
    tinsert(tbOpt, {"Thoat"})
    CreateNewSayEx("Chon ky nang can luyen (nang thang cap luyen toi da co the, khong tru EXP nhan vat):", tbOpt)
end

function IsSkill180(nSkillId)
    if not SKILL_180 then
        return 0
    end
    for i = 1, getn(SKILL_180) do
        if SKILL_180[i] == nSkillId then
            return 1
        end
    end
    return 0
end

function LuyenSkillExpMax(nSkillId)
    if HaveMagic(nSkillId) == -1 then
        Say("Ban chua hoc ky nang nay.", 0)
        return
    end
    -- [2026-08-14] Skill 180 la ho tro BI DONG: phai tu luyen dan theo thoi
    -- gian, khong cho nang cap thu cong tuc thi.
    if IsSkill180(nSkillId) == 1 then
        Say("Ky nang 180 la ho tro bi dong, phai tu luyen dan theo thoi gian - khong the nang cap thu cong.", 0)
        return
    end
    if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
        Say("Ky nang da dat cap luyen toi da.", 0)
        return
    end

    local nStartLevel = GetCurrentMagicLevel(nSkillId, 0)
    local nMaxLevel = GetSkillMaxLevel(nSkillId)
    local nGuard = 0
    local nLastNextExp = nil

    -- [2026-08-12] Bo hoan toan chi phi EXP nhan vat theo yeu cau - chi con
    -- nang thang len cap luyen toi da cua skill (vd 20 hoac 30 tuy skill),
    -- khong tru bat ky EXP nao cua nguoi choi nua.
    while GetCurrentMagicLevel(nSkillId, 0) < nMaxLevel and nGuard < 1000 do
        nGuard = nGuard + 1
        local nNextExp = GetSkillNextExp(nSkillId) - GetSkillExp(nSkillId)
        nLastNextExp = nNextExp
        if not nNextExp or nNextExp <= 0 then break end
        AddSkillExp(nSkillId, nNextExp, 1)
    end

    local nEndLevel = GetCurrentMagicLevel(nSkillId, 0)
    -- [2026-08-12] Log chi tiet moi lan bam de doi chieu neu van dung lai
    -- truoc MaxLevel: ly do dung (nGuard cham 1000 hay nNextExp<=0) va gia
    -- tri nLastNextExp cuoi cung engine tra ve, phuc vu chan doan tiep neu
    -- skill 180 van khong len het cap sau ban nay.
    WriteLog(format("[LuyenSkillExpMax] Account:%s Name:%s Skill:%d LevelFrom:%d LevelTo:%d MaxLevel:%d Guard:%d LastNextExp:%s",
        GetAccount(), GetName(), nSkillId, nStartLevel, nEndLevel, nMaxLevel, nGuard, tostring(nLastNextExp)))
    if nEndLevel < nMaxLevel then
        Say(format("Ky nang %s nang tu cap %d len cap %d (chua toi da %d - xem Logs de chan doan).", GetSkillName(nSkillId), nStartLevel, nEndLevel, nMaxLevel), 0)
    else
        Say(format("Ky nang %s da nang tu cap luyen %d len cap toi da %d.", GetSkillName(nSkillId), nStartLevel, nEndLevel), 0)
    end
end


------------------------Vµo ph¸i full skill 12x-----------------------------
function check_faction12x()
	local szCurFaction = GetFaction()
	if szCurFaction ~= nil and szCurFaction ~= "" then
		return
	end
	return 1
end

-- [2026-08-14] Nhan ky nang den cap 120 cho nhan vat DA co mon phai.
-- Dung dung nguon du lieu ma luong "vao phai" dang dung (gmscript AddSkills
-- + tbFaction[].tbSkill) nen ket qua giong het nguoi moi vao phai, chi khac
-- la khong goi SetFaction. Anh xa: nIndex = GetLastFactionNumber() + 1
-- (giong cach SKILL_180[nFaction + 1] dang dung).
function HocKyNang12xPhaiHienTai()
	local nFaction = GetLastFactionNumber()
	if nFaction < 0 or nFaction > 9 then
		Say("Khong xac dinh duoc mon phai hien tai cua nhan vat.", 0)
		return
	end
	local nIndex = nFaction + 1
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\gmscript.lua", "AddSkills", %tbFaction[nIndex].nShortFaction, 0)
	local nAdd = 0
	-- [2026-08-14] FIX: KHONG duoc bo qua bang HaveMagic. gmscript AddSkills
	-- o tren da them san cac skill nay o CAP 0, nen neu bo qua thi skill 90/120
	-- se ket o cap 0: khong thi trien duoc va khong cong diem duoc. Ban goc
	-- do_set_faction12x goi AddMagic(id, 1) vo dieu kien -> lam giong het de
	-- nhan vat cu nhan skill 90/120 o cap 1 nhu nguoi moi vao phai.
	for i = 1, getn(%tbFaction[nIndex].tbSkill) do
		AddMagic(%tbFaction[nIndex].tbSkill[i], 1)
		nAdd = nAdd + 1
	end
	-- [2026-08-15] FIX: Khinh cong (skill 210) KHONG nam trong tbSkill va cung
	-- khong co trong gmscript AddSkills, nen sau khi xoa sach ky nang thi nhan
	-- vat mat han Khinh cong. Bo sung o cap 1, dung cach loginmessage.lua va
	-- skills_table.lua:add_misc van lam. Co HaveMagic de khong ha cap nguoi da co.
	if HaveMagic(210) == -1 then
		AddMagic(210, 1)
		nAdd = nAdd + 1
	end
	WriteLog("[HocKyNang12x] "..GetName().." nhan ky nang den 120 cua phai "..%tbFaction[nIndex].szFaction.." (them "..nAdd.." skill)")
	Talk(1, "KickOutSelf", "§· nhËn ®Çy ®ñ kü n¨ng ®Õn cÊp 120. H·y ®¨ng nhËp l¹i ®Ó cËp nhËt b¶ng kü n¨ng.")
end

function choose_faction12x()
	if check_faction12x() ~= 1 then
		-- [2026-08-14] Truoc day chi bao "da gia nhap mon phai" roi thoat, nen
		-- nhan vat cu khong the nhan lai ky nang. Gio chuyen thang sang cap
		-- ky nang den 120 cho dung mon phai dang co.
		HocKyNang12xPhaiHienTai()
		return
	end
	local nSeries = GetSeries() + 1
	local szTitle = "Xin chµo <color=red>"..GetName().."<color>. Mét khi gia nhËp m«n ph¸i kh«ng thÓ thay ®æi, h·y suy nghÜ kü"
	local tbOpt = {}
	for i=1, getn(%tbFactionSeries[nSeries]) do
		local nIndex = %tbFactionSeries[nSeries][i]
		tinsert(tbOpt, {%tbFaction[nIndex].szShowName, set_faction12x, {nIndex}})
	end
	tinsert(tbOpt, {"Trë VÒ", NhanSkill})
	tinsert(tbOpt, {"Tho¸t"})
	CreateNewSayEx(szTitle, tbOpt)
end

function set_faction12x(nIndex)
	local szTitle = format("<color=red>"..GetName().."<color> Cã ch¾c ch¾n muèn gia nhËp ph¸i <color=yellow>%s<color> kh«ng?", %tbFaction[nIndex].szShowName)
	local tbOpt =
	{
		{"X¸c nhËn!", do_set_faction12x, {nIndex}},
		{"Trë VÒ.", choose_faction12x},
		{"KÕt thóc ®èi tho¹i."},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function do_set_faction12x(nIndex)
	if check_faction12x() ~= 1 then
		Talk(1, "", "Ng­êi ®· gia nhËp m«n ph¸i.")
		return
	end
	local nResult = SetFaction(%tbFaction[nIndex].szFaction)
	if nResult == 0 then
		return
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\gmscript.lua", "AddSkills", %tbFaction[nIndex].nShortFaction, 0)
	for i=1, getn(%tbFaction[nIndex].tbSkill) do--Add Skill 90-120
		AddMagic(%tbFaction[nIndex].tbSkill[i], 1)
	end
	-- [2026-08-15] FIX: bo sung Khinh cong (210) cap 1 nhu tren.
	if HaveMagic(210) == -1 then
		AddMagic(210, 1)
	end
	for i=1, getn(%tbFaction[nIndex].tbRank) do--Add X­ng HiÖu
		SetRank(%tbFaction[nIndex].tbRank[i])
	end
	Talk(1, "KickOutSelf", format("Ng­êi ®· gia nhËp thµnh c«ng ph¸i <color=yellow>%s", %tbFaction[nIndex].szShowName))
end


------Tay Tuy------------
function clear_attibute_point()
local szTitle = "<#>Xin chµo <color=red>"..GetName().."<color>. B¹n cÇn tÈy ®iÓm TiÒm N¨ng hay Kü N¨ng?\n\nHiÖn t¹i cã <color=red>"..GetPlayerCount().." <color>ng­êi ch¬i ®ang trùc tuyÕn.<color>"
local tbOpt =
{
{"TÈy §iÓm TiÒm N¨ng.", do_clear_prop},
{"TÈy §iÓm Kü N¨ng.", do_clear_skill},
{"Trë VÒ", NhanSkill},
{"Tho¸t."},
}
CreateNewSayEx(szTitle, tbOpt)
end
-- [2026-08-14] Cong cu TEST: xoa sach moi ky nang trong bang ky nang de
-- co the thu lai luong "Nhan ky nang" tu dau. Duyet toan bo dai SkillId
-- va chi goi DelMagic cho nhung id nhan vat thuc su dang co.
XOA_SKILL_ID_MAX = 2000

function XoaToanBoSkill()
    local tbOpt =
    {
        {"X¸c NhËn - Xo¸ S¹ch Toµn Bé Kü N¨ng", DoXoaToanBoSkill},
        {"Quay lai", NhanSkill},
        {"Tho¸t."},
    }
    CreateNewSayEx("C¶nh b¸o: thao t¸c nµy sÏ Xo¸ S¹ch mäi kü n¨ng trong b¶n kü n¨ng cña nh©n vËt (vÉn giö l¹i Khinh c«ng). §õng ®Ó Test häc l¹i. B¹n cã ch¾c kh«ng?", tbOpt)
end

-- [2026-08-15] Khinh cong (skill 210) hoc o Vo Su tu cap 1 va NPC nhan ky
-- nang KHONG cap lai duoc, nen phai giu lai khi xoa sach. Muon giu them ky
-- nang phu ngoai mon phai thi them id vao bang duoi (400 Kiep Phu Te Ban,
-- 397 Vu Lo Xuan Phong cung cung nhom).
SKILL_GIU_LAI = {210}

function LaSkillGiuLai(nId)
	for i = 1, getn(SKILL_GIU_LAI) do
		if SKILL_GIU_LAI[i] == nId then
			return 1
		end
	end
	return 0
end

function DoXoaToanBoSkill()
	local nCount = 0
	local nKhinhCong = HaveMagic(210)
	for nId = 1, XOA_SKILL_ID_MAX do
		if LaSkillGiuLai(nId) == 0 and HaveMagic(nId) ~= -1 then
			DelMagic(nId)
			nCount = nCount + 1
		end
	end
	-- an toan hai lop: neu Khinh cong van bi mat thi cap lai dung cap cu
	if HaveMagic(210) == -1 then
		if nKhinhCong < 1 then
			nKhinhCong = 1
		end
		AddMagic(210, nKhinhCong)
	end
	WriteLog("[XoaToanBoSkill] Account:"..GetAccount().." Name:"..GetName().." da xoa "..nCount.." ky nang, giu lai Khinh cong")
	Msg2Player("§· xo¸ "..nCount.." kü n¨ng (vÉn giö Khinh c«ng). H·y ®¨ng nhËp l¹i vµ dïng chøc n¨ng NhËn kü n¨ng ®Ó häc l¹i.")
	KickOutSelf()
end

function do_clear_skill()
local i = HaveMagic(210) 
local j = HaveMagic(400) 
local n = RollbackSkill() 
local x = 0
if (i ~= -1) then i = 1; x = x + i end 
if (j ~= -1) then x = x + j end
local rollback_point = n - x 
if (rollback_point + GetMagicPoint() < 0) then 
rollback_point = -1 * GetMagicPoint()
end
AddMagicPoint(rollback_point)
if (i ~= -1) then AddMagic(210, i) end 
if (j ~= -1) then AddMagic(400, j) end
Msg2Player("TÈy tñy thµnh c«ng! Ng­êi cã "..rollback_point.." ®iÓm kü n¨ng ®Ó ph©n phèi l¹i.")
KickOutSelf()
end
function do_clear_prop()
local base_str = {35,20,25,30,20} 
local base_dex = {25,35,25,20,15}
local base_vit = {25,20,25,30,25}
local base_eng = {15,25,25,20,40}
local player_series = GetSeries() + 1

local Utask88 = GetTask(88)
AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88, 1))
AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88, 2))
AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88, 3))
AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88, 4))
end
------Lay Skill Theo ID--------
function LaySkillID()
local szTitle = "Xin chµo Admin <color=red>"..GetName().."<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Trùc tuyÕn: <color=green>"..GetPlayerCount().."<color>"
local tbOpt =
{
	{"NhËn kü n¨ng", g_AskClientStringEx, {"1200,20", 0, 256, "ID kü n¨ng", {AddSkill, {self}} }}, 
	{"Xãa kü n¨ng", g_AskClientStringEx, {"1200", 0, 300, "ID kü n¨ng", {DelSkill, {self}} }},
	--{"Xãa kü n¨ng", skillmoi},
	{"NhËn danh s¸ch kü n¨ng", g_AskClientStringEx, {"1200,1210", 0, 256, "ID kü n¨ng", {AddDSSkill, {self}} }}, 
	{"Xãa danh s¸ch kü n¨ng", g_AskClientStringEx, {"1,1500", 0, 256, "ID kü n¨ng", {DelDSSkill, {self}} }}, 
	{"Trë VÒ", NhanSkill},
	{"Tho¸t."},
}
CreateNewSayEx(szTitle, tbOpt)
end
function AddDSSkill(szPos)
       local tbPos = lib:Split(szPos, ",")
       local s = tonumber(tbPos[1])
       local e = tonumber(tbPos[2])
      for i=s,e do AddMagic(i,20) end
end 

function skillmoi()
AddMagic(1656,20)
AddMagic(1646,20)
AddMagic(1636,20)
AddMagic(1631,20)
end 

function DelDSSkill(szPos) 
      local tbPos = lib:Split(szPos, ",")
       local s = tonumber(tbPos[1])
       local e = tonumber(tbPos[2])
      for i=s,e do DelMagic(i) end
end 

function AddSkill(szPos)
       local tbPos = lib:Split(szPos, ",")
       local id = tonumber(tbPos[1])
       local cap = tonumber(tbPos[2])
      AddMagic(id,cap)
end

function DelSkill(szPos) 
      local idskill = tonumber(szPos) 
      DelMagic(idskill) 
end

---=====| {"Céng §iÓm tiÒm n¨ng", congdiemtiemnang} - Star |=====---

function congdiemtiemnang()
	Say("ThÝch Minh: Ng­¬i muèn t¨ng ®iÓm kü n¨ng nµo?", 4,
		"T¨ng Søc M¹nh/add_prop_str",
		"T¨ng Th©n Ph¸p/add_prop_dex",
		"T¨ng Ngo¹i C«ng/add_prop_vit",
		"T¨ng Néi C«ng/add_prop_eng")
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "Xin h·y nhËp ®iÓm s søc m¹nh: ");
end

function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "Xin h·y nhËp ®iÓm s th©n ph¸p: ");
end

function add_prop_vit()
	AskClientForNumber("enter_vit_num", 0, GetProp(), "Xin h·y nhËp ®iÓm s ngo¹i c«ng:");
end

function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0, GetProp(), "Xin h·y nhËp ®iÓm s néi c«ng: ");
end

function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end

function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end

function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end

function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end
function OnCancel()
end;
---=====| {"Céng §iÓm tiÒm n¨ng", congdiemtiemnang} - END |=====---

------------------------ Nhan bo skill Phong Than ------------------------------
-- Nguon danh sach: cot 63 (StopWhenMove) trong settings/skills.txt
--   "Dao si"  = 28 skill    "Giap si" = 19 skill    "Di nhan" = 30 skill
-- Tat ca deu MaxLevel = 20, nam trong dai 1566-1643.
-- Tach thanh 3 bang rieng (khong dung key chuoi) cho chac an voi Lua 4.x.

SKILL_PT_DAOSI = {
    1589, 1590, 1591, 1592, 1593, 1594, 1595, 1596, 1597, 1598,
    1599, 1613, 1614, 1615, 1616, 1617, 1618, 1619, 1620, 1621,
    1622, 1623, 1624, 1625, 1626, 1627, 1628, 1629,
}

SKILL_PT_GIAPSI = {
    1588, 1609, 1610, 1611, 1612, 1630, 1631, 1632, 1633, 1634,
    1635, 1636, 1637, 1638, 1639, 1640, 1641, 1642, 1643,
}

SKILL_PT_DINHAN = {
    1566, 1567, 1568, 1569, 1570, 1571, 1572, 1573, 1574, 1575,
    1576, 1577, 1578, 1579, 1580, 1581, 1582, 1584, 1585, 1586,
    1587, 1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608,
}

function NhanSkillPhongThan()
    local tbOpt = {
        {"NhËn full skill §¹o SÜ", PhongThan_Nhan, {1}},
        {"NhËn full skill Gi¸p SÜ", PhongThan_Nhan, {2}},
        {"NhËn full skill DÞ Nh©n", PhongThan_Nhan, {3}},
        {"Trë L¹i", NhanSkill},
        {"Tho¸t"},
    }
    CreateNewSayEx("NhËn bé skill Phong ThÇn", tbOpt)
end

function PhongThan_Nhan(nNhom)
    local tbSkill = nil
    local szTen = ""
    if nNhom == 1 then
        tbSkill = SKILL_PT_DAOSI
        szTen = "§¹o SÜ"
    elseif nNhom == 2 then
        tbSkill = SKILL_PT_GIAPSI
        szTen = "Gi¸p SÜ"
    elseif nNhom == 3 then
        tbSkill = SKILL_PT_DINHAN
        szTen = "DÞ Nh©n"
    end

    if tbSkill == nil then
        Say("Nhãm kü n¨ng kh«ng hîp lÖ.", 0)
        return
    end

    local nCount = TanThu_MaxSkillList(tbSkill, 20, "PhongThan-"..szTen)

    Say("§· nhËn full skill <color=yellow>"..szTen.."<color>: "
        ..nCount.." kü n¨ng, tÊt c¶ lªn cÊp 20.", 0)
end
