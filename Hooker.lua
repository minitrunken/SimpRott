-- MainColorBox.lua

-- Assuming HR is already loaded from the main addon
local HR = HR or HeroRotation

-- Create the first color box for the Main Icon Frame
local mainColorBox = CreateFrame("Frame", "MainAbilityColorBox", UIParent)
mainColorBox:SetSize(15, 15)  -- Set the size of the box (width, height)
mainColorBox:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 15, 0)  -- Position for main frame color box
mainColorBox.texture = mainColorBox:CreateTexture(nil, "BACKGROUND")
mainColorBox.texture:SetAllPoints()
mainColorBox.texture:SetColorTexture(1, 1, 1, 1)  -- Default to white color

-- Track last ability ID to prevent redundant updates
local lastMainAbilityID = nil

-- Update the color of the main color box based on spell ID
local function UpdateMainColorBox(id)
    if id == lastMainAbilityID then return end  -- Skip if same ability
    if id and id ~= 0 then
        local color = spellColorList[id]
        if color then
            print("Found color for Main ID:", id)
            mainColorBox.texture:SetColorTexture(color.r, color.g, color.b, 1)
            lastMainAbilityID = id
        else
            print("No color for Main ID:", id)
            mainColorBox.texture:SetColorTexture(0, 0, 0, 1)
            lastMainAbilityID = nil
        end
    else
        print("No main ability showing. Set to black.")
        mainColorBox.texture:SetColorTexture(0, 0, 0, 1)
        lastMainAbilityID = nil
    end
end

-- Hook into the ChangeIcon function for the Main Icon Frame
local OriginalChangeIconMain = HR.MainIconFrame.ChangeIcon
HR.MainIconFrame.ChangeIcon = function(self, icon, keybind, usable, outofrange, id)
    OriginalChangeIconMain(self, icon, keybind, usable, outofrange, id)
    UpdateMainColorBox(id)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:SetScript("OnEvent", function(self, event)
    if not UnitExists("target") then
        UpdateMainColorBox(nil)   -- Reset main color box when no target
    end
end)

-- Function to get the player's current specialization and load the appropriate spell list
local function LoadSpellListBasedOnSpec()
    local specID = GetSpecializationInfo(GetSpecialization())
    if specID == 66 then  -- Protection Paladin spec ID
        print("Loading Protection Paladin spell list")
        spellColorList = protection_paladin_spellList
    else
        print("No spell list defined for this spec ID: ", specID)
    end
end

-- Hook into the PLAYER_LOGIN and ACTIVE_TALENT_GROUP_CHANGED events to check spec
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
frame:SetScript("OnEvent", function(self, event, ...)
    LoadSpellListBasedOnSpec()
end)
