Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")

function main()
	CreateTaskSay({"<dec><npc>A Di Da Phat! Nguoi co chac muon su dung Bo De Chuyen Sinh Dan de tien hanh cai lao hoan dong (Trung Sinh)?\nCac yeu cau bat buoc:\n1. Phai thao het trang bi va ngua.\n2. Cap do phai dat yeu cau (TS1: 120+, TS2: 130+, TS3: 140+, TS4: 150+, TS5: 160+).\n3. Khong co nhiem vu chua hoan thanh.",
		"Xac nhan Trung Sinh/xacnhan_trungsinh_item",
		"De ta suy nghi lai/OnCancel"
	})
end

function xacnhan_trungsinh_item()
	-- 1. Check level
	if (check_zhuansheng_level() ~= 1) then
		return
	end
	
	-- 2. Check quests
	if (GetTask(TSK_KILLER_ID) ~= 0 or
		GetTask(TSK_MESSENGER_FENG) ~= 0 or 
		GetTask(TSK_MESSENGER_SHAN) ~= 0 or 
		GetTask(TSK_MESSENGER_QIAN) ~= 0 or
		(GetTask(TSK_TASKLINK_STATE) ~= 3 and GetTask(TSK_TASKLINK_STATE) ~= 0) or
		GetTask(TSK_TASKLINK_CancelTaskLevel) ~= 0 or 
		GetTask(TSK_TASKLINK_CancelTaskExp1) ~= 0 or 
		GetTask(TSK_TASKLINK_CancelTaskExp2) ~= 0) then
		
		CreateTaskSay({"<dec><npc>Nguoi dang lam nhiem vu (Sat Thu, Tin Su, Da Tau...). Hay hoan thanh hoac huy bo nhiem vu truoc khi Trung Sinh.", "Ta se kiem tra lai/OnCancel"})
		return
	end
	
	-- 3. Check inventory space
	if (CalcFreeItemCellCount() < 1) then
		CreateTaskSay({"<dec><npc>Hanh trang cua nguoi da day, can thieu nhat 1 o trong.", "Ta se don dep/OnCancel"})
		return
	end
	
	-- 4. Consume the Bodhi Rebirth Pill (6, 1, 2877)
	if ConsumeItem(3, 1, 6, 1, 2877, -1) ~= 1 then
		CreateTaskSay({"<dec><npc>Khong tim thay Bo De Chuyen Sinh Dan trong hanh trang.", "Biet roi/OnCancel"})
		return
	end
	
	-- 5. Temporarily set flag to bypass quest check if needed by translife.lua
	SetTask(TSK_ZHUANSHENG_FLAG, 1)
	
	-- 6. Call the rebirth logic!
	DynamicExecute("\\script\\global\\translife.lua", "main")
end
