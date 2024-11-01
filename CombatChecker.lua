-- Create the frame
local frame = CreateFrame("Frame", "CombatSquareFrame", UIParent)
frame:SetSize(2, 2)
frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0) 
frame.texture = frame:CreateTexture(nil, "BACKGROUND")
frame.texture:SetAllPoints(frame)
frame.texture:SetColorTexture(0, 0, 0, 1)

local classSpecSpells = {
    WARRIOR = { [1] = 1464, [2] = 1464, [3] = 1464 },
    PALADIN = { [1] = 35395, [2] = 35395, [3] = 35395 },
    HUNTER = { [1] = 53351, [2] = 53351, [3] = 186270 },
    ROGUE = { [1] = 5938, [2] = 193315, [3] = 193315 },
    PRIEST = { [1] = 589, [2] = 589, [3] = 589 },
    DEATHKNIGHT = { [1] = 316239, [2] = 49143, [3] = 316239 },
    SHAMAN = { [1] = 188443, [2] = 73899, [3] = 17364 },
    MAGE = { [1] = 5143, [2] = 11366, [3] = 30455 },
    WARLOCK = { [1] = 5019, [2] = 5019, [3] = 5019 },
    MONK = { [1] = 107428, [2] = 100780, [3] = 107428 },
    DRUID = { [1] = 190984, [2] = 1822, [3] = 6807, [4] = 5176 },
    DEMONHUNTER = { [1] = 344862, [2] = 344862 },
    EVOKER = { [1] = 357211, [2] = 100780, [3] = 395160 }
}

-- Helper function to get the spell ID based on class and spec
local function GetSpellID()
    local _, playerClass = UnitClass("player")
    local spec = GetSpecialization()
    if classSpecSpells[playerClass] and classSpecSpells[playerClass][spec] then
        return classSpecSpells[playerClass][spec]
    else
        return nil
    end
end

-- Helper function to check if the target is in range
local function IsTargetInRange(spellID)
    if not spellID then
        print("Error: spellID is nil")
        return false
    end

    local inRange = C_Spell.IsSpellInRange(spellID, 'target')
    
    if UnitExists('target') and not UnitIsFriend('target', 'player') and not UnitIsDead('target') then
        return inRange == true
    else
        return false
    end
end

-- Event handler function
local function UpdateFrameColor()
    local spellID = GetSpellID()
    if not spellID then
        print("Error: No valid spell ID found for class and spec.")
        frame.texture:SetColorTexture(0.01, 0, 0.01, 1)  -- Black (0x000000)
        return
    end

    if InCombatLockdown() then
        -- In combat
        if UnitExists("target") and UnitCanAttack("player", "target") then
            if IsTargetInRange(spellID) then
                frame.texture:SetColorTexture(0, 0.1, 0, 1)  -- Green (0x001A00) - In combat, can attack the target, and in range
            else
                frame.texture:SetColorTexture(0.1, 0.1, 0, 1)  -- Yellow (0x1A1A00) - In combat, can attack the target, but out of range
            end
        else
            frame.texture:SetColorTexture(0.1, 0, 0, 1)  -- Red (0x1A0000) - In combat but no valid target
        end
    else
        -- Out of combat
        if UnitExists("target") then
            frame.texture:SetColorTexture(0.1, 0.05, 0, 1)  -- Orange (0x1A0D00) - Out of combat, with a target
        else
            frame.texture:SetColorTexture(0.01, 0, 0.01, 1)  -- Black (0x000000) - Out of combat, no target
        end
    end
end

-- Register events
frame:RegisterEvent("PLAYER_REGEN_DISABLED")  -- Fires when combat starts
frame:RegisterEvent("PLAYER_REGEN_ENABLED")   -- Fires when combat ends
frame:RegisterEvent("PLAYER_TARGET_CHANGED")  -- Fires when you change your target
frame:RegisterEvent("UNIT_COMBAT")            -- Detects when you hit or are hit by a target
frame:RegisterEvent("PLAYER_ENTERING_WORLD")  -- Fires when you log in or reload UI (to ensure correct initial state)
frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")  -- Fires when you change your specialization

-- Set script to handle events
frame:SetScript("OnEvent", UpdateFrameColor)

-- Set script to handle OnUpdate for more frequent updates
frame:SetScript("OnUpdate", function(self, elapsed)
    UpdateFrameColor()
end)

-- Initial color update
UpdateFrameColor()