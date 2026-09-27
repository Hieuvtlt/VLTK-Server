Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	local szTitle = "<npc>Muèn s¨n Boss cã ®å xŞn, §¹i HiÖp kh«ng thÓ kh«ng ghĞ cöa hµng cña tiÓu muéi, hihi!"
	local tbOpt = {}
	tinsert(tbOpt, {"Giao dŞch", yes})
	tinsert(tbOpt, {"§Ó ta ®i lÊy tiÒn !"})
	CreateNewSayEx(szTitle, tbOpt);
	Sale(182)
end

function yes()
	Sale(182)
end
