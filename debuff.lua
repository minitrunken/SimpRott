local frame = CreateFrame("Frame", "DeSquare", UIParent)
frame:SetSize(50, 50)  -- Size of the square
frame:SetPoint("TOP", UIParent, "TOP", 0, -50)  -- Place the frame at the top of the screen, with some offset
frame.texture = frame:CreateTexture(nil, "BACKGROUND")
frame.texture:SetAllPoints()
frame.texture:SetColorTexture(0, 0, 0, 1)  -- Default black

-- Function to check debuffs on a unit using AuraUtil
local function CheckForDebuff(unit)
    local debuffFound = false

    AuraUtil.ForEachAura(unit, "HARMFUL", nil, function(name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId)
        if name then
            print("Debuff found on " .. unit .. ": " .. name)
            debuffFound = true
            frame.texture:SetColorTexture(0.5, 0, 0.5, 1)  -- Set to purple
            return true  -- Stop iteration once we find a debuff
        end
    end)

    if not debuffFound then
        frame.texture:SetColorTexture(0, 0, 0, 1)  -- Set back to black if no debuff
    end
end

-- Event frame to handle updates
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("UNIT_AURA")
eventFrame:SetScript("OnEvent", function(self, event, unit)
    if unit == "player" or unit:match("party%d") then  -- Check for player or party members
        CheckForDebuff(unit)
    end
end)
