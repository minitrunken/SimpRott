local function SafeUnitBuff(unit, spellID)
    local found = false

    -- Use AuraUtil to iterate through buffs
    AuraUtil.ForEachAura(unit, "HELPFUL", nil, function(name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, auraSpellId)
        if auraSpellId == spellID then
            found = true
            return true  -- Exit iteration early if found
        end
    end)

    return found
end

local function HasDispelDebuff(unit)
    local dispellable = false

    -- Use AuraUtil to iterate through harmful debuffs
    AuraUtil.ForEachAura(unit, "HARMFUL", nil, function(name, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId)
        local _, playerClass = UnitClass("player")

        -- Check if the debuff is dispellable based on class
        if (playerClass == "PRIEST" and debuffType == "Magic") or
           (playerClass == "PALADIN" and (debuffType == "Magic" or debuffType == "Poison" or debuffType == "Disease")) or
           (playerClass == "DRUID" and (debuffType == "Curse" or debuffType == "Poison")) or
           (playerClass == "SHAMAN" and debuffType == "Curse") then
            dispellable = true
            return true  -- Exit iteration early if found
        end
    end)

    return dispellable
end

local function IsSpellOffCooldown(spellID)
    local spellCooldownInfo = C_Spell.GetSpellCooldown(spellID)
    if spellCooldownInfo then
        local startTime, duration, isEnabled = spellCooldownInfo.startTime, spellCooldownInfo.duration, spellCooldownInfo.isEnabled
        if isEnabled and (duration == 0 or (startTime + duration) <= GetTime()) then
            return true
        end
    end
    return false
end

-- Function to check the player's spec and determine the abilities to check
local function GetAbilitiesToCheck()
    local _, class = UnitClass("player")
    local specIndex = GetSpecialization()
    local specID = specIndex and select(1, GetSpecializationInfo(specIndex))

    if class == "PRIEST" and specID == 256 then -- Discipline Priest
        return {
            buffs = { 
                {21562, "Power Word: Fortitude", {0.1, 0.7, 0.3, 1}},
                {194384, "Atonement", {0.1, 0.8, 0.2, 1}}
            },
            healing = {
                {194509, "Power Word: Radiance", {0.1, 0.9, 0.1, 1}},
                {2061, "Flash Heal", {0.1, 1, 0, 1}}
            },
            lowHealing = {
               -- {139, "Renew", {0.1, 0.8, 0.2, 1}}
            },
            shields = { 
                {17, "Power Word: Shield", {0.2, 0.1, 0.9, 1}}
            },
            dispel = {
                {527, "Purify", {0.3, 0.2, 0.8, 1}} -- Priest dispel
            }
        }
    elseif class == "PRIEST" and specID == 257 then -- Holy Priest
        return {
            buffs = { {139, "Renew", {0, 1, 0, 1}} },
            healing = { {34861, "Holy Word: Sanctify", {1, 0, 0, 1}} },
            lowHealing = { {33076, "Prayer of Mending", {1, 1, 0, 1}} },
            shields = { {47788, "Guardian Spirit", {0, 0, 1, 1}} },
            dispel = { {527, "Purify", {0.5, 0, 0.5, 1}} }
        }
    elseif class == "PALADIN" and specID == 65 then -- Holy Paladin
        return {
            buffs = { {53563, "Beacon of Light", {0, 1, 0, 1}} },
            healing = { {223306, "Bestow Faith", {1, 0, 0, 1}} },
            lowHealing = { {183998, "Light of the Martyr", {1, 1, 0, 1}} },
            shields = { {1022, "Blessing of Protection", {0, 0, 1, 1}} },
            dispel = { {4987, "Cleanse", {0.5, 0, 0.5, 1}} }
        }
    else
        return nil -- No relevant abilities to track
    end
end

-- Function to create frames for ability checks
local function CreateAbilityCheckFrame(name, unit, x, y, labelText)
    local frame = CreateFrame("Frame", name, UIParent)
    frame:SetSize(15, 15) -- Set the size of the square to 15x15
    frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", x, -y) -- Hardcoded position, y is negative to go down from the top left corner
    frame.texture = frame:CreateTexture(nil, "BACKGROUND")
    frame.texture:SetAllPoints(frame)
    frame.texture:SetColorTexture(0, 0, 0, 1) -- Default color is black

    -- Create text label below the frame
    local label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOP", frame, "BOTTOM", 0, -5)
    label:SetText(labelText)

    -- Function to check if the unit has the relevant abilities
    local function CheckAbilities()
        -- Do not change color if the player is channeling an ability
        if UnitChannelInfo("player") then
            return
        end

        local abilities = GetAbilitiesToCheck()
        if not abilities then
            return
        end

        if UnitExists(unit) then
            frame:Show()
        else
            frame:Hide()
            return
        end

        -- Do not change color if the unit is dead
        if UnitIsDead(unit) then
            label:SetText(labelText .. " - Dead")
            return
        end

        -- Do not change color if the unit is out of range (more than 40 yards)
        if unit ~= "player" and not UnitInRange(unit) then
            label:SetText(labelText .. " - Out of Range")
            return
        end

        local healthPercent = (UnitHealth(unit) / UnitHealthMax(unit)) * 100
        local colorToSet = {0, 0, 0, 1} -- Default color is black
        local missingAbilityText = labelText

        -- Check Buffs (e.g., Fortitude, Atonement)
        for _, buff in ipairs(abilities.buffs) do
            local buffID, buffName, color = buff[1], buff[2], buff[3]
            local buffFound = SafeUnitBuff(unit, buffID)
            if not buffFound and IsSpellOffCooldown(buffID) then
                colorToSet = color
                missingAbilityText = labelText .. " - Missing: " .. buffName
                break
            end
        end

        -- Check Shields (if health below 85% and spell is off cooldown)
        if colorToSet[1] == 0 and colorToSet[2] == 0 and colorToSet[3] == 0 then
            for _, shield in ipairs(abilities.shields) do
                local shieldID, shieldName, color = shield[1], shield[2], shield[3]
                if healthPercent < 85 and IsSpellOffCooldown(shieldID) then
                    local shieldFound = SafeUnitBuff(unit, shieldID)
                    if not shieldFound then
                        colorToSet = color
                        missingAbilityText = labelText .. " - Missing: " .. shieldName
                        break
                    end
                end
            end
        end

        -- Check for Healing (if health between 1-80% and spell is off cooldown)
        if colorToSet[1] == 0 and colorToSet[2] == 0 and colorToSet[3] == 0 then
            for _, heal in ipairs(abilities.healing) do
                local healID, healName, color = heal[1], heal[2], heal[3]
                if healthPercent > 0 and healthPercent < 80 and IsSpellOffCooldown(healID) then
                    colorToSet = color
                    missingAbilityText = labelText .. " - Healing Needed: " .. healName
                    break
                end
            end
        end

        -- Check for Low Healing (if health between 80-99% and spell is off cooldown)
        if colorToSet[1] == 0 and colorToSet[2] == 0 and colorToSet[3] == 0 then
            for _, heal in ipairs(abilities.lowHealing) do
                local healID, healName, color = heal[1], heal[2], heal[3]
                if healthPercent >= 80 and healthPercent < 100 and IsSpellOffCooldown(healID) then
                    colorToSet = color
                    missingAbilityText = labelText .. " - Low Healing Needed: " .. healName
                    break
                end
            end
        end

        -- Check for Dispel (if a dispellable debuff exists and spell is off cooldown)
        if colorToSet[1] == 0 and colorToSet[2] == 0 and colorToSet[3] == 0 then
            if HasDispelDebuff(unit) then
                local dispel = abilities.dispel[1]
                local dispelID, dispelName, color = dispel[1], dispel[2], dispel[3]
                if IsSpellOffCooldown(dispelID) then
                    colorToSet = color
                    missingAbilityText = labelText .. " - Needs Dispel: " .. dispelName
                end
            end
        end

        -- Update the frame color and text independently
        frame.texture:SetColorTexture(unpack(colorToSet))
        label:SetText(missingAbilityText)
    end

    -- Event handler to update the frame when necessary
    frame:RegisterEvent("UNIT_AURA")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    frame:RegisterEvent("GROUP_ROSTER_UPDATE")
    frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
    frame:RegisterEvent("UNIT_HEALTH")
    frame:RegisterEvent("GROUP_JOINED")
    frame:SetScript("OnEvent", function(self, event, arg1)
        if event == "UNIT_AURA" and arg1 == unit then
            CheckAbilities()
        elseif event == "PLAYER_ENTERING_WORLD" or event == "GROUP_ROSTER_UPDATE" or event == "PLAYER_SPECIALIZATION_CHANGED" or event == "UNIT_HEALTH" or event == "GROUP_JOINED" then
            CheckAbilities()
        end
    end)

    -- Initial check
    CheckAbilities()

    -- Set up a ticker to update regularly to improve responsiveness
    C_Timer.NewTicker(0.5, function()
        CheckAbilities()
    end)
end

local startX = 150
local startY = 150
local gap = 100

-- Create frames for player and party members with updated coordinates
CreateAbilityCheckFrame("AbilityCheckFrame_Player", "player", startX, startY, "Me") -- Player frame
CreateAbilityCheckFrame("AbilityCheckFrame_Party1", "party1", startX + gap * 1, startY, "Member 1") -- Party member 1
CreateAbilityCheckFrame("AbilityCheckFrame_Party2", "party2", startX + gap * 2, startY, "Member 2") -- Party member 2
CreateAbilityCheckFrame("AbilityCheckFrame_Party3", "party3", startX + gap * 3, startY, "Member 3") -- Party member 3
CreateAbilityCheckFrame("AbilityCheckFrame_Party4", "party4", startX + gap * 4, startY, "Member 4") -- Party member 4
