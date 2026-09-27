IncludeLib("FILESYS")

-- V5.22 - Smart AI ONLY for NPCs created by Train Density Mode 1 / Mode 2.
-- Natural/original map NPCs are never passed to VSDTrainAI_Apply.
-- Goal: low/mid-level generated monsters use behavior derived from native level-90 profiles.
-- Stats/level/template/drop/ReviveFrame are NOT changed here.
--
-- Exact source anchors:
--   npclevelscript/animal.lua (>80): mode=3, p1=20,p2=5,p3=100,p4=100,p5=0,p6=50,p7=5,p8=10,p9=85
--   npclevelscript/standard.lua at level 90: mode=2, p1=72,p2=25,p3=5,p4=100,p5=0,p6=38,p7=7,p8=20,p9=65
--   soldier2/3/4.lua and newnpc.lua use the same AI formulas as standard.lua.
--   SetNpcAI(...) is used by exact server scripts; no custom bot timer is added here.

VSD_TRAIN_AI_NPC_FILE = "\\settings\\npcs.txt"
VSD_TRAIN_AI_TAB_KEY = "VSD_TRAIN_SMART_AI_V522"
VSD_TRAIN_AI_NATIVE_HIGH_LEVEL = 80

g_nVSDTrainAITabLoaded = g_nVSDTrainAITabLoaded or 0
g_nVSDTrainAIApplyTotal = g_nVSDTrainAIApplyTotal or 0
g_nVSDTrainAIApplyFail = g_nVSDTrainAIApplyFail or 0

function VSDTrainAI_LoadTable()
    if g_nVSDTrainAITabLoaded == 1 then return 1 end
    if not TabFile_Load or not TabFile_GetCell then return 0 end
    if TabFile_Load(VSD_TRAIN_AI_NPC_FILE, VSD_TRAIN_AI_TAB_KEY) == 0 then return 0 end
    g_nVSDTrainAITabLoaded = 1
    return 1
end

function VSDTrainAI_GetNumericMeta(nSettingIdx)
    if not nSettingIdx or nSettingIdx <= 0 then return nil end
    if VSDTrainAI_LoadTable() ~= 1 then return nil end
    local nRow = nSettingIdx + 1
    local t = {}
    t.szLevelScript = TabFile_GetCell(VSD_TRAIN_AI_TAB_KEY, nRow, "LevelScript") or ""
    t.nMode = tonumber(TabFile_GetCell(VSD_TRAIN_AI_TAB_KEY, nRow, "AIMode"))
    t.tbParam = {}
    local i
    for i = 1, 9 do
        t.tbParam[i] = tonumber(TabFile_GetCell(VSD_TRAIN_AI_TAB_KEY, nRow, "AIParam"..i))
    end
    return t
end

function VSDTrainAI_ProfileAnimal90()
    return {3,20,5,100,100,0,50,5,10,85}, "animal90"
end

function VSDTrainAI_ProfileStandard90()
    return {2,72,25,5,100,0,38,7,20,65}, "standard90"
end

function VSDTrainAI_IsAnimalScript(sz)
    if sz == "\\script\\npclevelscript\\animal.lua" then return 1 end
    if sz == "\\script\\npclevelscript\\double\\animal.lua" then return 1 end
    return 0
end

function VSDTrainAI_IsStandardFormulaScript(sz)
    if sz == "\\script\\npclevelscript\\standard.lua" then return 1 end
    if sz == "\\script\\npclevelscript\\double\\standard.lua" then return 1 end
    if sz == "\\script\\npclevelscript\\soldier2.lua" then return 1 end
    if sz == "\\script\\npclevelscript\\soldier3.lua" then return 1 end
    if sz == "\\script\\npclevelscript\\soldier4.lua" then return 1 end
    if sz == "\\script\\npclevelscript\\newnpc.lua" then return 1 end
    return 0
end

-- Conservative fallback for other normal-monster templates whose npcs.txt AI fields are all numeric.
-- Keep skill/heal probabilities p2..p7 exactly as template; only make movement/engagement behavior
-- no more passive than the native level-90 reference for the same AIMode family (2 or 3).
function VSDTrainAI_ProfileNumericFallback(meta)
    if not meta or not meta.nMode then return nil, "unsupported" end
    local p = meta.tbParam
    local i
    for i = 1, 9 do if p[i] == nil then return nil, "unsupported" end end

    local out = {meta.nMode,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9]}
    if meta.nMode == 3 then
        if out[2] < 20 then out[2] = 20 end
        if out[9] > 10 then out[9] = 10 end
        if out[10] < 85 then out[10] = 85 end
        return out, "numeric-mode3"
    end
    if meta.nMode == 2 then
        if out[2] < 72 then out[2] = 72 end
        if out[9] > 20 then out[9] = 20 end
        if out[10] < 65 then out[10] = 65 end
        return out, "numeric-mode2"
    end
    return nil, "unsupported"
end

function VSDTrainAI_GetProfile(nSettingIdx, nLevel)
    if nLevel and nLevel > VSD_TRAIN_AI_NATIVE_HIGH_LEVEL then
        return nil, "native-high"
    end
    local meta = VSDTrainAI_GetNumericMeta(nSettingIdx)
    if not meta then return nil, "meta-fail" end
    if VSDTrainAI_IsAnimalScript(meta.szLevelScript) == 1 then
        return VSDTrainAI_ProfileAnimal90()
    end
    if VSDTrainAI_IsStandardFormulaScript(meta.szLevelScript) == 1 then
        return VSDTrainAI_ProfileStandard90()
    end
    return VSDTrainAI_ProfileNumericFallback(meta)
end

-- return 1 = SmartAI applied; 2 = original level >80, keep native high AI; 0 = safe fallback to original AI.
function VSDTrainAI_Apply(nNpcIndex, nSettingIdx, nLevel)
    if not nNpcIndex or nNpcIndex <= 0 or not SetNpcAI then
        g_nVSDTrainAIApplyFail = g_nVSDTrainAIApplyFail + 1
        return 0
    end
    local p, szProfile = VSDTrainAI_GetProfile(nSettingIdx, nLevel)
    if szProfile == "native-high" then return 2 end
    if not p then
        g_nVSDTrainAIApplyFail = g_nVSDTrainAIApplyFail + 1
        return 0
    end
    SetNpcAI(nNpcIndex, p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10])
    g_nVSDTrainAIApplyTotal = g_nVSDTrainAIApplyTotal + 1
    return 1
end
