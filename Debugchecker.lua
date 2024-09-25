-- Define the color list using RGB values from your provided list
local colorList = {
    {r = 0.1, g = 0.1, b = 0.9},  -- Lightning Shield
    {r = 0.1, g = 0.2, b = 0.8},  -- Windstrike
    {r = 0.1, g = 0.3, b = 0.7},  -- Alpha Wolf
    {r = 0.1, g = 0.4, b = 0.6},  -- Ascendance
    {r = 0.1, g = 0.5, b = 0.5},  -- Crash Lightning
    {r = 0.1, g = 0.6, b = 0.4},  -- Doom Winds
    {r = 0.1, g = 0.7, b = 0.3},  -- Feral Spirit
    {r = 0.1, g = 0.8, b = 0.2},  -- Ice Strike
    {r = 0.1, g = 0.9, b = 0.1},  -- Lava Lash
    {r = 0.1, g = 1, b = 0},      -- Stormstrike
    {r = 0.2, g = 0.1, b = 0.9},  -- Sundering
    {r = 0.3, g = 0.2, b = 0.8},  -- Chain Lightning
    {r = 0.4, g = 0.3, b = 0.7},  -- Windfury Weapon
    {r = 0.5, g = 0.4, b = 0.6},  -- Flame Tongue
    {r = 0.6, g = 0.5, b = 0.5},  -- Flame Shock
    {r = 0.7, g = 0.6, b = 0.4},  -- Lightning Bolt
    {r = 0.8, g = 0.7, b = 0.3},  -- Tempest
    {r = 0.9, g = 0.8, b = 0.2},  -- Frost Shock
    {r = 1, g = 0.9, b = 0.1},    -- Frost Shock (another variation)
    {r = 1, g = 0.5, b = 0},      -- Red Variation
    {r = 0.9, g = 0, b = 0.1},    -- Another variation
    {r = 0.8, g = 0.1, b = 0.2},  -- Variation
    {r = 0.7, g = 0.2, b = 0.3},  -- Variation
    {r = 0.6, g = 0.3, b = 0.4},  -- Variation
    {r = 0.5, g = 0.4, b = 0.5},  -- Variation
    {r = 0.4, g = 0.5, b = 0.6},  -- Variation
    {r = 0.3, g = 0.6, b = 0.7},  -- Variation
    {r = 0.2, g = 0.7, b = 0.8},  -- Variation
    {r = 0.1, g = 0.8, b = 0.9},  -- Variation
    {r = 0, g = 0.9, b = 1},      -- Blue-Green
}

-- Function to create the grid of color squares
local function CreateColorGridUI()
    -- Main frame
    local frame = CreateFrame("Frame", "ColorGridFrame", UIParent, "BasicFrameTemplateWithInset")
    frame:SetSize(400, 400)  -- Adjust the frame size depending on how many squares you want
    frame:SetPoint("CENTER")

    -- Title
    frame.title = frame:CreateFontString(nil, "OVERLAY")
    frame.title:SetFontObject("GameFontHighlight")
    frame.title:SetPoint("CENTER", frame.TitleBg, "CENTER", 0, 0)
    frame.title:SetText("Color Grid")

    -- Grid layout settings
    local squareSize = 40  -- Width and height of each square
    local padding = 10     -- Space between squares
    local columns = 5      -- Number of squares per row

    -- Loop through the color list and create squares
    for i, color in ipairs(colorList) do
        -- Calculate row and column positions
        local row = math.floor((i - 1) / columns)
        local col = (i - 1) % columns

        -- Create a frame for each color square
        local square = CreateFrame("Frame", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
        square:SetSize(squareSize, squareSize)
        square:SetPoint("TOPLEFT", frame, "TOPLEFT", 20 + col * (squareSize + padding), -40 - row * (squareSize + padding))

        -- Set the background color for the square
        square:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",  -- Solid color background
            edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0,
            insets = { left = 0, right = 0, top = 0, bottom = 0 }
        })
        square:SetBackdropColor(color.r, color.g, color.b, 1)
    end
end

-- Create the grid when the addon is loaded
CreateColorGridUI()
