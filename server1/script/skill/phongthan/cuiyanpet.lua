--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ�������ϵӦ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range
EXP_PER = 10
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end

SKILLS={
	--����
	bingzong_wuying={ --truong cung te
		-- physicsenhance_p={{{1,15},{15,100},{20,146}}},
		physicsenhance_p={{{1,15},{15,350},{20,524}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{15,140},{20,173}},
			[3]={{1,50},{15,200},{20,276}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,0},{20,0}}
		},
		addskilldamage1={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,120}}
		},
		addskilldamage2={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,120}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,336},{2,336}},{{1,EXP_PER},{20,EXP_PER}},{{1,0},{2,0}}},
		skill_misslenum_v={{{1,1},{5,1},{20,1},{21,1}}},
	},
	bingzong_wuying1={ --thien vu te
		-- physicsenhance_p={{{1,15},{15,100},{20,146}}},
		physicsenhance_p={{{1,15},{15,350},{20,524}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{15,140},{20,173}},
			[3]={{1,50},{15,200},{20,276}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,0},{20,0}}
		},
		addskilldamage1={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,120}}
		},
		addskilldamage2={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,120}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,336},{2,336}},{{1,EXP_PER},{20,EXP_PER}},{{1,0},{2,0}}},
		skill_misslenum_v={{{1,1},{5,1},{20,1},{21,1}}},
	},
	bingzong_wuying2={ --lien no te
		-- physicsenhance_p={{{1,15},{15,100},{20,146}}},
		physicsenhance_p={{{1,15},{15,350},{20,524}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{15,140},{20,173}},
			[3]={{1,50},{15,200},{20,276}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,0},{20,0}}
		},
		addskilldamage1={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,120}}
		},
		addskilldamage2={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,120}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,336},{2,336}},{{1,EXP_PER},{20,EXP_PER}},{{1,0},{2,0}}},
		skill_misslenum_v={{{1,8},{5,8},{20,8},{21,8}}},
	},
	bingzong_wuying3={ --hoa loi te
		-- physicsenhance_p={{{1,15},{15,100},{20,146}}},
		physicsenhance_p={{{1,15},{15,350},{20,524}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{15,140},{20,173}},
			[3]={{1,50},{15,200},{20,276}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,0},{20,0}}
		},
		addskilldamage1={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,120}}
		},
		addskilldamage2={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,120}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,336},{2,336}},{{1,EXP_PER},{20,EXP_PER}},{{1,0},{2,0}}},
		skill_misslenum_v={{{1,1},{5,1},{20,1},{21,1}}},
	},
	bingzong_wuying4={ --hoa loi te
		-- physicsenhance_p={{{1,15},{15,100},{20,146}}},
		physicsenhance_p={{{1,15},{15,350},{20,524}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{15,140},{20,173}},
			[3]={{1,50},{15,200},{20,276}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,0},{20,0}}
		},
		addskilldamage1={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,120}}
		},
		addskilldamage2={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,120}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,336},{2,336}},{{1,EXP_PER},{20,EXP_PER}},{{1,0},{2,0}}},
		skill_misslenum_v={{{1,1},{5,1},{20,1},{21,1}}},
	},
	bingzong_wuying5={ --hoa loi te
		-- physicsenhance_p={{{1,15},{15,100},{20,146}}},
		physicsenhance_p={{{1,15},{15,350},{20,524}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{15,140},{20,173}},
			[3]={{1,50},{15,200},{20,276}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,0},{20,0}}
		},
		addskilldamage1={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,120}}
		},
		addskilldamage2={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,120}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,336},{2,336}},{{1,EXP_PER},{20,EXP_PER}},{{1,0},{2,0}}},
		skill_misslenum_v={{{1,1},{5,1},{20,1},{21,1}}},
	},
	bingzong_wuying7={ --hoa loi te
		-- physicsenhance_p={{{1,15},{15,100},{20,146}}},
		physicsenhance_p={{{1,15},{15,350},{20,524}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{15,140},{20,173}},
			[3]={{1,50},{15,200},{20,276}}
		},
		missle_speed_v={{{1,20},{20,24},{21,24}}},
		skill_attackradius={{{1,448},{20,512},{21,512}}},
		skill_cost_v={{{1,40},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,0},{20,0}}
		},
		addskilldamage1={
			[1]={{1,1063},{2,1063}},
			[3]={{1,1},{20,120}}
		},
		addskilldamage2={
			[1]={{1,1064},{2,1064}},
			[3]={{1,1},{20,120}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,336},{2,336}},{{1,EXP_PER},{20,EXP_PER}},{{1,0},{2,0}}},
		skill_misslenum_v={{{1,10},{5,10},{20,10},{21,10}}},
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
--����points�ṩ��һϵ�е㣬��ϵ�ڵ��������������
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
--�����趨��ʽ��Ϣ��
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
--�����������ܡ�������Ԣ����ħ�����Ժ���ֵ
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

