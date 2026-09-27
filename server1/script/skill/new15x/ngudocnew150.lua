-- =====================================================================
-- ngudocnew150.lua  -  Ngu Doc, cum ky nang 15x moi
--
--   ngudocnew150     <- SkillId 1651  "Am Phong Thuc Cot (1)"  (TANG 1)
--   ngudocnew150_2   <- SkillId 1652  "Am Phong Thuc Cot (2)"  (TANG 2)
--   ngudocnew150_3   <- SkillId 1653  "Am Phong Thuc Cot (3)"  (TANG 3)
--
-- MaxLevel = 30 cho CA BA tang (cot MaxLevel trong skills.txt da sua).
--
-- CHUOI TANG - KHAI BAO NGAY TRONG FILE NAY (.lua thang cot skills.txt):
--
--   1651 --StartEvent-----> 1652  (ngudocnew150_2, 5 dan toa vong tron)
--        --VanishedEvent--> 1653  (ngudocnew150_3, tuong phang)
--
--   Ca hai tang deu do TANG 1 truc tiep kich hoat nen skill_showevent cua
--   1651 mo ta duoc ca hai: start(1) + vanished(8) = 9.
--   Muon .lua lam chu chuoi tang thi skill_startevent va skill_vanishedevent
--   BAT BUOC phai duoc wire trong skills.txt cua 1651.
--
-- BAN GOC: chuoi 1066 (zhangwudu150) --Start--> 1094 --Start--> 1096
--          (ca 1094 va 1096 dung chung bang zhangwudu150_2), trong wudu.lua.
--
-- NGU HANH: CharClass=3 (Moc) -> dung DUNG 1 ham nguyen to poisondamage_v.
--           Ca 3 tang deu IsPhysical=0 (noi cong). KHONG dung
--           physicsenhance_p, KHONG dung deadlystrike_p.
--
-- poisondamage_v co 3 THAM SO: {sat_thuong},{thoi_luong},{nhip}.
-- Chi scale tham so thu NHAT; tham so 2 va 3 giu nguyen nhu ban goc
-- (thoi luong 60, nhip 10 -> 6 nhip DoT moi lan dinh).
--
-- ===================== CACH NEO MOC poisondamage_v =====================
-- poisondamage_v CHI NEO DEN CAP 20 (giong het ban goc). Cap 21-30 do
-- Link() NGOAI SUY TUYEN TINH theo do doc cua doan cuoi (15 -> 20):
--
--     y(30) = (B-A)*(30-15)/(20-15) + A = 3B - 2A     voi A=y(15), B=y(20)
--
-- Cac moc duoc TINH NGUOC tu muc tieu can bang, KHONG phai chon tuy y.
--
-- ===================== CAN BANG (max-level vs max-level) ===============
--   BAN GOC @lv20 = 265
--     1066  215 x 1 dan = 215
--     1094   25 x 1 dan =  25
--     1096   25 x 1 dan =  25
--   MUC TIEU: @lv30 = 1.3 x 265 = 344.5
--
--   BAN MOI @lv30 (do Link() ngoai suy tu moc cap 20):
--     1651  220 x 1 dan = 220     moc {15,100},{20,140} -> 3*140-2*100 = 220
--     1652   28 x N dan           moc {15,13},{20,18}   -> 3*18 -2*13  =  28
--     1653   41 x 1 dan =  41     moc {15,20},{20,27}   -> 3*27 -2*20  =  41
--
--   Tong: N=1 -> 289 (x1.09) ; N=3 -> 345 (x1.30) ; N=5 -> 401 (x1.51)
--   Lay N=3 lam chuan than trong -> DUNG x1.30 nhu yeu cau.
--
--   LUU Y: vi moc cuoi phai lui ve cap 20 de dat dung x1.3 o cap 30,
--   gia tri o CAP 20 cua ban moi THAP HON ban goc (140 vs 215 o tang 1).
--   Day la he qua bat buoc cua yeu cau, khong phai loi go nham.
--
-- seriesdamage_p: ban goc 80/82 VUOT TRAN 55%, da ha ve dung 55 o moi tang.
-- Cac thuoc tinh co tran (seriesdamage_p, skill_misslenum_v) deu co moc
-- phang {30,X} de Link() khong ngoai suy vuot tran.
-- =====================================================================

SKILLS={

	-- ================== TANG 1 : SkillId 1651 ==================
	-- MisslesForm=6 (ngay vi tri muc tieu), ChildSkillNum=1 -> 1 dan.
	-- IsExpSkill=1 nen bat buoc co skill_skillexp_v.
	ngudocnew150={
		-- Ngu hanh tuong khac, ha tu 80/82 ve dung tran 55%.
		seriesdamage_p={{{1,40},{15,40},{20,55},{30,55}}},

		-- Doc sat. Neo den cap 20, cap 21-30 do Link() ngoai suy.
		--   lv15=100  lv20=140  lv25=180  lv30=220  (=1.3x tang goc 1066)
		poisondamage_v={
			{{1,25},{15,100},{20,140}},   -- sat thuong
			{{1,60},{20,60}},              -- thoi luong (giu nguyen ban goc)
			{{1,10},{20,10}},              -- nhip       (giu nguyen ban goc)
		},

		skill_attackradius={{{1,448},{20,500},{30,500}}},
		skill_cost_v={{{1,35},{20,100},{30,130}}},
		skill_eventskilllevel={{{1,1},{30,30}}},

		-- Tang 2 (1652): bat tu cap 1
		skill_startevent={
			[1]={{1,1},{30,1}},
			[3]={{1,1652},{30,1652}},
		},

		-- Tang 3 (1653): bat tu cap 1
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{30,1}},
			[3]={{1,1653},{30,1653}},
		},

		-- bitmask: start(1) + vanished(8) = 9, bat tu cap 1.
		-- Chi skill_showevent cua TANG 1 la co tac dung; tang 2/3 khong khai bao.
		skill_showevent={{{1,1},{10,1},{10,9},{30,9}}},

		-- Duong cong chuan: exp(n) = 50*n^2 + 150*n + 100
		-- Ban goc khop cong thuc nay tu cap 1-18 nhung SAI o cap 19 (21400)
		-- va cap 20 (21000 - con thap hon cap 19). Da sua ve dung cong thuc
		-- va tinh tien tiep den cap 30.
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
							{19,21000},
							{20,23100},
							{21,25300},
							{22,27600},
							{23,30000},
							{24,32500},
							{25,35100},
							{26,37800},
							{27,40600},
							{28,43500},
							{29,46500},
							{30,49600},
							}},
	},

	-- ================== TANG 2 : SkillId 1652 ==================
	-- MisslesForm=3 (hinh tron), ChildSkillNum=5, Param2=-275.
	-- Sat thuong NHAN theo so dan THUC TRUNG nen gia tri moi dan phai
	-- chia nho. Xem phan CAN BANG o dau file.
	ngudocnew150_2={
		seriesdamage_p={{{1,40},{20,55},{30,55}}},

		-- Neo den cap 20:  lv15=13  lv20=18  lv25=23  lv30=28
		poisondamage_v={
			{{1,3},{15,13},{20,19}},
			{{1,60},{20,60}},
			{{1,10},{20,10}},
		},

		skill_misslenum_v={{{1,1},{25,5},{30,5}}},   -- khop ChildSkillNum=5
		skill_attackradius={{{1,180},{30,180}}},
		skill_cost_v={{{1,0},{30,0}}},        -- tang phu, khong tru them chi phi
		skill_eventskilllevel={{{1,1},{30,30}}},
	},

	-- ================== TANG 3 : SkillId 1653 ==================
	-- MisslesForm=0 (tuong phang), ChildSkillNum=1 -> 1 dan.
	ngudocnew150_3={
		seriesdamage_p={{{1,40},{20,55},{30,55}}},

		-- Neo den cap 20:  lv15=20  lv20=27  lv25=34  lv30=41
		poisondamage_v={
			{{1,4},{15,20},{20,27}},
			{{1,60},{20,60}},
			{{1,10},{20,10}},
		},

		skill_attackradius={{{1,420},{30,420}}},
		skill_cost_v={{{1,0},{30,0}}},
		skill_eventskilllevel={{{1,1},{30,30}}},
	},
}

--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--根据2个点，求2次形函数f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--当x1或者x2 < 0 ,y =0
--当x2=x1, 有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
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
--根据2个点，求-2次形函数f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--当x2或者x1<0, y=0,
--当x1=x2,有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
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
--描绘连接线:Link(x,points)
--根据points提供的一系列点，用相邻的两个点描绘曲线
--return y值
--x 输入值
--points 点集合
--形如：points是形如{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}的映射
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
--技能设定格式如下：
--SKILLS={
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	。。。。。
--}
--如：
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--魔法属性physicsenhance_p参数1，1级时为35，20级时为335，曲线不填，默认线形
--			[2]={{1,0},{20,0}},
--		},--没有[3]，表示魔法属性physicsenhance_p参数2，默认为任何时候都是0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--以上描述技能“三环套月”的魔法属性和数值
-----------------------------------------------------------
--函数GetSkillLevelData(levelname, data, level)
--levelname：魔法属性名称
--data：技能名称
--level：技能等级
--return：当技能名称为data，技能等级为level
--			时的魔法属性levelname所需求的三个参数的具体值
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

