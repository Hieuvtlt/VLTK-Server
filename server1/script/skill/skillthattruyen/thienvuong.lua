-- Thienvuong.lua
-- File Lua MOI duoc viet cho 6 ky nang SkillId 1271-1276 (skillstest.xlsx),
-- gom 3 CAP ky nang dang "skill nen + skill chinh" (MisslesForm=12).
--
-- CO CHE MisslesForm=12 (da doi chieu voi tien le CO SAN trong skills.txt):
--   - Ky nang co MisslesForm=12 la SKILL NEN. No KHONG ban missile; ChildSkillId
--     cua no tro thang toi 1 SkillId khac chu khong phai MissleId.
--   - SkillId duoc tro toi moi la SKILL CHINH: chinh no moi gan MissleId that
--     va ban missile ra.
--   - CA HAI dung CHUNG 1 BANG SCRIPT duy nhat trong file .lua nay, va 2 dong
--     trong skills.txt deu tro ve cung 1 ten bang (LvlData giong het nhau).
--   Cac cap trong file nay:
--       1271 (nen) + 1272 (chinh, missile 480) -> bang truytinhtn
--       1273 (nen) + 1274 (chinh, missile 489) -> bang truyphongquyet
--       1275 (nen) + 1276 (chinh, missile 490) -> bang phathientram
--   Tien le da tra cuu trong skills.txt live: cap 322+326 (potian_zhan),
--   323+327 (zhuixing_zhuyue), 1058+1084, 1059+1087, 1060+1088 - tat ca deu
--   dung chung 1 ten bang cho ca 2 dong. Hai cap 322/326 va 323/327 chinh la
--   ban goc cap 20 cua "Pha Thien Tram" va "Truy Tinh Truc Nguyet" o day.
--
-- QUAN TRONG - KHONG khai skill_misslenum_v trong cac bang nay:
--   Skill nen va skill chinh co ChildSkillNum KHAC NHAU (vd 1271 co num=5 la so
--   lan goi skill 1272, con 1272 co num=1 la so missile that su ban ra). Vi 2
--   dong dung chung 1 bang, neu khai skill_misslenum_v thi no se ghi de CA HAI
--   bang cung 1 con so va lam sai it nhat 1 ben. De ChildSkillNum trong
--   skills.txt tu dieu khien rieng tung dong. Day cung dung cach ban goc
--   potian_zhan / zhuixing_zhuyue trong tianwang.lua lam (khong he co
--   skill_misslenum_v).
--
-- Cac nguyen tac khac giu nguyen nhu VoDang.lua / Thiennhan.lua / Caibang.lua:
--   - CharClass=1 (Kim). Ham nguyen to he Kim la physicsdamage_v NHUNG ham do
--     CHI dung cho ky nang noi cong (IsPhysical=0). Ca 6 ky nang o day deu
--     IsPhysical=1 (ngoai cong) nen TUYET DOI KHONG dung physicsdamage_v ->
--     chi dung physicsenhance_p thuan tuy, khong gan ham nguyen to nao.
--     (KHONG nham physicsdamage_v voi physicsenhance_p - ten gan giong nhung
--      ban chat khac han: 1 la nguyen to Kim, 1 la % sat thuong vat ly.)
--   - deadlystrike_p duoc phep vi ca 6 deu la ngoai cong.
--   - attackrating_p (chinh xac) duoc giu lai vi day la chi so dac trung cua
--     Thien Vuong - ban goc potian_zhan / zhuixing_zhuyue deu co.
--   - addskillexp1 tham so [1] la SkillId NHAN kinh nghiem, phai tro ve SKILL
--     NEN (1271/1273/1275) dung nhu ban goc lam (potian_zhan tro ve 322).
--   - seriesdamage_p (Ngu hanh tuong khac) LUON gioi han toi da 55%. Luu y ban
--     goc trong tianwang.lua dang de 60/62 - vuot muc cho phep - nen o day da
--     ha ve dung 55.
--   - Ca 6 ky nang deu IsMelee=1 va AttackRadius=135 (can chien tam gan).

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/8)
end

SKILLS={
	-- ===== "TRUY TINH TRUC NGUYET" : SkillId 1271 (nen) + 1272 (chinh) =====
	truytinhtn={ -- dung chung cho CA 1271 va 1272 (co che MisslesForm=12)
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		-- CAN BANG: 2.5 lan ban goc "zhuixing_zhuyue" (SkillId 323, tianwang.lua).
		-- Goc cap 20: physicsenhance_p=381. Skill nen 1271 KHONG mang dame, dame
		-- thuc thuoc ve skill chinh 1272 (1 dan) -> N=1.
		--   physicsenhance_p : 381 x 2.5 / 1 = 952
		-- Moc cuoi dat o cap 20, cap 21-25 do Link() ngoai suy tuyen tinh.
		physicsenhance_p={{{1,35},{15,300},{20,600}}},-- CHI dung ham vat ly (Kim + ngoai cong)
		attackrating_p={{{1,110},{20,420},{25,480}}}, -- chi so dac trung Thien Vuong
		skill_attackradius={{{1,135},{25,135}}}, -- can chien tam gan (IsMelee=1)
		skill_cost_v={{{1,50},{25,55}}},
		deadlystrike_p={{{1,8},{20,25},{25,35}}},
--		steallife_p={{{1,1},{20,8},{25,10}}},
		fatallystrike_p={{{1,1},{25,10}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,1271},{2,1271}},{{1,1},{25,1}},{{1,0},{2,0}}}, -- kinh nghiem ve SKILL NEN 1271
		skill_skillexp_v={{	{1,SkillExpFunc(7000,1.15,1,3,1)},
							{2,SkillExpFunc(7000,1.15,2,3,1)},
							{3,SkillExpFunc(7000,1.16,3,3,1)},
							{4,SkillExpFunc(7000,1.17,4,3,1)},
							{5,SkillExpFunc(7000,1.18,5,3,1)},
							{6,SkillExpFunc(7000,1.19,6,3,1)},
							{7,SkillExpFunc(7000,1.20,7,3,1)},
							{8,SkillExpFunc(7000,1.21,8,3,1)},
							{9,SkillExpFunc(7000,1.22,9,3,1)},
							{10,SkillExpFunc(7000,1.23,10,3,1)},
							{11,SkillExpFunc(7000,1.24,11,3,1)},
							{12,SkillExpFunc(7000,1.23,12,3,1)},
							{13,SkillExpFunc(7000,1.22,13,3,1)},
							{14,SkillExpFunc(7000,1.21,14,3,1)},
							{15,SkillExpFunc(7000,1.20,15,3,1)},
							{16,SkillExpFunc(7000,1.19,16,3,1)},
							{17,SkillExpFunc(7000,1.18,17,3,1)},
							{18,SkillExpFunc(7000,1.17,18,3,1)},
							{19,SkillExpFunc(7000,1.16,19,3,1)},
							{20,SkillExpFunc(7000,1.15,20,3,1)},
							{21,SkillExpFunc(7000,1.15,21,3,1)},
							{22,SkillExpFunc(7000,1.15,22,3,1)},
							{23,SkillExpFunc(7000,1.15,23,3,1)},
							{24,SkillExpFunc(7000,1.15,24,3,1)},
							{25,SkillExpFunc(7000,1.15,25,3,1)},
						}},
	},

	-- ===== "TRUY PHONG QUYET" : SkillId 1273 (nen) + 1274 (chinh) =====
	truyphongquyet={ -- dung chung cho CA 1273 va 1274 (co che MisslesForm=12)
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		physicsenhance_p={{{1,35},{15,150},{20,358}}}, -- CHI dung ham vat ly
		attackrating_p={{{1,100},{20,390},{25,445}}}, -- chi so dac trung Thien Vuong
		skill_attackradius={{{1,135},{25,135}}},
		skill_cost_v={{{1,48},{25,55}}},
		deadlystrike_p={{{1,8},{20,23},{25,27}}},
		stun_p={{{1,1},{20,10},{25,12}},{{1,1*18},{25,1*18}}},
--		stealmana_p={{{1,1},{20,8},{25,10}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,1273},{2,1273}},{{1,1},{25,1}},{{1,0},{2,0}}}, -- kinh nghiem ve SKILL NEN 1273
		skill_skillexp_v={{	{1,SkillExpFunc(6700,1.15,1,3,1)},
							{2,SkillExpFunc(6700,1.15,2,3,1)},
							{3,SkillExpFunc(6700,1.16,3,3,1)},
							{4,SkillExpFunc(6700,1.17,4,3,1)},
							{5,SkillExpFunc(6700,1.18,5,3,1)},
							{6,SkillExpFunc(6700,1.19,6,3,1)},
							{7,SkillExpFunc(6700,1.20,7,3,1)},
							{8,SkillExpFunc(6700,1.21,8,3,1)},
							{9,SkillExpFunc(6700,1.22,9,3,1)},
							{10,SkillExpFunc(6700,1.23,10,3,1)},
							{11,SkillExpFunc(6700,1.24,11,3,1)},
							{12,SkillExpFunc(6700,1.23,12,3,1)},
							{13,SkillExpFunc(6700,1.22,13,3,1)},
							{14,SkillExpFunc(6700,1.21,14,3,1)},
							{15,SkillExpFunc(6700,1.20,15,3,1)},
							{16,SkillExpFunc(6700,1.19,16,3,1)},
							{17,SkillExpFunc(6700,1.18,17,3,1)},
							{18,SkillExpFunc(6700,1.17,18,3,1)},
							{19,SkillExpFunc(6700,1.16,19,3,1)},
							{20,SkillExpFunc(6700,1.15,20,3,1)},
							{21,SkillExpFunc(6700,1.15,21,3,1)},
							{22,SkillExpFunc(6700,1.15,22,3,1)},
							{23,SkillExpFunc(6700,1.15,23,3,1)},
							{24,SkillExpFunc(6700,1.15,24,3,1)},
							{25,SkillExpFunc(6700,1.15,25,3,1)},
						}},
	},

	-- ===== "PHA THIEN TRAM" : SkillId 1275 (nen) + 1276 (chinh) =====
	phathientram={ -- dung chung cho CA 1275 va 1276 (co che MisslesForm=12)
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		-- CAN BANG voi ban goc "potian_zhan" (SkillId 322, tianwang.lua).
		-- Goc cap 20: physicsenhance_p=338 moi dan, N=3 (ban goc cung ban 3 dan
		-- tuan tu, xac nhan trung du - DA KIEM CHUNG). Skill nen 1275 KHONG
		-- mang dame, dame thuc thuoc ve skill chinh 1276 (3 dan, N=3 xac nhan).
		--   Tong goc   : 338 x 3 = 1014
		--   Tong 1276  : 423 x 3 = 1269
		--   Ty le thuc te: 1269/1014 = x1.25 (DA TEST IN-GAME, nguoi dung xac
		--   nhan hop ly, KHONG can chinh lai them - xem doi thoai 2026-08-23).
		-- Moc cuoi dat o cap 20, cap 21-25 do Link() ngoai suy tuyen tinh.
		physicsenhance_p={{{1,35},{15,201},{20,310}}}, -- CHI dung ham vat ly
		attackrating_p={{{1,120},{20,450},{25,515}}}, -- chi so dac trung Thien Vuong
		skill_attackradius={{{1,135},{25,135}}},
		skill_cost_v={{{1,52},{25,55}}},
		deadlystrike_p={{{1,10},{20,36},{25,45}}},
--		stun_p={{{1,1},{20,15},{25,22}},{{1,1*18},{25,1*18}}}, -- % choang + thoi gian (giay)
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,1275},{2,1275}},{{1,1},{25,1}},{{1,0},{2,0}}}, -- kinh nghiem ve SKILL NEN 1275
		skill_skillexp_v={{	{1,SkillExpFunc(7400,1.15,1,3,1)},
							{2,SkillExpFunc(7400,1.15,2,3,1)},
							{3,SkillExpFunc(7400,1.16,3,3,1)},
							{4,SkillExpFunc(7400,1.17,4,3,1)},
							{5,SkillExpFunc(7400,1.18,5,3,1)},
							{6,SkillExpFunc(7400,1.19,6,3,1)},
							{7,SkillExpFunc(7400,1.20,7,3,1)},
							{8,SkillExpFunc(7400,1.21,8,3,1)},
							{9,SkillExpFunc(7400,1.22,9,3,1)},
							{10,SkillExpFunc(7400,1.23,10,3,1)},
							{11,SkillExpFunc(7400,1.24,11,3,1)},
							{12,SkillExpFunc(7400,1.23,12,3,1)},
							{13,SkillExpFunc(7400,1.22,13,3,1)},
							{14,SkillExpFunc(7400,1.21,14,3,1)},
							{15,SkillExpFunc(7400,1.20,15,3,1)},
							{16,SkillExpFunc(7400,1.19,16,3,1)},
							{17,SkillExpFunc(7400,1.18,17,3,1)},
							{18,SkillExpFunc(7400,1.17,18,3,1)},
							{19,SkillExpFunc(7400,1.16,19,3,1)},
							{20,SkillExpFunc(7400,1.15,20,3,1)},
							{21,SkillExpFunc(7400,1.15,21,3,1)},
							{22,SkillExpFunc(7400,1.15,22,3,1)},
							{23,SkillExpFunc(7400,1.15,23,3,1)},
							{24,SkillExpFunc(7400,1.15,24,3,1)},
							{25,SkillExpFunc(7400,1.15,25,3,1)},
						}},
	},
}

----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--¸ù¾Ý2¸öµã£¬ÇóÏßÐÎº¯Êýf(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--µ±x2=x1, ÓÐx=c,¸ÃÖ±ÏßÊÇÒ»Ìõ´¹Ö±ÓÚxÖáµÄÖ±Ïß
--ÕâÊÇ¿ÉÒÔÈ¡µÃy=ÈÎÒâÖµ
--Òò´Ë£¬Èç¹ûÒÑÖªÁ½µã(x1,y1),(x2,y2)¿ÉÇóµÃ¹ý´Ë2µãµÄ
--º¯ÊýÎª£º
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--¸ù¾Ý2¸öµã£¬Çó2´ÎÐÎº¯Êýf(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--µ±x1»òÕßx2 < 0 ,y =0
--µ±x2=x1, ÓÐx=c,ÊÇÒ»Ìõ´¹Ö±ÓÚxÖáµÄÖ±Ïß
--ÕâÊÇ¿ÉÒÔÈ¡µÃy=ÈÎÒâÖµ
--Òò´Ë£¬Èç¹ûÒÑÖªÁ½µã(x1,y1),(x2,y2)¿ÉÇóµÃ¹ý´Ë2µãµÄ
--º¯ÊýÎª£ºextrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--¸ù¾Ý2¸öµã£¬Çó-2´ÎÐÎº¯Êýf(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--µ±x2»òÕßx1<0, y=0,
--µ±x1=x2,ÓÐx=c,ÊÇÒ»Ìõ´¹Ö±ÓÚxÖáµÄÖ±Ïß
--ÕâÊÇ¿ÉÒÔÈ¡µÃy=ÈÎÒâÖµ
--Òò´Ë£¬Èç¹ûÒÑÖªÁ½µã(x1,y1),(x2,y2)¿ÉÇóµÃ¹ý´Ë2µãµÄ
--º¯ÊýÎª£ºextrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--Ãè»æÁ¬½ÓÏß:Link(x,points)
--¸ù¾ÝpointsÌá¹©µÄÒ»ÏµÁÐµã£¬ÓÃÏàÁÚµÄÁ½¸öµãÃè»æÇúÏß
--return yÖµ
--x ÊäÈëÖµ
--points µã¼¯ºÏ
--ÐÎÈç£ºpointsÊÇÐÎÈç{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}µÄÓ³Éä
function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end

------------------------------------------------------
--¼¼ÄÜÉè¶¨¸ñÊ½ÈçÏÂ£º
--SKILLS={
--	¼¼ÄÜÃû³Æ=	{
--		Ä§·¨ÊôÐÔ=	{
--			[1]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		Ä§·¨ÊôÐÔ=	{
--			[1]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		¡£¡£¡£¡£¡£
--	}£¬
--	¼¼ÄÜÃû³Æ=	{
--		Ä§·¨ÊôÐÔ=	{
--			[1]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		Ä§·¨ÊôÐÔ=	{
--			[1]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[2]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬
--			[3]={{¼¶±ð,ÊýÖµ£¬ÇúÏß}£¬{¼¶±ð£¬ÊýÖµ£¬ÇúÏß}£¬¡£¡£¡£¡£}£¬	
--		}£¬
--		¡£¡£¡£¡£¡£
--	}£¬
--	¡£¡£¡£¡£¡£
--}
--Èç£º
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--Ä§·¨ÊôÐÔphysicsenhance_p²ÎÊý1£¬1¼¶Ê±Îª35£¬20¼¶Ê±Îª335£¬ÇúÏß²»Ìî£¬Ä¬ÈÏÏßÐÎ
--			[2]={{1,0},{20,0}},
--		},--Ã»ÓÐ[3]£¬±íÊ¾Ä§·¨ÊôÐÔphysicsenhance_p²ÎÊý2£¬Ä¬ÈÏÎªÈÎºÎÊ±ºò¶¼ÊÇ0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--ÒÔÉÏÃèÊö¼¼ÄÜ¡°Èý»·Ì×ÔÂ¡±µÄÄ§·¨ÊôÐÔºÍÊýÖµ
-----------------------------------------------------------
--º¯ÊýGetSkillLevelData(levelname, data, level)
--levelname£ºÄ§·¨ÊôÐÔÃû³Æ
--data£º¼¼ÄÜÃû³Æ
--level£º¼¼ÄÜµÈ¼¶
--return£ºµ±¼¼ÄÜÃû³ÆÎªdata£¬¼¼ÄÜµÈ¼¶Îªlevel
--			Ê±µÄÄ§·¨ÊôÐÔlevelnameËùÐèÇóµÄÈý¸ö²ÎÊýµÄ¾ßÌåÖµ
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(SKILLS[data]==nil) then
		return ""
	end
	if(SKILLS[data][levelname]==nil) then
		return ""
	end
	if(type(SKILLS[data][levelname]) == "function") then
		return SKILLS[data][levelname](level)
	end
	if(SKILLS[data][levelname][1]==nil) then
		SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;


