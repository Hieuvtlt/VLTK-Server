--==Script §æi Giíi TÝnh - TiÕn BÞp - Vâ L©m Néi Bé==--
--==§­îc share miÔn phÝ, nÕu b¹n mua hoÆc tr¶ tiÒn cafe th× b¹n ®· bÞ bÞp==--
function KiemTraDoiGioiTinh()

	local nGia = 300

	if GetLevel() <= 100 then
		Msg2Player("<color=green>ChØ nh©n vËt cÊp trªn 100 míi cã thÓ chuyÓn giíi.")
		return 0
	end

	-- B¾t buéc th¸o hÕt trang bÞ 
	if CalcItemCount(2,0,-1,-1,-1) > 0 then
		Msg2Player("<color=green>H·y th¸o hÕt trang bÞ trªn ng­êi  tr­íc khi sèng víi th©n phËn kh¸c!")
		return 0
	end

	local nSoXu = CalcEquiproomItemCount(4,417,1,-1)

	if nSoXu < nGia then
		Msg2Player("<color=green>Ng­¬i kh«ng ®ñ <color=yellow>300 TiÒn §ång<color> kh«ng thÓ chuyÓn giíi.")
		return 0
	end

	return 1

end


function DoiGioiTinh()

	if KiemTraDoiGioiTinh() ~= 1 then
		return
	end

	if GetSex() == 0 then

		Say(
			"Ng­¬i ®· th¸o hÕt trang bÞ.\n\n"..
			"Chi phÝ chuyÓn giíi: <color=yellow>300 TiÒn §ång<color>.\n\n"..
			"Ng­¬i cã ch¾c muèn chuyÓn giíi sang <color=yellow>N÷ Nh©n<color>?",
			2,
			"§ång ý/#DoiGioiTinh_XacNhan()",
			"Huû/no"
		)

	else

		Say(
			"Ng­¬i ®· th¸o hÕt trang bÞ.\n\n"..
			"Chi phÝ chuyÓn giíi: <color=yellow>300 TiÒn §ång<color>.\n\n"..
			"Ng­¬i cã ch¾c muèn chuyÓn giíi sang <color=yellow>Nam Nh©n<color>?",
			2,
			"§ång ý/#DoiGioiTinh_XacNhan()",
			"Huû/no"
		)

	end

end


function DoiGioiTinh_XacNhan()

	local nGia = 300

	-- Re-check toµn bé ®iÒu kiÖn
	if KiemTraDoiGioiTinh() ~= 1 then
		return
	end

	-- Trõ 300 TiÒn §ång
	if ConsumeEquiproomItem(nGia,4,417,1,-1) ~= 1 then
		Msg2Player("<color=green>Ng­¬i kh«ng cã ®ñ <color=yellow> 300 TiÒn §ång<color>, vui lßng thö l¹i.")
		return
	end

	local nOldSex = GetSex()

	local szOldSex
	local szNewSex

	if nOldSex == 0 then
		szOldSex = "Nam Nh©n"
		szNewSex = "N÷ Nh©n"
		SetSex(1)
	else
		szOldSex = "N÷ Nh©n"
		szNewSex = "Nam Nh©n"
		SetSex(0)
	end

	Msg2SubWorld("§¹o h÷u <color=green>"..GetName().."<color> ®· chuyÓn giíi thµnh c«ng tõ <color=gold>"..szOldSex.."<color> sang <color=gold>"..szNewSex.."<color> !")
	AddGlobalNews("§¹o h÷u <color=green>"..GetName().."<color> ®· chuyÓn giíi thµnh c«ng tõ <color=gold>"..szOldSex.."<color> sang <color=gold>"..szNewSex.."<color> !")
	Msg2Player("<color=yellow>ChuyÓn giíi thµnh c«ng. <enter>Tù ®éng kÕt nèi l¹i.<color>")

	KickOutSelf()

end