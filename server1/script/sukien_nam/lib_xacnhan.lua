-- [23/09/2026] Bang xac nhan dieu kien truoc khi nhap so luong.
-- Dung lai tbActivityCompose:GetMaterialList cua script/lib/composeex.lua
-- de bang hien ra giong het Phu Quy Cam Hap: ten nguyen lieu + (dang co/can),
-- xanh la du, do la thieu.
Include("\\script\\lib\\composeex.lua")

-- Nho ham xu ly theo tung nguoi choi (khong dung closure vi engine la Lua 4)
SKN_XN_HANDLER = SKN_XN_HANDLER or {}

-- szTitle    : ten viec lam, hien o dau bang
-- tbMaterial : { {szName=.., tbProp={..}, nCount=N}, ... }  hoac  {szName=.., nJxb=gia_bac}
-- szHandler  : TEN ham xu ly, dang chuoi (AskClientForNumber can chuoi)
function SKN_XacNhan(szTitle, tbMaterial, szHandler)
	SKN_XN_HANDLER[PlayerIndex] = szHandler
	local pCompose = tbActivityCompose:new({tbMaterial = tbMaterial}, szTitle)
	local szMsg = format("%s yªu cÇu: <enter>%s", szTitle, pCompose:GetMaterialList(tbMaterial))
	local tbOpt = {
		{"X¸c nhËn", SKN_XN_NhapSo},
		{"Hñy bá"},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function SKN_XN_NhapSo()
	local szH = SKN_XN_HANDLER[PlayerIndex]
	if not szH then return end
	SKN_XN_HANDLER[PlayerIndex] = nil
	AskClientForNumber(szH, 1, 999, "NhËp sè l­îng muèn lµm:")
end
