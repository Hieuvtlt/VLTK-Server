Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")

function main()
	CreateTaskSay({"<dec><npc>A Di Da Phat. Ban tang la Tao Dia Tang o Thieu Lam Tu, nay du ngoan qua Ba Lang Huyen de giup do chu vi anh hung cai lao hoan dong (Trung Sinh). Nguoi tim ta co viec gi?",
		"Ta muon Trung Sinh nhan vat/beidou_translife_main",
		"Mua Bo De Chuyen Sinh Dan (Gia: 10000 van)/mua_putizhuanshengdan",
		"Kiem tra ky nang trung sinh 4/querySkillPoint_4",
		"Tay diem ky nang trung sinh 4/wantClearSkillPoint_4",
		"Chi la di ngang qua thoi/OnCancel"
	})
end

function mua_putizhuanshengdan()
	if GetCash() < 100000000 then
		CreateTaskSay({"<dec><npc>Hanh trang cua nguoi khong co du 10000 van luong tien mat de mua linh duoc.", "Ta se chuan bi lai/OnCancel"})
		return
	end
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"<dec><npc>Hanh trang cua nguoi da day. Hay don dep it nhat 1 o trong de nhan linh duoc.", "De ta don dep/OnCancel"})
		return
	end
	Pay(100000000)
	AddItem(6, 1, 2877, 1, 0, 0, 0)
	Msg2Player("Nhan duoc 1 Bo De Chuyen Sinh Dan.")
	CreateTaskSay({"<dec><npc>Giao dich thanh cong! Nguoi nhan duoc 1 Bo De Chuyen Sinh Dan.", "Cam on dai su/OnCancel"})
end
