-- Duongmon.lua
-- File Lua MOI duoc viet cho 7 ky nang SkillId 1248-1254 (skillstest.xlsx)
-- Nguyen tac ap dung giong VoDang.lua / Thiennhan.lua / Caibang.lua:
--   - CharClass=3 (Moc) cho ca 7 ky nang -> ham nguyen to la poisondamage_v.
--   - CA 7 ky nang deu co IsPhysical=1 (ngoai cong): dung physicsenhance_p va
--     duoc phep gan kem poisondamage_v -> "Doc sat ngoai cong", thiet ke hop le.
--     Tuyet doi KHONG dung physicsdamage_v tren ky nang ngoai cong.
--   - deadlystrike_p CHI dat tren ky nang ngoai cong (ca 7 deu du dieu kien).
--   - seriesdamage_p (Ngu hanh tuong khac) LUON gioi han toi da 55%.
--   - Chuoi StartEvent khai bao thang o day theo nguyen tac ".lua thang
--     skills.txt": 1248 -> 1250 -> 1249 ; 1251 -> 1252 ; 1253 -> 1254.
--   - Cac ky nang co IsExpSkill=0 (1249, 1250, 1252, 1254) la ky nang phu trong
--     chuoi: KHONG gan skill_skillexp_v / addskillexp1 va skill_cost_v = 0.

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/8)
end

SKILLS={
	-- ========== "THIEN NGOAI PHI TIEN" (chuoi 1248 -> 1250 -> 1249) ==========
	thienngoaipt1={ -- Thien Ngoai Phi Tien (1) [SkillId 1248] - mo dau chuoi
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		physicsenhance_p={{{1,30},{20,100},{25,111}}}, -- ham vat ly (IsPhysical=1)
		poisondamage_v={{{1,1},{15,2},{20,3}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,400},{25,400}}},
		skill_cost_v={{{1,45},{25,56}}},
		skill_misslenum_v={{{1,3},{9,3},{10,5},{19,5},{20,7},{24,7},{25,9},{26,9}}}, -- khop ChildSkillNum=9 (missile 471)
		deadlystrike_p={{{1,6},{20,39},{25,44}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6200,1.15,1,3,1)},
							{2,SkillExpFunc(6200,1.15,2,3,1)},
							{3,SkillExpFunc(6200,1.16,3,3,1)},
							{4,SkillExpFunc(6200,1.17,4,3,1)},
							{5,SkillExpFunc(6200,1.18,5,3,1)},
							{6,SkillExpFunc(6200,1.19,6,3,1)},
							{7,SkillExpFunc(6200,1.20,7,3,1)},
							{8,SkillExpFunc(6200,1.21,8,3,1)},
							{9,SkillExpFunc(6200,1.22,9,3,1)},
							{10,SkillExpFunc(6200,1.23,10,3,1)},
							{11,SkillExpFunc(6200,1.24,11,3,1)},
							{12,SkillExpFunc(6200,1.23,12,3,1)},
							{13,SkillExpFunc(6200,1.22,13,3,1)},
							{14,SkillExpFunc(6200,1.21,14,3,1)},
							{15,SkillExpFunc(6200,1.20,15,3,1)},
							{16,SkillExpFunc(6200,1.19,16,3,1)},
							{17,SkillExpFunc(6200,1.18,17,3,1)},
							{18,SkillExpFunc(6200,1.17,18,3,1)},
							{19,SkillExpFunc(6200,1.16,19,3,1)},
							{20,SkillExpFunc(6200,1.15,20,3,1)},
							{21,SkillExpFunc(6200,1.15,21,3,1)},
							{22,SkillExpFunc(6200,1.15,22,3,1)},
							{23,SkillExpFunc(6200,1.15,23,3,1)},
							{24,SkillExpFunc(6200,1.15,24,3,1)},
							{25,SkillExpFunc(6200,1.15,25,3,1)},
						}},
				
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{25,1}},
			[3]={{1,1250},{25,1250}}, -- kich hoat SkillId 1250 (Thien Ngoai Phi Tien (3))
		},
		skill_showevent={{{1,0},{10,0},{10,1},{15,1},{25,1}}},
	},

	thienngoaipt3={ -- Thien Ngoai Phi Tien (3) [SkillId 1250] - giua chuoi, goi tiep 1249
		seriesdamage_p={{{1,15},{20,45},{21,50},{25,50}}}, -- van <=55%
		physicsenhance_p={{{1,10},{20,100},{25,111}}},
		poisondamage_v={{{1,1},{15,2},{20,4}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,400},{25,400}}},
		skill_cost_v={{{1,0},{25,0}}}, -- ky nang phu trong chuoi, khong tru them chi phi
		skill_misslenum_v={{{1,3},{9,3},{10,5},{19,5},{20,7},{24,7},{25,9},{26,9}}}, -- khop ChildSkillNum=9
		deadlystrike_p={{{1,4},{20,39},{25,44}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		skill_startevent={
			[1]={{1,0},{25,1}},
			[3]={{1,1249},{25,1249}}, -- kich hoat SkillId 1249 (Thien Ngoai Phi Tien (2))
		},
	},

	thienngoaipt2={ -- Thien Ngoai Phi Tien (2) [SkillId 1249] - ket thuc chuoi
		seriesdamage_p={{{1,15},{20,40},{21,45},{25,45}}}, -- van <=55%
		physicsenhance_p={{{1,10},{20,100},{25,119}}},
		poisondamage_v={{{1,1},{15,2},{20,8}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,400},{25,400}}},
		skill_cost_v={{{1,0},{25,0}}},
		skill_misslenum_v={{{1,1},{25,1}}}, -- khop ChildSkillNum=1
		deadlystrike_p={{{1,4},{20,39},{25,44}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
	},

	-- ================ "BAO VU" -> "LE HOA" (chuoi 1251 -> 1252) ================
	baovu1={ -- Bao Vu (1) [SkillId 1251] - mo dau chuoi, dung missile 96 co san
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		physicsenhance_p={{{1,9},{15,125},{20,304}}},
		poisondamage_v={{{1,1},{20,17}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,500},{25,500}}},
		skill_cost_v={{{1,44},{25,54}}},
		missle_lifetime_v={{{1,18},{20,18*2},{21,18*2}}},
		deadlystrike_p={{{1,1},{20,5},{25,5}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(12260,1.15,1,3,1)},
							{2,SkillExpFunc(12260,1.15,2,3,1)},
							{3,SkillExpFunc(12260,1.16,3,3,1)},
							{4,SkillExpFunc(12260,1.17,4,3,1)},
							{5,SkillExpFunc(12260,1.18,5,3,1)},
							{6,SkillExpFunc(12260,1.19,6,3,1)},
							{7,SkillExpFunc(12260,1.20,7,3,1)},
							{8,SkillExpFunc(12260,1.21,8,3,1)},
							{9,SkillExpFunc(12260,1.22,9,3,1)},
							{10,SkillExpFunc(12260,1.23,10,3,1)},
							{11,SkillExpFunc(12260,1.24,11,3,1)},
							{12,SkillExpFunc(12260,1.23,12,3,1)},
							{13,SkillExpFunc(12260,1.22,13,3,1)},
							{14,SkillExpFunc(12260,1.21,14,3,1)},
							{15,SkillExpFunc(12260,1.20,15,3,1)},
							{16,SkillExpFunc(12260,1.19,16,3,1)},
							{17,SkillExpFunc(12260,1.18,17,3,1)},
							{18,SkillExpFunc(12260,1.17,18,3,1)},
							{19,SkillExpFunc(12260,1.16,19,3,1)},
							{20,SkillExpFunc(12260,1.15,20,3,1)},
							{21,SkillExpFunc(12260,1.15,21,3,1)},
							{22,SkillExpFunc(12260,1.15,22,3,1)},
							{23,SkillExpFunc(12260,1.15,23,3,1)},
							{24,SkillExpFunc(12260,1.15,24,3,1)},
							{25,SkillExpFunc(12260,1.15,25,3,1)},
						}},
		skill_startevent={
			[1]={{1,1},{25,1}},
			[3]={{1,1252},{25,1252}}, -- kich hoat SkillId 1252 (Le Hoa (2))
		},
		skill_showevent={{{1,1},{25,1}}}, -- start(1) bat tu lv1
	},

	lehoa2={ -- Le Hoa (2) [SkillId 1252] - ket thuc chuoi, 32 dan hinh tron
		seriesdamage_p={{{1,15},{20,40},{21,45},{25,45}}}, -- van <=55%
		physicsenhance_p={{{1,1},{15,1},{20,1},{21,1}}}, -- thap vi ban rat nhieu dan
		poisondamage_v={{{1,1},{20,1}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,360},{25,360}}},
		skill_cost_v={{{1,0},{25,0}}},
		skill_misslenum_v={{{1,4},{10,8},{15,12},{25,16},{26,16}}}, -- khop ChildSkillNum=32 (missile 472)
--		deadlystrike_p={{{1,2},{25,15}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
	},

	-- ============ "CUU CUNG PHI TINH" (chuoi 1253 -> 1254) ============
	cuucungpt1={ -- Cuu Cung Phi Tinh (1) [SkillId 1253] - mo dau chuoi
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		physicsenhance_p={{{1,10},{15,100},{20,350}}},
		poisondamage_v={{{1,1},{20,30}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,420},{25,420}}},
		skill_cost_v={{{1,43},{25,62}}},
		skill_misslenum_v={{{1,6},{20,6},{25,6}}}, -- khop ChildSkillNum=6 (missile 473)
		missle_speed_v={{{1,28},{20,32},{21,32}}},
		deadlystrike_p={{{1,5},{20,39},{25,45}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5800,1.15,1,3,1)},
							{2,SkillExpFunc(5800,1.15,2,3,1)},
							{3,SkillExpFunc(5800,1.16,3,3,1)},
							{4,SkillExpFunc(5800,1.17,4,3,1)},
							{5,SkillExpFunc(5800,1.18,5,3,1)},
							{6,SkillExpFunc(5800,1.19,6,3,1)},
							{7,SkillExpFunc(5800,1.20,7,3,1)},
							{8,SkillExpFunc(5800,1.21,8,3,1)},
							{9,SkillExpFunc(5800,1.22,9,3,1)},
							{10,SkillExpFunc(5800,1.23,10,3,1)},
							{11,SkillExpFunc(5800,1.24,11,3,1)},
							{12,SkillExpFunc(5800,1.23,12,3,1)},
							{13,SkillExpFunc(5800,1.22,13,3,1)},
							{14,SkillExpFunc(5800,1.21,14,3,1)},
							{15,SkillExpFunc(5800,1.20,15,3,1)},
							{16,SkillExpFunc(5800,1.19,16,3,1)},
							{17,SkillExpFunc(5800,1.18,17,3,1)},
							{18,SkillExpFunc(5800,1.17,18,3,1)},
							{19,SkillExpFunc(5800,1.16,19,3,1)},
							{20,SkillExpFunc(5800,1.15,20,3,1)},
							{21,SkillExpFunc(5800,1.15,21,3,1)},
							{22,SkillExpFunc(5800,1.15,22,3,1)},
							{23,SkillExpFunc(5800,1.15,23,3,1)},
							{24,SkillExpFunc(5800,1.15,24,3,1)},
							{25,SkillExpFunc(5800,1.15,25,3,1)},
						}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1254},{25,1254}}, -- kich hoat SkillId 1254 (Cuu Cung Phi Tinh (2))
		},
		skill_showevent={{{1,0},{10,0},{10,1},{25,1}}}, -- start(1) tu lv11
	},

	cuucungpt2={ -- Cuu Cung Phi Tinh (2) [SkillId 1254] - ket thuc chuoi
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		physicsenhance_p={{{1,10},{15,100},{20,350}}},
		poisondamage_v={{{1,1},{20,30}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_attackradius={{{1,420},{25,420}}},
		skill_cost_v={{{1,0},{25,0}}},
		skill_misslenum_v={{{10,3},{20,6},{25,6}}}, -- khop ChildSkillNum=6 (missile 474)
		deadlystrike_p={{{1,3},{20,39},{25,45}}},
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


