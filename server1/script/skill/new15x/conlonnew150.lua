-- =====================================================================
-- conlonnew150.lua  -  Con Lon, cum ky nang 15x moi
--
--   conlonnew150     <- SkillId 1648  "Thien Loi Chan Nhac1"  (TANG 1)
--   conlonnew150_2   <- SkillId 1649  "Thien Loi Chan Nhac2"  (TANG 2)
--   conlonnew150_3   <- SkillId 1650  "Thien Loi Chan Nhac3"  (TANG 3)
--
-- MaxLevel = 30 cho ca ba tang (skills.txt da san 30).
--
-- CHUOI TANG - KHAI BAO NGAY TRONG FILE NAY (.lua thang cot skills.txt):
--
--   1648 --StartEvent-----> 1649  (conlonnew150_2, vong tron 1-3 dan)
--        --VanishedEvent--> 1650  (conlonnew150_3, KHAI MO TU CAP 27)
--
--   Ca hai tang deu do TANG 1 truc tiep kich hoat nen skill_showevent cua
--   1648 mo ta duoc ca hai. Tang 2 va 3 KHONG khai bao skill_showevent.
--
-- BAN GOC: 1081 (jiankunlun150fu) --VanishedEvent--> 1109 (jiankunlun150),
--          trong kunlun.lua. Ban goc 2 tang; ban moi 3 tang.
--
-- NGU HANH: CharClass=5 (Tho) -> dung DUNG 1 ham nguyen to lightingdamage_v
--           (Set). Ca 3 tang deu IsPhysical=0 (noi cong). KHONG dung
--           physicsenhance_p, KHONG dung deadlystrike_p.
--
-- ================= TANG 1 KHONG MANG SAT THUONG (CO Y) =================
-- Missile 553 cua tang 1 co MissleHeight = 500, trong khi chieu cao toi da
-- cua muc tieu chi la 20. Dan bay TREN DAU, khong cham duoc ai.
-- Day la KY XAO CO CHU DICH: tang 1 chi de lay hieu ung hinh anh (spr dam
-- may bay tren troi) - "mot dam may tren troi thi lam gi duoc nguoi dung
-- duoi dat". KHONG PHAI LOI, KHONG duoc "sua" MissleHeight ve 20.
--
-- Vi vay tang 1 KHONG khai bao lightingdamage_v va seriesdamage_p nua
-- (khai bao cung vo nghia). Toan bo sat thuong nam o tang 2 va tang 3.
--
--   Missile 555 (tang 3) truoc day la 75 - da sua ve 20 de tang 3 trung
--   duoc muc tieu. Missile 554 (tang 2) von da la 15, giu nguyen.
--
-- ===================== CACH NEO MOC lightingdamage_v ===================
-- Sat thuong CHI NEO DEN CAP 20 (giong ban goc). Cap 21-30 do Link()
-- NGOAI SUY TUYEN TINH theo do doc doan cuoi (15 -> 20):
--
--     y(30) = (B-A)*(30-15)/(20-15) + A = 3B - 2A     voi A=y(15), B=y(20)
--
-- ===================== CAN BANG (max-level vs max-level) ===============
--   BAN GOC @lv20 = 1380
--     1081   250 x 1 dan =  250
--     1109  1130 x 1 dan = 1130
--   MUC TIEU: @lv30 = 1.2 x 1380 = 1656
--
--   PHAN BO YEU CAU:  tang 2 giu 75% ,  tang 3 giu 25% ,  tang 1 giu 0%
--
--   BAN MOI @lv30:
--     1648    0            =    0   (dam may, chi hieu ung)
--     1649  414 x 3 dan    = 1242   = 75.0%
--     1650  414 x 1 dan    =  414   = 25.0%
--                           ------
--                             1656   = DUNG x1.20
--
--   Ca hai tang dung CHUNG mot duong cong moi dan {15,189},{20,264}
--   -> 3*264 - 2*189 = 414. Tong = 4 don x 414. Ty le 3:1 = 75%:25%
--   sinh ra tu chinh so dan, khong can 2 duong cong khac nhau.
--
--   "AN DU DAN" hop le voi tang 2 vi MisslesForm=3 va skill_param2_v > 0:
--   dan xuat tu ria vong tron HUONG VAO tam -> muc tieu o tam an du 100%.
--   Vi vay N = dung bang skill_misslenum_v.
--
-- ===================== TANG 2: misslenum GAN VOI param2 ================
--     cap  1 - 14 :  misslenum = 1 ,  param2 =  0
--     cap 15 - 24 :  misslenum = 2 ,  param2 = 75
--     cap 25 - 30 :  misslenum = 3 ,  param2 = 75   (KHOA)
--
-- ===================== TANG 3: KHAI MO TU CAP 27 =======================
-- skill_vanishedevent cua tang 1 dung moc kep tai 26 -> bac thang:
-- tat o cap 1-26, bat tu cap 27. skill_showevent doi theo: 1 -> 9.
--
-- seriesdamage_p: ban goc 80/82 VUOT TRAN 55%, da ha ve dung 55.
-- stun_p: chan moc cuoi {30,44} (= gia tri cap 26 ban goc) de Link()
--         khong ngoai suy % choang len vo han.
-- =====================================================================

SKILLS={

	-- ================== TANG 1 : SkillId 1648 ==================
	-- MisslesForm=6, ChildSkillNum=1. KHONG mang sat thuong (missile 553
	-- co MissleHeight=500, bay tren dau - xem ghi chu dau file).
	-- Chi con vai tro: hieu ung hinh anh + cong kich hoat 2 tang con.
	conlonnew150={
		-- LUU Y: tang 1 khong cham duoc muc tieu nen stun_p RAT CO THE
		-- cung khong phat huy tac dung. Giu nguyen nhu ban goc, chua doi.
		
		skill_attackradius={{{1,470},{20,520},{30,520}}},
		skill_cost_v={{{1,48},{15,72},{20,115},{30,192}}},
		skill_eventskilllevel={{{1,1},{30,30}}},

		-- Tang 2 (1649): bat tu cap 1
		skill_startevent={
			[1]={{1,1},{30,1}},
			[3]={{1,1649},{30,1649}},
		},

		-- Tang 3 (1650): KHAI MO TU CAP 27 (moc kep tai 26 -> bac thang)
		skill_vanishedevent={
			[1]={{1,0},{26,0},{26,1},{30,1}},
			[3]={{1,1650},{30,1650}},
		},

		-- bitmask: start(1) tu cap 1 ; +vanished(8) tu cap 27 -> 1 roi 9.
		-- Chi skill_showevent cua TANG 1 co tac dung.
		skill_showevent={{{1,1},{26,1},{26,9},{30,9}}},

		-- Duong cong chuan: exp(n) = 50*n^2 + 150*n + 100
		-- Ban goc khop tu cap 1-18 nhung SAI o cap 19 (21400) va cap 20
		-- (21000 - thap hon cap 19). Da sua ve dung cong thuc, tien den 30.
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

	-- ================== TANG 2 : SkillId 1649 ==================
	-- SAT THUONG CHU DAO - giu 75% tong luong sat thuong toan skill.
	-- MisslesForm=3. So dan va ban kinh vong tron do .lua dieu khien.
	conlonnew150_2={
		seriesdamage_p={{{1,40},{20,55},{30,55}}},

		-- Neo den cap 20:  lv15=189  lv20=264  lv25=339  lv30=414 (moi dan)
		lightingdamage_v={
			[1]={{1,55},{15,189},{20,264}},
			[3]={{1,55},{15,189},{20,264}},
		},
		stun_p={{{1,5},{20,25},{25,30}},{{1,1},{20,12},{21,12}}},

		-- 1 dan (lv1-14) -> 2 dan (lv15-24) -> 3 dan (lv25+, khoa).
		-- Moc {30,3} chan Link() ngoai suy vuot ChildSkillNum=3.
		skill_misslenum_v={{{1,1},{14,1},{14,2},{24,2},{24,3},{30,3}}},

		-- Ban kinh vong tron, di kem so dan: 0 khi 1 dan, 75 khi >= 2 dan.
		-- BAT BUOC dien CA 3 KHE: engine KHONG doc khe [1] cua thuoc tinh
		-- nay. Da test thuc te - chi dien khe [1] thi dan CHONG LEN NHAU.
		skill_param2_v={
			[1]={{1,0},{14,0},{14,75},{30,75}},
			[2]={{1,0},{14,0},{14,75},{30,75}},
			[3]={{1,0},{14,0},{14,75},{30,75}},
		},

		skill_attackradius={{{1,520},{30,520}}},
		skill_cost_v={{{1,0},{30,0}}},        -- tang phu, khong tru them
		skill_eventskilllevel={{{1,1},{30,30}}},
	},

	-- ================== TANG 3 : SkillId 1650 ==================
	-- Giu 25% tong luong sat thuong. CHI XUAT HIEN TU CAP 27 (cong dat o
	-- skill_vanishedevent cua tang 1). MisslesForm=3, ChildSkillNum=1.
	-- Duong cong giong het MOI DAN cua tang 2 -> 1 don = 1/3 cua tang 2.
	conlonnew150_3={
		seriesdamage_p={{{1,40},{20,55},{30,55}}},

		-- Neo den cap 20:  lv15=189  lv20=264  lv25=339  lv30=414
		-- (cap 1-26 khong bao gio duoc goi toi vi tang chua khai mo)
		lightingdamage_v={
			[1]={{1,55},{15,189},{20,264}},
			[3]={{1,55},{15,189},{20,264}},
		},

		skill_attackradius={{{1,520},{30,520}}},
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

