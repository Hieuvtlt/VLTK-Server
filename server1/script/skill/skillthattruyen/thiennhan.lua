-- Thiennhan.lua
-- File Lua MOI duoc viet cho 3 ky nang SkillId 1224-1226 (skillstest.xlsx)
-- Nguyen tac ap dung giong VoDang.lua (xem chu thich dau file do):
--   - Ky nang IsPhysical=1 (ngoai cong) CHI dung physicsenhance_p.
--   - Ky nang IsPhysical=0 (noi cong) CHI dung 1 ham nguyen to.
--   - CharClass=4 (Hoa) -> dung firedamage_v. Co CO SO THUC TE: MissileId
--     451 (dung boi SkillId 1224) co AnimFile3/4 ten file chua "huo3"
--     (pinyin = "Hoa") - khop dung voi bang CharClass 4=Hoa da ghi nho,
--     cung cap bang chung ro rang hon so voi suy luan o VoDang.lua.
--   - seriesdamage_p (Ngu hanh tuong khac) LUON gioi han toi da 55%.
--   - CollideEvent/VanishedEvent cua SkillId 1224 khop voi skillstest.xlsx
--     (CollidSkillId=1225 dinh nghia o day; VanishedSkillId=363 la 1 SkillId
--     CO SAN tu truoc, KHONG thuoc pham vi 2 file moi nay nen KHONG dinh
--     nghia lai o day - gia tri 363 duoc giu nguyen theo skills.txt).

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/8)
end

SKILLS={
	thienngoailt1={ -- 110 Thien ngoai LT (1) [SkillId 1224] - noi cong, he Hoa
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		firedamage_v={
			[1]={{1,29},{15,292},{20,741}},
			[3]={{1,29},{15,292},{20,741}}
		},
		skill_attackradius={{{1,520},{25,520}}},
		skill_cost_v={{{1,40},{25,60}}},
		missle_speed_v={{{1,0},{25,0}}}, -- MoveKind=0 (roi tu tren xuong, xem Zspeed/Zacc trong missiles.xlsx)
--		deadlystrike_p={{{1,6},{20,18},{25,20}}},
        missle_damagerange_v={{{1,1},{21,7},{25,7}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(4085,1.15,1,3,1)},
							{2,SkillExpFunc(4085,1.15,2,3,1)},
							{3,SkillExpFunc(4085,1.16,3,3,1)},
							{4,SkillExpFunc(4085,1.17,4,3,1)},
							{5,SkillExpFunc(4085,1.18,5,3,1)},
							{6,SkillExpFunc(4085,1.19,6,3,1)},
							{7,SkillExpFunc(4085,1.20,7,3,1)},
							{8,SkillExpFunc(4085,1.21,8,3,1)},
							{9,SkillExpFunc(4085,1.22,9,3,1)},
							{10,SkillExpFunc(4085,1.23,10,3,1)},
							{11,SkillExpFunc(4085,1.24,11,3,1)},
							{12,SkillExpFunc(4085,1.23,12,3,1)},
							{13,SkillExpFunc(4085,1.22,13,3,1)},
							{14,SkillExpFunc(4085,1.21,14,3,1)},
							{15,SkillExpFunc(4085,1.20,15,3,1)},
							{16,SkillExpFunc(4085,1.19,16,3,1)},
							{17,SkillExpFunc(4085,1.18,17,3,1)},
							{18,SkillExpFunc(4085,1.17,18,3,1)},
							{19,SkillExpFunc(4085,1.16,19,3,1)},
							{20,SkillExpFunc(4085,1.15,20,3,1)},
							{21,SkillExpFunc(4085,1.15,21,3,1)},
							{22,SkillExpFunc(4085,1.15,22,3,1)},
							{23,SkillExpFunc(4085,1.15,23,3,1)},
							{24,SkillExpFunc(4085,1.15,24,3,1)},
							{25,SkillExpFunc(4085,1.15,25,3,1)},
						}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1225},{25,1225}}, -- kich hoat SkillId 1225 (110 Thien ngoai LT (2)) khi va cham
		},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,363},{25,363}}, -- SkillId 363 co san tu truoc (khop skills.txt), khong dinh nghia lai o day
		},
		skill_showevent={{{1,0},{10,0},{10,12},{25,12}}}, -- collide(4)+vanished(8)=12 tu lv11
	},

	thienngoailt2={ -- 110 Thien ngoai LT (2) [SkillId 1225] - noi cong, he Hoa
		seriesdamage_p={{{1,15},{20,45},{21,50}}}, -- van <=55%
		firedamage_v={
			[1]={{1,11},{15,50},{20,100}},
			[3]={{1,11},{15,50},{20,100}}
		},
		skill_attackradius={{{1,400},{20,400}}},
		skill_cost_v={{{1,0},{20,0}}}, -- ky nang phu duoc goi tu 1224, khong tru them chi phi
		skill_misslenum_v={{{1,5},{20,16},{21,16}}}, -- khop ChildSkillNum=16 trong skillstest.xlsx
--		missle_speed_v={{{1,0},{20,0}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
	},

	vanlongkich={ -- 110 Van Long Kich [SkillId 1226] - ngoai cong, he Hoa
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		-- ==== CAN BANG: HE SO 2.2 LAN BAN GOC, TINH THEO N=2 ====
		-- Ban goc "yunlong_ji" (SkillId 361, tianren.lua) dat max o cap 20, chi
		-- ban 1 dan: physicsenhance_p=445, firedamage_v=378.
		--
		-- DA KIEM CHUNG IN-GAME (2026-08-22): SAT THUONG NHAN THEO SO DAN TRUNG.
		-- Trung 1 dan -> x1, trung 2 dan -> x2, trung 3 dan -> x3.
		-- (ByMissle KHONG lien quan toi co che nay - dung dua vao no.)
		--
		-- Ky nang 110 nay ban 3 dan (ChildSkillNum=3) va dat max o cap 25.
		-- KHONG lay moc "trung du 3 dan" lam chuan, vi muc tieu co the chi an
		-- 1-2 dan. Lay N=2 (than trong): gia tri moi dan = goc x 2.2 / 2.
		--   physicsenhance_p : 490 x 2 = 980 = 2.20 x 445
		--   firedamage_v     : 416 x 2 = 832 = 2.20 x 378
		-- Cac truong hop khac (do sat thuong so voi ban goc):
		--   trung 1 dan -> x1.10   trung 2 dan -> x2.20   trung 3 dan -> x3.30
		-- Nho vay truong hop xau nhat (chi 1 dan trung) van manh hon ban goc.
		--
		-- MOC CUOI DAT O CAP 20, KHONG ghim gia tri cap 21/25.
		-- Ham Link() trong boilerplate tu NGOAI SUY TUYEN TINH khi cap vuot moc
		-- cuoi (nhanh "if(x > points[num][1])"), nen cap 21-25 tu tang theo do doc
		-- cua doan cuoi duong cong va cham dung dich o cap 25:
		--   physicsenhance_p : 20->399, 25->490
		--   firedamage_v     : 20->262, 25->416
		physicsenhance_p={{{1,51},{20,399}}}, -- CHI dung ham vat ly (Mau phap)
		-- Hoa sat ngoai cong. Cung CharClass=4 (Hoa) va IsPhysical=1 nhu ban goc
		-- nen hop le. Duong cong giu dung hinh dang goc ({1,6},{15,100},{20,378}),
		-- chi doi ty le de cham dich 416 o cap 25.
		firedamage_v={
			[1]={{1,6},{15,108},{20,262}},
			[3]={{1,6},{15,108},{20,262}},
		},
--		skill_attackradius={{{1,125},{25,125}}}, -- can chien tam gan (IsMelee=1)
		skill_cost_v={{{1,50},{25,70}}},
		skill_misslenum_v={{{1,1},{20,3},{21,3}}},
		deadlystrike_p={{{1,4},{25,75}}},
		stealmana_p={{{1,1},{20,16}}},
		steallife_p={{{1,1},{20,16}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(11600,1.15,1,1,1)},
							{2,SkillExpFunc(11600,1.15,2,1,1)},
							{3,SkillExpFunc(11600,1.16,3,1,1)},
							{4,SkillExpFunc(11600,1.17,4,1,1)},
							{5,SkillExpFunc(11600,1.18,5,1,1)},
							{6,SkillExpFunc(11600,1.19,6,1,1)},
							{7,SkillExpFunc(11600,1.20,7,1,1)},
							{8,SkillExpFunc(11600,1.21,8,1,1)},
							{9,SkillExpFunc(11600,1.22,9,1,1)},
							{10,SkillExpFunc(11600,1.23,10,1,1)},
							{11,SkillExpFunc(11600,1.24,11,1,1)},
							{12,SkillExpFunc(11600,1.23,12,1,1)},
							{13,SkillExpFunc(11600,1.22,13,1,1)},
							{14,SkillExpFunc(11600,1.21,14,1,1)},
							{15,SkillExpFunc(11600,1.20,15,1,1)},
							{16,SkillExpFunc(11600,1.19,16,1,1)},
							{17,SkillExpFunc(11600,1.18,17,1,1)},
							{18,SkillExpFunc(11600,1.17,18,1,1)},
							{19,SkillExpFunc(11600,1.16,19,1,1)},
							{20,SkillExpFunc(11600,1.15,20,1,1)},
							{21,SkillExpFunc(11600,1.15,21,1,1)},
							{22,SkillExpFunc(11600,1.15,22,1,1)},
							{23,SkillExpFunc(11600,1.15,23,1,1)},
							{24,SkillExpFunc(11600,1.15,24,1,1)},
							{25,SkillExpFunc(11600,1.15,25,1,1)},
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
