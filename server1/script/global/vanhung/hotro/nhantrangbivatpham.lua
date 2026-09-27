tbPGaming = {};
tbPGaming.nPak = curpack()

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	LÊy vËt phÈm chØ ®Þnh																			--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbPGaming:TakeSpecifiedItem()
	g_AskClientStringEx(GetStringTask(TASKS_GETITEM), 0, 256, "Th«ng sè item:", {self.TakeSpecifiedItemParam, {self}})
end

function tbPGaming:TakeSpecifiedItemParam(szParam)
	if not szParam then
		Talk(1, "", "GM ch­a nhËp th«ng sè cña mét item bÊt kú, vui lßng thö l¹i.")
		return 0
	end
	
	local nType, tbParam = self:GetTypeParam(szParam)
	if (nType == 0) then
		GMMsg2Player("LÊy vËt phÈm chØ ®Þnh", "ThÊt b¹i! Tèi ®a cho phÐp lµ 16 th«ng sè.")
		return 0
	end
	local nIsParam = self:IsParamNumber(tbParam[2])
	if nIsParam ~= 1 then
		GMMsg2Player("LÊy vËt phÈm chØ ®Þnh", "ThÊt b¹i! ChØ sö dông c¸c ký tù sè tõ 0-9 vµ dÊu phÈy “,”.")
		return 0
	end
	
	self:SetCountSpecifiedItem(nType, tbParam)
end

function tbPGaming:SetCountSpecifiedItem(nType, tbParam)
	local tbOptionSelected = {}
	g_AskClientNumberEx(1, 500, "NhËp sè l­îng:", {self.CountSpecifiedItem, {self, {nType, tbParam, tbOptionSelected}}})
end

function tbPGaming:CountSpecifiedItem(tbSpecifiedItem, nCount, nOptionSelected)
	local szTitle = "H·y thiÕt lËp thªm option nÕu muèn.\n\n* Option GM ®· chän:"
	local nIsTable = self:IsOption(tbSpecifiedItem[3], "table")
	if nIsTable then
		for x, y in tbSpecifiedItem[3] do
			szTitle = szTitle..format("\n"..strfill_right("+", 5, " ").." <color=green>%s<color>",y[1])
		end
	end
	
	local tbOpt = {}
		local nBind = self:GetTypeOption(tbSpecifiedItem[3], 1)
		if nBind ~= 1 then
			tinsert(tbOpt, {"+ Thªm option khãa b¶o hiÓm vÜnh viÔn", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 1}})
			tinsert(tbOpt, {"+ Thªm option khãa b¶o hiÓm", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 2}})
		end
		
		local nExpired = self:GetTypeOption(tbSpecifiedItem[3], 2)
		if nExpired ~= 2 then
			tinsert(tbOpt, {"+ Thªm option thêi h¹n sö dông", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 3}})
		end
		
		tinsert(tbOpt, {"§· xong, ta muèn lÊy ngay b©y giê", self.CreateItemSpecified, {self, tbSpecifiedItem, nCount}})
		tinsert(tbOpt, {"Chän l¹i option", self.ReselectOption, {self, tbSpecifiedItem, nCount}})

		tinsert(tbOpt, {"§ãng."})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbPGaming:CreateItemSpecified(tbSpecifiedItem, nCount)
	local GMPlayer = PlayerIndex;
	local szPlayerName = "";
	local szGMName = "";
	if nPlayerIndex then
		PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
	end
	
	local nItemIndex = 0;
	local szItemName = "";
	local tbItem = self:GetParamItem(tbSpecifiedItem)
		for i = 1, nCount do
			nItemIndex = self:NewItemEx(tbItem)
			
			if (nItemIndex <= 0) then
				break
			end
				
			szItemName = GetItemName(nItemIndex)
			
			if (IsItemStackable(nItemIndex) == 1) then
				SetItemStackCount(nItemIndex, 1)
			end
			
			for x, y in tbSpecifiedItem[3] do
				if y[3] == 1 then
					SetItemBindState(nItemIndex, y[2])
				end
				if y[3] == 2 then
					ITEM_SetExpiredTime(nItemIndex,y[2]*24*60)
				end
			end
			
			AddItemByIndex(nItemIndex)
		end
	
	SetStringTask(TASKS_GETITEM, tbSpecifiedItem[2][1])

	if nPlayerIndex then
		PlayerIndex = GMPlayer;
			szGMName = GetName()
			Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i <color=yellow>%s<color> nµy %d %s", szPlayerName, nCount, szItemName))
		PlayerIndex = nPlayerIndex;
			Msg2Player(format("B¹n ®· ®­îc GM <color=yellow>%s<color> tÆng %d %s", szGMName, nCount, szItemName))
		nPlayerIndex = nil;
	else
		Msg2Player(format("B¹n nhËn ®­îc %d %s", nCount, szItemName))
	end
end

function tbPGaming:GetParamItem(tbSpecifiedItem)
	local nType = tbSpecifiedItem[1]
	local tbParam = tbSpecifiedItem[2][2]
	local nVersion, nQuality;
	local nGenre, nDetailType, nParcular, nLevel, nSeries, nMagic;
	local MagicIndex1, MagicIndex2, MagicIndex3, MagicIndex4, MagicIndex5, MagicIndex6;
	
	if (nType == 1) then
		if (getn(tbParam) == 1) then
			nQuality, nDetailType = 1, (tbParam[1] -1)
		elseif (getn(tbParam) == 2) then
			nQuality, nDetailType = tbParam[1], (tbParam[2] -1);
		end
	elseif (nType == 2) then
		nGenre, nDetailType, nParcular, nLevel, nSeries, nMagic = tbParam[1],tbParam[2],tbParam[3],tbParam[4],tbParam[5],tbParam[6];
	elseif (nType == 3) then
		nGenre, nDetailType, nParcular, nLevel, nSeries, nMagic = tbParam[1],tbParam[2],tbParam[3],tbParam[4],tbParam[5],tbParam[6];
		MagicIndex1, MagicIndex2, MagicIndex3, MagicIndex4, MagicIndex5, MagicIndex6 = tbParam[7],tbParam[8],tbParam[9],tbParam[10],tbParam[11],tbParam[12];
	end
	
	return {
		nVersion or 4,
		nQuality or 2,
		nGenre or 0,
		nDetailType or 0,
		nParcular or 0,
		nLevel or 0,
		nSeries or 0,
		nMagic or 0,
		MagicIndex1 or 0,
		MagicIndex2 or 0,
		MagicIndex3 or 0,
		MagicIndex4 or 0,
		MagicIndex5 or 0,
		MagicIndex6 or 0
	}
end

function tbPGaming:NewItemEx(tbItem)
	return NewItemEx(
		tbItem[1],
		0,
		tbItem[2],
		tbItem[3],
		tbItem[4],
		tbItem[5],
		tbItem[6],
		tbItem[7],
		tbItem[8],
		tbItem[9],
		tbItem[10],
		tbItem[11],
		tbItem[12],
		tbItem[13],
		tbItem[14],
		0)
end

function tbPGaming:ReselectOption(tbSpecifiedItem, nCount)
	tbSpecifiedItem[3] = {}
	self:CountSpecifiedItem(tbSpecifiedItem, nCount)
end

function tbPGaming:GetTypeOption(tbOption, nType)
	for x, y in tbOption do
		if tbOption[x][3] == nType then
			return nType
		end
	end
	return 0
end

function tbPGaming:AddOptionInItem(tbSpecifiedItem, nCount, nOptionSelected)
	local tbListOption =
	{
		[1] = {"Khãa b¶o hiÓm vÜnh viÔn", 1},
		[2] = {"Khãa b¶o hiÓm", 1},
		[3] = {"Thêi h¹n sö dông", 2},
	};
	
	if (nOptionSelected == 1) then
		tbSpecifiedItem[3][nOptionSelected] = {tbListOption[nOptionSelected][1], -2, tbListOption[nOptionSelected][2]};
		self:CountSpecifiedItem(tbSpecifiedItem, nCount)
	elseif (nOptionSelected == 2) then
		tbSpecifiedItem[3][nOptionSelected] = {tbListOption[nOptionSelected][1], -1, tbListOption[nOptionSelected][2]};
		self:CountSpecifiedItem(tbSpecifiedItem, nCount)
	elseif (nOptionSelected == 3) then
		self:SetTimeInItem(tbSpecifiedItem, nCount, nOptionSelected, tbListOption[nOptionSelected]);
	end
end

function tbPGaming:SetTimeInItem(tbSpecifiedItem, nCount, nOptionSelected, tbListOption)
	g_AskClientNumberEx(1,999999, "Thêi h¹n sö dông:", {self.SetTimeOptionInItem, {self, tbSpecifiedItem, nCount, nOptionSelected, tbListOption}})
end

function tbPGaming:SetTimeOptionInItem(tbSpecifiedItem, nCount, nOptionSelected, tbListOption, nTimer)
	tbSpecifiedItem[3][nOptionSelected] = {tbListOption[1], nTimer, tbListOption[2]};
	self:CountSpecifiedItem(tbSpecifiedItem, nCount)
end

function tbPGaming:IsOption(tbOpt, nType)
	if (type(tbOpt) == nType) then
		return 1
	else
		return
	end
end

function tbPGaming:GetTypeParam(szParam)
	local nTypeParam = 0;
	local nMaxParam = 16;
	local tbParam = split(szParam)
	if (getn(tbParam) < 3) then
		nTypeParam = 1;
	elseif (getn(tbParam) == 6) then
		nTypeParam = 2;
	elseif (getn(tbParam) > 6) and (getn(tbParam) < 13) then
		nTypeParam = 3;
	-- elseif (getn(tbParam) >= 13) and (getn(tbParam) =< nMaxParam) then
		-- nTypeParam = 4;
	end
	return nTypeParam, {szParam, tbParam};
end

function tbPGaming:IsParamNumber(tbParam)
	for i = 1, getn(tbParam) do
		local IsNumber = tonumber(tbParam[i])
		if not IsNumber then
			return 0;
		end
	end
	return 1;
end
