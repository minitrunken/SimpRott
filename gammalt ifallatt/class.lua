-- Function to show a class-colored square in the center of the screen
local function showClassSquare()
    -- Define a table of colors for each class (RGB format)
    local classColors = {
        WARRIOR     = {0.78, 0.61, 0.43}, -- Brown
        PALADIN     = {0.96, 0.55, 0.73}, -- Pink
        HUNTER      = {0.67, 0.83, 0.45}, -- Green
        ROGUE       = {1.00, 0.96, 0.41}, -- Yellow
        PRIEST      = {1.00, 1.00, 1.00}, -- White
        DEATHKNIGHT = {0.77, 0.12, 0.23}, -- Dark Red
        SHAMAN      = {0.00, 0.44, 0.87}, -- Blue
        MAGE        = {0.25, 0.78, 0.92}, -- Light Blue
        WARLOCK     = {0.53, 0.53, 0.93}, -- Purple
        MONK        = {0.00, 1.00, 0.59}, -- Light Green
        DRUID       = {1.00, 0.49, 0.04}, -- Orange
        DEMONHUNTER = {0.64, 0.19, 0.79}, -- Dark Purple
        EVOKER      = {0.15, 0.50, 0.45}, -- Slightly darker teal
    }

    -- Retrieve the player's class
    local _, class = UnitClass("player")

    -- Define the size and position for the square
    local squareSize = 2  -- Adjust size as desired
    local color = classColors[class] or {1, 1, 1} -- Default to white if the class isn't found

    -- Create the frame if it doesn't already exist
    if not classSquareFrame then
        classSquareFrame = CreateFrame("Frame", "ClassSquareFrame", UIParent)
        classSquareFrame:SetSize(squareSize, squareSize)
        classSquareFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 4, 0)

        -- Create the texture for the frame and set the initial color
        classSquareFrame.texture = classSquareFrame:CreateTexture(nil, "BACKGROUND")
        classSquareFrame.texture:SetAllPoints()
    end

    -- Set the color of the square based on the class
    classSquareFrame.texture:SetColorTexture(unpack(color))

    -- Ensure the frame is shown and is at the top
    classSquareFrame:SetFrameStrata("TOOLTIP")
    classSquareFrame:SetFrameLevel(100)
    classSquareFrame:Show()
end

-- Create a frame to register and handle events
local eventFrame = CreateFrame("Frame")

-- Event handler function
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        showClassSquare()  -- Call the function when the player logs in
    end
end)

-- Register the PLAYER_LOGIN event
eventFrame:RegisterEvent("PLAYER_LOGIN")
