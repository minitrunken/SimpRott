-- AbilityDisplay.lua

-- Assuming HR is already loaded from the main addon
local HR = HR or HeroRotation  -- HeroRotation is probably globally accessible from the original addon


-- Create the first color box for the Main Icon Frame
local mainColorBox = CreateFrame("Frame", "MainAbilityColorBox", UIParent)
mainColorBox:SetSize(15, 15)  -- Set the size of the box (width, height)
mainColorBox:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 15, 0)  -- Position for main frame color box
mainColorBox.texture = mainColorBox:CreateTexture(nil, "BACKGROUND")
mainColorBox.texture:SetAllPoints()
mainColorBox.texture:SetColorTexture(1, 1, 1, 1)  -- Default to white color

-- Create the second color box for the Small Icon Frame
local smallColorBox = CreateFrame("Frame", "SmallAbilityColorBox", UIParent)
smallColorBox:SetSize(15, 15)  -- Set the size of the box (width, height)
smallColorBox:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 30, 0)  -- Position for small frame color box
smallColorBox.texture = smallColorBox:CreateTexture(nil, "BACKGROUND")
smallColorBox.texture:SetAllPoints()
smallColorBox.texture:SetColorTexture(1, 1, 1, 1)  -- Default to white color

-- Variables to keep track of state
local lastMainAbilityID = nil
local lastSmallAbilityID = nil
local isMainBlack = false
local isSmallBlack = false






-- Function to update the color of the small color box based on spell ID
local function UpdateSmallColorBox(id)


    if id and id ~= 0 then
        local color = spellColorList[id]
        if color then
            print("Found color mapping for Small ID:", id)
            smallColorBox.texture:SetColorTexture(color.r, color.g, color.b, 1)  -- Set the color
            lastSmallAbilityID = id
            isSmallBlack = false
        else
            print("No color mapping found for Small ID:", id)
        end
    else
        if not isSmallBlack then
            smallColorBox.texture:SetColorTexture(0, 0, 0, 1)  -- Set to black
            lastSmallAbilityID = nil
            isSmallBlack = true
            print("No small ability showing. Set color to black.")
        end
    end
end








-- Function to update the color of the main color box based on spell ID
local function UpdateMainColorBox(id)
    -- Skip updating if the ID hasn't changed (prevent flickering)
    if id == lastMainAbilityID then 
        return 
    end

    if id and id ~= 0 then
        local color = spellColorList[id]
        if color then
            print("Found color mapping for Main ID:", id)
            mainColorBox.texture:SetColorTexture(color.r, color.g, color.b, 1)  -- Set the color
            lastMainAbilityID = id
            isMainBlack = false
        else
            print("No color mapping found for Main ID:", id)
        end
    else
        if not isMainBlack then
            mainColorBox.texture:SetColorTexture(0, 0, 0, 1)  -- Set to black
            lastMainAbilityID = nil
            isMainBlack = true
            print("No main ability showing. Set color to black.")
        end
    end
end



-- Hook into the ChangeIcon function for both Main and Small Frames

-- Main Frame Hook
local OriginalChangeIconMain = HR.MainIconFrame.ChangeIcon
HR.MainIconFrame.ChangeIcon = function(self, icon, keybind, usable, outofrange, id)
    OriginalChangeIconMain(self, icon, keybind, usable, outofrange, id)
    UpdateMainColorBox(id)  -- Update with the Main Frame's ability
end

-- Small Frame Hook
local OriginalChangeIconSmall = HR.SmallIconFrame.ChangeIcon
HR.SmallIconFrame.ChangeIcon = function(self, icon, keybind, usable, outofrange, id)
    print("Small frame updating color with ID:", id)
    OriginalChangeIconSmall(self, icon, keybind, usable, outofrange, id)
    UpdateSmallColorBox(id)  -- Update with the Small Frame's ability
end

-- Event handler to detect when you lose or change targets
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:SetScript("OnEvent", function(self, event)
    print("Player target changed event triggered.")
    if not UnitExists("target") then
        -- No target, set both color boxes to black
        UpdateMainColorBox(nil)
        UpdateSmallColorBox(nil)
    end
end)
