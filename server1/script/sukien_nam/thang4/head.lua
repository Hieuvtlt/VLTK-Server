Include("\\script\\lib\\basic.lua");

PRM_PAN_PLAYID = 1
PRM_PAN_EVENT = 2	
PRM_PAN_TIME = 3		
PRM_PAN_POINT = 4;	

TB_PAN_TASK = {2,3,4}
TB_PAN_NPCID = {1272, 1273, 1274, 1275}; 
TB_PAN_COOKIESPROP = {
	{6,1,1395,1,0,0}, 
	{6,1,1396,1,0,0}, 
	{6,1,1397,1,0,0}, 
}
-- Th?i gian thao tác gi?m xu?ng 8s d? kh?p v?i nh?p s? ki?n 10s
TB_PAN_TASKTIME = {8, 8, 8, 8};

DEC_PAN_SZSEX = {[0]="§¹i hiÖp",[1]="N÷ hiÖp"}
DEC_PAN_STASK = {"§·i vá ®Ëu xanh","Nhµo bét","Bá nh©n vµo b¸nh","Thªm cñi"};
DEC_PAN_EVENT = {
	"BÕp löa nhá: N÷ hiÖp, xin h·y ®îi 8 gi©y sau míi cã thÓ §·i vá ®Ëu xanh!",
	"BÕp löa nhá: §¹i hiÖp, xin h·y ®îi 8 gi©y sau míi cã thÓ Nhµo bét",
	"BÕp löa nhá: NhÞ vÞ, xin h·y ®îi 8 gi©y sau míi cã thÓ Bá nh©n vµo b¸nh.",
	"BÕp löa nhá: NhÞ vÞ, xin h·y ®îi 8 gi©y sau míi cã thÓ Thªm cñi",
	"BÕp löa nhá: B¸nh ®· chÝn råi, tæng céng cã %s xin h·y vít ra.",
};

DEC_PAN_OTHER = {
	"BÕp löa nhá: Ta ®ang ch¸y ®©y!",
	"BÕp löa nhá: Nãng qu¸ ®i mÊt!",
	"BÕp löa nhá: ¤i th«i nãng qu¸!",
	"BÕp löa nhá: N­íc ®· s«i, ®ang bèc h¬i ®Êy!",
};