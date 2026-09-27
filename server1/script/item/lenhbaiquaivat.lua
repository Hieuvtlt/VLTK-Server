-- LÖnh Bµi Qu¸i VËt Script
-- Recreated for VLTK OFFLINE SIM CITY with features identical to VLTK OFFLINE 1
IncludeLib("NPCINFO")

function main(nItemIndex)
    if GetFightState() == 0 then
        Msg2Player("Kh«ng thÓ sö dông vËt phÈm nµy t¹i khu vùc an toµn.")
        return 1
    end
    
    local szMsg = "B¹n cã muèn t¹o qu¸i kh«ng?"
    Say(szMsg, 3,
        "T¹o b·i qu¸i/meltaobai",
        "Xãa b·i qu¸i/melxoabai",
        "KÕt thóc ®èi tho¹i/DoNothing"
    )
    return 1
end

function DoNothing()
end

-- T¹o B·i Qu¸i
function meltaobai()
    local tbNpcList = GetAroundNpcList(60)
    local pW, pX, pY = GetWorldPos()
    local tmpFound = {}
    local nNpcIdx
    for i = 1, getn(tbNpcList) do
        nNpcIdx = tbNpcList[i]
        local nSettingIdx = GetNpcSettingIdx(nNpcIdx)
        local name = GetNpcName(nNpcIdx)
        local level = NPCINFO_GetLevel(nNpcIdx)
        local kind = GetNpcKind(nNpcIdx)
        if nSettingIdx > 0 and kind == 0 then
            tinsert(tmpFound, {nSettingIdx, name, level})
        end
    end
    local total = getn(tmpFound)
    if total == 0 then
        Msg2Player("Kh«ng t×m thÊy qu¸i vËt xung quanh ®Ó sao chÐp linh hån.")
        return 0
    end
    
    local j = 0
    while j < 20 do
        local data = tmpFound[random(1, total)]
        local isBoss = 0
        if (j == 10) then
            isBoss = 2
        end
        local nNpcIndex = AddNpcEx(data[1], data[3], random(0, 4), SubWorldID2Idx(pW), (pX + random(-5, 5)) * 32, (pY + random(-5, 5)) * 32, 0, data[2], isBoss)
        if nNpcIndex > 0 then
            j = j + 1
        end
    end
    Msg2Player("§· triÖu håi thµnh c«ng b·i qu¸i.")
    return 0
end

-- Xãa B·i Qu¸i
function melxoabai()
    local tbNpcList = GetAroundNpcList(30)
    local pW, pX, pY = GetWorldPos()
    local tmpFound = {}
    local nNpcIdx
    local count = 0
    for i = 1, getn(tbNpcList) do
        nNpcIdx = tbNpcList[i]
        local kind = GetNpcKind(nNpcIdx)
        local nSettingIdx = GetNpcSettingIdx(nNpcIdx)
        local nNpcType = GetNpcPowerType(nNpcIdx)
        if nSettingIdx > 0 and kind == 0 and nNpcType ~= 3 then
            DelNpc(nNpcIdx)
            count = count + 1
        end
    end
    if count > 0 then
        Msg2Player("§· tiªu hñy qu¸i vËt xung quanh.")
    else
        Msg2Player("Kh«ng t×m thÊy qu¸i vËt cÇn tiªu hñy.")
    end
    return 0
end

function GetDesc(nItemIndex)
    local szDesc = "<color=water>LÊy linh hån qu¸i vËt xung quanh b¹n råi triÖu håi.<color>\n"
    szDesc = szDesc.."<color=water>Qu¸i vËt triÖu håi cã thÓ xãa bá b»ng c¸ch t¸i kÝch ho¹t.<color>\n"
    return szDesc
end
