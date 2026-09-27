Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

function main()
dofile("script/global/pgaming/item/traitao.lua");
local partnerindex,partnerstate = PARTNER_GetCurPartner()      
PARTNER_AddExp(partnerindex,40000,1)
return 0
end
