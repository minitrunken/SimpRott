-- Create a frame to handle events
local frame = CreateFrame("Frame")

-- Register for the UI_ERROR_MESSAGE event
frame:RegisterEvent("UI_ERROR_MESSAGE")

-- Create the alert frame (a red square)
local alertFrame = CreateFrame("Frame", nil, UIParent)
alertFrame:SetSize(100, 100) -- Width, Height
alertFrame:SetPoint("CENTER") -- Position on the screen
alertFrame:Hide() -- Hide by default

-- Set the background color to red
alertFrame.texture = alertFrame:CreateTexture(nil, "BACKGROUND")
alertFrame.texture:SetAllPoints(alertFrame)
alertFrame.texture:SetColorTexture(1, 0, 0, 0.5) -- Red color with 50% opacity

-- Event handler function
frame:SetScript("OnEvent", function(self, event, errorType, message)
    if event == "UI_ERROR_MESSAGE" and message == "Target needs to be in front of you." then
        alertFrame:Show()
        C_Timer.After(2, function() alertFrame:Hide() end) -- Hide after 2 seconds
    end
end)
