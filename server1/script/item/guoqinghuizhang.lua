--π˙«Èª’’¬
--by –°¿À∂‡∂‡
--2007-08-8
TASK_EXP = 1832;					--æ≠—È±‰¡ø£¨◊Ó∂‡4E,≤ªµ˛º”
TASK_TOP_EXP = 400000000;	--◊Ó∂‡ø…µ√æ≠—È
TASK_GET_EXP = 2091945;		--“ª¥ŒªÒµ√æ≠—È
TASK_LEVEL = 50						--µ»º∂œﬁ÷∆
TASK_DATE_END = 07092324-- π”√Ωÿ÷¡ ±º‰
function main(sel)
	nDate = tonumber(GetLocalDate("%y%m%d%H"))
	--if TASK_DATE_END < nDate then
	--	Talk(1,"","ThÀt Æ∏ng ti’c, vÀt ph»m nµy Æ∑ qu∏ hπn sˆ dÙng.")
	--	return 0
	--end
	if GetLevel() < TASK_LEVEL then
		Talk(1,"","Chÿ c„ ng≠Íi ch¨i c p tı 50 trÎ l™n mÌi c„ th” sˆ dÙng huy ch≠¨ng QuËc Kh∏nh.")
		return 1
	end

	-- Su kien 12 thang: ghi nhan moc su dung (NPC doc GetTask(5823))
	-- Reset dau moi thang: marker luu YYYYMM nen sang nam van reset dung.
	-- (khong dung task 5794 cua script su kien vi no chi luu so thang)
	TSK_QK_MARKER = 5900
	local nYearMonth = tonumber(GetLocalDate("%Y%m"))
	if GetTask(TSK_QK_MARKER) ~= nYearMonth then
		SetTask(TSK_QK_MARKER, nYearMonth)
		SetTask(5823, 0)	-- bo dem huy chuong da dung
		SetTask(5821, 0)	-- co da nhan Moc 1
		SetTask(5820, 0)	-- co da nhan Moc 2
		SetTask(5819, 0)	-- co da nhan Moc 3
	end

	TSK_HUYCHUONG_QK = 5823
	GIOIHAN_HUYCHUONG_QK = 2000
	if GetTask(TSK_HUYCHUONG_QK) >= GIOIHAN_HUYCHUONG_QK then
		Say("MÁi Nh©n VÀt Chÿ Sˆ DÙng TËi ßa "..GIOIHAN_HUYCHUONG_QK.." Huy ch≠¨ng quËc kh∏nh Trong SuËt ThÍi Gian Hoπt ßÈng",0)
		return 1
	end
	local nexp = GetTask(TASK_EXP);
	local addexp = TASK_GET_EXP;
	if nexp >= TASK_TOP_EXP then
		Talk(1,"","Chÿ c„ th” nhÀn Æ≠Óc tËi Æa 400 tri÷u Æi”m kinh nghi÷m!!!")
		return 1
	end
	
	if nexp + addexp > TASK_TOP_EXP then
		addexp = TASK_TOP_EXP - nexp ;
		SetTask(TASK_EXP,TASK_TOP_EXP);
	else
		SetTask(TASK_EXP,tonumber(nexp+addexp));
	end
	
	AddOwnExp(addexp);
	SetTask(TSK_HUYCHUONG_QK, GetTask(TSK_HUYCHUONG_QK) + 1)
	Msg2Player(format("Bπn nhÀn Æ≠Óc %d Æi”m kinh nghi÷m.",addexp));
	WriteLog(format("[GuoQingHuiZhang]\t Date:%s\t Account:%s\t Name:%s\t Effect:GetExp %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),addexp));
		
end