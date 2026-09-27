--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/8)
end


SKILLS={
	--����
	-- ############################################################
	-- ### BO KY NANG 110 (SkillId 1229, 1233, 1234, 1235)       ###
	-- ### Them moi - toan bo noi dung phia tren giu nguyen goc.  ###
	-- ### CharClass=2 (Thuy) -> ham nguyen to la colddamage_v.   ###
	-- ### Tham khao ban goc: bingzong_wuying (SkillId 336,       ###
	-- ### cuiyan.lua, "Bang Tung Vo Anh").                       ###
	-- ############################################################

	
	

	-- ===== "110 BANG TUNG VO ANH TY" : 1233 bay -> 1234 =====
	-- Bang nay KE THUA TOAN BO thong so cua bang nhap cu "wuxiang_zhan"
	-- (ghi chu goc "-- Qua cau bang 110") da bi xoa khoi file nay: 1233 chinh
	-- la ky nang ban ra "qua cau bang" (missile 460) roi bay den dau toa ra
	-- tia bang (1234).
	-- HAI DIEU CHINH BAT BUOC:
	--   1) seriesdamage_p ban nhap la 60/62/90 - vuot 55% - da ha ve 55.
	--   2) Rut duong cong tu cap 30 ve cap 25 (MaxLevel cua 1233 la 25).
	-- Ban nhap co skill_skillexp_v RONG, nen bang exp duoi day duoc giu lai
	-- theo ban goc bingzong_wuying (SkillId 336, cuiyan.lua).
	bangtungvoanh110={ -- 110 Bang tung vo anh TY (1) [SkillId 1233] - NGOAI CONG
		seriesdamage_p={{{1,20},{15,20},{20,55},{21,55},{25,55}}}, -- da ha tu 60/62/90 ve 55%
		-- ==== CAN BANG THEO NGAN SACH TONG, HE SO 1.2 LAN BAN GOC ====
		-- Ban goc "bingzong_wuying" (SkillId 336, cuiyan.lua) cap 20:
		--   physicsenhance_p=146, colddamage_v can tren=276.
		--   Ngan sach = 146 x 1.2 = 175 (vat ly) va 276 x 1.2 = 331 (bang).
		--
		-- CHUOI 2 TANG - phai tinh CA HAI moi ra tong sat thuong:
		--   1233 (bang nay) --FlyEvent(t=5)--> 1234 tiabang110_2 (16 tia, form 3)
		--   Missile 460 co LifeTime=37, FlyEventTime=5
		--   => so lan sinh tang 2 = int(37/5)+1 = 8 lan  (DA DEM IN-GAME)
		--   => do tang 2 no tai vi tri dan tang 1 dang bay nen chi ~4 lan roi
		--      dung tam muc tieu (DA DO IN-GAME) -> 4 x 16 = 64 lan danh.
		--
		-- PHAN BO NGAN SACH:
		--   tang 2 : 1 vat ly + 2 bang moi tia  -> 64 va 128 tong (37%/39%)
		--   tang 1 : phan con lai               -> 111 va 203
		--   Cong lai: 111+64=175 va 203+128=331 = dung ngan sach.
		-- Gia tri tang 2 da cham SAN toi thieu (1 va 2); muon giam them thi phai
		-- giam so dan hoac so lan sinh, khong the ha gia tri xuong duoi 1.
		--
		-- Moc cuoi dat o cap 20, cap 21-25 do Link() ngoai suy tuyen tinh.
		physicsenhance_p={{{1,5},{20,89}}},
		colddamage_v={
			[1]={{1,15},{15,117},{20,160}},
			[3]={{1,15},{15,117},{20,160}},
		},
		skill_attackradius={{{1,448},{20,500},{21,500}}}, -- giu nguyen goc (goc {30,576})
		skill_cost_v={{{1,15},{20,45},{25,53}}}, -- giu nguyen goc
		skill_misslenum_v={{{1,1},{25,1}}}, -- khop ChildSkillNum=1 (missile 460)
--		missle_speed_v={{{1,28},{20,32},{25,34}}}, -- giu nguyen goc (goc {30,36})
		deadlystrike_p={{{1,7},{20,20},{25,20}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(8000,1.15,1,1,1)},
							{2,SkillExpFunc(8000,1.15,2,1,1)},
							{3,SkillExpFunc(8000,1.16,3,1,1)},
							{4,SkillExpFunc(8000,1.17,4,1,1)},
							{5,SkillExpFunc(8000,1.18,5,1,1.5)},
							{6,SkillExpFunc(8000,1.19,6,1,1.5)},
							{7,SkillExpFunc(8000,1.20,7,1,1.5)},
							{8,SkillExpFunc(8000,1.21,8,1,1.5)},
							{9,SkillExpFunc(8000,1.22,9,1,1.5)},
							{10,SkillExpFunc(8000,1.23,10,1,2)},
							{11,SkillExpFunc(8000,1.24,11,1,2)},
							{12,SkillExpFunc(8000,1.23,12,1,2)},
							{13,SkillExpFunc(8000,1.22,13,1,2)},
							{14,SkillExpFunc(8000,1.21,14,1,2)},
							{15,SkillExpFunc(8000,1.20,15,1,3)},
							{16,SkillExpFunc(8000,1.19,16,1,3)},
							{17,SkillExpFunc(8000,1.18,17,1,3)},
							{18,SkillExpFunc(8000,1.17,18,1,3)},
							{19,SkillExpFunc(8000,1.16,19,1,3)},
							{20,SkillExpFunc(8000,1.15,20,1,4)},
							{21,SkillExpFunc(8000,1.15,21,1,4)},
							{22,SkillExpFunc(8000,1.15,22,1,4)},
							{23,SkillExpFunc(8000,1.15,23,1,4)},
							{24,SkillExpFunc(8000,1.15,24,1,4)},
							{25,SkillExpFunc(8000,1.15,25,1,4)},
						}},
		skill_flyevent={
			[1]={{1,1},{25,1}},
			[3]={{1,1234},{25,1234}}, -- kich hoat SkillId 1234 (110 Tia bang TY (2)) khi bay
		},
		skill_showevent={{{1,2},{25,2}}}, -- fly(2) bat tu lv1
	},

	-- Bang nay KE THUA TOAN BO thong so cua bang nhap cu "bihai_chaosheng"
	-- (ghi chu goc "--Tia bang qua cau") da bi xoa khoi file nay. Xac nhan
	-- dung dich: ban nhap co skill_misslenum_v = 5->16, trung khit
	-- ChildSkillNum=16 cua SkillId 1234 trong skillstest.xlsx.
	-- BA DIEU CHINH BAT BUOC:
	--   1) DA BO physicsdamage_v cua ban nhap. SkillId 1234 co IsPhysical=1
	--      (ngoai cong) ma physicsdamage_v la ham nguyen to he Kim CHI dung
	--      cho ky nang noi cong -> sai quy tac, da go bo.
	--   2) seriesdamage_p ban nhap 50/52 van duoi 55% nen giu nguyen.
	--   3) Mo khoa lai skill_misslenum_v (ban nhap dang comment tat).
	-- Ban nhap khong co skill_skillexp_v / addskillexp1 - dung, vi 1234 co
	-- IsExpSkill=0 (ky nang phu trong chuoi).
	tiabang110_2={ -- 110 Tia bang TY (2) [SkillId 1234] - NGOAI CONG, 16 dan hinh tron
		seriesdamage_p={{{1,10},{20,50},{21,52},{25,55}}}, -- giu nguyen goc, <=55%
		physicsenhance_p={{{1,1},{15,1},{20,2},{25,2},{26,2}}}, -- thap vi ban rat nhieu dan
		colddamage_v={ -- Bang sat ngoai cong - giu nguyen goc
			[1]={{1,2},{20,2},{25,2}},
			[3]={{1,2},{20,2},{25,2}},
		},
		skill_cost_v={{{1,65},{20,65},{25,65}}}, -- giu nguyen goc
		skill_misslenum_v={{{1,3},{5,6},{10,9},{15,12},{20,16},{25,16}}}, -- giu nguyen goc, khop ChildSkillNum=16
		skill_eventskilllevel={{{1,1},{25,25}}},
	},

	-- ===== "110 3 TIEN (1)" : 1235 bay -> 1236 (o ngami.lua) =====
	-- Bang nay KE THUA TOAN BO thong so cua bang cu "Ba_Kiem110" (ghi chu goc
	-- "--3 co tien" = "3 co tien" -> chinh la "110 3 Tien") da bi xoa khoi file
	-- nay. Giu nguyen gia tri goc, chi mo rong duong cong tu cap 20 len cap 25.
	-- HAI DIEU CHINH BAT BUOC so voi ban cu:
	--   1) DA BO physicsdamage_v cua ban cu. SkillId 1235 co IsPhysical=0
	--      (noi cong) va CharClass=2 (Thuy) -> phai dung DUNG 1 ham nguyen to la
	--      colddamage_v. physicsdamage_v la ham he Kim, chi hop le cho ky nang
	--      noi cong he Kim, nen o day la sai quy tac va da duoc go bo.
	--   2) seriesdamage_p ban cu la 60/62 - vuot muc toi da 55% - da ha ve 55.
	-- THAY DOI CO CHU DICH: them skill_flyevent -> 1236 theo skillstest.xlsx
	-- (ban cu co skill_flyevent -> 338 nhung dang bi comment tat).
	batien110_1={ -- 110 3 Tien (1) [SkillId 1235] - NOI CONG (IsPhysical=0)
		seriesdamage_p={{{1,20},{15,20},{20,55},{21,55},{25,55}}}, -- da ha tu 60/62 ve 55%
		physicsdamage_v={
			[1]={{1,3},{15,64},{20,229}},
			[3]={{1,3},{15,64},{20,229}},
		},
		colddamage_v={
			[1]={{1,10},{15,166},{20,403}},
			[3]={{1,10},{15,166},{20,403}}
		},
		missle_speed_v={{{1,28},{20,32},{21,32}}}, -- giu nguyen goc
		skill_attackradius={{{1,512},{25,512}}}, -- giu nguyen goc (skills.txt ghi 450, .lua thang)
		skill_cost_v={{{1,45},{20,65}}}, -- giu nguyen goc
		skill_misslenum_v={{{1,1},{10,2},{20,3},{25,3}}}, -- giu nguyen goc, khop ChildSkillNum=3
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(13000,1.15,1,1,1)},
							{2,SkillExpFunc(13000,1.15,2,1,1)},
							{3,SkillExpFunc(13000,1.16,3,1,1)},
							{4,SkillExpFunc(13000,1.17,4,1,1)},
							{5,SkillExpFunc(13000,1.18,5,1,1)},
							{6,SkillExpFunc(13000,1.19,6,1,1)},
							{7,SkillExpFunc(13000,1.20,7,1,1)},
							{8,SkillExpFunc(13000,1.21,8,1,1)},
							{9,SkillExpFunc(13000,1.22,9,1,1)},
							{10,SkillExpFunc(13000,1.23,10,1,1)},
							{11,SkillExpFunc(13000,1.24,11,1,1)},
							{12,SkillExpFunc(13000,1.23,12,1,1)},
							{13,SkillExpFunc(13000,1.22,13,1,1)},
							{14,SkillExpFunc(13000,1.21,14,1,1)},
							{15,SkillExpFunc(13000,1.20,15,1,1)},
							{16,SkillExpFunc(13000,1.19,16,1,1)},
							{17,SkillExpFunc(13000,1.18,17,1,1)},
							{18,SkillExpFunc(13000,1.17,18,1,1)},
							{19,SkillExpFunc(13000,1.16,19,1,1)},
							{20,SkillExpFunc(13000,1.15,20,1,1)},
							{21,SkillExpFunc(13000,1.15,21,1,1)},
							{22,SkillExpFunc(13000,1.15,22,1,1)},
							{23,SkillExpFunc(13000,1.15,23,1,1)},
							{24,SkillExpFunc(13000,1.15,24,1,1)},
							{25,SkillExpFunc(13000,1.15,25,1,1)},
						}},
		skill_flyevent={
			[1]={{1,1},{10,1},{11,1},{25,1}},
			[3]={{1,1236},{25,1236}}, -- kich hoat SkillId 1236 (110 3 Tien (2)) - bang o ngami.lua
		},
		skill_showevent={{{1,2},{25,2}}}, -- fly(2) bat tu lv1
	},
	
    batien110_2={ -- 110 3 Tien (2) [SkillId 1236] - NOI CONG (IsPhysical=0), ky nang phu
		seriesdamage_p={{{1,15},{20,45},{21,50},{25,50}}}, -- van <=55%
		colddamage_v={ -- CHI 1 ham nguyen to duy nhat (he Thuy)
			[1]={{1,10},{15,135},{20,330}},
			[3]={{1,10},{15,135},{20,330}},
		},
		skill_attackradius={{{1,400},{25,400}}},
		skill_cost_v={{{1,0},{25,0}}}, -- ky nang phu duoc goi tu 1235, khong tru them chi phi
		skill_misslenum_v={{{1,1},{25,1}}}, -- khop ChildSkillNum=1 (missile 463)
		skill_eventskilllevel={{{1,1},{25,25}}},
	},
}
	
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--����2���㣬�����κ���f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--��x2=x1, ��x=c,��ֱ����һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--����2���㣬��2���κ���f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--��x1����x2 < 0 ,y =0
--��x2=x1, ��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
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
--����2���㣬��-2���κ���f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--��x2����x1<0, y=0,
--��x1=x2,��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
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
--���������:Link(x,points)
--����points�ṩ��һϵ�е㣬�����ڵ��������������
--return yֵ
--x ����ֵ
--points �㼯��
--���磺points������{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}��ӳ��
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
--�����趨��ʽ���£�
--SKILLS={
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		����������
--	}��
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		����������
--	}��
--	����������
--}
--�磺
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--ħ������physicsenhance_p����1��1��ʱΪ35��20��ʱΪ335�����߲��Ĭ������
--			[2]={{1,0},{20,0}},
--		},--û��[3]����ʾħ������physicsenhance_p����2��Ĭ��Ϊ�κ�ʱ����0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--�����������ܡ��������¡���ħ�����Ժ���ֵ
-----------------------------------------------------------
--����GetSkillLevelData(levelname, data, level)
--levelname��ħ����������
--data����������
--level�����ܵȼ�
--return������������Ϊdata�����ܵȼ�Ϊlevel
--			ʱ��ħ������levelname����������������ľ���ֵ
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

