IncludeLib("SETTING") -- G?i thu vi?n h? th?ng gi?ng file Tiên Th?o L?[cite: 4]

-- =======================================================
-- HÀM T? Ð?NG G?I KHI NGU?I CHOI M?C NG?A VÀO NGU?I (F2)
-- =======================================================
function OnEquip()
   local nItemIndex = GetCurItem()
    local szHorseName = GetItemName(nItemIndex)
    
    -- DÒNG B?Y L?I S? 1: B?t game ph?i lên ti?ng
    Msg2Player("Script ngua da chay! Ten game doc duoc la: " .. szHorseName)

    -- (Ph?n code if - elseif c?a b?n c? gi? nguyên ? du?i dây)
    -- if szHorseName == "T VÐn §šp TuyÕt" then...
end