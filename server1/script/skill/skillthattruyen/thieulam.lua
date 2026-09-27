--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/8)
end

SKILLS={
	--������
	jingang_fumo={ --��շ�ħ
		physicsenhance_p={{{1,15},{20,55}}},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,321},{2,321}},
			[3]={{1,1},{20,61}}
		},
		addskilldamage2={
			[1]={{1,319},{2,319}},
			[3]={{1,1},{20,64}}
		},
		addskilldamage3={
			[1]={{1,11},{2,11}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage4={
			[1]={{1,19},{2,19}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage5={
			[1]={{1,1056},{2,1056}},
			[3]={{1,1},{20,54}}
		},
		addskilldamage6={
			[1]={{1,1057},{2,1057}},
			[3]={{1,1},{20,51}}
		},
		missle_speed_v={{{1,18},{20,18}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,54},{20,54}}},
		skill_cost_v={{{1,2},{20,6}}}
	},
	shaolin_gunfa={ --���ֹ���
		addphysicsdamage_p={{{1,25},{20,100}},{{1,-1},{2,-1}},{{1,2},{2,2}}},
		attackratingenhance_p={{{1,35},{20,275}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,6},{20,45,Conic}},{{1,-1},{2,-1}}}
	},
	shaolin_daofa={ --���ֵ���
		addphysicsdamage_p={{{1,25},{20,215}},{{1,-1},{2,-1}},{{1,1},{2,1}}},
		deadlystrikeenhance_p={{{1,5},{20,15,Conic}},{{1,-1},{2,-1}}}
	},
	shaolin_quanfa={ --����ȭ��
		addphysicsdamage_p={{{1,25},{20,415}},{{1,-1},{2,-1}},{{1,9},{2,9}}},
		addphysicsdamage_p={{{1,25},{20,215}},{{1,-1},{2,-1}},{{1,9},{2,9}}},
		attackratingenhance_p={{{1,35},{20,275}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,6},{20,45,Conic}},{{1,-1},{2,-1}}}
	},
	xinglong_buyu={ --��������
		physicsenhance_p={{{1,60},{20,445}}},
		physicsdamage_v={
			[1]={{1,20},{20,220}},
			[3]={{1,20},{20,220}},
		},
		seriesdamage_p={{{1,1},{20,10}}},
		deadlystrike_p={{{1,5},{20,20}}},
		addskilldamage1={
			[1]={{1,318},{2,318}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage2={
			[1]={{1,317},{2,317}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage3={
			[1]={{1,271},{2,271}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage4={
			[1]={{1,272},{2,272}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage5={
			[1]={{1,1083},{2,1083}},
			[3]={{1,1},{20,125}}
		},
		addskilldamage6={
			[1]={{1,1055},{2,1055}},
			[3]={{1,1},{20,125}}
		},
		skill_cost_v={{{1,2},{20,10}}}
	},
	longzhao_huzhua={ --��צ��ץ
		physicsenhance_p={{{1,120},{20,1242}}},
		physicsenhance_p={{{1,120},{20,600}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		ignoredefense_p={{{1,9},{20,85},{21,86}}},
		stun_p={{{1,1},{20,5}},{{1,1},{20,5}}},
		deadlystrike_p={{{1,5},{20,40}}},
		colddamage_v={
			[1]={{1,10},{20,56}},
			[3]={{1,10},{20,56}}
		},
		addskilldamage1={
			[1]={{1,318},{2,318}},
			[3]={{1,1},{20,110},{25,150},{27,161}}
		},
		addskilldamage2={
			[1]={{1,317},{2,317}},
			[3]={{1,1},{20,110},{25,150},{27,161}}
		},
		addskilldamage3={
			[1]={{1,1083},{2,1083}},
			[3]={{1,1},{20,110},{25,125},{27,133}}
		},
		addskilldamage4={
			[1]={{1,1055},{2,1055}},
			[3]={{1,1},{20,110},{25,125},{27,133}}
		},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,1},{20,16}}}
	},
	luohan_zhen={ --�޺���
		addphysicsdamage_p={{{1,11},{20,135}},{{1,18},{2,18}},{{1,6},{2,6}}},
		--meleedamagereturn_p={{{1,0},{29,0},{30,10},{34,10},{35,20},{40,20},{41,20}},{{1,18},{2,18}}},
		--rangedamagereturn_p={{{1,0},{29,0},{30,10},{34,10},{35,20},{40,20},{41,20}},{{1,18},{2,18}}},
		meleedamagereturn_p={{{1,1},{20,20},{30,30}},{{1,18},{2,18}}},--��Ϊ20%�����˺�
		rangedamagereturn_p={{{1,1},{20,20},{30,30}},{{1,18},{2,18}}},
		adddefense_v={{{1,40},{20,800}},{{1,18},{2,18}}},
	},
	budong_mingwang={ --��������
		attackratingenhance_p={{{1,28},{20,275}},{{1,18*120},{20,18*180}}},
		adddefense_v={{{1,15},{20,250}},{{1,18*120},{20,18*180}}},
		skill_cost_v={{{1,10},{20,40}}}
	},
	shizi_hou={ --ʨ�Ӻ�
		stun_p={{{1,15},{20,65},{21,66}},{{1,5},{20,27},{21,28}}},
		physicsdamage_v={
			[1]={{1,45},{20,140}},
			[3]={{1,45},{20,140}}
		},
		skill_cost_v={{{1,10},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
	},
	mohe_wuliang={ --Ħڭ����
		physicsenhance_p={{{1,52},{20,372}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		addskilldamage1={
			[1]={{1,321},{2,321}},
			[3]={{1,1},{20,92/2}}
		},
		addskilldamage2={
			[1]={{1,1057},{2,1057}},
			[3]={{1,1},{20,38}}
		},
		colddamage_v={
			[1]={{1,10},{20,56}},
			[3]={{1,10},{20,56}}
		},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,15},{20,35}}}
	},
	hengsao_liuhe={ --��ɨ����
		physicsenhance_p={{{1,71},{20,417}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		attackrating_p={{{1,12},{20,50}}},
		colddamage_v={
			[1]={{1,10},{20,56}},
			[3]={{1,10},{20,56}}
		},
		deadlystrike_p={{{1,10},{20,30}}},
		addskilldamage1={
			[1]={{1,319},{2,319}},
			[3]={{1,1},{20,96/2}}
		},
		addskilldamage2={
			[1]={{1,1056},{2,1056}},
			[3]={{1,1},{20,40}}
		},
		skill_attackradius={{{1,96},{20,96}}},
		skill_cost_v={{{1,8},{20,8}}}
	},
	yijin_jing={ --�׽
		allres_yan_p={{{1,1},{20,20*0.5}},{{1,-1},{2,-1}}},
		--meleedamagereturn_p={{{1,0},{29,0},{30,5},{34,5},{35,10},{40,10}},{{1,-1},{2,-1}}},	--���ٽ�ս��Զ�̵Ĺ�����������25%���ٵ�15% 20160919
		--rangedamagereturn_p={{{1,0},{29,0},{30,5},{34,5},{35,10},{40,10}},{{1,-1},{2,-1}}},
		meleedamagereturn_p={{{1,1},{20,20},{25,25},{30,30}},{{1,-1},{2,-1}}},
		rangedamagereturn_p={{{1,1},{20,20},{25,25},{30,30}},{{1,-1},{2,-1}}},		
		lifemax_yan_p={{{1,21},{35,150},{36,150}},{{1,-1},{30,-1}}},
		lifemax_p={{{1,3},{20,80},{21,80}},{{1,18*120},{20,18*360},{21,18*360}}},
		anti_block_rate={{{1,1},{30,30},{31,30}},{{1,-1},{30,-1}}},
	},
	rulai_qianye={ --����ǧҶ
		addphysicsdamage_p={{{1,65},{30,215}},{{1,18*120},{30,18*360}},{{1,6},{2,6}}},
		--lifemax_p={{{1,3},{30,80}},{{1,18*120},{30,18*360}}},
		addcolddamage_v={{{1,10},{30,215}},{{1,18*120},{30,18*360}}},
		coldenhance_p={{{1,1},{30,50},{31,50}},{{1,18*120},{30,18*360}}},
		deadlystrikeenhance_p={{{1,5},{30,15}},{{1,18*120},{30,18*360}}},
		attackspeed_v={{{1,35},{30,65},{35,70},{36,82},{37,96},{38,98},{39,100},{40,101},{41,102},{42,103},{43,104},{44,105},{45,106},{46,107},{47,108}},{{1,18*120},{30,18*360}}},
		--lifemax_yan_p={{{1,21},{35,150},{36,150}},{{1,-1},{30,-1}}},
		me2wooddamage_p={{{1,1},{30,20},{31,20}},{{1,-1},{2,-1}}},--��ľϵ�˺����ӣ�15%
		wood2medamage_p={{{1,1},{30,20},{31,20}},{{1,-1},{2,-1}}},--��������ľϵ���˺���15%
		skill_cost_v={{{1,15},{30,45}}},
		fastwalkrun_p={{{1,1},{50,50},{51,50}},{{1,-1},{2,-1}}},
		do_hurt_p={{{1,0},{39,0},{40,15},{41,15}},{{1,-1},{2,-1}}},
		anti_hitrecover={{{1,0},{39,0},{40,20},{41,20}},{{1,-1},{2,-1}}},
	},
	damo_dujiang={ --��Ħ�ɽ�
		physicsenhance_p={{{1,55},{15,345},{20,615}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		ignoredefense_p={{{1,9},{20,90},{21,94},{22,98},{23,99},{24,99},}},
		skill_cost_v={{{1,15},{20,35}}},
		colddamage_v={
			[1]={{1,10},{20,155}},
			[3]={{1,10},{20,155}}
		},
		deadlystrike_p={{{1,5},{20,40}}},
		addskillexp1={{{1,318},{2,318}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6312,1.15,1,2,1)},
							{2,SkillExpFunc(6312,1.15,2,2,1)},
							{3,SkillExpFunc(6312,1.16,3,2,1)},
							{4,SkillExpFunc(6312,1.17,4,2,1)},
							{5,SkillExpFunc(6312,1.18,5,2,1)},
							{6,SkillExpFunc(6312,1.19,6,2,1)},
							{7,SkillExpFunc(6312,1.20,7,2,1)},
							{8,SkillExpFunc(6312,1.21,8,2,1)},
							{9,SkillExpFunc(6312,1.22,9,2,1)},
							{10,SkillExpFunc(6312,1.23,10,2,1)},
							{11,SkillExpFunc(6312,1.24,11,2,1)},
							{12,SkillExpFunc(6312,1.23,12,2,1)},
							{13,SkillExpFunc(6312,1.22,13,2,1)},
							{14,SkillExpFunc(6312,1.21,14,2,1)},
							{15,SkillExpFunc(6312,1.20,15,2,1)},
							{16,SkillExpFunc(6312,1.19,16,2,1)},
							{17,SkillExpFunc(6312,1.18,17,2,1)},
							{18,SkillExpFunc(6312,1.17,18,2,1)},
							{19,SkillExpFunc(6312,1.16,19,2,1)},
							{20,SkillExpFunc(6312,1.15,20,2,1)},
							}},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,90},{20,90}}},
		addskilldamage1={
			[1]={{1,1083},{2,1083}},
			[3]={{1,10},{20,50}}
		},
		addskilldamage2={
			[1]={{1,1055},{2,1055}},
			[3]={{1,10},{20,50}}
		},
	},
	
	quanshaolin150={ --ȭ����150
		physicsenhance_p={{{1,70},{15,490},{20,840},{23,1245},{26,1455}}},	--ÿ��������5%�����˺� 20160801
		--physicsenhance_p={{{1,65},{15,415},{20,740},{23,1130},{26,1325}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		ignoredefense_p={{{1,9},{20,90},{21,94},{22,98},{23,99},{24,99},}},
		skill_cost_v={{{1,18},{20,42},{23,49}}},
		colddamage_v={
			[1]={{1,12},{20,185},{23,239},{26,266}},
			[3]={{1,12},{20,185},{23,239},{26,266}}
		},
		anti_block_rate={{{1,3},{20,10},{21,10}},{{1,-1},{2,-1}}},--ÿ�����Ӻ��Ը񵲸���0.5% 20141014
		stun_p={{{1,1.5},{20,20},{35,35},{36,35}},{{1,5},{20,5},{21,6}}},	--ÿ������0.5%ѣ�μ��� 20160801
		--stun_p={{{1,1},{20,8},{21,10},{22,10}},{{1,5},{20,5},{21,6}}},
		deadlystrike_p={{{1,6.5},{20,55},{23,68.5},{26,76}}},	--ÿ������0.5�������� 20160801
		--deadlystrike_p={{{1,6},{20,45},{23,57},{26,63}}},
		missle_speed_v={{{1,30},{20,32},{21,32}}},
		missle_lifetime_v={{{1,10},{20,10}}},
		do_stun_p={{{1,1},{35,35},{36,35}}},
		skill_attackradius={{{1,320},{20,320}}},
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
	hengsao_qianjun={ --��ɨǧ��
	physicsenhance_p={{{1,10},{15,150},{20,353},{30,1800}}},
	seriesdamage_p={{{1,20},{15,20},{20,60},{21,62},{30,90}}},
	skill_cost_v={{{1,15},{20,20},{30,25}}},
	attackrating_p={{{1,45},{20,412},{30,600}}},
	deadlystrike_p={{{1,10},{20,30},{30,50}}},
	colddamage_v={
		[1]={{1,10},{20,114},{30,460}},
		[3]={{1,10},{20,114},{30,460}}
	},
	addskilldamage1={
		[1]={{1,1056},{2,1056},{30,1600}},
		[3]={{1,1},{20,20},{30,30}}
	},
	skill_attackradius={{{1,128},{20,128},{30,128}}},
	addskillexp1={{{1,0},{2,0}},{{1,1},{20,1},{30,1}},{{1,0},{2,0}}},
	skill_skillexp_v={
		{	{1,SkillExpFunc(5070,1.15,1,3,1)},
			{2,SkillExpFunc(5070,1.15,2,3,1)},
			{3,SkillExpFunc(5070,1.16,3,3,1)},
			{4,SkillExpFunc(5070,1.17,4,3,1)},
			{5,SkillExpFunc(5070,1.18,5,3,1)},
			{6,SkillExpFunc(5070,1.19,6,3,1)},
			{7,SkillExpFunc(5070,1.20,7,3,1)},
			{8,SkillExpFunc(5070,1.21,8,3,1)},
			{9,SkillExpFunc(5070,1.22,9,3,1)},
			{10,SkillExpFunc(5070,1.23,10,3,1)},
			{11,SkillExpFunc(5070,1.24,11,3,1)},
			{12,SkillExpFunc(5070,1.23,12,3,1)},
			{13,SkillExpFunc(5070,1.22,13,3,1)},
			{14,SkillExpFunc(5070,1.21,14,3,1)},
			{15,SkillExpFunc(5070,1.20,15,3,1)},
			{16,SkillExpFunc(5070,1.21,16,3,1)},
			{17,SkillExpFunc(5070,1.18,17,3,1)},
			{18,SkillExpFunc(5070,1.17,18,3,1)},
			{19,SkillExpFunc(5070,1.16,19,3,1)},
			{20,SkillExpFunc(5070,1.15,20,3,1)},
			{21,SkillExpFunc(5070,1.14,21,3,1)},
			{22,SkillExpFunc(5070,1.13,22,3,1)},
			{23,SkillExpFunc(5070,1.12,23,3,1)},
			{24,SkillExpFunc(5070,1.11,24,3,1)},
			{25,SkillExpFunc(5070,1.10,25,3,1)},
			{26,SkillExpFunc(5070,1.09,26,3,1)},
			{27,SkillExpFunc(5070,1.08,27,3,1)},
			{28,SkillExpFunc(5070,1.07,28,3,1)},
			{29,SkillExpFunc(5070,1.06,29,3,1)},
			{30,SkillExpFunc(5070,1.15,30,3,1)},
		},
	},
},

	gunshaolin150={ --������150	--Τ������
		physicsenhance_p={{{1,10},{27,1350},{30,1800},{31,1850}}},	--ÿһ������15%����ɱ�� 2016.08.01
		--physicsenhance_p={{{1,12},{15,180},{20,425},{23,719},{26,866}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		skill_cost_v={{{1,18},{20,25},{23,27}}},
		attackrating_p={{{1,65},{20,595},{23,762},{26,846}}},
		deadlystrike_p={{{1,30},{20,55},{30,76},{40,95}}},	--20����������55%��30����ÿ����1.9% 2016.09.27
		colddamage_v={
			[1]={{1,11},{20,220},{50,550},{51,550}},
			[3]={{1,11},{20,220},{50,550},{51,550}},
		},
		anti_block_rate={{{1,3},{20,10},{21,10}},{{1,-1},{2,-1}}},--ÿ�����Ӻ��Ը񵲸���0.5% 20141014
		skill_attackradius={{{1,180},{20,180}}},	--���ܷ�Χ��128��Ϊ180 2016.08.01
		missle_missrate={{{1,99},{20,50}}},
		skill_desc=
			function(level)
				local szRate = format(floor(100 -Link(level,SKILLS.gunshaolin150.missle_missrate[1])))
				return format("Th�m c�ch th?hai <color=blue> Vi �� H?Ph�p <color> l�y t?l?<color=orange>%s%%<color> t�o th�nh s�t th��ng k?��ch\n", szRate)
			end,
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,1},{20,1}},
			[3]={{1,1201},{20,1201}}
		},
		skill_showevent={{{1,1},{20,1}}},
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
	wuxiang_zhan={ --����ն
	physicsenhance_p={{{1,45},{15,150},{20,333},{30,1800}}},
	seriesdamage_p={{{1,20},{15,20},{20,60},{21,62},{30,90}}},
	colddamage_v={
		[1]={{1,10},{20,111},{30,560}},
		[3]={{1,10},{20,111},{30,560}}
	},
	skill_cost_v={{{1,15},{20,45},{30,60}}},
	addskilldamage1={
		[1]={{1,1057},{2,1057},{30,1600}},
		[3]={{1,1},{20,18},{30,30}}
	},
	addskillexp1={{{1,0},{2,0}},{{1,1},{20,1},{30,1}},{{1,0},{2,0}}},
	skill_skillexp_v={
		{
			{1,SkillExpFunc(5070,1.15,1,3,1)},
			{2,SkillExpFunc(5070,1.15,2,3,1)},
			{3,SkillExpFunc(5070,1.16,3,3,1)},
			{4,SkillExpFunc(5070,1.17,4,3,1)},
			{5,SkillExpFunc(5070,1.18,5,3,1)},
			{6,SkillExpFunc(5070,1.19,6,3,1)},
			{7,SkillExpFunc(5070,1.20,7,3,1)},
			{8,SkillExpFunc(5070,1.21,8,3,1)},
			{9,SkillExpFunc(5070,1.22,9,3,1)},
			{10,SkillExpFunc(5070,1.23,10,3,1)},
			{11,SkillExpFunc(5070,1.24,11,3,1)},
			{12,SkillExpFunc(5070,1.23,12,3,1)},
			{13,SkillExpFunc(5070,1.22,13,3,1)},
			{14,SkillExpFunc(5070,1.21,14,3,1)},
			{15,SkillExpFunc(5070,1.20,15,3,1)},
			{16,SkillExpFunc(5070,1.21,16,3,1)},
			{17,SkillExpFunc(5070,1.18,17,3,1)},
			{18,SkillExpFunc(5070,1.17,18,3,1)},
			{19,SkillExpFunc(5070,1.16,19,3,1)},
			{20,SkillExpFunc(5070,1.15,20,3,1)},
			{21,SkillExpFunc(5070,1.14,21,3,1)},
			{22,SkillExpFunc(5070,1.13,22,3,1)},
			{23,SkillExpFunc(5070,1.12,23,3,1)},
			{24,SkillExpFunc(5070,1.11,24,3,1)},
			{25,SkillExpFunc(5070,1.10,25,3,1)},
			{26,SkillExpFunc(5070,1.09,26,3,1)},
			{27,SkillExpFunc(5070,1.08,27,3,1)},
			{28,SkillExpFunc(5070,1.07,28,3,1)},
			{29,SkillExpFunc(5070,1.06,29,3,1)},
			{30,SkillExpFunc(5070,1.15,30,3,1)},
		},
	},
	missle_speed_v={{{1,28},{20,32},{30,36}}},
	skill_attackradius={{{1,448},{20,512},{30,576}}},
},
	daoshaolin150={ --������150
		physicsenhance_p={{{1,55},{15,180},{20,400},{23,664},{26,796},{30,1256},{31,1320}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		colddamage_v={
			[1]={{1,12},{20,240},{50,600},{51,600}},
			[3]={{1,12},{20,240},{50,600},{51,600}},
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1085},{20,1085}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{15,1}}},
		skill_cost_v={{{1,18},{20,55},{23,66},{26,72}}},
		missle_speed_v={{{1,32},{20,36},{23,38},{30,38}}},
		skill_attackradius={{{1,448},{20,512}}},
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
	dachengrulaizhou={ --���������
		poisondamagereturn_p={{{1,5},{15,40},{20,45},{21,45}},{{1,-1},{2,-1}}},
		returnskill_p={{{1,5},{20,80},{21,80}},{{1,-1},{2,-1}}},
		autoreplyskill={{{1,20 * 256 + 1},{20,20 * 256 + 20},{21,20*256 + 21}},{{1,-1},{2,-1}},{{1,10*18*256 + 0},{25,4*18*256 + 0},{26,5*18*256 + 5},{31,5*18*256 + 10},{32,5*18*256 + 10}}},
		skill_skillexp_v={{	{1,17851239},
							{2,19487603},
							{3,22760330},
							{4,27669421},
							{5,34214875},
							{6,42396694},
							{7,52214875},
							{8,63669421},
							{9,76760330},
							{10,91487603},
							{11,107851239},
							{12,135669421},
							{13,174942148},
							{14,225669421},
							{15,274418181},
							{16,344618181},
							{17,425738181},
							{18,517778181},
							{19,620738181},
							{20,620738181},
							}},	
	},

	-- ################################################################
	-- ### BO KY NANG 110 (SkillId 1245,1246,1247,1255,1256)        ###
	-- ### Them moi - toan bo noi dung phia tren giu nguyen goc.     ###
	-- ### CharClass=1 (Kim) + IsPhysical=1 (ngoai cong) cho tat ca. ###
	-- ### -> KHONG dung physicsdamage_v (ham he Kim chi danh cho    ###
	-- ###    ky nang noi cong). Dung physicsenhance_p, va gan kem   ###
	-- ###    colddamage_v ("Bang sat ngoai cong") dung nhu cac ban  ###
	-- ###    goc damo_dujiang / hengsao_qianjun van lam.            ###
	-- ### Tham khao ban goc trong shaolin.lua: damo_dujiang         ###
	-- ### (SkillId 318), hengsao_qianjun (SkillId 319); va          ###
	-- ### yindao_sheyue (SkillId 340, tangmen.lua).                 ###
	-- ################################################################

	-- ===== "DAT MA DO GIANG" : 1245 (nen) + 1246 (chinh) + 1247 (skill tang) =====
	-- MisslesForm=12: 1245 la SKILL NEN, ChildSkillId cua no tro toi SkillId
	-- 1246 chu khong phai missile. 1246 moi la SKILL CHINH (ban missile 469).
	--
	-- LUU Y - CAP NAY LA NGOAI LE so voi cac cap form=12 khac: theo yeu cau,
	-- SkillId 1246 KHONG dung chung bang voi 1245 ma co bang RIENG
	-- (damodugiang110_2) mang nguyen thong so cua bang "daotianwang150" ben
	-- tianwang.lua - noi ma skills.txt live dang tro SkillId 1246 toi. Nho tach
	-- rieng bang nen 1246 co the khai skill_startevent -> 1247 an toan.
	--   1245 -> damodugiang110      (bang duoi day)
	--   1246 -> damodugiang110_2    (chuyen tu tianwang.lua)
	--   1247 -> damodugiang110_3
	damodugiang110={ -- SkillId 1245 (SKILL NEN, MisslesForm=12)
		physicsenhance_p={{{1,45},{10,131},{11,240},{15,310},{20,645},{25,742}}},
		colddamage_v={ 
		    [1]={{1,10},{20,155}},
			[3]={{1,10},{20,155}}
		},
		seriesdamage_p={{{1,40},{15,40},{20,55},{21,55},{25,55}}}, -- da ha tu 80/82 ve 55%
		deadlystrike_p={{{1,5},{20,30},{25,50}}}, -- goc: {23,37},{26,41}
		attackrating_p={{{1,35},{20,215},{25,286}}}, -- goc: {23,271},{26,300}
--		missle_speed_v={{{1,34},{25,34}}}, -- giu nguyen goc
--		missle_lifetime_v={{{1,7},{25,7}}}, -- giu nguyen goc
		skill_attackradius={{{1,170},{25,170}}}, -- giu nguyen goc (skills.txt ghi 170, .lua thang)
		skill_cost_v={{{1,20},{20,35},{25,40}}}, -- goc: {23,39}
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,1245},{2,1245}},{{1,1},{25,1}},{{1,0},{2,0}}}, -- kinh nghiem ve SKILL NEN 1245
		skill_skillexp_v={{	{1,SkillExpFunc(6312,1.15,1,2,1)},
							{2,SkillExpFunc(6312,1.15,2,2,1)},
							{3,SkillExpFunc(6312,1.16,3,2,1)},
							{4,SkillExpFunc(6312,1.17,4,2,1)},
							{5,SkillExpFunc(6312,1.18,5,2,1)},
							{6,SkillExpFunc(6312,1.19,6,2,1)},
							{7,SkillExpFunc(6312,1.20,7,2,1)},
							{8,SkillExpFunc(6312,1.21,8,2,1)},
							{9,SkillExpFunc(6312,1.22,9,2,1)},
							{10,SkillExpFunc(6312,1.23,10,2,1)},
							{11,SkillExpFunc(6312,1.24,11,2,1)},
							{12,SkillExpFunc(6312,1.23,12,2,1)},
							{13,SkillExpFunc(6312,1.22,13,2,1)},
							{14,SkillExpFunc(6312,1.21,14,2,1)},
							{15,SkillExpFunc(6312,1.20,15,2,1)},
							{16,SkillExpFunc(6312,1.19,16,2,1)},
							{17,SkillExpFunc(6312,1.18,17,2,1)},
							{18,SkillExpFunc(6312,1.17,18,2,1)},
							{19,SkillExpFunc(6312,1.16,19,2,1)},
							{20,SkillExpFunc(6312,1.15,20,2,1)},
							{21,SkillExpFunc(6312,1.15,21,2,1)},
							{22,SkillExpFunc(6312,1.15,22,2,1)},
							{23,SkillExpFunc(6312,1.15,23,2,1)},
							{24,SkillExpFunc(6312,1.15,24,2,1)},
							{25,SkillExpFunc(6312,1.15,25,2,1)},
						}},
	},

	
	damodugiang110_2={ -- Dat Ma Do Giang (2) [SkillId 1246] - SKILL CHINH (ban missile 469)
		physicsenhance_p={{{1,45},{10,131},{11,240},{15,310},{20,645},{25,1012}}},
		colddamage_v={ 
		    [1]={{1,10},{20,155}},
			[3]={{1,10},{20,155}}
		},
		seriesdamage_p={{{1,40},{15,40},{20,55},{21,55},{25,55}}}, -- da ha tu 80/82 ve 55%
		deadlystrike_p={{{1,5},{20,30},{25,50}}}, -- goc: {23,37},{26,41}
		attackrating_p={{{1,35},{20,215},{25,286}}}, -- goc: {23,271},{26,300}
--		missle_speed_v={{{1,34},{25,34}}}, -- giu nguyen goc
--		missle_lifetime_v={{{1,7},{25,7}}}, -- giu nguyen goc
		skill_attackradius={{{1,170},{25,170}}}, -- giu nguyen goc (skills.txt ghi 170, .lua thang)
		skill_cost_v={{{1,20},{20,35},{25,40}}}, -- goc: {23,39}
		skill_eventskilllevel={{{1,1},{25,25}}},
		skill_startevent={ --  tang 3 (SkillId 1247) 
			[1]={{1,0},{10,0},{10,1},{20,1}}, 
			[3]={{1,1247},{25,1247}}, 
		},
		skill_showevent={{{1,0},{10,0},{10,1},{25,1}}}, -- giu nguyen goc
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
	},

	damodugiang110_3={ -- Dat Ma Do Giang (3) [SkillId 1247] 
		seriesdamage_p={{{1,15},{20,45},{21,50},{25,50}}}, -- van <=55%
		physicsenhance_p={{{1,22},{15,130},{20,240},{25,270}}}, --
		colddamage_v={ -- 
		    [1]={{1,10},{20,155}},
			[3]={{1,10},{20,155}}
		},
		skill_attackradius={{{1,170},{25,170}}},
--		missle_speed_v={{{1,34},{25,34}}}, -- giu nguyen goc
--		missle_lifetime_v={{{1,7},{25,7}}}, -- giu nguyen goc	
		skill_cost_v={{{1,0},{25,0}}}, -- ky nang phu duoc goi tu 1246, khong tru them chi phi
--		skill_misslenum_v={{{1,1},{25,1}}}, -- khop ChildSkillNum=1 (missile 470)
		deadlystrike_p={{{1,4},{20,16},{25,19}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
	},

	-- ===== "NGAN DAO XA NGUYET TRAM (1)" : va cham -> 340 (co san) =====
	ngandaoxnt110={ -- Ngan Dao Xa Nguyet Tram (1) [SkillId 1255] - NGOAI CONG
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		-- ==== CAN BANG (da sua lai 25/08/2026) ====
		-- BAN GOC DUNG LA "wuxiang_zhan" = Vo Tuong Tram (SkillId 321, shaolin.lua).
		-- Khop hoan toan: cung MissleId=136, MisslesForm=1, ChildSkillNum=2,
		-- CharClass=1, IsPhysical=1, cung icon Vo_Tuong.
		-- (Ghi chu cu ghi nham ban goc la "yindao_sheyue" 340. 340 KHONG phai ban goc
		--  ma la TANG VA CHAM cua chinh 1255, duoc goi qua skill_collideevent.)
		--
		-- Goc 321 @lv20 : physicsenhance_p=333, colddamage_v=111 (phang), 2 dan
		--                 -> tong 666 vat ly / 222 bang
		-- TT 1255 @lv25 : physEnh 480/dan x2 = 960 ; cold 125-138/dan x2 = 250-276
		--                 -> HE SO THUC x1.44 vat ly, x1.13-1.24 bang
		--                 (chua tinh phan tang va cham 340 cong them)
		--
		-- NGUYEN TAC: so MAX-LEVEL voi MAX-LEVEL - goc cap 20 vs TT cap 25. Moc cuoi
		-- dat o cap 20, cap 21-25 do Link() ngoai suy tuyen tinh.
		-- colddamage_v CO san trong ban goc 321 (=111 phang); o day de 101/111.
		physicsenhance_p={{{1,45},{15,150},{20,315}}},
		colddamage_v={
			[1]={{1,10},{20,101}},
			[3]={{1,10},{20,111}}
		},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,44},{25,45}}},
		missle_speed_v={{{1,28},{20,34}}},
		skill_misslenum_v={{{1,2},{10,2},{25,2}}}, -- khop ChildSkillNum=2 (missile 136 co san)
--		attackrating_p={{{1,50},{20,430},{25,490}}}, -- chinh xac, theo mach ban goc Thieu Lam
		deadlystrike_p={{{1,7},{20,26},{25,26}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6100,1.15,1,3,1)},
							{2,SkillExpFunc(6100,1.15,2,3,1)},
							{3,SkillExpFunc(6100,1.16,3,3,1)},
							{4,SkillExpFunc(6100,1.17,4,3,1)},
							{5,SkillExpFunc(6100,1.18,5,3,1)},
							{6,SkillExpFunc(6100,1.19,6,3,1)},
							{7,SkillExpFunc(6100,1.20,7,3,1)},
							{8,SkillExpFunc(6100,1.21,8,3,1)},
							{9,SkillExpFunc(6100,1.22,9,3,1)},
							{10,SkillExpFunc(6100,1.23,10,3,1)},
							{11,SkillExpFunc(6100,1.24,11,3,1)},
							{12,SkillExpFunc(6100,1.23,12,3,1)},
							{13,SkillExpFunc(6100,1.22,13,3,1)},
							{14,SkillExpFunc(6100,1.21,14,3,1)},
							{15,SkillExpFunc(6100,1.20,15,3,1)},
							{16,SkillExpFunc(6100,1.19,16,3,1)},
							{17,SkillExpFunc(6100,1.18,17,3,1)},
							{18,SkillExpFunc(6100,1.17,18,3,1)},
							{19,SkillExpFunc(6100,1.16,19,3,1)},
							{20,SkillExpFunc(6100,1.15,20,3,1)},
							{21,SkillExpFunc(6100,1.15,21,3,1)},
							{22,SkillExpFunc(6100,1.15,22,3,1)},
							{23,SkillExpFunc(6100,1.15,23,3,1)},
							{24,SkillExpFunc(6100,1.15,24,3,1)},
							{25,SkillExpFunc(6100,1.15,25,3,1)},
						}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{25,1}},
			[3]={{1,340},{25,340}}, -- SkillId 340 co san tu truoc (yindao_sheyue, tangmen.lua) - KHONG dinh nghia lai
		},
		skill_showevent={{{1,0},{10,0},{10,4},{25,4}}}, -- collide(4) tu lv11
	},

	-- ===== "HOANH TAO THIEN QUAN (1)" : don don tai cho, tam rat gan =====
	hoanhtaotq110={ -- Hoanh Tao Thien Quan (1) [SkillId 1256] - NGOAI CONG
		seriesdamage_p={{{1,20},{20,50},{21,55},{25,55}}}, -- Ngu hanh tuong khac, gioi han 55%
		-- CAN BANG: 2.5 lan ban goc "hengsao_qianjun" (SkillId 319, shaolin.lua).
		-- Goc cap 20: physicsenhance_p=353, colddamage_v=114. N=1 (chi 1 dan).
		--   physicsenhance_p : 353 x 2.5 / 1 = 883
		--   colddamage_v     : 114 x 2.5 / 1 = 285
		-- Moc cuoi dat o cap 20, cap 21-25 do Link() ngoai suy tuyen tinh.
		physicsenhance_p={{{1,14},{15,181},{20,370}}},
		colddamage_v={ -- Bang sat ngoai cong - giu dung y do ban goc hengsao_qianjun
			[1]={{1,9},{15,130},{20,168}},
			[3]={{1,9},{15,130},{20,168}},
		},
		skill_attackradius={{{1,128},{20,128}}}, -- tam rat gan, DoHurt=100 nen sat thuong don
		skill_cost_v={{{1,15},{20,20}}},
		skill_misslenum_v={{{1,1},{25,1}}}, -- khop ChildSkillNum=1 (missile 475)
		attackrating_p={{{1,55},{20,500},{25,570}}}, -- chinh xac, theo ban goc hengsao_qianjun
		deadlystrike_p={{{1,10},{20,10},{25,10}}},
		skill_eventskilllevel={{{1,1},{25,25}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{25,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5070,1.15,1,3,1)},
							{2,SkillExpFunc(5070,1.15,2,3,1)},
							{3,SkillExpFunc(5070,1.16,3,3,1)},
							{4,SkillExpFunc(5070,1.17,4,3,1)},
							{5,SkillExpFunc(5070,1.18,5,3,1)},
							{6,SkillExpFunc(5070,1.19,6,3,1)},
							{7,SkillExpFunc(5070,1.20,7,3,1)},
							{8,SkillExpFunc(5070,1.21,8,3,1)},
							{9,SkillExpFunc(5070,1.22,9,3,1)},
							{10,SkillExpFunc(5070,1.23,10,3,1)},
							{11,SkillExpFunc(5070,1.24,11,3,1)},
							{12,SkillExpFunc(5070,1.23,12,3,1)},
							{13,SkillExpFunc(5070,1.22,13,3,1)},
							{14,SkillExpFunc(5070,1.21,14,3,1)},
							{15,SkillExpFunc(5070,1.20,15,3,1)},
							{16,SkillExpFunc(5070,1.19,16,3,1)},
							{17,SkillExpFunc(5070,1.18,17,3,1)},
							{18,SkillExpFunc(5070,1.17,18,3,1)},
							{19,SkillExpFunc(5070,1.16,19,3,1)},
							{20,SkillExpFunc(5070,1.15,20,3,1)},
							{21,SkillExpFunc(5070,1.15,21,3,1)},
							{22,SkillExpFunc(5070,1.15,22,3,1)},
							{23,SkillExpFunc(5070,1.15,23,3,1)},
							{24,SkillExpFunc(5070,1.15,24,3,1)},
							{25,SkillExpFunc(5070,1.15,25,3,1)},
						}},
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

