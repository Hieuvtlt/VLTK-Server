-- Bi kip Vo hoc That Truyen - script VAT PHAM
-- Dat tai: \script\global\thattruyen_book.lua
--
-- Vat pham {6, 1, TT_BOOK_P} - khai bao trong settings/item/magicscript.txt,
-- cot script tro toi chinh file nay.
--
-- Su phu chi TRAO bi kip (thattruyen_head.lua -> tt_do_learn).
-- Doc bi kip moi thuc su duoc skill - va van phai kiem tra lai tuyet ky bon mon,
-- vi nguoi choi co the cat bi kip roi doc rat lau ve sau.
--
-- Quy uoc tra ve cua script vat pham (theo mau lv120skillbook.lua):
--   return 0 -> dung thanh cong, engine TIEU vat pham
--   return 1 -> khong dung duoc, GIU nguyen vat pham

Include("\\script\\global\\thattruyen_head.lua")

function main(idxItem)

	local nFaction = GetLastFactionNumber()

	if (nFaction < 0) or (nFaction > 9) then
		Msg2Player("<color=yellow>Ch­a gia nhËp m«n ph¸i th× kh«ng ®äc næi bİ kİp nµy.<color>")
		return 1
	end

	-- KHOA: phai co "Bac Minh tam phap" trong hanh trang moi luyen duoc.
	-- Kiem TRUOC khi trao bat cu skill nao, va GIU nguyen bi kip (return 1).
	if (CalcItemCount(3, 6, 1, TT_KEY_P, -1) < 1) then
		Say("Cuèn bİ kİp chØ cã <color=yellow>khÈu quyÕt<color>, nh­ng hoµn toµn kh«ng cã <color=yellow>t©m ph¸p<color> vËn khİ."
			.."<enter>BiÕt c¸ch ra chiªu nh­ng kh«ng biÕt vËn c«ng."
			.."<enter>BiÕt c¸ch dÉn khİ nh­ng kh«ng biÕt khİ ph¶i ®i ®©u."
			.."<enter>BiÕt vâ chiªu nh­ng kh«ng thÓ sinh ra néi lùc t­¬ng øng."
			.."<enter>Cµng cè luyÖn, kinh m¹ch cµng ®au ®ín.",
			1, "KÕt thóc/tt_book_quit")
		return 1
	end

	local tList = TT_SKILL_LIST[nFaction]
	local nLearned, nAlready, nLack = 0, 0, 0
	local szLearned = ""

	for i = 1, getn(tList) do
		local nTT     = tList[i][1]
		local nOrigin = tList[i][2]

		if (HaveMagic(nTT) ~= -1) then
			nAlready = nAlready + 1
		elseif (HaveMagic(nOrigin) >= TT_ORIGIN_MAXLEVEL) then
			AddMagic(nTT, TT_SKILL_LEVEL)
			nLearned = nLearned + 1
			szLearned = szLearned.." "..nTT
		else
			nLack = nLack + 1
		end
	end

	-- Khong hoc duoc gi -> GIU lai bi kip, giai thich ro ly do
	if (nLearned == 0) then
		if (nAlready >= getn(tList)) then
			Msg2Player("<color=yellow>Ng­¬i ®· lÜnh héi trän vÑn bé vâ häc thÊt truyÒn råi.<color>")
		else
			Msg2Player("<color=yellow>TuyÖt kü bæn m«n ch­a luyÖn ®Õn cÊp "
				..TT_ORIGIN_MAXLEVEL..", ch­a thÓ lÜnh héi. Bİ kİp vÉn cßn nguyªn.<color>")
		end
		return 1
	end

	WriteLog(GetLocalDate("%Y-%m-%d %X").."\t[ThatTruyen-DocBiKip]\tAccount:"..GetAccount()
		.."\tName:"..GetName().."\tFaction:"..nFaction
		.."\tHoc:"..nLearned.."\tSkillId:"..szLearned
		.."\tDaCo:"..nAlready.."\tConThieuGoc:"..nLack)

	Msg2Player("<color=yellow>Ng­¬i ®· lÜnh héi "..nLearned
		.." m«n vâ häc thÊt truyÒn cña bæn m«n!<color>")

	-- Con mon chua mo khoa thi bao de nguoi choi khong tuong bi kip bi mat oan
	if (nLack > 0) then
		Msg2Player("<color=red>Cßn "..nLack
			.." m«n ch­a lÜnh héi ®­îc v× tuyÖt kü bæn m«n ch­a luyÖn thµnh."
			.." H·y xin s­ phô bİ kİp míi sau khi luyÖn xong.<color>")
	end

	Say("Hai cuèn bİ kİp ®Æt c¹nh nhau.§iÒu kú l¹ x¶y ra,nh÷ng c©u ch÷ t­ëng nh­ hoµn toµn kh«ng liªn quan b¾t ®Çu bæ sung cho nhau."
		.."<enter>KhÈu quyÕt cña cuèn thø nhÊt... L¹i chİnh lµ nh÷ng \"®iÓm khuyÕt\" mµ t©m ph¸p cña cuèn thø hai cã thÓ lÊp  ®Çy."
		.."<enter>Mét cuèn lµ th©n ... Mét cuèn lµ t©m !"
		.."<enter>Chóng vèn ®­îc sinh ra ®Ó kÕt hîp víi nhau."
		.."<enter>Ng­¬i kh«ng hÒ häc mét vâ c«ng cã s½n."
		.."<enter><color=yellow>Ng­¬i ®ang t¹o ra mét vâ c«ng míi tõ hai thø vâ häc  vèn kh«ng hoµn chØnh.<color>",
		1, "./tt_book_quit")

	return 0

end

function tt_book_quit()
end
