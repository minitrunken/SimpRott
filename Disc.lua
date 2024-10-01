-- DiscPriestRotationHelper.lua
local DiscPriestRotationHelper = CreateFrame("Frame", "DiscPriestRotationHelperFrame", UIParent)
DiscPriestRotationHelper:SetSize(50, 50) -- Size of the square
DiscPriestRotationHelper:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 2, 0) -- Position on the left side
DiscPriestRotationHelper.texture = DiscPriestRotationHelper:CreateTexture()
DiscPriestRotationHelper.texture:SetAllPoints(DiscPriestRotationHelper)
DiscPriestRotationHelper.texture:SetColorTexture(0, 0, 0, 1) -- Default color is black

local abilities = {
    { name = "Purge the Wicked", id = 204213, r = 0.1, g = 0.1, b = 0.9 },
    { name = "Shadow Word: Death", id = 32379, r = 0.1, g = 0.2, b = 0.8 },
    { name = "Mindbender", id = 123040, r = 0.1, g = 0.3, b = 0.7 },
    { name = "Mind Blast", id = 8092, r = 0.1, g = 0.4, b = 0.6 },
    { name = "Penance", id = 47540, r = 0.1, g = 0.5, b = 0.5 },
    { name = "Smite", id = 585, r = 0.1, g = 0.6, b = 0.4 },
}

local function IsSpellReady(spellId)
    if not IsSpellKnown(spellId) then
        return false
    end
    local spellCooldownInfo = C_Spell.GetSpellCooldown(spellId)
    if not spellCooldownInfo then
        return false
    end
    local start, duration, isEnabled = spellCooldownInfo.startTime, spellCooldownInfo.duration, spellCooldownInfo.isEnabled
    return isEnabled and duration == 0 and start == 0
end

local function IsDebuffApplied(unit, spellId)
    local debuffFound = false
    if UnitExists(unit) and UnitCanAttack("player", unit) then
        AuraUtil.ForEachAura(unit, "HARMFUL", nil, function(name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, auraSpellId)
            if auraSpellId == spellId then
                debuffFound = true
                return true -- Stop iteration once we find the debuff
            end
        end)
    end
    return debuffFound
end

local function ShowRotationColor(frame)
    local target = "target"
    if UnitExists(target) and UnitCanAttack("player", target) then
        -- Check if Purge the Wicked is on target
        local purgeTheWicked = abilities[1]
        if purgeTheWicked and not IsDebuffApplied(target, purgeTheWicked.id) then
            frame.texture:SetColorTexture(purgeTheWicked.r, purgeTheWicked.g, purgeTheWicked.b, 1)
            return
        end

        -- Iterate through the rest of the abilities
        for i = 2, #abilities do
            local ability = abilities[i]
            if IsSpellReady(ability.id) then
                frame.texture:SetColorTexture(ability.r, ability.g, ability.b, 1)
                return
            end
        end
    end

    -- Default to black if no abilities are available
    frame.texture:SetColorTexture(0, 0, 0, 1)
end

local function UpdateRotationHelper()
    local specIndex = GetSpecialization()
    if not specIndex or GetSpecializationInfo(specIndex) ~= 256 then
        -- Not in Discipline specialization, hide the frame
        DiscPriestRotationHelper:Hide()
    else
        -- In Discipline specialization, make sure the frame is visible
        DiscPriestRotationHelper:Show()
    end

    if not UnitAffectingCombat("player") then
        -- Not in combat, show black square
        DiscPriestRotationHelper.texture:SetColorTexture(0, 0, 0, 1)
        return
    end

    ShowRotationColor(DiscPriestRotationHelper)
end

DiscPriestRotationHelper:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
DiscPriestRotationHelper:RegisterEvent("PLAYER_REGEN_ENABLED")
DiscPriestRotationHelper:RegisterEvent("PLAYER_REGEN_DISABLED")
DiscPriestRotationHelper:RegisterEvent("PLAYER_TARGET_CHANGED")
DiscPriestRotationHelper:RegisterEvent("UNIT_AURA")
DiscPriestRotationHelper:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_SPECIALIZATION_CHANGED" or event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_TARGET_CHANGED" or event == "UNIT_AURA" then
        UpdateRotationHelper()
    end
end)

DiscPriestRotationHelper:SetScript("OnUpdate", function(self, elapsed)
    UpdateRotationHelper()
end)
