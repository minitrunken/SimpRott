-- Initialize the debug mode variable
local debugMode = false

-- Function to load the saved debug mode setting
local function LoadDebugMode()
    if MyAddonSavedVariables and MyAddonSavedVariables.debugMode ~= nil then
        debugMode = MyAddonSavedVariables.debugMode
    else
        debugMode = false
    end
end

-- Function to save the debug mode setting
local function SaveDebugMode()
    if not MyAddonSavedVariables then
        MyAddonSavedVariables = {}
    end
    MyAddonSavedVariables.debugMode = debugMode
end

-- Create a frame for debug messages
local debugFrame = CreateFrame("ScrollingMessageFrame", "DebugFrame", UIParent, "BackdropTemplate")
debugFrame:SetSize(400, 100)  -- Width, Height
debugFrame:SetPoint("TOP", UIParent, "TOP", 0, -50)  -- Position at the top center of the screen
debugFrame:SetFontObject(GameFontNormal)
debugFrame:SetJustifyH("CENTER")
debugFrame:SetMaxLines(10)
debugFrame:EnableMouse(true)

debugFrame:SetBackdropColor(0, 0, 0, 1)
debugFrame:Hide()  -- Hide by default

-- Function to display debug messages
local function ShowDebugMessage(message)
    debugFrame:AddMessage(message)
    debugFrame:Show()
end

-- Enhanced dprint function that supports multiple arguments
function dprint(...)
    if debugMode then
        -- Concatenate all arguments into a single string with spaces in between
        local message = table.concat({...}, " ")
        ShowDebugMessage("|cff00ff00[Debug]:|r " .. message)
    end
end

-- Function to toggle debug mode on or off
local function ToggleDebugMode()
    debugMode = not debugMode
    SaveDebugMode()
    if debugMode then
        ShowDebugMessage("|cff00ff00Debug mode enabled.|r")
    else
        ShowDebugMessage("|cffff0000Debug mode disabled.|r")
    end
end

-- Register the /debug slash command
SLASH_DEBUG1 = "/debug"
SlashCmdList["DEBUG"] = ToggleDebugMode

-- Load the saved debug mode setting when the addon is loaded
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "test" then  -- Replace with your actual addon name
        LoadDebugMode()
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

-- Define a table to store frames
local colorFrames = {}
local numSquares = 2
local squareSize = 2  -- Set square size to 2x2 pixels
local displayDuration = 8  -- Duration in seconds to display the squares

-- Define a table of bright and odd colors
local colors = {
    {1, 0, 1},    -- Magenta
    {1, 1, 0},    -- Yellow
    {0, 1, 1},    -- Cyan
    {0.5, 0, 0.5},-- Purple
    {1, 0.5, 0},  -- Orange
}

-- Function to create and display the squares
local function showSquares()
    -- Loop through the number of squares
    for i = 1, numSquares do
        -- If the frame doesn't exist, create it
        if not colorFrames[i] then
            local frame = CreateFrame("Frame", "ColorFrame"..i, UIParent)
            frame:SetSize(squareSize, squareSize)
            frame:SetPoint("TOPLEFT", (i - 1) * squareSize, 0)

            frame:SetFrameStrata("TOOLTIP")
            frame:SetFrameLevel(100)

            -- Create a texture for the frame and set the color
            local texture = frame:CreateTexture(nil, "BACKGROUND")
            texture:SetAllPoints()
            texture:SetColorTexture(unpack(colors[i]))

            frame.texture = texture
            colorFrames[i] = frame
        end
        -- Show the frame
        colorFrames[i]:Show()
    end

    -- Schedule hiding the squares after 5 seconds
    C_Timer.After(displayDuration, function()
        for i = 1, numSquares do
            if colorFrames[i] then
                colorFrames[i]:Hide()
            end
        end
    end)
end

-- Define an ordered list of keys to ensure specific display order
local orderedKeys = {
    "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
    "SHIFT-F1", "SHIFT-F2", "SHIFT-F3", "SHIFT-F4", "SHIFT-F5", "SHIFT-F6", "SHIFT-F7", "SHIFT-F8", "SHIFT-F9", "SHIFT-F10", "SHIFT-F11", "SHIFT-F12",
    "CTRL-F1", "CTRL-F2", "CTRL-F3", "CTRL-F4", "CTRL-F5", "CTRL-F6", "CTRL-F7", "CTRL-F8", "CTRL-F9", "CTRL-F10", "CTRL-F11", "CTRL-F12",
    "NUMPAD1", "NUMPAD2", "NUMPAD3", "NUMPAD4", "NUMPAD5", "NUMPAD6", "NUMPAD7", "NUMPAD8", "NUMPAD9", "NUMPAD0", "NUMPADDOT", "NUMPADENTER"
}

-- Define a table with colors for each key
local keyColors = {
    ["F1"] = {0.1, 0.1, 0.9},
    ["F2"] = {0.1, 0.2, 0.8},
    ["F3"] = {0.1, 0.3, 0.7},
    ["F4"] = {0.1, 0.4, 0.6},
    ["F5"] = {0.1, 0.5, 0.5},
    ["F6"] = {0.1, 0.6, 0.4},
    ["F7"] = {0.1, 0.7, 0.3},
    ["F8"] = {0.1, 0.8, 0.2},
    ["F9"] = {0.1, 0.9, 0.1},
    ["F10"] = {0.1, 1.0, 0.0},
    ["F11"] = {0.2, 0.1, 0.9},
    ["F12"] = {0.3, 0.2, 0.8},
    
    ["SHIFT-F1"] = {0.4, 0.3, 0.7},
    ["SHIFT-F2"] = {0.5, 0.4, 0.6},
    ["SHIFT-F3"] = {0.6, 0.5, 0.5},
    ["SHIFT-F4"] = {0.7, 0.6, 0.4},
    ["SHIFT-F5"] = {0.8, 0.7, 0.3},
    ["SHIFT-F6"] = {0.9, 0.8, 0.2},
    ["SHIFT-F7"] = {1.0, 0.9, 0.1},
    ["SHIFT-F8"] = {1.0, 0.5, 0.0},
    ["SHIFT-F9"] = {0.9, 0.0, 0.1},
    ["SHIFT-F10"] = {0.8, 0.1, 0.2},
    ["SHIFT-F11"] = {0.7, 0.2, 0.3},
    ["SHIFT-F12"] = {0.6, 0.3, 0.4},
    
    ["CTRL-F1"] = {0.5, 0.4, 0.5},
    ["CTRL-F2"] = {0.4, 0.5, 0.6},
    ["CTRL-F3"] = {0.3, 0.6, 0.7},
    ["CTRL-F4"] = {0.2, 0.7, 0.8},
    ["CTRL-F5"] = {0.1, 0.8, 0.9},
    ["CTRL-F6"] = {0.0, 0.9, 1.0},
    ["CTRL-F7"] = {0.1, 0.2, 0.9},
    ["CTRL-F8"] = {0.2, 0.3, 0.8},
    ["CTRL-F9"] = {0.3, 0.4, 0.7},
    ["CTRL-F10"] = {0.4, 0.5, 0.8},
    ["CTRL-F11"] = {0.5, 0.6, 0.5},
    ["CTRL-F12"] = {0.6, 0.7, 0.4},
    
    ["NUMPAD1"] = {0.9, 0.1, 0.2},
    ["NUMPAD2"] = {0.8, 0.2, 0.3},
    ["NUMPAD3"] = {0.7, 0.3, 0.4},
    ["NUMPAD4"] = {0.6, 0.4, 0.5},
    ["NUMPAD5"] = {0.5, 0.5, 0.6},
    ["NUMPAD6"] = {0.4, 0.6, 0.7},
    ["NUMPAD7"] = {0.3, 0.7, 0.8},
    ["NUMPAD8"] = {0.2, 0.8, 0.9},
    ["NUMPAD9"] = {0.1, 0.9, 1.0},
    ["NUMPAD0"] = {0.0, 1.0, 0.9},
    ["NUMPADDOT"] = {0.1, 0.8, 0.7},
    ["NUMPADENTER"] = {0.2, 0.7, 0.6}
}

-- Function to create frames
local function CreateColorFrames()
    local frameSize = 100  -- Size of each square frame
    local padding = 10    -- Space between frames

    for index, key in ipairs(orderedKeys) do
        local color = keyColors[key]
        if color then
            local row = math.floor((index - 1) / 8)  -- 8 frames per row
            local col = (index - 1) % 8

            -- Create a frame for each color
            local frame = CreateFrame("Frame", "ColorFrame_" .. key, UIParent)
            frame:SetSize(frameSize, frameSize)
            frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 50 + (col * (frameSize + padding)), -50 - (row * (frameSize + padding)))

            -- Apply the color to the frame's background
            local texture = frame:CreateTexture(nil, "BACKGROUND")
            texture:SetAllPoints(frame)
            texture:SetColorTexture(color[1], color[2], color[3], 1)

            -- Create a font string to display the key name
            local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            text:SetPoint("CENTER", frame, "CENTER")
            text:SetText(key)
            text:SetTextColor(1, 1, 1)  -- White text for visibility

            frame:Hide()  -- Start hidden
            table.insert(colorFrames, frame)  -- Store the frame in a table for toggling
        end
    end
end

-- Function to toggle visibility of frames
local function ToggleColorFrames()
    for _, frame in ipairs(colorFrames) do
        if frame:IsShown() then
            frame:Hide()
        else
            frame:Show()
        end
    end
end

-- Slash command to trigger the function
SLASH_COLORADDON1 = "/cal"
SlashCmdList["COLORADDON"] = function()
    showSquares()
end

-- Register slash command
SLASH_COLOR1 = "/color"
SlashCmdList["COLOR"] = function()
    if #colorFrames == 0 then  -- Create frames only if they haven't been created yet
        CreateColorFrames()
    end
    ToggleColorFrames()
end