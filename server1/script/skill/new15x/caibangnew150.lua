-- =====================================================================
-- caibangnew150.lua  -  Cai Bang, cum ky nang 15x moi
--
--   caibangnew150     <- SkillId 1644  "Thoi Thang Luc Long1"  (TANG 1)
--   caibangnew150_2   <- SkillId 1645  (TANG 2, sinh ra khi 1644 va cham)
--
-- MaxLevel = 30 cho CA HAI tang (phai sua cot MaxLevel trong skills.txt).
--
-- CHUOI TANG - KHAI BAO NGAY TRONG FILE NAY (.lua thang cot skills.txt):
--
--   1644 --FlyEvent-----> 1103  (Thoi Thang Luc Long Hoa, co san, gaibang.lua)
--        --CollideEvent-> 1645  (caibangnew150_2, KHAI MO TU CAP 27)
--
--   Muon .lua dieu khien chuoi tang thi skill_flyevent va skill_collideevent
--   BAT BUOC phai duoc wire trong skills.txt cua 1644. Neu khong wire, chung
--   tra ve rong va cot skills.txt se lam chu.
--
-- BAN GOC: 1073 (zhanggaibang150) va tang 1072 (zhanggaibang150_2).
-- =====================================================================

SKILLS={

	-- ================== TANG 1 : SkillId 1644 ==================
	-- NOI CONG (IsPhysical=0), CharClass=4 (Hoa) -> dung DUNG 1 ham
	-- nguyen to la firedamage_v, KHONG dung physicsenhance_p.
	caibangnew150={
		-- Ngu hanh tuong khac. Ban goc 80/82 vuot tran 55%, da ha ve 55.
		-- Them moc {30,55} de Link() khong ngoai suy vuot tran o cap 21-30.
		seriesdamage_p={{{1,40},{15,40},{20,55},{30,55}}},

		-- Sat thuong phang (can duoi = can tren). Moc cuoi dat o cap 20,
		-- cap 21-30 do Link() ngoai suy tuyen tinh -> cap 30 = 3600.
		firedamage_v={
			[1]={{1,24},{15,720},{20,1800}},
			[3]={{1,24},{15,720},{20,1800}},
		},

		skill_attackradius={{{1,448},{20,512},{30,512}}},
		skill_cost_v={{{1,12},{20,78},{30,98}}},
		skill_eventskilllevel={{{1,1},{30,30}}},

		-- Tang phu 1103: bat tu cap 1
		skill_flyevent={
			[1]={{1,1},{30,1}},
			[3]={{1,1103},{30,1103}},
		},

		-- Tang 2 (1645): KHAI MO TU CAP 27 (moc kep tai 26 -> bac thang)
		skill_collideevent={
			[1]={{1,0},{26,0},{26,1},{30,1}},
			[3]={{1,1645},{30,1645}},
		},

		-- bitmask: fly(2) tu cap 1 ; +collide(4) tu cap 27  -> 2 roi 6
		skill_showevent={{{1,2},{26,2},{26,6},{30,6}}},

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

	-- ================== TANG 2 : SkillId 1645 ==================
	-- NOI CONG (IsPhysical=0), CharClass=4 (Hoa) -> DUNG 1 ham nguyen to
	-- duy nhat la firedamage_v. KHONG dung physicsenhance_p.
	--
	-- SAT THUONG LUON MAX: khong tang theo cap, phang tu cap 1 den cap 30.
	--   ban goc 1072: 450 @lv20, 1 dan          ->  450 tong
	--   1645        : 150 moi dan x 3 dan       ->  450 tong (giu he so x1.00)
	-- Sat thuong NHAN theo so dan trung nen phai chia cho so dan.
	--
	-- Tang nay chi khai mo khi tang 1 dat CAP 27, nen nguoi choi cham toi
	-- no da o cuoi duong cong - de phang la hop ly.
	caibangnew150_2={
		-- Ban goc 80/82 vuot tran, ha ve 55%. Phang luon cho dong bo.
		seriesdamage_p={{{1,55},{30,55}}},

		-- Hoa, phang tuyet doi: 150 moi dan o MOI cap.
		firedamage_v={
			[1]={{1,24},{15,720},{20,1800}},
			[3]={{1,24},{15,720},{20,1800}},
		},

		skill_misslenum_v={{{1,3},{30,3}}},   -- khop ChildSkillNum=3
		skill_attackradius={{{1,320},{30,320}}},
		skill_cost_v={{{1,0},{30,0}}},        -- tang phu, khong tru them chi phi
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

