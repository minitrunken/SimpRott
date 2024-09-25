-- FrameHandler.lua

local addonName, addonTable = ...
addonTable.FrameHandler = addonTable.FrameHandler or {}
local frameHandler = addonTable.FrameHandler

addonTable.debugMode = false  -- Initial debug mode status
addonTable.autoTauntEnabled = false -- Initial auto taunt status

local function CreateStyledButton(name, parent, width, height, text)
    local button = CreateFrame("Button", name, parent, "UIPanelButtonTemplate")
    button:SetSize(width, height)
    button:SetText(text)

    -- Set button scripts
button:SetScript("OnClick", function()
    if name == "EnhcSham" then
        if not addonTable.EnhcSham or not addonTable.EnhcSham.Initialize then
            print("Enhancement Spec not found")
        else
            print("Initializing Enhancement Spec...")
            addonTable.EnhcSham.Initialize()  -- Kör initiationsfunktionen
            frameHandler.UpdateSpecText("Enhance Sham", {r = 0, g = 1, b = 0})
            frameHandler.subMenu:Hide()
            frameHandler.specsButton:SetText("Unload Spec")
            frameHandler.specsButton:SetScript("OnClick", frameHandler.ReloadUI)
        end
    end
end)

    print("Button " .. name .. " created")
    return button
end


function frameHandler.UpdateSpecText(text, color)
    if frameHandler.specText then
        frameHandler.specText:SetText(text)
        frameHandler.specText:SetTextColor(color.r, color.g, color.b)
    end
end

function frameHandler.UpdateDebugText(text)
    if frameHandler.debugText then
        frameHandler.debugText:SetText(text)
    end
end

function frameHandler.ReloadUI()
    print("Reloading UI")
    ReloadUI()
end

function frameHandler.ShowSubMenu()
    if frameHandler.subMenu:IsShown() then
        frameHandler.subMenu:Hide()
    else
        frameHandler.subMenu:Show()
    end
end



    


function frameHandler.Initialize()
    print("Initializing frameHandler")

    -- Skapa en huvudram med storleken 100x175 px
    mainFrame = CreateFrame("Frame", "MainFrame", UIParent, "BackdropTemplate")
    mainFrame:SetSize(100, 175)
    mainFrame:SetPoint("CENTER")
    mainFrame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
    mainFrame:SetBackdropColor(0, 0, 0, 0.5)
    mainFrame:EnableMouse(true)
    mainFrame:SetMovable(true)
    mainFrame:RegisterForDrag("LeftButton")
    mainFrame:SetScript("OnDragStart", mainFrame.StartMoving)
    mainFrame:SetScript("OnDragStop", mainFrame.StopMovingOrSizing)
    mainFrame:Show()
    print("Main frame created and configured")

    -- Skapa en titel
    local title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", mainFrame, "TOP", 0, -10)
    title:SetText("SimRot")
    title:SetTextColor(0x00/255, 0x52/255, 0xBA/255)
    title:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")

    -- Understrykning av titeln
    local titleUnderline = mainFrame:CreateTexture(nil, "ARTWORK")
    titleUnderline:SetColorTexture(0x00/255, 0x52/255, 0xBA/255)
    titleUnderline:SetHeight(2)
    titleUnderline:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -2)
    titleUnderline:SetPoint("TOPRIGHT", title, "BOTTOMRIGHT", 0, -2)
    print("Title and underline created")

    -- Skapa en knapp
    frameHandler.specsButton = CreateStyledButton("SpecsButton", mainFrame, 80, 20, "Specs")
    frameHandler.specsButton:SetPoint("TOP", titleUnderline, "BOTTOM", 0, -1)
    frameHandler.specsButton:SetScript("OnClick", frameHandler.ShowSubMenu)

    -- Skapa en text för att visa vald spec
    frameHandler.specText = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frameHandler.specText:SetPoint("TOP", frameHandler.specsButton, "BOTTOM", 0, -1)
    frameHandler.specText:SetText("Choose Spec.")
    frameHandler.specText:SetTextColor(1, 0, 0)  -- Red text


    -- Skapa en undermeny
    print("Creating submenu")
    frameHandler.subMenu = CreateFrame("Frame", "SubMenu", UIParent, "BackdropTemplate")
    frameHandler.subMenu:SetSize(100, 200)
    frameHandler.subMenu:SetPoint("LEFT", mainFrame, "RIGHT", 0, 0)
    frameHandler.subMenu:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
    frameHandler.subMenu:SetBackdropColor(0, 0, 0, 0.5)
    frameHandler.subMenu:Hide()

    local dkBloodButton = CreateStyledButton("DKBloodButton", frameHandler.subMenu, 80, 20, "DK Blood")
    dkBloodButton:SetPoint("TOP", frameHandler.subMenu, "TOP", 0, -10)
    print("DK Blood button created")

    local dkUnholyButton = CreateStyledButton("DKUnholyButton", frameHandler.subMenu, 80, 20, "DK Unholy")
    dkUnholyButton:SetPoint("TOP", dkBloodButton, "BOTTOM", 0, -5)
    print("DK Unholy button created")

    local dkFrostButton = CreateStyledButton("DKFrostButton", frameHandler.subMenu, 80, 20, "DK Frost")
    dkFrostButton:SetPoint("TOP", dkUnholyButton, "BOTTOM", 0, -5)
    print("DK Frost button created")

    local EnhcSham = CreateStyledButton("EnhcSham", frameHandler.subMenu, 80, 20, "EnhcSham")
    EnhcSham:SetPoint("TOP", dkFrostButton, "BOTTOM", 0, -5)
    print("EnhcSham button created")
	
	local DiscPriest = CreateStyledButton("DiscPriest", frameHandler.subMenu, 80, 20, "DiscPriest")
    DiscPriest:SetPoint("TOP", EnhcSham, "BOTTOM", 0, -5)
    print("DiscPriest button created")

    print("UI elements created and configured")

    -- Register for target change event
    local targetFrame = CreateFrame("Frame")
    targetFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
    targetFrame:SetScript("OnEvent", function(self, event, ...)
    end)


frameHandler.showability = CreateStyledButton("showability", mainFrame, 80, 20, "Debug")
frameHandler.showability:SetPoint("TOP", titleUnderline, "BOTTOM", 0, -155)
frameHandler.showability:SetScript("OnClick", ShowAllAbilitiesWithColors)


end
addonTable.frameHandler = frameHandler
