-- ploidai.lua  (ASCII, khong dau)  -- MO RONG he bot SimCity, khong sua gi cua engine
-- "Loi dai ti vo Cong Binh Tu" - phien ban DAU VOI BOT MINH TO DOI:
-- Reversible:
--   * BOTDUEL_ENABLED = 0  -> tat (cong o Cong Binh Tu tra ve luong goc nguoi-vs-nguoi).
--   * Xoa dong Include o head.lua + 1 dong hook o bwmanager.lua (OnRegister).

-- CANH BAO: BOTDUEL_ENABLED CO Y KHONG duoc dinh nghia o day - control.lua la
-- NOI DUY NHAT dat (engine Include = "dinh nghia dau tien thang", global da co khong bi ghi de).
-- Khong co control.lua => BOTDUEL_ENABLED = nil => cac check "~= 1" coi nhu TAT (luong goc nguoi-vs-nguoi).
BW_MISSIONID_DUEL = 4

BotDuel = {
    arenaMap   = 209,
    ownerPos   = { 1620, 3202 },
    botPos     = { 1612, 3187 },
    ownerCamp  = 2,
    botCamp    = 3,
    maxTicks   = 200,
    active     = {},
    botToOwner = {},
    prepTicks  = 6,
}

if SimCityWorld and SimCityWorld.New then
    SimCityWorld:New({
        worldId   = 209,
        name      = "Dien Vo Truong",
        firstNode = { 1610, 3200 },
        nodes = {
            ["1610_3200"] = { x = 1610, y = 3200, linkedNodes = { "1620_3202", "1612_3187" }, isExact = 0, nodeType = 0, isNearAtraction = 0, isNotPreset = 1 },
            ["1620_3202"] = { x = 1620, y = 3202, linkedNodes = { "1610_3200" }, isExact = 0, nodeType = 0, isNearAtraction = 0, isNotPreset = 1 },
            ["1612_3187"] = { x = 1612, y = 3187, linkedNodes = { "1610_3200" }, isExact = 0, nodeType = 0, isNearAtraction = 0, isNotPreset = 1 },
        },
    })
end

function BotDuel:FindBot(pidx)
    if not pidx or pidx <= 0 then return nil end
    if not SimCitizen or not SimCitizen.fighterList then return nil end
    for id, tb in SimCitizen.fighterList do
        if tb and tb.partyPlayerId == pidx and tb.finalIndex and tb.finalIndex > 0
           and (tb.role == nil or tb.role == "citizen")
           and (tb.children == nil or getn(tb.children) == 0) then
            return id, tb
        end
    end
    return nil
end


function BotDuel:ArenaState()
    if not GetMissionV or not SubWorldID2Idx then return 0 end
    local _oldSW = SubWorld
    SubWorld = SubWorldID2Idx(self.arenaMap)
    local st = GetMissionV(1)
    SubWorld = _oldSW
    return st or 0
end

function BotDuel:ArenaStage()
    if not GetMissionV or not SubWorldID2Idx then return 0 end
    local _oldSW = SubWorld
    SubWorld = SubWorldID2Idx(self.arenaMap)
    local v = GetMissionV(8)
    SubWorld = _oldSW
    return v or 0
end
function BotDuel_TryOffer()
    if BOTDUEL_ENABLED ~= 1 or not BotDuel then return nil end
    if BotDuel:ArenaStage() ~= 0 then
        Say("Cong Binh Tu: Dien vo truong dang co tran dau, xin cho tran sau.", 0)
        return 1
    end
    local id, tb = BotDuel:FindBot(PlayerIndex)
    if not id then return nil end
    if BotDuel.active[PlayerIndex] then
        Say("Cong Binh Tu: Nguoi dang trong tran ti vo roi.", 0)
        return 1
    end
    Say("Cong Binh Tu: Nguoi muon ti vo voi " .. (tb.szName or "ban dong") .. " phai khong? Ta se dua no len Dien Vo Truong.",
        2,
        "Dung vay, vao dau ngay!/#BotDuel_Confirm()",
        "Thoi, de ta suy nghi./OnCancel")
    return 1
end

function BotDuel_Confirm()
    if BotDuel then BotDuel:Start(PlayerIndex) end
end

function BotDuel_OnOwnerDead()
    if BotDuel and BotDuel.OnOwnerDead then BotDuel:OnOwnerDead(PlayerIndex, nil) end
end
function BotDuel:PrepArena(camp)
    local _oldSW = SubWorld
    if SubWorldID2Idx then SubWorld = SubWorldID2Idx(self.arenaMap) end
    if StopMissionTimer then StopMissionTimer(BW_MISSIONID_DUEL, 10); StopMissionTimer(BW_MISSIONID_DUEL, 11) end
    if CloseMission then CloseMission(BW_MISSIONID_DUEL) end
    if SetMissionV then SetMissionV(1, 0) end
    if OpenMission then OpenMission(BW_MISSIONID_DUEL) end
    if StopMissionTimer then StopMissionTimer(BW_MISSIONID_DUEL, 10); StopMissionTimer(BW_MISSIONID_DUEL, 11) end
    if AddMSPlayer then AddMSPlayer(BW_MISSIONID_DUEL, camp) end
    if SetTaskTemp then SetTaskTemp(200, 1) end
    if SetMissionV then SetMissionV(8, 1) end
    SubWorld = _oldSW
end

function BotDuel:StartCombat(pidx, a)
    local _oldSW = SubWorld
    if SubWorldID2Idx then SubWorld = SubWorldID2Idx(self.arenaMap) end
    if RunMission then RunMission(BW_MISSIONID_DUEL) end
    if StopMissionTimer then StopMissionTimer(BW_MISSIONID_DUEL, 10); StopMissionTimer(BW_MISSIONID_DUEL, 11) end
    if SetMissionV then SetMissionV(8, 2) end
    SubWorld = _oldSW
    local _oldPI = PlayerIndex
    PlayerIndex = pidx
    if SetFightState then SetFightState(1) end
    if SetPKFlag then SetPKFlag(1) end
    PlayerIndex = _oldPI
    local tb = SimCitizen.fighterList[a.botId]
    if tb and tb.finalIndex and tb.finalIndex > 0 then
        tb.duelPlayerId = pidx
        tb.duelTicks = 999999
        if SetNpcCurCamp then SetNpcCurCamp(tb.finalIndex, self.botCamp) end
    end
    if Msg2MSAll then Msg2MSAll(BW_MISSIONID_DUEL, "Cong Binh Tu: Het gio chuan bi, tran ti vo bat dau!") end
end

function BotDuel:Start(pidx)
    if BOTDUEL_ENABLED ~= 1 then return end
    if self.active[pidx] then return end
    local id, tb = self:FindBot(pidx)
    if not id then
        Say("Cong Binh Tu: Ta khong thay ban dong bot nao trong to doi cua nguoi.", 0)
        return
    end
    local aidx = SubWorldID2Idx(self.arenaMap)
    if not aidx or aidx < 0 then
        Say("Cong Binh Tu: Dien vo truong chua san sang.", 0)
        return
    end

    local rw, rx, ry = GetWorldPos()
    self.active[pidx] = { botId = id, botName = tb.szName, retW = rw, retX = rx, retY = ry, ticks = 0, stage = "prep", prepLeft = self.prepTicks }
    self.botToOwner[id] = pidx

    if not self:PutBotInArena(tb, pidx) then
        self.active[pidx] = nil
        self.botToOwner[id] = nil
        Say("Cong Binh Tu: Khong the trieu " .. (tb.szName or "doi thu") .. " len dai.", 0)
        return
    end

    LeaveTeam()
    SetCreateTeam(0)
    SetFightState(0)
    SetPunish(0)
    SetCurCamp(self.ownerCamp)
    SetPKFlag(1)
    ForbidChangePK(1)
    ForbidEnmity(1)
    DisabledStall(1)
    ForbitTrade(1)
    DisabledUseTownP(1)
    SetDeathScript("\\script\\global\\nobitaxd\\vdk\\simcity\\components\\ploidai_death.lua")
    SetTempRevPos(rw, rx * 32, ry * 32)
    NewWorld(self.arenaMap, self.ownerPos[1], self.ownerPos[2])
    self:PrepArena(self.ownerCamp)

    Msg2Player("Cong Binh Tu: Chuan bi ti vo voi " .. (tb.szName or "doi thu") .. ". Trong luc chuan bi moi cac vi hao hiep vao xem!")
end

function BotDuel:PutBotInArena(tb, pidx)
    if tb.finalIndex and tb.finalIndex > 0 then
        if PartyClear then PartyClear(tb.finalIndex) end
        if BotDuelDisarm then BotDuelDisarm(tb.finalIndex) end
        DelNpcSafe(tb.finalIndex)
    end
    tb.finalIndex    = nil
    tb.isDead        = 0
    tb.nMapId        = self.arenaMap
    tb.worldInfo     = SimCityWorld:Get(self.arenaMap)
    tb.nPosId        = "1612_3187"
    tb.walkMode      = "random"
    tb.stall         = 0
    tb.daTau         = 0
    tb.isFighting    = 1
    tb.camp          = self.botCamp
    tb.partyOldCamp  = nil
    tb.partyPlayerId = nil
    tb.botDuelTarget = nil
    tb.dashUntil     = nil
    tb.noReviveOld   = tb.noRevive
    tb.noRevive      = 1
    tb.ploidaiBot    = 1

    SimEntity.Citizen.CreateChar(SimEntity.Citizen, SimCitizen, tb, 0, self.botPos[1] * 32, self.botPos[2] * 32)
    if not (tb.finalIndex and tb.finalIndex > 0) then
        return nil
    end
    SetNpcCurCamp(tb.finalIndex, self.botCamp)
    tb.duelPlayerId = nil
    tb.duelTicks    = 0
    tb.selfDefDuel  = nil
    return 1
end

function BotDuel:OnBotDead(pidx, tb)
    if not self.active[pidx] then return end
    self:Finish(pidx, "win")
end

function BotDuel:OnOwnerDead(pidx, launcher)
    if not self.active[pidx] then return end
    self:Finish(pidx, "lose")
end

function BotDuel:Finish(pidx, result)
    local a = self.active[pidx]
    if not a then return end
    self.active[pidx] = nil

    local old = PlayerIndex
    PlayerIndex = pidx
    local _pname = (GetName and GetName()) or "Nguoi choi"
    local _res
    if result == "win" then
        _res = "Loi dai Cong Binh Tu: " .. _pname .. " da danh bai " .. (a.botName or "doi thu") .. "!"
    elseif result == "lose" then
        _res = "Loi dai Cong Binh Tu: " .. (a.botName or "doi thu") .. " da danh bai " .. _pname .. "!"
    else
        _res = "Loi dai Cong Binh Tu: Tran ti vo " .. _pname .. " vs " .. (a.botName or "doi thu") .. " ket thuc hoa."
    end
    local _oldSWr = SubWorld
    if SubWorldID2Idx then SubWorld = SubWorldID2Idx(self.arenaMap) end
    if Msg2MSAll then Msg2MSAll(BW_MISSIONID_DUEL, _res) end
    SubWorld = _oldSWr
    if AddGlobalNews then AddGlobalNews(_res) end
    local _oldSWf = SubWorld
    if SubWorldID2Idx then SubWorld = SubWorldID2Idx(self.arenaMap) end
    if DelMSPlayer then DelMSPlayer(BW_MISSIONID_DUEL, pidx) end
    if StopMissionTimer then StopMissionTimer(BW_MISSIONID_DUEL, 10); StopMissionTimer(BW_MISSIONID_DUEL, 11) end
    if CloseMission then CloseMission(BW_MISSIONID_DUEL) end
    if SetMissionV then SetMissionV(1, 0) end
    if SetMissionV then SetMissionV(8, 0) end
    SubWorld = _oldSWf
    SetFightState(0)
    SetPunish(1)
    SetPKFlag(0)
    ForbidChangePK(0)
    ForbidEnmity(0)
    DisabledStall(0)
    ForbitTrade(0)
    DisabledUseTownP(0)
    SetCurCamp(GetCamp())
    SetCreateTeam(1)
    SetDeathScript("")
    if result == "win" then
        if Earn then Earn(50000) end
        Msg2Player("Cong Binh Tu: Chuc mung! Nguoi da danh bai " .. (a.botName or "doi thu") .. ". Thuong 5 van bac.")
    elseif result == "lose" then
        Msg2Player("Cong Binh Tu: Nguoi da bai tran truoc " .. (a.botName or "doi thu") .. ". Lan sau co gang hon!")
    else
        Msg2Player("Cong Binh Tu: Tran ti vo ket thuc.")
    end
    if result ~= "lose" then
        NewWorld(a.retW, a.retX, a.retY)
    end
    PlayerIndex = old

    self.botToOwner[a.botId] = nil
    local tb = SimCitizen.fighterList[a.botId]
    if tb then
        if tb.finalIndex and tb.finalIndex > 0 then DelNpcSafe(tb.finalIndex) end
        tb.finalIndex = nil
        tb.isDead = 1
        tb.duelPlayerId = nil
        tb._ownerRemove = 1
        if SimCitizen.Remove then SimCitizen:Remove(a.botId) end
    end
end

function BotDuel:Tick()
    if not self.active then return end
    local toFinish = {}
    for pidx, a in self.active do
        a.ticks = (a.ticks or 0) + 1
        if a.stage == "prep" then
            a.prepLeft = (a.prepLeft or 0) - 1
            if a.prepLeft > 0 then
                local _oPI = PlayerIndex
                PlayerIndex = pidx
                if Msg2Player then Msg2Player("<color=yellow>Loi dai: Tran ti vo bat dau sau " .. a.prepLeft .. "...<color>") end
                PlayerIndex = _oPI
            end
            if a.prepLeft <= 0 then
                a.stage = "battle"
                self:StartCombat(pidx, a)
            end
        else
            local tb = SimCitizen.fighterList[a.botId]
            if not tb or not tb.finalIndex or tb.finalIndex <= 0 then
                tinsert(toFinish, { pidx, "win" })
            elseif a.ticks > self.maxTicks then
                tinsert(toFinish, { pidx, "draw" })
            else
                tb.duelPlayerId = pidx
                tb.duelTicks = 999999
                if SetNpcCurCamp then SetNpcCurCamp(tb.finalIndex, self.botCamp) end
            end
        end
    end
    for i = 1, getn(toFinish) do
        self:Finish(toFinish[i][1], toFinish[i][2])
    end
end

if SimEntity and SimEntity.Citizen and not BotDuel._patchedOnDeath then
    BotDuel._patchedOnDeath = 1
    BotDuel._origEntityOnDeath = SimEntity.Citizen.OnDeath
    SimEntity.Citizen.OnDeath = function(self, simInstance, tbNpc, nNpcIndex, attackerIndex)
        local ret = BotDuel._origEntityOnDeath(self, simInstance, tbNpc, nNpcIndex, attackerIndex)
        if tbNpc and BotDuel and BotDuel.botToOwner and BotDuel.botToOwner[tbNpc.id] then
            local ow = BotDuel.botToOwner[tbNpc.id]
            if BotDuel.active[ow] then BotDuel:OnBotDead(ow, tbNpc) end
        end
        return ret
    end
end

if SimCityWorld and not BotDuel._patchedATick then
    BotDuel._patchedATick = 1
    BotDuel._origWorldATick = SimCityWorld.ATick
    function SimCityWorld:ATick(rate)
        if BotDuel and BotDuel.Tick then BotDuel:Tick() end
        return BotDuel._origWorldATick(self, rate)
    end
end
