-- Caibang.lua
-- File Lua MOI duoc viet cho 3 ky nang SkillId 1237-1239 (skillstest.xlsx)
-- Nguyen tac ap dung giong VoDang.lua / Thiennhan.lua (xem chu thich dau 2 file do):
--   - CharClass=4 (Hoa) cho ca 3 ky nang  -> ham nguyen to la firedamage_v.
--   - SkillId 1237 co IsPhysical=0 (noi cong): CHI dung 1 ham nguyen to duy nhat
--     la firedamage_v, KHONG dung physicsenhance_p, KHONG dung physicsdamage_v.
--   - SkillId 1238/1239 co IsPhysical=1 (ngoai cong): dung physicsenhance_p va
--     duoc phep gan kem firedamage_v -> day la "Hoa sat ngoai cong", thiet ke
--     hop le. Tuyet doi KHONG dung physicsdamage_v tren ky nang ngoai cong.
--   - seriesdamage_p (Ngu hanh tuong khac) LUON gioi han toi da 55%.
--   - SkillId 1238 co FlyEvent=1 / FlySkillId=1239 trong skillstest.xlsx. Theo
--     nguyen tac ".lua thang skills.txt", chuoi nay duoc khai bao thang o day
--     bang skill_flyevent (giong cach thiendia2 lam trong VoDang.lua).
--   - SkillId 1239 co IsExpSkill=0 (ky nang phu trong chuoi, khong tu len cap)
--     nen KHONG gan skill_skillexp_v / addskillexp1 va skill_cost_v = 0.
--   - KHONG khai missle_speed_v: slot 7 cua skills.txt dang bo trong theo quy
--     uoc cua cac dong 1218-1226, khai ma khong wire thi thuoc tinh luon rong.
--     De Speed trong missles.txt lam chu (missile 464 Speed=270 cho MoveKind=3).

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/8)
end

SKILLS={
	-- ============ "110 PHI LONG RONG XOAY" (noi cong, he Hoa) ============
	philong1={ -- 110 Phi long rong xoay (1) [SkillId 1237] - noi cong, AoE 4 rong
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		firedamage_v={
			[1]={{1,6},{15,106},{20,287}},
			[3]={{1,6},{15,106},{20,287}}
		},
		skill_attackradius={{{1,660},{25,660}}}, -- khop AttackRadius=660 trong skillstest.xlsx
		skill_cost_v={{{1,45},{25,65}}},
		skill_misslenum_v={{{1,2},{20,4},{25,4}}}, -- khop ChildSkillNum=4 (missile 464)
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(4600,1.15,1,3,1)},
							{2,SkillExpFunc(4600,1.15,2,3,1)},
							{3,SkillExpFunc(4600,1.16,3,3,1)},
							{4,SkillExpFunc(4600,1.17,4,3,1)},
							{5,SkillExpFunc(4600,1.18,5,3,1)},
							{6,SkillExpFunc(4600,1.19,6,3,1)},
							{7,SkillExpFunc(4600,1.20,7,3,1)},
							{8,SkillExpFunc(4600,1.21,8,3,1)},
							{9,SkillExpFunc(4600,1.22,9,3,1)},
							{10,SkillExpFunc(4600,1.23,10,3,1)},
							{11,SkillExpFunc(4600,1.24,11,3,1)},
							{12,SkillExpFunc(4600,1.23,12,3,1)},
							{13,SkillExpFunc(4600,1.22,13,3,1)},
							{14,SkillExpFunc(4600,1.21,14,3,1)},
							{15,SkillExpFunc(4600,1.20,15,3,1)},
							{16,SkillExpFunc(4600,1.19,16,3,1)},
							{17,SkillExpFunc(4600,1.18,17,3,1)},
							{18,SkillExpFunc(4600,1.17,18,3,1)},
							{19,SkillExpFunc(4600,1.16,19,3,1)},
							{20,SkillExpFunc(4600,1.15,20,3,1)},
							{21,SkillExpFunc(4600,1.15,21,3,1)},
							{22,SkillExpFunc(4600,1.15,22,3,1)},
							{23,SkillExpFunc(4600,1.15,23,3,1)},
							{24,SkillExpFunc(4600,1.15,24,3,1)},
							{25,SkillExpFunc(4600,1.15,25,3,1)},
						}},
	},

	-- ============ "BONG" (ngoai cong, Hoa sat ngoai cong) ============
	bong1={ -- Bong (1) [SkillId 1238] - ngoai cong, mo dau chuoi -> 1239
		seriesdamage_p={{{1,20},{20,50},{21,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		physicsenhance_p={{{1,25},{25,50}}}, -- ham vat ly (IsPhysical=1)
		firedamage_v={ -- Hoa sat ngoai cong: sat thuong nguyen to phu tro
			[1]={{1,10},{20,55}},
			[3]={{1,10},{20,55}},
		},
		skill_attackradius={{{1,520},{25,520}}},
		skill_cost_v={{{1,42},{25,60}}},
		deadlystrike_p={{{1,6},{20,20},{25,24}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6800,1.15,1,3,1)},
							{2,SkillExpFunc(6800,1.15,2,3,1)},
							{3,SkillExpFunc(6800,1.16,3,3,1)},
							{4,SkillExpFunc(6800,1.17,4,3,1)},
							{5,SkillExpFunc(6800,1.18,5,3,1)},
							{6,SkillExpFunc(6800,1.19,6,3,1)},
							{7,SkillExpFunc(6800,1.20,7,3,1)},
							{8,SkillExpFunc(6800,1.21,8,3,1)},
							{9,SkillExpFunc(6800,1.22,9,3,1)},
							{10,SkillExpFunc(6800,1.23,10,3,1)},
							{11,SkillExpFunc(6800,1.24,11,3,1)},
							{12,SkillExpFunc(6800,1.23,12,3,1)},
							{13,SkillExpFunc(6800,1.22,13,3,1)},
							{14,SkillExpFunc(6800,1.21,14,3,1)},
							{15,SkillExpFunc(6800,1.20,15,3,1)},
							{16,SkillExpFunc(6800,1.19,16,3,1)},
							{17,SkillExpFunc(6800,1.18,17,3,1)},
							{18,SkillExpFunc(6800,1.17,18,3,1)},
							{19,SkillExpFunc(6800,1.16,19,3,1)},
							{20,SkillExpFunc(6800,1.15,20,3,1)},
							{21,SkillExpFunc(6800,1.15,21,3,1)},
							{22,SkillExpFunc(6800,1.15,22,3,1)},
							{23,SkillExpFunc(6800,1.15,23,3,1)},
							{24,SkillExpFunc(6800,1.15,24,3,1)},
							{25,SkillExpFunc(6800,1.15,25,3,1)},
						}},
		skill_flyevent={
			[1]={{1,1},{25,1}}, -- luon kich hoat khi dan dang bay
			[3]={{1,1239},{25,1239}}, -- kich hoat SkillId 1239 (Bong (2))
		},
		skill_showevent={{{1,2},{25,2}}}, -- fly(2) bat tu lv1
	},

	bong2={ -- Bong (2) [SkillId 1239] - ngoai cong, ket thuc chuoi (3 dan, hinh tron)
		seriesdamage_p={{{1,15},{20,40},{21,45}}}, -- van <=55%
		physicsenhance_p={{{1,25},{15,110},{20,240},{25,340}}},  -- ham vat ly (IsPhysical=1)
		firedamage_v={ -- Hoa sat ngoai cong
			[1]={{1,6},{15,40},{20,405}},
			[3]={{1,6},{15,40},{20,405}},
		},
		skill_attackradius={{{1,520},{25,520}}},
		skill_cost_v={{{1,0},{25,0}}}, -- ky nang phu duoc goi tu 1238, khong tru them chi phi
		skill_misslenum_v={{{1,1},{20,3},{25,3}}}, -- khop ChildSkillNum=3 (missile 466)
		skill_eventskilllevel={{{1,1},{25,25}}},
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


