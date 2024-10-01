-- Hooker.lua

-- Assuming HR is already loaded from the main addon
local HR = HR or HeroRotation

-- Create the first color box for the Main Icon Frame
mainColorBox = CreateFrame("Frame", "MainAbilityColorBox", UIParent)
mainColorBox:SetSize(2, 2)  -- Set the size of the box (width, height)
mainColorBox:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 2, 0)  -- Position for main frame color box
mainColorBox.texture = mainColorBox:CreateTexture(nil, "BACKGROUND")
mainColorBox.texture:SetAllPoints()


-- Track last ability ID to prevent redundant updates
local lastMainAbilityID = nil


-- Function to update the color of the main color box based on spell ID
local function UpdateMainColorBox(id)
    local specIndex = GetSpecialization()
    local specID = GetSpecializationInfo(specIndex)
    local specSpellConfig = spellColorList[specID]

    -- If the same ability ID is used, skip the update
    if id == lastMainAbilityID then return end

    if id and id ~= 0 then
        if specSpellConfig then
            -- Handle spells like Avenging Wrath vs Crusade
            if id == 31884 and IsPlayerSpell(231895) then
                id = 231895  -- Use Crusade if available
            end

            -- Find the spell in the specSpellConfig table by spellID
            local color = nil
            for _, spellData in ipairs(specSpellConfig) do
                if spellData.spellID == id then
                    color = spellData.color
                    break
                end
            end

            if color then
                dprint("|cff00ccffFound color for Main ID:", id)
                mainColorBox.texture:SetColorTexture(color.r, color.g, color.b, 1)
                lastMainAbilityID = id
            else
                print("|cffff0000No color for Main ID:", id)
                mainColorBox.texture:SetColorTexture(0, 0, 0, 1)
                lastMainAbilityID = nil
            end
        else
            dprint("|cffff0000No spell configuration for spec ID:", specID)
        end
    else
        dprint("|cffff8000No main ability showing. Set to black.")
        mainColorBox.texture:SetColorTexture(0.1, 0.05, 0.05, 1)
        lastMainAbilityID = nil
    end
end


-- Hook into the ChangeIcon function for the Main Icon Frame
local OriginalChangeIconMain = HR.MainIconFrame.ChangeIcon
HR.MainIconFrame.ChangeIcon = function(self, icon, keybind, usable, outofrange, id)
    OriginalChangeIconMain(self, icon, keybind, usable, outofrange, id)
    UpdateMainColorBox(id)
end

-- Ensure the color updates based on the spell loaded via specialization
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
    if not UnitExists("target") then
        UpdateMainColorBox(0)
    end
end)
