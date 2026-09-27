-- C¸c hµm nhËn ®iÓm


IncludeLib("SETTING")
Include("\\script\\lib\\award.lua");
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua");

TAB_DATHUOCTINH = {
{szName="Khæng T­íc Nguyªn Th¹ch (Kim)", tbProp={6,1,150,1,0,0,0}, nWidth=2, nHeight=3},
{szName="Khæng T­íc Nguyªn Th¹ch (Méc)", tbProp={6,1,150,1,1,0,0}, nWidth=2, nHeight=3},
{szName="Khæng T­íc Nguyªn Th¹ch (Thñy)", tbProp={6,1,150,1,2,0,0}, nWidth=2, nHeight=3},
{szName="Khæng T­íc Nguyªn Th¹ch (Háa)", tbProp={6,1,150,1,3,0,0}, nWidth=2, nHeight=3},
{szName="Khæng T­íc Nguyªn Th¹ch (Thæ)", tbProp={6,1,150,1,4,0,0}, nWidth=2, nHeight=3},
{szName="Phï Dung Nguyªn Th¹ch (Kim)", tbProp={6,1,152,1,0,0,0}, nWidth=2, nHeight=3},
{szName="Phï Dung Nguyªn Th¹ch (Méc)", tbProp={6,1,152,1,1,0,0}, nWidth=2, nHeight=3},
{szName="Phï Dung Nguyªn Th¹ch (Thñy)", tbProp={6,1,152,1,2,0,0}, nWidth=2, nHeight=3},
{szName="Phï Dung Nguyªn Th¹ch (Háa)", tbProp={6,1,152,1,3,0,0}, nWidth=2, nHeight=3},
{szName="Phï Dung Nguyªn Th¹ch (Thæ)", tbProp={6,1,152,1,4,0,0}, nWidth=2, nHeight=3},
{szName="Chung Nhò Nguyªn Th¹ch (Kim)", tbProp={6,1,154,1,0,0,0}, nWidth=2, nHeight=3},
{szName="Chung Nhò Nguyªn Th¹ch (Méc)", tbProp={6,1,154,1,1,0,0}, nWidth=2, nHeight=3},
{szName="Chung Nhò Nguyªn Th¹ch (Thñy)", tbProp={6,1,154,1,2,0,0}, nWidth=2, nHeight=3},
{szName="Chung Nhò Nguyªn Th¹ch (Háa)", tbProp={6,1,154,1,3,0,0}, nWidth=2, nHeight=3},
{szName="Chung Nhò Nguyªn Th¹ch (Thæ)", tbProp={6,1,154,1,4,0,0}, nWidth=2, nHeight=3},
};

function DaChuaThuocTinh()
	local tbDaThuocTinh = TAB_DATHUOCTINH;
	AddItemByTable("Mêi b¹n chän lo¹i ®¸:", tbDaThuocTinh)
end

-- pEventType:Reg("TÝnh n¨ng thö nghiÖm", "Thó c­ìi", ThuCuoi);
-- pEventType:Reg("LÖnh bµi T©n Thñ", "Thó c­ìi", ThuCuoi);