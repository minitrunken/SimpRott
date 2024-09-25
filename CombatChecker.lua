-- Create the frame
local frame = CreateFrame("Frame", "CombatSquareFrame", UIParent)
frame:SetSize(15, 15)
frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0)  -- Placerar rutan till vänster med en marginal på 10 pixlar från vänsterkanten
frame.texture = frame:CreateTexture(nil, "BACKGROUND")
frame.texture:SetAllPoints(frame)
frame.texture:SetColorTexture(0, 0, 0, 1)  -- Initial color: black (0x000000)

-- Event handler function
local function UpdateFrameColor()
    if InCombatLockdown() then
        -- In combat
        if UnitExists("target") and UnitCanAttack("player", "target") then
            frame.texture:SetColorTexture(0, 1, 0, 1)  -- Green (0x00FF00) - In combat and can attack the target
        else
            frame.texture:SetColorTexture(1, 0, 0, 1)  -- Red (0xFF0000) - In combat but no valid target
        end
    else
        -- Out of combat
        if UnitExists("target") then
            frame.texture:SetColorTexture(1, 0.5, 0, 1)  -- Orange (0xFF8000) - Out of combat, with a target
        else
            frame.texture:SetColorTexture(0, 0, 0, 1)  -- Black (0x000000) - Out of combat, no target
        end
    end
end

-- Register events
frame:RegisterEvent("PLAYER_REGEN_DISABLED")  -- Fires when combat starts
frame:RegisterEvent("PLAYER_REGEN_ENABLED")   -- Fires when combat ends
frame:RegisterEvent("PLAYER_TARGET_CHANGED")  -- Fires when you change your target
frame:RegisterEvent("UNIT_COMBAT")            -- Detects when you hit or are hit by a target
frame:RegisterEvent("PLAYER_ENTERING_WORLD")  -- Fires when you log in or reload UI (to ensure correct initial state)

-- Set script to handle events
frame:SetScript("OnEvent", UpdateFrameColor)

-- Initial color update
UpdateFrameColor()
