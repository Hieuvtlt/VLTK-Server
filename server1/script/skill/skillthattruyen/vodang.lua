-- VoDang.lua
-- File Lua MOI duoc viet cho 6 ky nang SkillId 1218-1223 (skillstest.xlsx)
-- Nguyen tac da ap dung nghiem ngat theo yeu cau:
--   1) Ky nang VAT LY (IsPhysical=1, Property "Cong kich ngoai cong")
--      CHI dung physicsenhance_p, KHONG gan bat ky ham nguyen to nao.
--   2) Ky nang NGUYEN TO/NOI CONG (IsPhysical=0, Property "Cong kich noi
--      cong") CHI dung 1 ham nguyen to duy nhat, KHONG dung physicsenhance_p.
--   3) Nguyen to duoc chon dua theo CharClass (Ngu Hanh) cua skills.txt:
--        CharClass=5 (Tho) -> VoDang -> dung lightingdamage_v (Set)
--      THEO XAC NHAN TRUC TIEP CUA NGUOI DUNG: he Tho dung sat thuong Set.
--      Bang Ngu Hanh -> ham sat thuong da xac nhan/ghi nho cho du an:
--        Kim -> (chua xac nhan)      Thuy -> colddamage_v
--        Moc -> poisondamage_v        Hoa -> firedamage_v (co bang chung
--        that qua ten file AnimFile "huo3" o Thiennhan.lua)
--        Tho -> lightingdamage_v (XAC NHAN boi nguoi dung, ap dung tu day)
--   4) seriesdamage_p (Ngu hanh tuong khac) LUON gioi han toi da 55%.
--   5) Chuoi StartEvent/FlyEvent duoc dinh nghia khop CHINH XAC voi
--      SkillId dich trong skillstest.xlsx (1218->1219->1220,
--      1221->1222->1223), dam bao dung nguyen tac ".lua thang skills.txt".

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/8)
end

SKILLS={
	-- ================= CUM "110 THIEN DIA" (noi cong, he Tho) =================
	thiendia1={ -- 110 Thien Dia (1) [SkillId 1218] - noi cong, mo dau combo
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		lightingdamage_v={
			[1]={{1,12},{15,175},{20,467},{21,478},{25,525}},
			[3]={{1,12},{15,175},{20,467},{21,478},{25,525}},
		},
		skill_attackradius={{{1,470},{25,520}}},
		skill_cost_v={{{1,40},{25,55}}},
		missle_speed_v={{{1,0},{25,0}}}, -- MoveKind=0 (dung yen tai cho), toc do 0
		--deadlystrike_p={{{1,5},{20,18},{25,20}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,21000},
												{21,21000},
												{22,21000},
												{23,21000},
												{24,21000},
												{25,21000},
												}},	
		
		stun_p={{{1,1},{25,40}},{{1,1*18},{25,2*18}}}, -- % choang + thoi gian (giay)
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{15,1},{20,1}}, -- luon kich hoat (combo mo dau)
			[3]={{1,1219},{25,1219}}, -- kich hoat SkillId 1219 (110 Thien Dia (2))
		},
		skill_flyevent={
			[1]={{1,0},{15,1},{20,1}},
			[3]={{1,1220},{25,1220}}, -- kich hoat SkillId 1220 (110 Thien Dia (3)) khi dang bay
		},
		skill_showevent={{{1,0},{10,0},{10,1},{14,1},{14,3},{25,3}}}, -- start(1) tu lv11 ; +fly(2) tu lv15
	},

	thiendia2={ -- 110 Thien Dia (2) [SkillId 1219] - noi cong, tang giua combo
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		lightingdamage_v={
			[1]={{1,5},{20,86},{21,96},{25,97}},
			[3]={{1,5},{20,86},{21,96},{25,97}},
		},
		skill_attackradius={{{1,470},{25,470}}},
		skill_cost_v={{{1,0},{25,0}}}, -- ky nang phu trong chuoi, khong tru them chi phi rieng
		stun_p={{{1,0},{20,0},{25,5}},{{1,1*18},{25,2*18}}}, -- % choang + thoi gian (giay)
		skill_flyevent={
			[1]={{1,1},{25,1}},
			[3]={{1,1220},{25,1220}}, -- kich hoat SkillId 1220 (110 Thien Dia (3)) khi dang bay
		},
		skill_eventskilllevel={{{1,1},{25,25}}},
		skill_showevent={{{1,0},{10,0},{10,1},{25,1}}},
	},

	thiendia3={ -- 110 Thien Dia (3) [SkillId 1220] - noi cong, ket thuc combo (6 dan, hinh tron)
		-- Da them moc {25,55}: cac moc cu (1,20,21) qua gan nhau nen khi Link()
		-- ngoai suy den cap 25 se vuot tran (65%). Chot cung dung 55% o cap 25.
		seriesdamage_p={{{1,15},{20,40},{21,45},{25,55}}},
		lightingdamage_v={
			[1]={{1,5},{20,10},{21,11}},
			[3]={{1,5},{20,10},{21,11}},
		},
		skill_attackradius={{{1,480},{20,480}}},
		skill_cost_v={{{1,10},{20,25}}},
		missle_speed_v={{{1,20},{20,20}}}, -- MoveKind=1 (bay thang), can toc do bay
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_misslenum_v={{{1,2},{20,6},{25,6}}}, -- khoa cung 6 dan o cap 25 (truoc day ngoai suy len 7)
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
	},

	-- ================= CUM "110 NHAN KIEM" (ngoai cong, vat ly thuan) =================
	nhankiem1={ -- 110 Nhan Kiem (1) [SkillId 1221] - ngoai cong, mo dau combo
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		physicsenhance_p={{{1,15},{15,73},{20,160}}}, -- CHI dung ham vat ly (dung quy tac)
		lightingdamage_v={
			[1]={{1,9},{15,77},{20,209}},
			[3]={{1,9},{15,77},{20,209}}
		},
		skill_attackradius={{{1,470},{25,520}}},
		skill_cost_v={{{1,45},{25,65}}},
		missle_speed_v={{{1,0},{25,0}}}, -- MoveKind=0
		deadlystrike_p={{{1,8},{20,22},{25,25}}},
		stun_p={{{1,1},{20,20},{25,30}},{{1,1*18},{25,2*18}}}, -- % choang + thoi gian (giay)
		stealmana_p={{{1,1},{20,5}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(7200,1.15,1,3,1)},
							{2,SkillExpFunc(7200,1.15,2,3,1)},
							{3,SkillExpFunc(7200,1.16,3,3,1)},
							{4,SkillExpFunc(7200,1.17,4,3,1)},
							{5,SkillExpFunc(7200,1.18,5,3,1)},
							{6,SkillExpFunc(7200,1.19,6,3,1)},
							{7,SkillExpFunc(7200,1.20,7,3,1)},
							{8,SkillExpFunc(7200,1.21,8,3,1)},
							{9,SkillExpFunc(7200,1.22,9,3,1)},
							{10,SkillExpFunc(7200,1.23,10,3,1)},
							{11,SkillExpFunc(7200,1.24,11,3,1)},
							{12,SkillExpFunc(7200,1.23,12,3,1)},
							{13,SkillExpFunc(7200,1.22,13,3,1)},
							{14,SkillExpFunc(7200,1.21,14,3,1)},
							{15,SkillExpFunc(7200,1.20,15,3,1)},
							{16,SkillExpFunc(7200,1.19,16,3,1)},
							{17,SkillExpFunc(7200,1.18,17,3,1)},
							{18,SkillExpFunc(7200,1.17,18,3,1)},
							{19,SkillExpFunc(7200,1.16,19,3,1)},
							{20,SkillExpFunc(7200,1.15,20,3,1)},
							{21,SkillExpFunc(7200,1.15,21,3,1)},
							{22,SkillExpFunc(7200,1.15,22,3,1)},
							{23,SkillExpFunc(7200,1.15,23,3,1)},
							{24,SkillExpFunc(7200,1.15,24,3,1)},
							{25,SkillExpFunc(7200,1.15,25,3,1)},
							}},
		skill_startevent={
			[1]={{1,1},{25,1}},
			[3]={{1,1222},{25,1222}}, -- kich hoat SkillId 1222 (110 Nhan Kiem (2))
		},
		skill_showevent={{{1,1},{25,1}}}, -- start(1) bat tu lv1
	},

	nhankiem2={ -- 110 Nhan Kiem (2) [SkillId 1222] - ngoai cong, tang giua combo
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		physicsenhance_p={{{1,7},{15,43},{20,43},{21,43},{25,43}}}, -- CHI dung ham vat ly
		lightingdamage_v={
			[1]={{1,17},{15,39},{20,51},{25,77}},
			[3]={{1,17},{15,39},{20,51},{25,77}}
		},
		-- Khoa cung toi da 5 dan: neu chi dinh nghia den moc {25,5} thi Link()
		-- se NGOAI SUY vuot 5 khi bi truy van qua cap 25 (vd cap 30 -> 7 dan,
		-- da kiem chung engine). Them moc {30,5} de chan cung, dam bao khong
		-- bao gio vuot 5 dan du co bi truy van vuot MaxLevel=25 hay khong.
		skill_misslenum_v={{{1,1},{11,2},{20,3},{25,5},{30,5}}},
--		skill_attackradius={{{1,520},{25,520}}},
--		skill_cost_v={{{1,0},{25,0}}},
--    	missle_speed_v={{{1,20},{25,20}}}, -- MoveKind=1
		skill_eventskilllevel={{{1,1},{25,25}}},
		skill_startevent={
			[1]={{1,1},{25,1}},
			[3]={{1,1223},{25,1223}}, -- kich hoat SkillId 1223 (110 Nhan Kiem (3))
		},
	},

	nhankiem3={ -- 110 Nhan Kiem (3) [SkillId 1223] - ngoai cong, ket thuc combo (can chien)
		seriesdamage_p={{{1,15},{20,40},{21,45}}}, -- van <=55%
		physicsenhance_p={{{1,5},{20,5},{21,5}}}, -- CHI dung ham vat ly
--		skill_attackradius={{{1,0},{20,0}}}, -- can chien (IsMelee=1), khong can tam xa
--		skill_cost_v={{{1,15},{20,30}}},
--		deadlystrike_p={{{1,10},{20,30}}},
--		steallife_p={{{1,1},{20,5}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
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


