-- »ªÉ½ÅÉ¼ýÍ·¶Ô»°½Å±¾

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\thattruyen_getall.lua")

function jt_task()
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_jiantou()
	else
		Talk(1,"","Nghe nãi Vâ L©m TruyÒn Kú cã nhiÖm vô Hoµng Kim, §Ö tö Hoa S¬n ph¸i ®· xuèng nói lµm nhiÖm vô, sau nµy ng­¬i h·y quay l¹i!");
	end
end

-- Menu bao ngoai: giu nguyen nhanh nhiem vu goc (jt_task)
function main()
	Say("Ta la Tien Dau cua Hoa Son phai. Nguoi can gi?", 5,
		"Nhiem vu Hoa Son/jt_task",
		"Nhan tat ca skill That Truyen - cap 1/tt_getall_lv1",
		"Nhan tat ca skill That Truyen - cap 25/tt_getall_lv25",
		"Huy toan bo skill That Truyen/tt_delall_confirm",
		"Ket thuc doi thoai/tt_getall_quit")
end
