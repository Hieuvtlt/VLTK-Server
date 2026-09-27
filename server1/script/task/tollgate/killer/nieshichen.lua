--BossÉ±ÊÖÈÎÎñ½ÓÒýnpc½Å±¾
--By LiuKuo 2005.3.25
Include ("\\script\\class\\ktabfile.lua")
Include ("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\missions\\challengeoftime\\npc\\dragonboat_main_caocap_dondau.lua")
Include("\\script\\missions\\challengeoftime\\npc\\dragonboat_main_caocap_todoi.lua")
Include("\\script\\missions\\challengeoftime\\npc\\dragonboat_main_socap_dondau.lua")
Include("\\script\\missions\\challengeoftime\\npc\\dragonboat_main_socap_todoi.lua")
Include("\\script\\event\\birthday_jieri\\200905\\chuangguan\\chuangguan.lua");
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\log.lua")
Include("\\script\\global\\nobitaxd\\config\\cfg_server.lua")
-- ´³¹Ø»î¶¯Ã¿ÈÕÅÅÐÐ°ñ
Include("\\script\\missions\\challengeoftime\\rank_perday.lua");
---- DescribÍ¼Æ¬ÃèÊö
--DescLink_NieShiChen = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>Äôß±³¾£º<link>";
--TSKID_KILLTASKID = 1082;	-- ½ÓÊÜµÄÄÄ¸öÈÎÎñ
--TSKID_KILLERDATE	= 1192;	--½ÓÈÎÎñÊ±µÄÈÕÆÚ
--TSKID_KILLERMAXCOUNT	= 1193;	--Ã¿ÌìÉ±ÈË´ÎÊý
--KILLER_MAXCOUNT		= 8;	--Ã¿ÌìÉ±ÈËÉÏÏÞ8ÈË

--Thªm dßng kiÓm tra ®iÒu kiÖn tham gia khiªu chiÕn cña tæ ®éi - Modified by DinhHQ - 20110504
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")

tab_ToaDoBossST = {
	--    Tªn boss ph¶i lÊy trong \script\task\tollgate\killbosshead.lua nã míi chuÈn. Vµ FindNpc nã míi cã thÓ t×m thÊy
	--    IDMap,ID(Sè dßng)trong killer.txt, tªn boss, tªn map, cÊp ®é boss s¸t thñ
		{73,1,"Tr¸c L·nh CÇm","Phôc L­u ®éng",20,1545,2947},
		{73,2,"Tiªu Thiªn Ng¹o","Phôc L­u ®éng",20,1418,3034},
		{73,3,"Môc Minh KiÖt","Phôc L­u ®éng",20,1640,3088},
		{73,4,"TÊt V­u Phãng","Phôc L­u ®éng",20,1740,3044},
		{43,5,"Lôc Cöu U","KiÕm C¸c Trung Nguyªn",20,1607,3038},
		{43,6,"Bé Hiªu TrÇn","KiÕm C¸c Trung Nguyªn",20,1717,3141},
		{43,7,"Cèc KiÕm Thu","KiÕm C¸c Trung Nguyªn",20,1806,3062},
		{43,8,"ThiÖu Hoa Dung","KiÕm C¸c Trung Nguyªn",20,1784,2746},
		{71,9,"Quan Tö M¹c","B¹ch Thñy ®éng",20,1684,3136},
		{71,10,"Bµnh ThÝch H¶i","B¹ch Thñy ®éng",20,1602,3081},
		{71,11,"BÝch Phï B×nh","B¹ch Thñy ®éng",20,1578,3187},
		{71,12,"Tr­îng L·nh s¬n ","B¹ch Thñy ®éng",20,1599,3293},
		{83,13,"Tiªu KiÕm TuyÕt","Háa Lang ®éng",20,1513,3086},
		{83,14,"Kha ThiÕu Gia","Háa Lang ®éng",20,1561,2885},
		{83,15,"Ch­ëng B¸t Ph­¬ng","Háa Lang ®éng",20,1720,3031},
		{83,16,"Méng Êt  Phi","Háa Lang ®éng",20,1696,3197},
		{14,17,"T­ §å TuyÖt Chñy","M·nh Hæ ®éng",20,1799,3214},
		{14,18,"Th­îng Quan L·ng","M·nh Hæ ®éng",20,1712,3312},
		{14,19,"D­¬ng Thanh Èn","M·nh Hæ ®éng",20,1628,3172},
		{14,20,"Ngôy Chiªm Th©n","M·nh Hæ ®éng",20,1704,3214},
		{4,21,"§µo §o¹t Thu","Kim Quang ®éng",30,1577,2996},
		{4,22,"Xµ B¸ §«ng","Kim Quang ®éng",30,1755,3251},
		{4,23,"L­¬ng T­ Nam ","Kim Quang ®éng",30,1747,2973},
		{4,24,"Tr¸c ThÊt Lang","Kim Quang ®éng",30,1539,2894},
		{22,25,"KiÒu §Ønh Thiªn","B¹ch V©n ®éng",30,1722,3187},
		{22,26,"Träng V« CÊp","B¹ch V©n ®éng",30,1784,3040},
		{22,27,"KhÝ CÇm SÜ","B¹ch V©n ®éng",30,1890,3206},
		{22,28,"§inh V¨n Dôc","B¹ch V©n ®éng",30,1727,3350},
		{77,29,"Phong Ngò Ên","YÕn Tö ®éng",30,1368,3508},
		{77,30,"Khang  BÊt Hèi","YÕn Tö ®éng",30,1447,3355},
		{77,31,"Ph­¬ng Dùc Viªm","YÕn Tö ®éng",30,1649,3269},
		{77,32,"Ninh T©m Cuång","YÕn Tö ®éng",30,1623,3535},
		{141,33,"H×nh Phô Sinh","D­îc V­¬ng §éng TÇng 1",30,1575,3265},
		{141,34,"Ho¾c TrÊn Phi","D­îc V­¬ng §éng TÇng 1",30,1555,3220},
		{141,35,"Qu¶n V« YÕm","D­îc V­¬ng §éng TÇng 1",30,1663,3273},
		{141,36,"DiÖp VÜnh ¢n","D­îc V­¬ng §éng TÇng 1",30,1635,3194},
		{193,37,"¢u chÝ Phong","Vò Di s¬n",30,1250,2965},
		{193,38,"§éc C« HiÖp","Vò Di s¬n",30,919,2668},
		{193,39,"H¹ng Phï Nhai","Vò Di s¬n",30,967,2705},
		{193,40,"Nghª §¹i Chu","Vò Di s¬n",30,1442,3181},
		{5,41,"Du Th¸n Giang","Kinh Hoµng ®éng",40,1616,3476},
		{5,42,"H¹ Hïng Phi","Kinh Hoµng ®éng",40,1442,3379},
		{5,43,"Tèng Vò Phong","Kinh Hoµng ®éng",40,1602,3284},
		{5,44,"Lé Th­îng Nh©n","Kinh Hoµng ®éng",40,1757,3616},
		{168,45,"NhËm T«ng Hoµnh","Phông Nh·n ®éng",40,1765,3222},
		{168,46,"Hµn Khanh Long","Phông Nh·n ®éng",40,1767,3038},
		{168,47,"Tr× PhÈm Chi","Phông Nh·n ®éng",40,1646,2923},
		{168,48,"Chung ThiÕt Thèi","Phông Nh·n ®éng",40,1525,2940},
		{23,49,"§iªu DÞch §ao","ThÇn Tiªn ®éng",40,1699,3178},
		{23,50,"§å Tµn Sinh","ThÇn Tiªn ®éng",40,1774,3086},
		{23,51,"Bµng V« TÜnh","ThÇn Tiªn ®éng",40,1866,3181},
		{23,52,"Lý Hoa §é","ThÇn Tiªn ®éng",40,1770,3319},
		{91,53,"ThÝch ¶nh Sa","Mª Cung Kª Qu¸n ®éng",40,1539,3011},
		{91,54,"Nguy Nh©n Tö ","Mª Cung Kª Qu¸n ®éng",40,1534,2785},
		{91,55,"Cè ViÔn Khª","Mª Cung Kª Qu¸n ®éng",40,1695,2972},
		{91,56,"Tang Ninh Cèc","Mª Cung Kª Qu¸n ®éng",40,1660,3101},
		{135,57,"Diªm Tù H÷u","KiÕn TÝnh Phong s¬n ®éng",40,1740,2960},
		{135,58,"§µm Thiªn Béc","KiÕn TÝnh Phong s¬n ®éng",40,1812,3040},
		{135,59,"Th¹ch Cè KiÒu","KiÕn TÝnh Phong s¬n ®éng",40,1609,3097},
		{135,60,"øng Th¸i HiÖp","KiÕn TÝnh Phong s¬n ®éng",40,1540,2902},
		{12,61,"M¹nh §¹p Hång","§Þa §¹o HËu ViÖn TÝn T­íng Tù",50,1796,3172},
		{12,62,"¢n  Tøc HËn","§Þa §¹o HËu ViÖn TÝn T­íng Tù",50,1724,3113},
		{12,63,"Ho¾c Thanh S­¬ng","§Þa §¹o HËu ViÖn TÝn T­íng Tù",50,1703,3205},
		{12,64,"Miªn T­ §¹o","§Þa §¹o HËu ViÖn TÝn T­íng Tù",50,1783,3272},
		{24,65,"TiÕu Väng Du","H­ëng Thñy ®éng",50,1796,3238},
		{24,66,"Cao N·i Kho¸t","H­ëng Thñy ®éng",50,1903,3284},
		{24,67,"M¹nh Tö  Vò ","H­ëng Thñy ®éng",50,1955,3383},
		{24,68,"§­êng NghÜa Chi","H­ëng Thñy ®éng",50,2065,3216},
		{42,69,"L©u Vi ThiÖn","Thiªn T©m ®éng",50,1592,2932},
		{42,70,"Lç Tranh Tranh","Thiªn T©m ®éng",50,1527,3161},
		{42,71,"Sö Tiªu s¬n","Thiªn T©m ®éng",50,1638,2994},
		{42,72,"T©y M«n V« Giíi","Thiªn T©m ®éng",50,1708,3114},
		{66,73,"Giíi T×nh ChØ","§¸y §éng §×nh Hå TÇng 1",50,1725,3237},
		{66,74,"L«i HuyÔn Kh¸ch","§¸y §éng §×nh Hå TÇng 1",50,1699,3316},
		{66,75,"DiÖp Ngò Long","§¸y §éng §×nh Hå TÇng 1",50,1838,3237},
		{66,76,"TiÕt TiÓu B¸ch","§¸y §éng §×nh Hå TÇng 1",50,1657,3196},
		{194,77,"MËu TuÊt Nhung","Ngäc Hoa ®éng",50,1723,3371},
		{194,78,"D­¬ng DiÔm Qu©n","Ngäc Hoa ®éng",50,1771,3213},
		{194,79,"Du Tiªu C­êng","Ngäc Hoa ®éng",50,1538,3105},
		{194,80,"C« Dù  TÈu","Ngäc Hoa ®éng",50,1482,3467},
		{164,81,"U«ng  ThÖ Thñy","Thiªn TÇm Th¸p TÇng 1",60,1787,3131},
		{164,82,"YÕn L­u  Sanh","Thiªn TÇm Th¸p TÇng 1",60,1780,2938},
		{164,83,"Tang Th­¬ng H¶i","Thiªn TÇm Th¸p TÇng 1",60,1723,3083},
		{164,84,"Bå ThËp Tam","Thiªn TÇm Th¸p TÇng 1",60,1571,3040},
		{117,85,"HËu  KhÊt KiÕm","T­êng V©n §éng TÇng 2",60,1669,3011},
		{117,86,"HËu YÕn T©n","T­êng V©n §éng TÇng 2",60,1534,3118},
		{117,87,"ThiÖu ThÊt S¸t","T­êng V©n §éng TÇng 2",60,1660,3145},
		{117,88,"Du V¹n Lý","T­êng V©n §éng TÇng 2",60,1685,3256},
		{56,89,"Cõu DuÉn Sam","Hoµnh s¬n ph¸i",60,1466,3448},
		{56,90,"Th­îng Quan ChÊt","Hoµnh s¬n ph¸i",60,1536,3389},
		{56,91,"T¸i ViÔn B¹c","Hoµnh s¬n ph¸i",60,1505,3234},
		{56,92,"T­ëng HuyÒn ViÔn","Hoµnh s¬n ph¸i",60,1631,3167},
		{148,93,"KhuÊt Léc Vinh","TuyÕt b¸o ®éng tÇng 4",60,1539,3302},
		{148,94,"L« Qu¸n B¾c","TuyÕt b¸o ®éng tÇng 4",60,1567,3283},
		{148,95,"Gi¶i Qui Nam","TuyÕt b¸o ®éng tÇng 4",60,1599,3318},
		{148,96,"Tïng V« ¶nh","TuyÕt b¸o ®éng tÇng 4",60,1628,3209},
		{196,97,"TiÔn Thª Thanh","D­¬ng Gi¸c ®éng",60,1533,3047},
		{196,98,"B¹ch Th­¬ng Nham","D­¬ng Gi¸c ®éng",60,1654,2953},
		{196,99,"BiÖn L­u ThiÖn","D­¬ng Gi¸c ®éng",60,1774,3192},
		{196,100,"Th¸i Tinh ThÇn","D­¬ng Gi¸c ®éng",60,1662,3356},
		{123,101,"H¹ng LÖnh Ti","L·o Hæ ®éng",70,1604,3210},
		{123,102,"Tµo Nh©n  Phñ","L·o Hæ ®éng",70,1706,3254},
		{123,103,"Tr×nh Phóc Tam","L·o Hæ ®éng",70,1583,3375},
		{123,104,"§Æng An Khuª","L·o Hæ ®éng",70,1554,3303},
		{94,105,"øng  Tiªu Phong","Linh Cèc ®éng",70,1670,3126},
		{94,106,"Th­¬ng TriÒu S­¬ng","Linh Cèc ®éng",70,1755,3170},
		{94,107,"Phïng Song Dùc","Linh Cèc ®éng",70,1591,3251},
		{94,108,"Phã Kh©u Tu","Linh Cèc ®éng",70,1613,3041},
		{319,109,"L¹c Long HiÒn","L©m du quan",70,1663,3311},
		{319,110,"Cæ Thanh D­¬ng","L©m du quan",70,1859,3273},
		{319,111,"Quan Thiªn VÊn","L©m du quan",70,1933,3642},
		{319,112,"H¹ ThiÕu Hïng","L©m du quan",70,1815,3419},
		{72,113,"T« Cæ Ng©m","§¹i Tï ®éng",70,1630,3121},
		{72,114,"Hå NhÊt Lang","§¹i Tï ®éng",70,1807,3201},
		{72,115,"Hoµng V¹n KiÕp","§¹i Tï ®éng",70,1590,3238},
		{72,116,"Giang TrÇm Nh¹n","§¹i Tï ®éng",70,1562,2986},
		{76,117,"C¶nh Dung Phôc","S¬n B¶o ®éng",70,1655,3140},
		{76,118,"Kh­¬ng Tù Dao","S¬n B¶o ®éng",70,1590,3153},
		{76,119,"Khæng Dong Nh©n","S¬n B¶o ®éng",70,1835,3066},
		{76,120,"L¨ng TËn Trung","S¬n B¶o ®éng",70,1614,3027},
		{201,121,"DiÖp øc Anh","B¨ng Hµ ®éng",80,1768,3200},
		{201,122,"L¹c NhÜ Kim","B¨ng Hµ ®éng",80,1649,3184},
		{201,123,"M¹c Nam Tróc","B¨ng Hµ ®éng",80,1698,3320},
		{201,124,"TÇn Tö Du","B¨ng Hµ ®éng",80,1839,3365},
		{10,125,"C« V« Th­êng","Nh¹n Th¹ch ®éng",80,1750,2997},
		{10,126,"LiÔu Tø Gia","Nh¹n Th¹ch ®éng",80,1849,3229},
		{10,127,"Thi §¹i ThiÕu","Nh¹n Th¹ch ®éng",80,1755,3225},
		{10,128,"T«n V¨n B­u","Nh¹n Th¹ch ®éng",80,1675,3149},
		{202,129,"§ång BÊt Phôc","Phï Dung ®éng",80,1548,2836},
		{202,130,"§­êng B¸c V¨n","Phï Dung ®éng",80,1715,2925},
		{202,131,"§µo §¶o Chñ ","Phï Dung ®éng",80,1610,3141},
		{202,132,"§iÒn V« §¹o","Phï Dung ®éng",80,1514,2666},
		{181,133,"Viªn NiÖm TÞch","L­ìng Thñy ®éng",80,1598,3111},
		{181,134,"TrÞnh Tr¸c QuÇn","L­ìng Thñy ®éng",80,1625,2974},
		{181,135,"Ch­¬ng Nguyªn Sïng","L­ìng Thñy ®éng",80,1696,3031},
		{181,136,"T¹ Träng HËu","L­ìng Thñy ®éng",80,1694,3229},
		{143,137,"Vu Cöu  §å","d­îc v­¬ng ®éng tÇng 3",80,1536,3152},
		{143,138,"Viªn Thiªn Thä","d­îc v­¬ng ®éng tÇng 3",80,1528,3251},
		{143,139,"Nh¹c Th­îng C«n","d­îc v­¬ng ®éng tÇng 3",80,1642,3130},
		{143,140,"Chiªm Phóc V©n","d­îc v­¬ng ®éng tÇng 3",80,1634,3252},
		{93,141,"Cæ Giíi Nh©n","TiÕn Cóc ®éng",90,1644,3279},
		{93,142,"TrÞnh Cöu NhËt","TiÕn Cóc ®éng",90,1646,3058},
		{93,143,"Chu Së B¸","TiÕn Cóc ®éng",90,1736,3213},
		{93,144,"Trang Minh Trung","TiÕn Cóc ®éng",90,1610,3152},
		{225,145,"Cam ChÝnh C«","Sa M¹c 1",90,1590,3325},
		{225,146,"Vò NhÊt ThÕ","Sa M¹c 1",90,1261,3247},
		{225,147,"D­¬ng Phong DËt","Sa M¹c 1",90,1452,3377},
		{225,148,"Hµ Sinh Vong","Sa M¹c 1",90,1425,3107},
		{75,149,"T»ng ChØ O¸n","Kho¶ Lang ®éng",90,1711,3187},
		{75,150,"VÖ Biªn Thµnh","Kho¶ Lang ®éng",90,1752,3124},
		{75,151,"Cè Thñ §»ng","Kho¶ Lang ®éng",90,1831,3190},
		{75,152,"Ch­ C¸t Kinh Hång","Kho¶ Lang ®éng",90,1639,3159},
		{321,153,"Phan Ng¹t Nhan","Tr­êng B¹ch S¬n Nam",90,1253,3002},
		{321,154,"Liªn Kinh Th¸i","Tr­êng B¹ch S¬n Nam",90,1483,2742},
		{321,155,"B¶o TriÖt S¬n","Tr­êng B¹ch S¬n Nam",90,1289,2613},
		{321,156,"V¹n Hå Tinh","Tr­êng B¹ch S¬n Nam",90,1113,2569},
		{340,157,"Trö Thiªn MÉn","M¹c Cao QuËt",90,1217,2740},
		{340,158,"§o¹n L¨ng NguyÖt","M¹c Cao QuËt",90,1723,2765},
		{340,159,"T¶ DËt Danh","M¹c Cao QuËt",90,1275,2749},
		{340,160,"Nh©m Th­¬ng Khung","M¹c Cao QuËt",90,1932,2759},
	} 
	
ContentList = {
	"<#> NhiÖm vô S¸t Thñ hiÖn kh«ng giíi h¹n sè lÇn hoµn thµnh trong ngµy. Cã thÓ chän bÊt kú cÊp Boss nµo, kh«ng giíi h¹n theo cÊp nh©n vËt. H·y chän môc tiªu muèn truy s¸t. <enter>Sau khi chän Boss, hÖ thèng sÏ kiÓm tra tr¹ng th¸i Cßn Sèng hoÆc Boss ®· chÕt tr­íc khi b¾t ®Çu nhiÖm vô.",
	"<#> NhiÖm vô s¸t thñ cÊp 20/killer20",
	"<#> NhiÖm vô s¸t thñ cÊp 30/killer30",
	"<#> NhiÖm vô s¸t thñ cÊp 40/killer40",
	"<#> NhiÖm vô s¸t thñ cÊp 50/killer50",	--5
	"<#> NhiÖm vô s¸t thñ cÊp 60/killer60",
	"<#> NhiÖm vô s¸t thñ cÊp 70/killer70",
	"<#> NhiÖm vô s¸t thñ cÊp 80/killer80",
	"<#> NhiÖm vô s¸t thñ cÊp 90/killer90",
	"<#> Ta ®¸nh kh«ng muèn giÕt ng­êi ®©u, hñy bá nhiÖm vô./cancel",	--10
	"<#> M¸u ch¶y ®Çu r¬i, tèt nhÊt lµ ta nªn tr¸nh xa/no",
	"<#> Ng­¬i ®· hñy bá nhiÖm vô. Lµm s¸t thñ tr­íc tiªn ph¶i cã thñ ph¸p siªu phµm, hai lµ h¹ thñ v« t×nh, xem ra ng­¬i kh«ng thÝch hîp, kh«ng ®i còng kh«ng sao.",
	"<#> Ng­êi lÇn tr­íc ta nãi ng­¬i ®i h¹ thñ vÉn cßn sèng, h·y chøng minh thùc lùc cña m×nh tr­íc ®i ®·.",
	"<#> §¼ng cÊp cña ng­¬i kh«ng phï hîp, ph¶i giao ®Êu cïng víi ng­êi cã ®¼ng cÊp t­¬ng øng míi ®­îc.",
	"<#> §ãng/no",	--15
	"<#> §¼ng cÊp nh­ thÕ cã 20 s¸t thñ, tay mçi ng­êi ®Òu nhuèm ®Çy m¸u, ng­¬i muèn ®¸nh víi ng­êi nµo?",
	"<#> Hîp thµnh s¸t thñ gi¶n/compose",
	"<#> S¸t thñ gi¶n b¹n ®Ó kh«ng ®óng, viÖc quan s¸t vµ cÆp m¾t tinh t­êng lµ rÊt quan träng.",
	"<#> S¸t thñ lÖnh b¹n ®Ó qu¸ nhiÒu, s¸t thñ còng ph¶i cã nghÖ thuËt cña nã, kh«ng thÓ nµo mµ ngay c¶ sinh mÖnh cña b¶n th©n m×nh còng kh«ng biÕt.",
	"<#> S¸t thñ lÖnh b¹n ®Ó qu¸ Ýt, s¸t thñ còng ph¶i cã nghÖ thuËt cña nã, kh«ng thÓ nµo mµ ngay c¶ sinh mÖnh cña b¶n th©n m×nh còng kh«ng biÕt.",	--20
	"<#> Hîp l¹i mét lÇn n÷a/compose",
	"<#> B¹n ®· hîp thµnh mét<color=",
	"<#> Thuéc tÝnh<color> s¸t thñ gi¶n, s¸t thñ gi¶n lµ mét s¸t thñ phi phµm. B¹n cã thÓ dïng mét s¸t thñ cïng cÊp ®Ó so tµi víi s¸t thñ gi¶n, quy t¾c th¾ng thua ®­îc ¸p dông theo quy t¾c t­¬ng kh¾c cña ngò hµnh. ",
	"<#> Thö luyÖn s¸t thñ /annealofkiller",
	"<#> Tham gia khiªu chiÕn/want_playboat",	--25
	"<#> S¸t thñ luyÖn thøc tr­íc tiªn ph¶i b¾t ®Çu tõ viÖc tham gia khiªu chiÕn, ng­¬i d¸m tiÕp nhËn nhiÖm vô chø?",
	"<#> Liªn quan ®Õn khiªu chiÕn/aboutchallenge",
	"<#> Cø mçi giê hÖ thèng sÏ th«ng b¸o 1 lÇn. Thêi gian b¸o danh lµ 5 phót, thùc hiÖn chØ trong 30 phót. Mçi ng­êi chØ tèi ®a 2 lÇn/ngµy. Ph¶i ®o ®éi tr­ëng ®Õn b¸o danh. <enter>”NhiÖm vô th¸ch thøc thêi gian” gåm 2 khu vùc tham gia. S¬ cÊp: ng­êi ch¬i tõ cÊp 50 ®Õn 89, do ®éi tr­ëng mang 2 s¸t thñ gi¶n d­íi cÊp 90 (ngò hµnh bÊt kú) ®i b¸o danh. Cao cÊp: ng­êi ch¬i tõ cÊp 90, do ®éi tr­ëng mang 2 s¸t thñ gi¶n cÊp 90 (ngò hµnh bÊt kú) ®i b¸o danh. <enter>Néi trong thêi gian quy ®Þnh, nÕu v­ît qua hÕt 28 ¶i sÏ hoµn thµnh. Mçi ¶i phÇn th­ëng kinh nghiÖm sÏ kh¸c nhau. NÕu hoµn thµnh nhiÖm vô tr­íc thêi gian h¹n ®Þnh, phÇn th­ëng kinh nghiÖm sÏ cµng cao <enter>NÕu tr­íc thêi h¹n ®· hoµn thµnh, cã thÓ sÏ xuÊt hiÖn thªm 1 ¶i, trong ®ã cã nhiÒu phÇn th­ëng bÊt ngê (vËt phÈm ngÉu nhiªn, trang bÞ Hoµng Kim…). ChØ nh÷ng ®éi ®· v­ît 28 ¶i ®óng thêi gian quy ®Þnh míi cã tªn trong b¶ng xÕp h¹ng.",
	--"<#> NhiÖm vô \"Qu¸ quan tÇm b¶o\"/guoguan_xunbao",
	"<#> Ta ®Õn nhËn th­ëng/rank_award", --29
    "<#> Ta ®Õn xem xÕp h¹ng 5 ®éi cao nhÊt cña h«m nay./get_top5team",	
	"<#> V­ît ¶i §¬n S¬ CÊp/want_playboat_socap_dondau",    
	"<#> V­ît ¶i §¬n - C¸ Nh©n/want_playboat_caocap_dondau",
    "<#> V­ît ¶i Tæ §éi S¬ CÊp/want_playboat_socap_todoi",
    "<#> V­ît ¶i Tæ §éi/want_playboat_caocap_todoi", --34    
		  
}


killertabfile = new(KTabFile,"/settings/task/tollgate/killer/killer.txt","KILLER")

function main()
	UWorld1082 = nt_getTask(1082);
	local tbDialog = {ContentList[24],ContentList[17],ContentList[2],ContentList[3],ContentList[4],ContentList[5],ContentList[6],ContentList[7],ContentList[8],ContentList[9],ContentList[10],ContentList[15]};
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 12, ContentList[29]);
	end
	Describe(DescLink_NieShiChen..ContentList[1], getn(tbDialog), unpack(tbDialog));
end

function annealofkiller()
--Thªm dßng kiÓm tra ®iÒu kiÖn tham gia khiªu chiÕn cña tæ ®éi - Modified by DinhHQ - 20110504
	--Describe(DescLink_NieShiChen..ContentList[26], 3, ContentList[25],ContentList[27],ContentList[11]);
	Describe(DescLink_NieShiChen..ContentList[26],4,ContentList[32],ContentList[34],ContentList[27],ContentList[11]);
end
--"<#> KiÓm tra ®iÒu kiÖn tæ ®éi/#tbCOT_Party:CheckCondition()"
function aboutchallenge()
	Describe(DescLink_NieShiChen..ContentList[28],1, ContentList[15]);
end

function killer20()
	if ( killerCoundTakedTask(20, 29) == 0) then
		return 0;
	end;
	showboss( 0 );
end

function killer30()
	if ( killerCoundTakedTask(30, 39) == 0) then
		return 0;
	end;
	showboss( 20 );
end

function killer40()
	if ( killerCoundTakedTask(40, 49) == 0) then
		return 0;
	end;
	showboss( 40 );
end

function killer50()
	if ( killerCoundTakedTask(50, 59) == 0) then
		return 0;
	end;
	showboss( 60 );
end

function killer60()
	if ( killerCoundTakedTask(60, 69) == 0) then
		return 0;
	end;
	showboss( 80 );
end

function killer70()
	if ( killerCoundTakedTask(70, 79) == 0) then
		return 0;
	end;
	showboss( 100 );
end

function killer80()
	if ( killerCoundTakedTask(80, 89) == 0) then
		return 0;
	end;
	showboss( 120 );
end

function killer90()
	if ( killerCoundTakedTask(90, 350) == 0) then
		return 0;
	end;
	showboss( 140 );
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBossSatThu")
end

function cancel()
	if (nt_getTask(1082) == 0) then
		Talk(1, "", "Ng­¬i ch­a nhËn nhiÖm vô, kh«ng thÓ hñy bá!")
	return end
	nt_setTask(1082, 0);
	Describe(DescLink_NieShiChen..ContentList[12], 1,ContentList[15]);
end

-- KST V10: live boss lookup based on the same APIs used by script/lib/funclibex.lua.
-- Return: alive(1/0), mapId, teleportX, teleportY.
function KST_GetBossLivePos(taskid)
	taskid = tonumber(taskid);
	if (not taskid) or taskid < 1 or taskid > getn(tab_ToaDoBossST) then
		return 0, 0, 0, 0;
	end;
	local nMap = tonumber(tab_ToaDoBossST[taskid][1]);
	local szBossName = tab_ToaDoBossST[taskid][3];
	if (not nMap) or (not szBossName) then
		return 0, 0, 0, 0;
	end;
	local tbNpc = GetMapNpcWithName(nMap, szBossName);
	if tbNpc == nil or tbNpc == szBossName or tbNpc[1] == nil then
		return 0, nMap, 0, 0;
	end;
	local nRawX, nRawY, nSubWorld = GetNpcPos(tbNpc[1]);
	if (not nRawX) or (not nRawY) or (not nSubWorld) then
		return 0, nMap, 0, 0;
	end;
	local nWorld = SubWorldIdx2ID(nSubWorld);
	if (not nWorld) or nWorld <= 0 then
		nWorld = nMap;
	end;
	return 1, nWorld, floor(nRawX / 32), floor(nRawY / 32);
end

-- If boss is alive, use its current position. If dead/not found, use exact killbosshead.lua spawn point.
function KST_GetBossTeleportPos(taskid)
	local nAlive, nWorld, nX, nY = KST_GetBossLivePos(taskid);
	if nAlive == 1 then
		return 1, nWorld, nX, nY;
	end;
	local nSpawnW = tonumber(tab_ToaDoBossST[taskid][1]);
	local nSpawnX = tonumber(tab_ToaDoBossST[taskid][6]);
	local nSpawnY = tonumber(tab_ToaDoBossST[taskid][7]);
	if (not nSpawnW) or (not nSpawnX) or (not nSpawnY) then
		return 0, 0, 0, 0;
	end;
	return 0, nSpawnW, nSpawnX, nSpawnY;
end

-- KST V2 TEAM: normalize daily bookkeeping for the PlayerIndex currently in context.
function KST_RefreshKillerDayForCurrentPlayer()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	local nMyDate = nt_getTask(TSKID_KILLERDATE);
	if nMyDate ~= nDate then
		nt_setTask(TSKID_KILLERMAXCOUNT, 0);
		nt_setTask(TSKID_KILLERDATE, nDate);
	end;
end

-- Assign/replace Killer Boss task for the PlayerIndex currently in context.
-- Direct overwrite is the native task-variable equivalent of cancelling the old Killer task and taking the new one.
function KST_AssignBossTaskCurrentPlayer(taskid)
	KST_RefreshKillerDayForCurrentPlayer();
	nt_setTask(TSKID_KILLTASKID, taskid);
	return 1;
end

-- One member chooses => every CURRENT online team member gets exactly the chooser's task.
-- Member indexes are snapshotted before PlayerIndex is switched, matching native JX team patterns.
function KST_SyncBossTaskToCurrentTeam(taskid)
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	if nMemCount == 0 then
		KST_AssignBossTaskCurrentPlayer(taskid);
		return 1;
	end;

	local tbMember = {};
	for i = 1, nMemCount do
		tbMember[i] = GetTeamMember(i);
	end;

	local nAssigned = 0;
	for i = 1, nMemCount do
		if tbMember[i] ~= nil and tbMember[i] > 0 then
			PlayerIndex = tbMember[i];
			KST_AssignBossTaskCurrentPlayer(taskid);
			nAssigned = nAssigned + 1;
		end;
	end;
	PlayerIndex = nPreservedPlayerIndex;

	-- Defensive fallback: if engine reports a team but no usable member index, never leave the chooser without a task.
	if nAssigned == 0 then
		KST_AssignBossTaskCurrentPlayer(taskid);
		return 1;
	end;
	return nAssigned;
end

-- Build the FIRST boss-list label with realtime status.
function KST_GetBossMenuLabel(taskid)
	taskid = tonumber(taskid);
	if (not taskid) or taskid < 1 or taskid > getn(tab_ToaDoBossST) then
		return "?";
	end;
	local szBossName = killertabfile:getCell("BossName", taskid);
	if szBossName == nil or szBossName == "" then
		szBossName = tab_ToaDoBossST[taskid][3];
	end;
	local nAlive = KST_GetBossLivePos(taskid);
	if nAlive == 1 then
		return "-Cßn Sèng- "..szBossName;
	end;
	return "-§· ChÕt- "..szBossName;
end

function KST_ShowBossStatus(taskid)
	taskid = tonumber(taskid);
	if (not taskid) or taskid < 1 or taskid > getn(tab_ToaDoBossST) then
		Msg2Player("D÷ liÖu nhiÖm vô S¸t Thñ kh«ng hîp lÖ!");
		return 0;
	end;
	local nAlive = KST_GetBossLivePos(taskid);
	local szBossName = tab_ToaDoBossST[taskid][3];
	local szBossInfo = killertabfile:getCell("BossInfo", taskid);
	local szStatus = "";
	local szDeadHint = "";
	if nAlive == 1 then
		szStatus = "-Cßn Sèng-";
	else
		szStatus = "-§· ChÕt-";
		szDeadHint = "<enter>SÏ ®­a ®Õn ®iÓm xuÊt hiÖn ®Ó chê håi sinh.";
	end;
	-- Status is intentionally plain text and placed first because this legacy client renders color tags literally.
	local szText = DescLink_NieShiChen..szStatus.." "..szBossName.."<enter>"..szBossInfo..szDeadHint;
	local tbSay = {};
	if TuDichChuyen == 1 then
		tinsert(tbSay, "VÞ ®¹i hiÖp h·y b¾t ®Çu nhiÖm vô/#Bil_Go2BossPos("..taskid..")");
	end;
	tinsert(tbSay, "§ãng/no");
	Say(szText, getn(tbSay), tbSay);
	return 1;
end

function havetask()
	local nTaskId = nt_getTask(TSKID_KILLTASKID);
	if nTaskId ~= 0 then
		KST_ShowBossStatus(nTaskId);
		return 0;
	end;
	return 1;
end

function TimNhanhBossST(TD)
	if (TD == 1) then
		NewWorld(93,1644,3279)
		SetFightState(1);
	elseif (TD == 2) then
		NewWorld(93,1646,3058)
		SetFightState(1);
	elseif (TD == 3) then
		NewWorld(93,1736,3213)
		SetFightState(1);
	elseif (TD == 4) then
		NewWorld(93,1610,3152)
		SetFightState(1);
	elseif (TD == 5) then
		NewWorld(225,1590,3325)
		SetFightState(1);
	elseif (TD == 6) then
		NewWorld(225,1261,3247)
		SetFightState(1);
	elseif (TD == 7) then
		NewWorld(225,1452,3377)
		SetFightState(1);
	elseif (TD == 8) then
		NewWorld(225,1425,3107)
		SetFightState(1);
	elseif (TD == 9) then
		NewWorld(75,1711,3187)
		SetFightState(1);
	elseif (TD == 10) then
		NewWorld(75,1752,3124)
		SetFightState(1);
	elseif (TD == 11) then
		NewWorld(75,1831,3190)
		SetFightState(1);
	elseif (TD == 12) then
		NewWorld(75,1639,3159)
		SetFightState(1);
	elseif (TD == 13) then
		NewWorld(321,1253,3002)
		SetFightState(1);
	elseif (TD == 14) then
		NewWorld(321,1483,2742)
		SetFightState(1);
	elseif (TD == 15) then
		NewWorld(321,1289,2613)
		SetFightState(1);
	elseif (TD == 16) then
		NewWorld(321,1113,2569)
		SetFightState(1);
	elseif (TD == 17) then
		NewWorld(340,1217,2740)
		SetFightState(1);
	elseif (TD == 18) then
		NewWorld(340,1723,2765)
		SetFightState(1);
	elseif (TD == 19) then
		NewWorld(340,1275,2749)
		SetFightState(1);
	elseif (TD == 20) then
		NewWorld(340,1932,2759)
		SetFightState(1);
	end
end 

function showboss(row)
	local tbSay = {};
	for i = 1, 10 do
		local taskid = row + i;
		tinsert(tbSay, KST_GetBossMenuLabel(taskid).."/#givetask("..taskid..")");
	end;
	tinsert(tbSay, "Trang kÕ /#showbossnext("..row..")");
	tinsert(tbSay, ContentList[15]);
	Describe(DescLink_NieShiChen..ContentList[16], getn(tbSay), unpack(tbSay));
end

function showbossnext(row)
	local tbSay = {};
	for i = 11, 20 do
		local taskid = row + i;
		tinsert(tbSay, KST_GetBossMenuLabel(taskid).."/#givetask("..taskid..")");
	end;
	tinsert(tbSay, "Trang tr­íc/#showboss("..row..")");
	tinsert(tbSay, ContentList[15]);
	Describe(DescLink_NieShiChen..ContentList[16], getn(tbSay), unpack(tbSay));
end

function givetask(taskid)
	taskid = tonumber(taskid);
	if (not taskid) or taskid < 1 or taskid > getn(tab_ToaDoBossST) then
		Msg2Player("D÷ liÖu nhiÖm vô S¸t Thñ kh«ng hîp lÖ!");
		return 0;
	end;
	local nAssigned = KST_SyncBossTaskToCurrentTeam(taskid);
	if nAssigned == nil or nAssigned <= 0 then
		Msg2Player("Kh«ng thÓ ®ång bé nhiÖm vô S¸t Thñ cho tæ ®éi!");
		return 0;
	end;
	KST_ShowBossStatus(taskid);
	return 1;
end

function Bil_Go2BossPos(taskid)
	taskid = tonumber(taskid);
	if (not taskid) or taskid < 1 or taskid > getn(tab_ToaDoBossST) then
		Msg2Player("D÷ liÖu nhiÖm vô S¸t Thñ kh«ng hîp lÖ!");
		return 0;
	end;
	if nt_getTask(TSKID_KILLTASKID) ~= taskid then
		Msg2Player("NhiÖm vô hiÖn t¹i ®· thay ®æi. H·y nhËn l¹i nhiÖm vô t¹i NhiÕp ThÝ TrÇn.");
		return 0;
	end;

	-- Re-sync the CURRENT team at start time as well: late joiners/old Killer tasks follow this selected task.
	KST_SyncBossTaskToCurrentTeam(taskid);

	local nAlive, nWorld, nX, nY = KST_GetBossTeleportPos(taskid);
	if (not nWorld) or nWorld == 0 or (not nX) or nX == 0 or (not nY) or nY == 0 then
		Msg2Player("Lçi: Kh«ng ®äc ®­îc täa ®é Boss S¸t Thñ!");
		return 0;
	end;

	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	if nMemCount == 0 then
		local nRet = NewWorld(nWorld, nX, nY);
		if nRet == 0 or nRet == nil then
			Msg2Player("Kh«ng thÓ ®­a nh©n vËt tíi b¶n ®å Boss. Map: "..nWorld.." X:"..nX.." Y:"..nY);
			return 0;
		end;
		SetFightState(1);
		return 1;
	end;

	-- Capture member indexes before changing PlayerIndex; this follows the native team-pull pattern.
	local tbMember = {};
	for i = 1, nMemCount do
		tbMember[i] = GetTeamMember(i);
	end;
	local nSuccess = 0;
	for i = 1, nMemCount do
		if tbMember[i] ~= nil and tbMember[i] > 0 then
			PlayerIndex = tbMember[i];
			local nRet = NewWorld(nWorld, nX, nY);
			if nRet ~= 0 and nRet ~= nil then
				SetFightState(1);
				nSuccess = nSuccess + 1;
			end;
		end;
	end;
	PlayerIndex = nPreservedPlayerIndex;
	if nSuccess == 0 then
		Msg2Player("Kh«ng thÓ ®­a tæ ®éi tíi b¶n ®å Boss. Map: "..nWorld.." X:"..nX.." Y:"..nY);
		return 0;
	end;
	return 1;
end

function compose()
	GiveItemUI("Giao diÖn hîp thµnh s¸t thñ gi¶n","5 s¸t thñ lÖnh cïng ®¼ng cÊp sÏ hîp thµnh 1 s¸t thñ gi¶n cÊp t­¬ng øng, thuéc tÝnh cña s¸t thñ gi¶n ®­îc t¹o thµnh cã liªn quan ®Õn thuéc tÝnh cña 5 s¸t thñ lÖnh. B¹n cã thÓ dïng s¸t thñ gi¶n cña m×nh ®Ó so tµi víi s¸t thñ gi¶n ®ång cÊp cña ng­êi kh¸c, quy t¾c th¾ng thua ®­îc tÝnh theo quy t¾c t­¬ng kh¾c cña ngò hµnh.","exchange_token", "no")
end

function exchange_token(ncount)
	local scrollidx = {}
	local scrollattr = {}
	local y = 0
	local compare_level = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype, level, attribute = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype == 399  ) then	
			if( y > 0 ) then
				if( level ~= compare_level ) then
					Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
					return
				end
			end
			y = y + 1;
			scrollidx[y] = nItemIdx;
			scrollattr[y] = attribute;
			compare_level = level;
		end
	end
	if( y ~= ncount) then
		Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y > 5 ) then
		Describe(DescLink_NieShiChen..ContentList[19], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y < 5 ) then
		Describe(DescLink_NieShiChen..ContentList[20], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y == 5 ) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i]);
		end
		givesword(scrollattr,compare_level);
	end
end

function givesword(attr,level)
	series = {"metal>Kim", "wood>Méc", "water>Thñy", "fire>Háa", "earth>Thæ "};
	i = random( 1, 5 );
	AddItem( 6, 1, 400, level, attr[i], 0);
	j = attr[i] + 1;
	Describe(DescLink_NieShiChen..ContentList[22]..series[j]..ContentList[23], 1, ContentList[15]);
end

function no()
end

--Ã¿Ìì½ÓÈÎÎñµÄÏÞÖÆ
function killerCoundTakedTask(nLowLevel, nHighLevel)
	-- Goi NHIEP_THI_TRAN bo chan cap do va bo han muc ngay; ta GIU LAI ca hai.
	-- Chot havetask() da bo de mot thanh vien co the chon lai boss cho ca to doi.
	local myLevel = GetLevel();
	if( myLevel < nLowLevel or myLevel >  nHighLevel) then
		Describe(DescLink_NieShiChen..ContentList[14], 1,ContentList[15]);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	local myDate = nt_getTask(TSKID_KILLERDATE);
	if (myDate == nDate and nt_getTask(TSKID_KILLERMAXCOUNT) >= SoLuongBossSatThuTrongNgay) then
		Describe(DescLink_NieShiChen.."S¸t thñ cã mét tè chÊt rÊt quan träng gäi lµ khinh kÎ b¹i trËn. H«m nay ng­¬i ®· h¹ gôc "..SoLuongBossSatThuTrongNgay.." tªn s¸t thñ råi, ngµy mai h·y quay l¹i.", 1, ContentList[15]);
		return 0;
	elseif (myDate ~= nDate) then
		nt_setTask(TSKID_KILLERMAXCOUNT, 0);
		nt_setTask(TSKID_KILLERDATE, nDate);
	end;
	return 1;
end;
