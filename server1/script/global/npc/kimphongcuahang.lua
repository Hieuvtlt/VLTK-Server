Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	local szTitle = "<npc>§å hoµng kim xŞn xß cho cuéc hµnh tr×nh míi cña thiÕu hiÖp, quÑo lùa nha!"
	local tbOpt = {}
	tinsert(tbOpt, {"Giao dŞch", yes})
	tinsert(tbOpt, {"§Ó ta ®i lÊy tiÒn !"})
	CreateNewSayEx(szTitle, tbOpt);
	Sale(183)
end

function yes()
	Sale(183)
end
