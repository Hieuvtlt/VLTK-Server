-- [20/09/2026] Choi mot minh khong co to doi -> Msg2Team khong toi, bao thang cho nguoi choi.
function PAN_Bao(szMsg)
	if (GetTeamSize() < 1) then Msg2Player(szMsg); else Msg2Team(szMsg); end;
end;

Include("\\script\\sukien_nam\\thang4\\head.lua");

function isPanMaster(nNpcIdx, ntask)
	-- [20/09/2026] Khong con doi to doi 2 nguoi khac gioi.
	-- Chi can: nguoi thao tac LA chu bep, hoac chu bep dang o cung to voi ho.
	local nMaster = GetNpcParam(nNpcIdx, PRM_PAN_PLAYID);
	if (nMaster < 0) then nMaster = nMaster + 4294967296; end;

	if (FileName2Id(GetName()) == nMaster) then return 1; end;

	local nteam = GetTeamSize();
	if (nteam < 1) then return 0; end;
	local oldPlayer = PlayerIndex;
	local bM = 0;
	for i = 1, nteam do
		PlayerIndex = GetTeamMember(i);
		if (FileName2Id(GetName()) == nMaster) then bM = 1; end;
	end;
	PlayerIndex = oldPlayer;
	return bM;
end;

function main()
	local nNpcIdx = GetLastDiagNpc();
	if (isPanMaster(nNpcIdx) == 1) then
		local nparam2 = GetNpcParam(nNpcIdx, PRM_PAN_EVENT);
		local nevent,nstate,nphase,task = GetByte(nparam2, 1),GetByte(nparam2, 2),GetByte(nparam2, 3),GetByte(nparam2, 4);
		
		if (nphase == 4) then
			local nCurTime = GetCurServerTime();
			local nmyTime = GetNpcParam(nNpcIdx, PRM_PAN_TIME);
			if (nmyTime > nCurTime) then
				Msg2Player("§ang lÊy b¸nh ra, xin ®îi trong gi©y l¸t!");
				return 0;
			end;

			local nparam4 = GetNpcParam(nNpcIdx, PRM_PAN_POINT)
			local pure, norm, bud = getPANCount(nNpcIdx);
			if (nparam4 > 0 and nmyTime == 0) then
				local szmsg = "";
				if (pure > 0) then szmsg = format("<color=yellow>%d c¸i<color> B¸nh chay ®Æc biÖt, ",pure); end;
				if (norm > 0) then szmsg = format("%s <color=yellow>%d c¸i<color> B¸nh chay th­êng, ",szmsg, norm); end;
				if (bud > 0) then szmsg = format("%s <color=yellow>%d c¸i<color> B¸nh chay ch­a chÝn, ",szmsg, bud); end;
				szmsg = format(DEC_PAN_EVENT[5], szmsg);
				Say(szmsg, 2, "LÊy b¸nh ra/#sure2pickpan("..nNpcIdx..")", "L¸t n÷a quay l¹i /OnCancel");
			elseif (nmyTime <= nCurTime) then
				local nItem = 0;
				if (pure > 0) then
					pure = pure - 1;
					SetNpcParam(nNpcIdx, PRM_PAN_POINT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_POINT),1,pure));
					nItem = AddItem(unpack(TB_PAN_COOKIESPROP[1]));
				elseif (norm > 0) then
					norm = norm - 1;
					SetNpcParam(nNpcIdx, PRM_PAN_POINT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_POINT),2,norm));
					nItem = AddItem(unpack(TB_PAN_COOKIESPROP[2]));
				elseif (bud > 0) then
					bud = bud - 1;
					SetNpcParam(nNpcIdx, PRM_PAN_POINT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_POINT),3,bud));
					nItem = AddItem(unpack(TB_PAN_COOKIESPROP[3]));
				else
					Talk(1, "", DEC_PAN_OTHER[random(getn(DEC_PAN_OTHER))]);
					return 0;
				end;
				Msg2Player("B¹n nhËn ®­îc mét "..GetItemName(nItem));
				SetNpcParam(nNpcIdx, PRM_PAN_TIME, 0);
			end;
		else
			if (task >= 1 and task <= 4) then
				if (nstate == 0) then Say(DEC_PAN_EVENT[task], 1, "Ta biÕt råi/#sure2pantaketask("..nNpcIdx..")");
				elseif (nstate == 1) then Say("", 2, format("%s/#sure2pandotask(%d)",DEC_PAN_STASK[task], nNpcIdx), "H·y ®îi mät chót/OnCancel");
				elseif (nstate == 2) then Talk(1, "", DEC_PAN_OTHER[random(getn(DEC_PAN_OTHER))]); end;
			else Talk(1, "", DEC_PAN_OTHER[random(getn(DEC_PAN_OTHER))]); end;
		end;
	else Talk(1, "", DEC_PAN_OTHER[random(getn(DEC_PAN_OTHER))]); end;
end;

function sure2pickpan(nNpcIdx)
	if (isPanMaster(nNpcIdx) ~= 1) then return 0; end;
	if (GetNpcParam(nNpcIdx, PRM_PAN_POINT) > 0) then
		SetNpcParam(nNpcIdx, PRM_PAN_TIME, GetCurServerTime()+3);
		Msg2Player("§îi 3 gi©y sau mçi cã thÓ vît b¸nh ra.");
	else
		Talk(1, "", DEC_PAN_OTHER[random(getn(DEC_PAN_OTHER))]);
		Msg2Player("B¸nh ®· vît ra hÕt råi!");
	end;
end;

function sure2pantaketask(nNpcIdx)
	if (isPanMaster(nNpcIdx) ~= 1) then return 0; end;
	local nparam2 = GetNpcParam(nNpcIdx, PRM_PAN_EVENT);
	local _,nstate,_,task = GetByte(nparam2, 1),GetByte(nparam2, 2),GetByte(nparam2, 3),GetByte(nparam2, 4);
	if (task >= 1 and task <= 4 and nstate == 0) then
		SetNpcParam(nNpcIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_EVENT), 2, 1));
		AddNpcSkillState(nNpcIdx, 662, 1,1, 0);
		-- Thay d?i hi?u ?ng skill kh?p v?i 10 giây/nh?p
		AddNpcSkillState(nNpcIdx, 765, 1,1, 10*18);
		SetNpcParam(nNpcIdx, PRM_PAN_TIME, GetCurServerTime()+TB_PAN_TASKTIME[task]);
		Msg2Player(format("Xin ®îi %s gi©y sau %s.", TB_PAN_TASKTIME[task], DEC_PAN_STASK[task]));
	end;
end;

function sure2pandotask(nNpcIdx)
	if (isPanMaster(nNpcIdx) ~= 1) then return 0; end;
	local nparam2 = GetNpcParam(nNpcIdx, PRM_PAN_EVENT);
	local nparam3 = GetNpcParam(nNpcIdx, PRM_PAN_TIME);
	local _,nstate,_,task = GetByte(nparam2, 1),GetByte(nparam2, 2),GetByte(nparam2, 3),GetByte(nparam2, 4);
	if (task >= 1 and task <= 4 and nstate == 1) then
		local nsex = mod(task, 2);
		-- [20/09/2026] Ai cung lam duoc ca 4 viec, khong phan theo gioi tinh nua.
		if (task >= 1 and task <= 4) then
			calcPANpoint(nNpcIdx, abs(nparam3-GetCurServerTime()));
			SetNpcParam(nNpcIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_EVENT), 2, 0));
			SetNpcParam(nNpcIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_EVENT), 4, 0));
			SetNpcParam(nNpcIdx, PRM_PAN_TIME, 0);
			AddNpcSkillState(nNpcIdx, 765,1, 1, 0);
			Msg2Player("Xin ®a t¹ "..DEC_PAN_STASK[task]);
		else
			Say(format("ChØ cã %s mçi cã thÓ %s ®­îc.", DEC_PAN_STASK[task], DEC_PAN_SZSEX[nsex]), 0);
		end;
	end;
end;

function calcPANpoint(nNpcIdx, nvalue)
	local npoint = 0;
	if (nvalue <= 1) then npoint = 10;
	elseif (nvalue == 2 or nvalue == 3) then npoint = 8;
	elseif (nvalue == 4 or nvalue == 5) then npoint = 7;
	elseif (nvalue >= 6 and nvalue <= 8) then npoint = 6;
	else npoint = 5; end;
	local ncurpoint = GetNpcParam(nNpcIdx, PRM_PAN_POINT);
	PAN_Bao("§iÓm sè lÇn nµy "..npoint);
	PAN_Bao("Tæng ®iÓm nhËn ®­îc "..(ncurpoint+npoint));
	SetNpcParam(nNpcIdx, PRM_PAN_POINT, ncurpoint + npoint);
end;

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0) then DelNpc(nNpcIdx) return 0; end;

	local nparam1 = GetNpcParam(nNpcIdx, PRM_PAN_PLAYID);
	if (nparam1 < 0) then nparam1 = nparam1 + 4294967296; end;
	local nparam2 = GetNpcParam(nNpcIdx, PRM_PAN_EVENT);
	local nevent = GetByte(nparam2, 1);
	local nstate = GetByte(nparam2, 2);
	local nphase = GetByte(nparam2, 3);
	local npoint = GetNpcParam(nNpcIdx, PRM_PAN_POINT);
	
	if (nphase == 4) then
		DelNpc(nNpcIdx);
	else
		nevent = nevent + 1;
		SetNpcParam(nNpcIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_EVENT), 1, nevent));
		if (nevent == 10) then
			nevent = 0; nphase = nphase + 1; nstate = 0;
			local nx, ny = GetNpcPos(nNpcIdx);
			local szname = GetNpcName(nNpcIdx);
			DelNpc(nNpcIdx);
			local nIdx = AddNpc(TB_PAN_NPCID[nphase], 1, SubWorld, nx, ny, 1, szname);
			
			SetNpcScript(nIdx, "\\script\\sukien_nam\\thang4\\pan.lua");
			
			SetNpcParam(nIdx, PRM_PAN_PLAYID, nparam1);
			SetNpcParam(nIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nIdx, PRM_PAN_EVENT), 3, nphase));
			SetNpcParam(nIdx, PRM_PAN_POINT, npoint);
			SetNpcParam(nIdx, PRM_PAN_TIME, 0);
			if (nphase ~= 4) then 
				-- Ch?y 10 giây m?i nh?p (T?ng 10 nh?p = 100 giây cho giai do?n m?i)
				SetNpcTimer(nIdx, 10*18);
			else
				initPANCount(nIdx, npoint);
				-- Giai do?n 4 (Bánh chín): Ch? 15 phút (15 * 60 giây) tru?c khi lò bi?n m?t
				SetNpcTimer(nIdx, 15*60*18);
			end;
		else
			local process = mod(nevent, 3);
			if (process == 1) then startPANTask(nNpcIdx, nphase);
			elseif (process == 2) then
				if (nstate == 0) then endPANTask(nNpcIdx); end;
			elseif (process == 0) then endPANTask(nNpcIdx); end;
			
			-- Ch?y 10 giây m?i nh?p trong giai do?n hi?n t?i
			SetNpcTimer(nNpcIdx, 10*18);
		end;
	end;
end;

function initPANCount(nidx, npoint)
	local total_cakes = random(5, 7) 
	local pure = 0
	local norm = 0
	local bud = 0

	for i = 1, total_cakes do
		local rand = random(1, 100)
		if npoint >= 35 then
			if rand <= 60 then pure = pure + 1
			elseif rand <= 90 then norm = norm + 1
			else bud = bud + 1 end
		elseif npoint >= 28 then 
			if rand <= 20 then pure = pure + 1
			elseif rand <= 70 then norm = norm + 1
			else bud = bud + 1 end
		else 
			if rand <= 5 then pure = pure + 1
			elseif rand <= 30 then norm = norm + 1
			else bud = bud + 1 end
		end
	end
	
	SetNpcParam(nidx, PRM_PAN_POINT, 0);
	SetNpcParam(nidx, PRM_PAN_POINT, SetByte(GetNpcParam(nidx, PRM_PAN_POINT), 1, pure));
	SetNpcParam(nidx, PRM_PAN_POINT, SetByte(GetNpcParam(nidx, PRM_PAN_POINT), 2, norm));
	SetNpcParam(nidx, PRM_PAN_POINT, SetByte(GetNpcParam(nidx, PRM_PAN_POINT), 3, bud));
end;

function getPANCount(nidx)
	local nparam4 = GetNpcParam(nidx, PRM_PAN_POINT)
	return GetByte(nparam4, 1),GetByte(nparam4, 2),GetByte(nparam4, 3)
end;

function startPANTask(nNpcIdx, nphase)
	local task = random(1, TB_PAN_TASK[nphase]);
	SetNpcParam(nNpcIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_EVENT), 4, task));
	-- Thay d?i hi?u ?ng skill vòng l?p kh?p v?i 10 giây
	AddNpcSkillState(nNpcIdx, 662,1, 1, 10*18);
end;

function endPANTask(nNpcIdx)
	AddNpcSkillState(nNpcIdx, 662,1, 1, 0);
	AddNpcSkillState(nNpcIdx, 765,1, 1, 0);
	SetNpcParam(nNpcIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_EVENT), 2, 0));
	SetNpcParam(nNpcIdx, PRM_PAN_EVENT, SetByte(GetNpcParam(nNpcIdx, PRM_PAN_EVENT), 4, 0));
	SetNpcParam(nNpcIdx, PRM_PAN_TIME, 0);
end;

function OnCancel() end;
function OnTimeOut(nNpcIdx, nTimeOut) DelNpc(nNpcIdx) end;