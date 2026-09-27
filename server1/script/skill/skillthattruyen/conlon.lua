-- Conlon.lua
-- File Lua MOI duoc viet cho 5 ky nang SkillId 1262, 1264-1267 (skillstest.xlsx)
-- Nguyen tac ap dung giong VoDang.lua / Thiennhan.lua / Caibang.lua:
--   - CharClass=5 (Tho) cho ca 5 ky nang -> ham nguyen to la lightingdamage_v
--     (Set), giong het cach VoDang.lua xu ly he Tho.
--   - 1262/1264/1265 co IsPhysical=0 (noi cong): CHI dung lightingdamage_v,
--     KHONG dung physicsenhance_p va KHONG dung deadlystrike_p (chi mang chi
--     danh cho ky nang ngoai cong).
--   - 1266/1267 co IsPhysical=1 (ngoai cong): dung physicsenhance_p, duoc phep
--     gan kem lightingdamage_v -> "Set sat ngoai cong", thiet ke hop le.
--   - Tuyet doi KHONG dung physicsdamage_v (ham he Kim) o bat ky ky nang nao.
--   - seriesdamage_p (Ngu hanh tuong khac) LUON gioi han toi da 55%.
--   - Chuoi su kien khai bao thang o day theo nguyen tac ".lua thang skills.txt":
--       1262: StartEvent -> 1265 ; FlyEvent -> 1264
--       1266: FlyEvent -> 1267 ; CollideEvent -> 373
--     SkillId 373 la ky nang CO SAN tu truoc, KHONG thuoc pham vi file nay nen
--     KHONG dinh nghia lai o day (giu nguyen theo skills.txt).
--   - Cac ky nang co IsExpSkill=0 (1264, 1265, 1267) la ky nang phu trong chuoi:
--     KHONG gan skill_skillexp_v / addskillexp1 va skill_cost_v = 0.

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/8)
end

SKILLS={
	-- ===== "LOI DONG CUU THIEN" (NOI CONG he Tho, 1262 -> 1265 va bay -> 1264) =====
	loidongct1={ -- Loi dong Cuu Thien (1) [SkillId 1262] - NOI CONG (IsPhysical=0)
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		lightingdamage_v={ -- CHI 1 ham nguyen to duy nhat (he Tho = Set)
			[1]={{1,25},{15,245},{20,585}},
			[3]={{1,25},{15,245},{20,585}},
		},
		skill_attackradius={{{1,470},{25,470}}},
		skill_cost_v={{{1,48},{25,70}}},
		missle_speed_v={{{1,5},{20,12},{21,12}}},
		skill_misslenum_v={{{1,2},{20,5},{25,5}}}, -- khop ChildSkillNum=5 (missile 481)
		skill_eventskilllevel={{{1,1},{25,25}}},
		stun_p={{{1,5},{20,25},{25,30}},{{1,1},{20,12},{21,12}}},
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
		skill_startevent={
			[1]={{1,1},{25,1}},
			[3]={{1,1265},{25,1265}}, -- kich hoat SkillId 1265 (Loi dong Cuu Thien (2))
		},
		skill_flyevent={
			[1]={{1,0},{20,1}},
			[3]={{1,1264},{25,1264}}, -- kich hoat SkillId 1264 (Loi dong Cuu Thien (3)) khi bay
		},
		skill_showevent={{{1,1},{19,1},{19,3},{25,3}}}, -- lv1-19: start(1) ; lv20+: start+fly(1+2=3)
	},

	loidongct2={ -- Loi dong Cuu Thien (2) [SkillId 1265] - NOI CONG, ky nang phu
		seriesdamage_p={{{1,15},{20,45},{21,50},{25,50}}}, -- van <=55%
		lightingdamage_v={
			[1]={{1,25},{20,137}},
			[3]={{1,25},{20,137}}
		},
		skill_attackradius={{{1,470},{25,470}}},
		missle_speed_v={{{1,1},{20,12},{21,12}}},
		skill_cost_v={{{1,0},{25,0}}}, -- ky nang phu duoc goi tu 1262, khong tru them chi phi
		skill_misslenum_v={{{1,1},{20,2},{25,2}}}, -- khop ChildSkillNum=2 (missile 484)
		skill_eventskilllevel={{{1,1},{25,25}}},
	},

	loidongct3={ -- Loi dong Cuu Thien (3) [SkillId 1264] - NOI CONG, kich hoat khi dan bay
		seriesdamage_p={{{1,15},{20,40},{21,45},{25,45}}}, -- van <=55%
		lightingdamage_v={ -- CHI 1 ham nguyen to duy nhat (he Tho)
			[1]={{1,8},{15,70},{20,152},{25,170}},
			[3]={{1,8},{15,70},{20,152},{25,170}},
		},
		skill_attackradius={{{1,400},{25,400}}},
		skill_cost_v={{{1,0},{25,0}}},
		skill_misslenum_v={{{1,1},{25,1}}}, -- khop ChildSkillNum=1 (missile 483)
		skill_eventskilllevel={{{1,1},{25,25}}},
	},

	-- ===== "NGAO TUYET TIEU PHONG" (NGOAI CONG, 1266 bay -> 1267, va cham -> 373) =====
	ngaotuyettp1={ -- Ngao Tuyet Tieu Phong (1) [SkillId 1266] - ngoai cong
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		physicsenhance_p={{{1,30},{15,132},{20,330}}}, -- ham vat ly (IsPhysical=1)
		lightingdamage_v={
			[1]={{1,39},{15,200},{20,730}},
			[3]={{1,39},{15,200},{20,730}}
		},
		skill_attackradius={{{1,420},{25,420}}},
		skill_cost_v={{{1,45},{25,45}}},
		skill_misslenum_v={{{1,1},{25,1}}}, -- khop ChildSkillNum=1 (missile 178 co san)
		deadlystrike_p={{{1,7},{20,20},{25,26}}},
		stun_p={{{1,5},{20,25},{25,28}},{{1,1},{20,12},{21,12}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6300,1.15,1,3,1)},
							{2,SkillExpFunc(6300,1.15,2,3,1)},
							{3,SkillExpFunc(6300,1.16,3,3,1)},
							{4,SkillExpFunc(6300,1.17,4,3,1)},
							{5,SkillExpFunc(6300,1.18,5,3,1)},
							{6,SkillExpFunc(6300,1.19,6,3,1)},
							{7,SkillExpFunc(6300,1.20,7,3,1)},
							{8,SkillExpFunc(6300,1.21,8,3,1)},
							{9,SkillExpFunc(6300,1.22,9,3,1)},
							{10,SkillExpFunc(6300,1.23,10,3,1)},
							{11,SkillExpFunc(6300,1.24,11,3,1)},
							{12,SkillExpFunc(6300,1.23,12,3,1)},
							{13,SkillExpFunc(6300,1.22,13,3,1)},
							{14,SkillExpFunc(6300,1.21,14,3,1)},
							{15,SkillExpFunc(6300,1.20,15,3,1)},
							{16,SkillExpFunc(6300,1.19,16,3,1)},
							{17,SkillExpFunc(6300,1.18,17,3,1)},
							{18,SkillExpFunc(6300,1.17,18,3,1)},
							{19,SkillExpFunc(6300,1.16,19,3,1)},
							{20,SkillExpFunc(6300,1.15,20,3,1)},
							{21,SkillExpFunc(6300,1.15,21,3,1)},
							{22,SkillExpFunc(6300,1.15,22,3,1)},
							{23,SkillExpFunc(6300,1.15,23,3,1)},
							{24,SkillExpFunc(6300,1.15,24,3,1)},
							{25,SkillExpFunc(6300,1.15,25,3,1)},
						}},
		skill_flyevent={
			[1]={{1,1},{25,1}},
			[3]={{1,1267},{25,1267}}, -- kich hoat SkillId 1267 (Ngao Tuyet Tieu Phong (2))
		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,5}},
			[3]={{1,373},{25,373}}, -- SkillId 373 co san tu truoc, khong dinh nghia lai o day
		},
		skill_showevent={{{1,2},{10,2},{10,6},{25,6}}}, -- lv1-10: fly(2) ; lv11+: fly+collide(2+4=6)
	},

	ngaotuyettp2={ -- Ngao Tuyet Tieu Phong (2) [SkillId 1267] - ngoai cong, ky nang phu
		seriesdamage_p={{{1,15},{20,45},{21,50},{25,50}}}, -- van <=55%
		physicsenhance_p={{{1,13},{25,15}}},
		poisondamage_v={{{1,1},{15,6},{25,10}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,420},{25,420}}},
		skill_cost_v={{{1,0},{25,0}}}, -- ky nang phu duoc goi tu 1266, khong tru them chi phi
		skill_misslenum_v={{{1,1},{20,2},{25,2}}}, -- khop ChildSkillNum=2 (missile 485)
--		deadlystrike_p={{{1,4},{20,13},{25,16}}},
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


