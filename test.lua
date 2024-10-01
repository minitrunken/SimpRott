local frame = CreateFrame("Frame", "PurgeTheWickedChecker", UIParent)
frame:SetSize(50, 50)
frame:SetPoint("CENTER", 0, 0)

local texture = frame:CreateTexture()
texture:SetAllPoints()
frame.texture = texture

frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("UNIT_AURA")

-- New function to safely retrieve debuff information using AuraUtil
local function UpdateDebuffStatus()
    if UnitExists("target") and UnitCanAttack("player", "target") then
        local debuffFound = false

        AuraUtil.ForEachAura("target", "HARMFUL", nil, function(name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId)
            if spellId == 204213 then
                debuffFound = true
                return true -- Stop iteration once we find the debuff
            else
                print("Found debuff: " .. (name or "nil") .. " with Spell ID: " .. (spellId or "nil"))
            end
        end)

        if debuffFound then
            frame.texture:SetColorTexture(0, 0, 0) -- Black square when debuff is present
        else
            frame.texture:SetColorTexture(1, 0.75, 0.8) -- Pink square when debuff is missing
        end
    else
        frame.texture:SetColorTexture(0, 0, 0) -- Default black when no valid target
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
    UpdateDebuffStatus()
end)

-- Initialize the color when the addon loads
UpdateDebuffStatus()
