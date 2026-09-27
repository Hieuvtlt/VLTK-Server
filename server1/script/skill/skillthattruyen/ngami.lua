--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range
Include("\\script\\skill\\head.lua")
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/8)
end


SKILLS={
	--����
	
	



	yuquan_xichen={ --��Ȫϴ��
		physicsenhance_p={{{1,30},{20,148}}},
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		deadlystrike_p={{{1,10},{20,20}}},
	},
	jianemei150={ --����ü150
		physicsenhance_p={{{1,35},{50,1750},{51,1750}}},
		--physicsenhance_p={{{1,30},{30,1200},{31,1240}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		colddamage_v={
			[1]={{1,20},{20,195},{23,250},{26,277}},
			[3]={{1,20},{20,195},{23,250},{26,277}}
		},
		deadlystrike_p={{{1,12},{20,65},{23,81},{26,90}}},
		missle_speed_v={{{1,36},{20,36},{21,36}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,45},{20,45}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1089},{20,1089}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
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
												{20,90000},
												{21,120000},
												{22,150000},
												{23,200000},
												{24,250000},
												{25,300000},
												{26,390000},
												}},	
	},
	
	jinding_foguang={ --�𶥷��
		colddamage_v={
			[1]={{1,10},{20,585},{21,600}},
			[3]={{1,10},{20,585},{21,600}},
		},
		seriesdamage_p={{{1,20},{20,60},{21,62}}},
		missle_speed_v={{{1,28},{20,28},{21,28}}},
		skill_misslenum_v={{{1,1},{10,2},{20,3},{21,3}}},
	},
	

	-- ############################################################
	-- ### BO KY NANG 110 (SkillId 1227,1228,1230,1231,1232,1236) ###
	-- ### Them moi - toan bo noi dung phia tren giu nguyen goc.  ###
	-- ### CharClass=2 (Thuy) -> ham nguyen to la colddamage_v.   ###
	-- ### Tham khao ban goc: fengshuang_suiying (SkillId 380,    ###
	-- ### emei.lua, "Phong Suong Toai Anh") va yuquan_xichen     ###
	-- ### (SkillId 329, emei.lua).                               ###
	-- ############################################################

	-- ===== "110 PHONG SUONG" : 1227 -> 1228, va bay -> 1229 (o thuyyen.lua) =====
	-- Bang nay KE THUA TOAN BO thong so cua bang nhap cu "SuongHan_ThauTam"
	-- (ghi chu goc "-- phong suong 110 (1)") da bi xoa khoi file nay.
	-- Gia tri colddamage_v cua ban nhap trung khit ban goc fengshuang_suiying
	-- (SkillId 380, emei.lua) - xac nhan day dung la ban nhap cua 1227.
	-- HAI DIEU CHINH BAT BUOC:
	--   1) seriesdamage_p ban nhap la 60/62/76 - vuot 55% - da ha ve 55.
	--   2) Rut duong cong tu cap 30 ve cap 25 (MaxLevel cua 1227 la 25).
	-- THAY DOI CO CHU DICH: skill_startevent 1973 -> 1228 va skill_flyevent
	-- 1974 -> 1229, khop chuoi that trong skillstest.xlsx (1973/1974 la ID tam
	-- cua ban nhap, khong ton tai trong bo ky nang 110 nay).
	phongsuong110_1={ -- 110 Phong Suong (1) [SkillId 1227] - NOI CONG (IsPhysical=0)
		seriesdamage_p={{{1,20},{15,20},{20,55},{21,55},{25,55}}}, -- da ha tu 60/62/76 ve 55%
		colddamage_v={
			[1]={{1,28},{15,375},{20,938}},
			[3]={{1,28},{15,375},{20,938}}
		},
		skill_attackradius={{{1,520},{25,520}}},
		skill_cost_v={{{1,30},{20,60},{25,60}}}, -- giu nguyen goc
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6260,1.15,1,3,1)},
							{2,SkillExpFunc(6260,1.15,2,3,1)},
							{3,SkillExpFunc(6260,1.16,3,3,1)},
							{4,SkillExpFunc(6260,1.17,4,3,1)},
							{5,SkillExpFunc(6260,1.18,5,3,1)},
							{6,SkillExpFunc(6260,1.19,6,3,1)},
							{7,SkillExpFunc(6260,1.20,7,3,1)},
							{8,SkillExpFunc(6260,1.21,8,3,1)},
							{9,SkillExpFunc(6260,1.22,9,3,1)},
							{10,SkillExpFunc(6260,1.23,10,3,1)},
							{11,SkillExpFunc(6260,1.24,11,3,1)},
							{12,SkillExpFunc(6260,1.23,12,3,1)},
							{13,SkillExpFunc(6260,1.22,13,3,1)},
							{14,SkillExpFunc(6260,1.21,14,3,1)},
							{15,SkillExpFunc(6260,1.20,15,3,1)},
							{16,SkillExpFunc(6260,1.19,16,3,1)},
							{17,SkillExpFunc(6260,1.18,17,3,1)},
							{18,SkillExpFunc(6260,1.17,18,3,1)},
							{19,SkillExpFunc(6260,1.16,19,3,1)},
							{20,SkillExpFunc(6260,1.15,20,3,1)},
							{21,SkillExpFunc(6260,1.15,21,3,1)},
							{22,SkillExpFunc(6260,1.15,22,3,1)},
							{23,SkillExpFunc(6260,1.15,23,3,1)},
							{24,SkillExpFunc(6260,1.15,24,3,1)},
							{25,SkillExpFunc(6260,1.15,25,3,1)},
						}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1228},{25,1228}}, -- kich hoat SkillId 1228 (110 Phong Suong (2) 3 tia bang )
		},
		skill_flyevent={
			[1]={{1,0},{14,0},{14,1},{20,1}},
			[3]={{1,1229},{25,1229}}, -- kich hoat SkillId 1229 (110 Phong Suong (3)) - bang o thuyyen.lua
		},
		skill_showevent={{{1,0},{10,0},{10,1},{14,1},{14,3},{25,3}}}, -- start(1) tu lv11 ; +fly(2) tu lv16
	},

	phongsuong110_2={ -- 110 Phong Suong (2) [SkillId 1228] - NOI CONG, ky nang phu
		colddamage_v={
			[1]={{1,4},{20,257},{21,266}},
			[3]={{1,4},{20,257},{21,266}},
		},
		seriesdamage_p={{{1,20},{20,55},{21,55}}},
		missle_speed_v={{{1,26},{20,30},{21,30}}},
		skill_misslenum_v={{{1,1},{10,1},{20,3},{21,3}}}
	},
	
    phongsuong110_3={ -- 110 Phong Suong (3) [SkillId 1229] - NOI CONG (IsPhysical=0)
		colddamage_v={
			[1]={{1,40},{25,375}},
			[3]={{1,40},{25,375}}
		},
		seriesdamage_p={{{1,5},{20,30}}}
	},
	

	-- ===== "110 3 KIEM" : 1230 -> 329 (co san), bay -> 1231, va cham -> 1232 =====
	-- Bang nay KE THUA thong so cua HAI ban nhap cu da bi xoa khoi file nay,
	-- ca hai deu la ban nhap cua CUNG SkillId 1230 (deu co skill_startevent
	-- -> 329 va skill_attackradius 448->512 y het nhau):
	--   - "tuichuang_wangyue" (ghi chu "--Kiem Bang 110") : lay lam bang goc vi
	--     day du hon, co du ca chuoi 3 tang (start + fly + collide).
	--   - "Ba_Kiem110"        (ghi chu "-- 3 kiem 110")   : chi lay them
	--     missle_speed_v=32. Cac gia tri con lai bi trung nen dung ban tren.
	--     LUU Y da BO addskilldamage1 -> 1061 cua ban nay vi trung slot voi
	--     addskilldamage1 -> 1091 cua ban tuichuang_wangyue; neu muon dung
	--     1061 thay cho 1091 thi doi lai trong addskilldamage1 ben duoi.
	-- Giu nguyen gia tri goc, chi mo rong duong cong tu cap 20 len cap 25.
	-- THAY DOI CO CHU DICH: skill_flyevent 1976 -> 1231 va skill_collideevent
	-- 1977 -> 1232, de khop chuoi that trong skillstest.xlsx (1976/1977 la ID
	-- tam cua ban nhap cu, khong ton tai trong bo ky nang 110 nay).
	bakiem110_1={ -- 110 3 Kiem (1) [SkillId 1230] - NGOAI CONG (IsPhysical=1)
		seriesdamage_p={{{1,5},{20,30},{25,40}}}, -- giu nguyen goc, <=55%
		physicsenhance_p={{{1,65},{20,170},{25,260}}}, -- giu nguyen goc
		colddamage_v={ -- Bang sat ngoai cong (he Thuy) - giu nguyen goc
			[1]={{1,13},{20,130},{25,154}},
			[3]={{1,13},{20,130},{25,154}},
		},
		skill_attackradius={{{1,448},{20,512},{25,512}}}, -- giu nguyen goc (ca 2 ban nhap deu 448->512)
		skill_cost_v={{{1,20},{25,20}}}, -- giu nguyen goc
		skill_misslenum_v={{{1,1},{25,1}}}, -- khop ChildSkillNum=1 (missile 457)
		missle_speed_v={{{1,32},{25,34}}}, -- lay tu ban nhap "Ba_Kiem110"
		deadlystrike_p={{{1,10},{20,30},{25,36}}}, -- giu nguyen goc
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5000,1.15,1,3,1)},
							{2,SkillExpFunc(5000,1.15,2,3,1)},
							{3,SkillExpFunc(5000,1.16,3,3,1)},
							{4,SkillExpFunc(5000,1.17,4,3,1)},
							{5,SkillExpFunc(5000,1.18,5,3,1)},
							{6,SkillExpFunc(5000,1.19,6,3,1)},
							{7,SkillExpFunc(5000,1.20,7,3,1)},
							{8,SkillExpFunc(5000,1.21,8,3,1)},
							{9,SkillExpFunc(5000,1.22,9,3,1)},
							{10,SkillExpFunc(5000,1.23,10,3,1)},
							{11,SkillExpFunc(5000,1.24,11,3,1)},
							{12,SkillExpFunc(5000,1.23,12,3,1)},
							{13,SkillExpFunc(5000,1.22,13,3,1)},
							{14,SkillExpFunc(5000,1.21,14,3,1)},
							{15,SkillExpFunc(5000,1.20,15,3,1)},
							{16,SkillExpFunc(5000,1.19,16,3,1)},
							{17,SkillExpFunc(5000,1.18,17,3,1)},
							{18,SkillExpFunc(5000,1.17,18,3,1)},
							{19,SkillExpFunc(5000,1.16,19,3,1)},
							{20,SkillExpFunc(5000,1.15,20,3,1)},
							{21,SkillExpFunc(5000,1.15,21,3,1)},
							{22,SkillExpFunc(5000,1.15,22,3,1)},
							{23,SkillExpFunc(5000,1.15,23,3,1)},
							{24,SkillExpFunc(5000,1.15,24,3,1)},
							{25,SkillExpFunc(5000,1.15,25,3,1)},
						}},
		skill_startevent={
			[1]={{1,1},{25,1}},
			[3]={{1,329},{25,329}}, -- SkillId 329 co san tu truoc (yuquan_xichen, emei.lua) - KHONG dinh nghia lai
		},
		skill_flyevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1231},{25,1231}}, -- kich hoat SkillId 1231 (110 3 Kiem (2)) khi bay
		},
		skill_collideevent={
			[1]={{1,1},{10,1},{10,1},{25,1}},
			[3]={{1,1232},{25,1232}}, -- kich hoat SkillId 1232 (110 3 Kiem (3)) khi va cham
		},
		skill_showevent={{{1,5},{10,5},{10,7},{25,7}}}, -- start+collide=5 tu lv1 ; +fly=7 tu lv11
	},

	bakiem110_2={ -- 110 3 Kiem (2) [SkillId 1231] - NGOAI CONG, ky nang phu 
		seriesdamage_p={{{1,15},{20,45},{21,50},{25,50}}}, -- van <=55%
		physicsenhance_p={{{1,14},{15,60},{20,128},{25,134}}},
		colddamage_v={ -- Bang sat ngoai cong
			[1]={{1,3},{15,26},{20,56},{25,63}},
			[3]={{1,3},{15,26},{20,56},{25,63}},
		},
		skill_attackradius={{{1,512},{25,512}}},
		skill_cost_v={{{1,0},{25,0}}},
		skill_misslenum_v={{{1,1},{19,1},{20,3},{25,3}}}, -- khop ChildSkillNum=3 (missile 458)
		deadlystrike_p={{{1,4},{20,14},{25,25}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
	},

	bakiem110_3={ -- 110 3 Kiem (3) [SkillId 1232] - NGOAI CONG, no tai cho khi va cham
		seriesdamage_p={{{1,15},{20,40},{21,45},{25,45}}}, -- van <=55%
		physicsenhance_p={{{1,10},{15,44},{20,95},{25,107}}},
		colddamage_v={ -- Bang sat ngoai cong
			[1]={{1,5},{15,38},{20,82},{25,92}},
			[3]={{1,5},{15,38},{20,82},{25,92}},
		},
		skill_attackradius={{{1,512},{25,512}}},
		skill_cost_v={{{1,0},{25,0}}},
		skill_misslenum_v={{{1,1},{25,1}}}, -- khop ChildSkillNum=1 (missile 459)
		deadlystrike_p={{{1,3},{20,11},{25,13}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
	},

	-- ===== "110 3 TIEN (2)" : ket thuc chuoi bat dau tu 1235 (o thuyyen.lua) =====
	
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


-----------------------------------------------
--����2���㣬��2���κ���f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--��x1����x2 < 0 ,y =0
--��x2=x1, ��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac


-----------------------------------------------
--����2���㣬��-2���κ���f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--��x2����x1<0, y=0,
--��x1=x2,��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac


-----------------------------------------------
--���������:Link(x,points)
--����points�ṩ��һϵ�е㣬�����ڵ��������������
--return yֵ
--x ����ֵ
--points �㼯��
--���磺points������{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}��ӳ��


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


