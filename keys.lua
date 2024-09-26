-- List of abilities with their names exactly as per the provided keybinding layout


-- List of abilities for Enhancement Shaman spec
local shamanAbilities = {
    { name = "lightning shield", key = "F1" },
    { name = "flametongue weapon", key = "F2" },
    { name = "windfury weapon", key = "F3" },
    { name = "Skyfury", key = "F4" },
    { name = "Astral Shift", key = "F5" },
    { name = "doom winds", key = "F6" },
    { name = "feral spirit", key = "F7" },
    { name = "flame shock", key = "SHIFT-F1" },
    { name = "stormstrike", key = "SHIFT-F2" },
    { name = "windstrike", key = "SHIFT-F3" },
    { name = "crash lightning", key = "SHIFT-F4" },
    { name = "chain lightning", key = "SHIFT-F5" },
    { name = "sundering", key = "SHIFT-F6" },
    { name = "lava lash", key = "SHIFT-F7" },
    { name = "lightning bolt", key = "SHIFT-F8" },
    { name = "tempest", key = "SHIFT-F9" },
    { name = "frost shock", key = "SHIFT-F10" },
    { name = "ice strike", key = "SHIFT-F11" }
	
}

-- List of abilities for Havoc Demon Hunter spec using spell names
local demonHunterAbilities = {
    { name = "Immolation Aura", key = "F1" },
    { name = "Chaos Nova", key = "F2" },
    { name = "Felblade", key = "F3" },
    { name = "Fodder to the Flame", key = "F4" },
    { name = "The Hunt", key = "F5" },
    { name = "Vengeful Retreat", key = "F6" },
    { name = "Disrupt", key = "F7" },
    { name = "Annihilation", key = "F8" },
    { name = "Blade Dance", key = "F9" },
    { name = "Blur", key = "F10" },
    { name = "Chaos Strike", key = "F11" },
    { name = "Death Sweep", key = "F12" },
    { name = "Demon's Bite", key = "SHIFT-F1" },
    { name = "Fel Rush", key = "SHIFT-F2" },
    { name = "Metamorphosis", key = "SHIFT-F3" },
    { name = "Throw Glaive", key = "SHIFT-F4" },
    { name = "Essence Break", key = "SHIFT-F5" },
    { name = "Eye Beam", key = "SHIFT-F6" },
    { name = "Fel Eruption", key = "SHIFT-F7" }
}


local RetpalaAbilities = {
{ name = "Eternal Flame", key = "F1" },
{ name = "Hammer of Light", key = "F2" },
{ name = "Crusader Strike", key = "F3" },
{ name = "Shield of the Righteous", key = "F4" },
{ name = "Judgment", key = "F5" },
{ name = "Hammer of Justice", key = "F6" },
{ name = "Consecration", key = "F7" },
{ name = "Hand of Reckoning", key = "F8" },
{ name = "Templar's Verdict", key = "F9" },
{ name = "Divine Toll", key = "F10" },
{ name = "Blessing of Protection", key = "F11" },
{ name = "Avenging Wrath", key = "F12" },
{ name = "Rebuke", key = "SHIFT-F1" },
{ name = "Blinding Light", key = "SHIFT-F2" },
{ name = "Repentance", key = "SHIFT-F3" },
{ name = "Turn Evil", key = "SHIFT-F4" },
{ name = "Hammer of Wrath", key = "SHIFT-F5" },
{ name = "Blessing of Freedom", key = "SHIFT-F6" },
{ name = "Lay on Hands", key = "SHIFT-F7" },
{ name = "Wake of Ashes", key = "SHIFT-F8" },
{ name = "Blade of Justice", key = "SHIFT-F9" },
{ name = "Final Reckoning", key = "SHIFT-F10" },
{ name = "Final Verdict", key = "SHIFT-F11" },
{ name = "Divine Shield", key = "SHIFT-F12" },
{ name = "Shield of Vengeance", key = "CTRL-F1" },
{ name = "Divine Protection", key = "CTRL-F2" },
{ name = "Intercession", key = "CTRL-F3" },
{ name = "Divine Storm", key = "CTRL-F4" }

}


local ProtpalaAbilities = {
{ name = "Consecration", key = "F1" },
{ name = "Blessed Hammer", key = "F2" },
{ name = "Hand of Reckoning", key = "F3" },
{ name = "Avenger's Shield", key = "F4" },
{ name = "Avenging Wrath", key = "F5" },
{ name = "Hammer of Wrath", key = "F6" },
{ name = "Judgment", key = "F7" },
{ name = "Shield of the Righteous", key = "F8" },
{ name = "Divine Toll", key = "F9" },
{ name = "Holy Bulwark", key = "F10" },
{ name = "Devotion Aura", key = "F11" },
{ name = "Word of Glory", key = "F12" },
{ name = "Ardent Defender", key = "SHIFT-F1" },
{ name = "Sentinel", key = "SHIFT-F2" },
{ name = "Lay on Hands", key = "SHIFT-F3" },
{ name = "Guardian of Ancient Kings", key = "SHIFT-F4" },
{ name = "Divine Toll", key = "SHIFT-F5" },
{ name = "Eye of Tyr", key = "SHIFT-F6" }
}



--{ name = "22222", key = "22222" },




-- Rebind function to bind each ability in the list to the appropriate key by name
function RebindAbilities(abilities)
    for i, ability in ipairs(abilities) do
        local hotkey = ability.key
        if hotkey and ability.name then
            -- Set the binding directly with spell name
            SetBinding(hotkey) -- Clear any existing binding for the key
            local success = SetBindingSpell(hotkey, ability.name) -- Bind by spell name
            if success then
                print("Bound " .. ability.name .. " to " .. hotkey)
            else
                print("Error: Failed to bind spell '" .. ability.name .. "' to key " .. hotkey)
            end
        else
            print("Error: Missing hotkey or spell name for binding")
        end
    end
    SaveBindings(GetCurrentBindingSet()) -- Save changes permanently
end

-- Function to check if the player is in the appropriate class and spec
local function LoadKeybindings()
    local _, class = UnitClass("player")  -- Get the player's class
    local spec = GetSpecialization()  -- Get the player's specialization
    local specID = GetSpecializationInfo(spec)  -- Get spec ID

    -- Enhancement Shaman: Check if the player is a Shaman and in the Enhancement spec
    if class == "SHAMAN" and specID == 263 then
        RebindAbilities(shamanAbilities)
        print("Enhancement Shaman keybindings loaded!")
    -- Havoc Demon Hunter: Check if the player is a Demon Hunter and in the Havoc spec
    elseif class == "DEMONHUNTER" and specID == 577 then
        RebindAbilities(demonHunterAbilities)
        print("Havoc Demon Hunter keybindings loaded!")
	elseif class == "PALADIN" and specID == 70 then
        RebindAbilities(RetpalaAbilities)
        print("Pala Ret keybindings loaded!")
	elseif class == "PALADIN" and specID == 66 then
        RebindAbilities(ProtpalaAbilities)
        print("Pala Prot keybindings loaded!")
    else
        print("No keybindings for this class/spec!")
    end
end

-- Event handler to load keybindings on player login or spec change
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")  -- Trigger when the player logs in
f:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")  -- Trigger when the spec changes
f:SetScript("OnEvent", function(self, event, ...)
    LoadKeybindings()  -- Load the correct keybindings based on the player's class and spec
end)

-- Slash command to manually rebind abilities (useful for debugging)
SLASH_REBINDABILITIES1 = "/rebindabilities"
SlashCmdList["REBINDABILITIES"] = function()
    LoadKeybindings()
end