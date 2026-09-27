---------Chinh vat pham-----------
TaskExpCauCa	= 3019
TaskDateCauCa 	= 3020
MaxExpMoiNgay 	=  25000000
GccPos = 		{{54464,99072},};

tbAWard=
{
	[4799]={szName = "§iÓm kinh nghiÖm", nExp_tl=90000000},	
	[4800]={szName = "§iÓm kinh nghiÖm", nExp_tl=95000000},	
	[4801]={szName = "§iÓm kinh nghiÖm", nExp_tl=100000000},	
	[4802]={szName = "§iÓm kinh nghiÖm", nExp_tl=110000000},	
	[4803]={szName = "§iÓm kinh nghiÖm", nExp_tl=120000000},	
	[4804]={szName = "§iÓm kinh nghiÖm", nExp_tl=130000000},	
	[4805]={szName = "§iÓm kinh nghiÖm", nExp_tl=300000000},

}
ItemAwardNT_cathuong1 = {
	{szName="QuÕ Hoa Töu",tbProp={6,1,125,1,0,0},nCount=1,nRate=50},
	{szName="Phóc Duyªn Lé (§¹i)",tbProp={6,1,124,1,0,0},nCount=1,nRate=30},
	{szName="Tiªn Th¶o Lé",tbProp={6,1,71,1,0,0},nCount=1,nRate=30},
	{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=10},
	{szName="Vâ L©m MËt TÞch",tbProp={6,1,26,1,0,0},nCount=1,nRate=2},
	{szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=2},
	{szName="Phi Phong CÊp 7",tbProp={6,1,4769,1,0,0},nCount=1,nRate=1.2},
	{szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=1,nRate=0.21},
	{szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=1,nRate=0.22},
	{szName = "Sö dông L­íi ®¸nh c¸ kh«ng may m¾n",
		pFun = function (nItemCount, szLogTitle)
			Msg2Player("LÇn nµy kh«ng may m¾n")
		end,
		nRate = 100,
	}
}
ItemAwardNT_cathuong2 = {
	{szName="Vâ L©m MËt TÞch",tbProp={6,1,26,1,0,0},nCount=1,nRate=2},
	{szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=2},
	{szName="Phi Phong CÊp 7",tbProp={6,1,4769,1,0,0},nCount=1,nRate=1.2},
	{szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=1,nRate=0.21},
	{szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=1,nRate=0.22},
	{szName = "Sö dông L­íi ®¸nh c¸ kh«ng may m¾n",
		pFun = function (nItemCount, szLogTitle)
			Msg2Player("LÇn nµy kh«ng may m¾n")
		end,
		nRate = 100,
	}
}

ItemAwardNT = {
	{szName="Phi Phong CÊp 7",tbProp={6,1,4769,1,0,0},nCount=1,nRate=65},
	{szName="HuyÒn Tinh",tbProp={6,1,4654,1,0,0},nCount=1,nRate=65},
	{szName="M·nh LÖnh Bµi",tbProp={6,1,4655,1,0,0},nCount=1,nRate=76},
	{szName = "Sö dông L­íi ®¸nh c¸ kh«ng may m¾n",
		pFun = function (nItemCount, szLogTitle)
			Msg2Player("LÇn nµy kh«ng may m¾n")
		end,
		nRate = 100,
	}
}

function CheckGioiHan()
	old_date = GetByte(GetTask(TaskDateCauCa), 1)
	old_month = GetByte(GetTask(TaskDateCauCa), 2)
	old_year = GetByte(GetTask(TaskDateCauCa), 3)

	now_date = tonumber(date("%d"))
	now_month = tonumber(date("%m"))
	now_year = tonumber(date("%y"))

	if old_date == now_date and old_month == now_month and old_year == now_year then
		if GetTask(TaskExpCauCa) > MaxExpMoiNgay then
			Msg2Player("Mâi ngµy chØ sö dông tèi ®a "..MaxExpMoiNgay.." ®iÓm kinh nghiÖm")
			return 1;
		end
	else
		SetTask(TaskDateCauCa, SetByte(GetTask(TaskDateCauCa), 1, now_date))
		SetTask(TaskDateCauCa, SetByte(GetTask(TaskDateCauCa), 2, now_month))
		SetTask(TaskDateCauCa, SetByte(GetTask(TaskDateCauCa), 3, now_year))
		SetTask(TaskExpCauCa,0)
		return 0;
	end
end

function GetNearstPos(X,Y, PosTab)
	PosCount = getn(PosTab);
	PosId = 0;
	MaxDist = 999999999;

	BeyondCount = 0;---gi do

	for i = 1, PosCount do 
		Dist = sqrt( (X-PosTab[i][1]) * (X-PosTab[i][1]) + (Y - PosTab[i][2]) * (Y - PosTab[i][2]))
		if (Dist >= 250) then 
			BeyondCount = BeyondCount + 1;
		end;
		if (i == 1) then 
			PosId = 1
			MaxDist = Dist
		elseif (MaxDist > Dist) then 
			PosId = i
			MaxDist = Dist
		end
	end;

	if (BeyondCount >= PosCount) then
		return 0
	else
		return PosId;
	end;
end