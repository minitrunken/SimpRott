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
{ name = "Blade of Justice", key = "F1" },
{ name = "Divine Toll", key = "F2" },
{ name = "Execution Sentence", key = "F3" },
{ name = "Wake of Ashes", key = "F4" },
{ name = "Final Verdict", key = "F5" },
{ name = "Judgment", key = "F6" },
{ name = "Templar Strike", key = "F7" },
{ name = "Hammer of Wrath", key = "F8" },
{ name = "Shield of Vengeance", key = "F9" },
{ name = "Avenging Wrath", key = "F10" },
{ name = "Templar Slash", key = "F11" },
{ name = "Divine Storm", key = "F12" },
--{ name = "Hammer of Light", key = "SHIFT-F1" },
{ name = "", key = "SHIFT-F2" },
{ name = "", key = "SHIFT-F3" },
{ name = "", key = "SHIFT-F4" },
{ name = "", key = "SHIFT-F5" },
{ name = "", key = "SHIFT-F6" },
{ name = "", key = "SHIFT-F7" },
{ name = "", key = "SHIFT-F8" },
{ name = "", key = "SHIFT-F9" },
{ name = "", key = "SHIFT-F10" },
{ name = "", key = "SHIFT-F11" },
{ name = "", key = "SHIFT-F12" },
{ name = "", key = "CTRL-F1" },
{ name = "", key = "CTRL-F2" },
{ name = "", key = "CTRL-F3" },
{ name = "", key = "CTRL-F4" }

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
{ name = "Eye of Tyr", key = "SHIFT-F6" },
--F7 427453 - hammer of light (eye of tyr upgrade)
{ name = "Moment of Glory", key = "SHIFT-F8" },
}

local ProtwarriorAbilities = {
{ name = "Battle Shout", key = "F1" },
{ name = "Last Stand", key = "F2" },
{ name = "Thunder Clap", key = "F3" },
{ name = "Shield Slam", key = "F4" },
{ name = "Ignore Pain", key = "F5" },
{ name = "Revenge", key = "F6" },
{ name = "Charge", key = "F7" },
{ name = "Shield Block", key = "F8" },
{ name = "Execute", key = "F9" },
{ name = "Impending Victory", key = "F10" },
{ name = "Avatar", key = "F11" },
{ name = "Ravager", key = "F12" },
{ name = "Shield Charge", key = "SHIFT-F1" },
{ name = "Thunderous Roar", key = "SHIFT-F2" },
{ name = "Demoralizing Shout", key = "SHIFT-F3" },
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
                print("|cffff0000Error: Failed to bind spell '" .. ability.name .. "' to key " .. hotkey)
            end
        else
            print("|cffff0000Error: Missing hotkey or spell name for binding")
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
        print("|cff00ff00Enhancement Shaman keybindings loaded!")
    -- Havoc Demon Hunter: Check if the player is a Demon Hunter and in the Havoc spec
    elseif class == "DEMONHUNTER" and specID == 577 then
        RebindAbilities(demonHunterAbilities)
        print("|cff00ff00Havoc Demon Hunter keybindings loaded!")
	elseif class == "PALADIN" and specID == 70 then
        RebindAbilities(RetpalaAbilities)
        print("|cff00ff00Pala Ret keybindings loaded!")
	elseif class == "PALADIN" and specID == 66 then
        RebindAbilities(ProtpalaAbilities)
        print("|cff00ff00Pala Prot keybindings loaded!")
	elseif class == "WARRIOR" and specID == 73 then
        RebindAbilities(ProtwarriorAbilities)
        print("|cff00ff00Warrior Prot keybindings loaded!")
    else
        print("|cffff0000No keybindings for this class/spec!")
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