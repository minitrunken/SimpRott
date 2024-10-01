

-- Function to load spell data for the current spec
local function LoadSpecConfig()
    local specIndex = GetSpecialization()
    if specIndex then
        local specID = GetSpecializationInfo(specIndex)
        local specSpellConfig = spellColorList[specID]

        -- Debugging statements
        print("Spec Index: " .. specIndex)
        print("Spec ID: " .. specID)

        -- Check if specSpellConfig exists
        if not specSpellConfig or #specSpellConfig == 0 then
            dprint("No spell configuration found for this specialization (Spec ID: " .. specID .. ").")
            return
        else
            dprint("Found spell configuration for Spec ID: " .. specID)
        end

        -- Create a table to track bound keys to prevent rebinding the same key multiple times
        local boundKeys = {}

        -- Iterate over the spell configurations
        for i = 1, #specSpellConfig do
            local spellData = specSpellConfig[i]

            -- Check if the player knows this spell
            if IsPlayerSpell(spellData.spellID) then
                -- Only bind if this key hasn't been bound already
                if not boundKeys[spellData.key] then
                    -- Bind the key to the spell the player knows
					SetBinding(spellData.key, nil)  -- Clears any previous binding on this key
					SetBinding(spellData.key, "SPELL " .. spellData.spellName)
                    print("Bound " .. spellData.key .. " to spell: " .. spellData.spellName .. " (Spell ID: " .. spellData.spellID .. ")")
                    
                    -- Mark this key as bound to avoid rebinding
                    boundKeys[spellData.key] = true
                end
            else
                print("Player does not know spell: " .. spellData.spellName .. " (Spell ID: " .. spellData.spellID .. ")")
            end
        end

        -- Save keybindings (if necessary)
        SaveBindings(GetCurrentBindingSet())
    else
        dprint("Unable to retrieve specialization index.")
    end
end

-- Event handler for addon load and specialization change
local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")

frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        LoadSpecConfig()  -- Call your function after login
    elseif event == "PLAYER_SPECIALIZATION_CHANGED" then
        LoadSpecConfig()  -- Handle spec changes
    end
end)
