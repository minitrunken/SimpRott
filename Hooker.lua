

-- Define a list of key-color mappings
local keyColorList = {
    { key = "F1", color = {r = 0.1, g = 0.1, b = 0.9} },
    { key = "F2", color = {r = 0.1, g = 0.2, b = 0.8} },
    { key = "F3", color = {r = 0.1, g = 0.3, b = 0.7} },
    { key = "F4", color = {r = 0.1, g = 0.4, b = 0.6} },
    { key = "F5", color = {r = 0.1, g = 0.5, b = 0.5} },
    { key = "F6", color = {r = 0.1, g = 0.6, b = 0.4} },
    { key = "F7", color = {r = 0.1, g = 0.7, b = 0.3} },
    { key = "F8", color = {r = 0.1, g = 0.8, b = 0.2} },
    { key = "F9", color = {r = 0.1, g = 0.9, b = 0.1} },
    { key = "F10", color = {r = 0.1, g = 1.0, b = 0} },
    { key = "F11", color = {r = 0.2, g = 0.1, b = 0.9} },
    { key = "F12", color = {r = 0.3, g = 0.2, b = 0.8} },
    { key = "SHIFT-F1", color = {r = 0.4, g = 0.3, b = 0.7} },
    { key = "SHIFT-F2", color = {r = 0.5, g = 0.4, b = 0.6} },
    { key = "SHIFT-F3", color = {r = 0.6, g = 0.5, b = 0.5} },
    { key = "SHIFT-F4", color = {r = 0.7, g = 0.6, b = 0.4} },
    { key = "SHIFT-F5", color = {r = 0.8, g = 0.7, b = 0.3} },
    { key = "SHIFT-F6", color = {r = 0.9, g = 0.8, b = 0.2} },
    { key = "SHIFT-F7", color = {r = 1.0, g = 0.9, b = 0.1} },
    { key = "SHIFT-F8", color = {r = 1.0, g = 0.5, b = 0.0} },
    { key = "SHIFT-F9", color = {r = 0.9, g = 0.0, b = 0.1} },
    { key = "SHIFT-F10", color = {r = 0.8, g = 0.1, b = 0.2} },
    { key = "SHIFT-F11", color = {r = 0.7, g = 0.2, b = 0.3} },
    { key = "SHIFT-F12", color = {r = 0.6, g = 0.3, b = 0.4} },
    { key = "CTRL-F1", color = {r = 0.5, g = 0.4, b = 0.5} },
    { key = "CTRL-F2", color = {r = 0.4, g = 0.5, b = 0.6} },
    { key = "CTRL-F3", color = {r = 0.3, g = 0.6, b = 0.7} },
    { key = "CTRL-F4", color = {r = 0.2, g = 0.7, b = 0.8} },
    { key = "CTRL-F5", color = {r = 0.1, g = 0.8, b = 0.9} },
    { key = "CTRL-F6", color = {r = 0.0, g = 0.9, b = 1.0} },
    { key = "CTRL-F7", color = {r = 0.1, g = 0.2, b = 0.9} },
    { key = "CTRL-F8", color = {r = 0.2, g = 0.3, b = 0.8} },
    { key = "CTRL-F9", color = {r = 0.3, g = 0.4, b = 0.7} },
    { key = "CTRL-F10", color = {r = 0.4, g = 0.5, b = 0.8} },
    { key = "CTRL-F11", color = {r = 0.5, g = 0.6, b = 0.5} },
    { key = "CTRL-F12", color = {r = 0.6, g = 0.7, b = 0.4} },

    { key = "ALT-F1", color = {r = 0.9, g = 0.1, b = 0.2} },
    { key = "ALT-F2", color = {r = 0.8, g = 0.2, b = 0.3} },
    { key = "ALT-F3", color = {r = 0.7, g = 0.3, b = 0.4} },
    { key = "ALT-F5", color = {r = 0.5, g = 0.5, b = 0.6} },
    { key = "ALT-F6", color = {r = 0.4, g = 0.6, b = 0.7} },
    { key = "ALT-F7", color = {r = 0.3, g = 0.7, b = 0.8} },
    { key = "ALT-F8", color = {r = 0.2, g = 0.8, b = 0.9} },
    { key = "ALT-F9", color = {r = 0.1, g = 0.9, b = 1.0} },
    { key = "ALT-F10", color = {r = 0.0, g = 1.0, b = 0.9} },
    { key = "ALT-F11", color = {r = 0.1, g = 0.8, b = 0.7} },
    { key = "ALT-F12", color = {r = 0.2, g = 0.7, b = 0.6} },

}

-- List of spell IDs to bind
local spellIDList = {

    --RACIAL
    {265221},
    --RACIAL END

    --TRINKET
        --lägga till trinket id eller försöka skanna fram det och hardcodea 2 färger som blir trinket färger?
    --TRINKET END


    --PALADIN
    {255647}, -- Lights Judgement
    {24275},  -- Hammer of Wrath
    {633},    -- Lay on Hands
    {327193}, -- Moment of Glory
    {389539}, -- Sentinel
    {31850},  -- Ardent Defender
    {31935},  -- Avenger's Shield   FEL!
    {378974}, -- Bastion of Light
    {35395,204019,53595}, -- Crusader Strike & Blessed Hammer & Hammer of the Righteous
    {62124},  -- Hand of Reckoning
    {633},    -- Lay on Hands
    {85222},  -- Light of Dawn
    {115750}, -- Blinding Light
    {20473},  -- Holy Shock
    {4987},   -- Cleanse
    {633},    -- Lay on Hands
    {498},    -- Divine Protection
    {6940},   -- Blessing of Sacrifice
    {31821},  -- Aura Mastery
    {31850},  -- Ardent Defender
    {31884},  -- Avenging Wrath
    {31935},  -- Avenger's Shield
    {319952}, -- Consecration
    {375576}, -- Divine Toll
    {387174,427453}, -- Eye of Tyr
    {86659},  -- Guardian of Ancient Kings
    {465},    -- Devotion Aura
    {26573},  -- Consecration
    {31884},  -- Avenging Wrath
    {53600},  -- Shield of the Righteous
    {275779,20271}, -- Judgment
    {85673},  -- Word of Glory
    {853},    -- Hammer of Justice
    {96231},  -- Rebuke
    {432459, }, -- Holy Bulwark
    {432472}, -- Sacred Weapon
    {433583}, -- Rite of Adjuration
    {184662}, -- Shield of Vengeance
    {255937,427453}, -- Wake of Ashes
    {343527}, -- Execution Sentence
    {343721}, -- Final Reckoning
    {31884,231895}, -- Crusade
    {215661}, -- Justicar's Vengeance
    {337247}, -- Final Verdict
    {406646}, -- Templar Strikes
    {53385},  -- Divine Storm
    {184575}, -- Blade of Justice
    {198034}, -- Divine Hammer
    {231895}, -- Crusader
    {432472,432459}, --Holy Bulwark and Sacred Weapon
    {642},
    --END PALADIN

    --HUNTER
    {185358,193455}, -- Arcane Shot
    {109304}, -- Exhilaration
    {1543},   -- Flare
    {187650}, -- Freezing Trap
    {257284}, -- Hunter's Mark
    {136},    -- Mend Pet
    {982},    -- Revive Pet
    {883},    -- Call Pet 1
    {120360}, -- Barrage
    {147362}, -- Counter Shot
    {212431}, -- Explosive Shot
    {19577},  -- Intimidation
    {34026,259489},  -- Kill Command
    {320976}, -- Kill Shot
    {1513},   -- Scare Beast
    {187698}, -- Tar Trap
    {217200}, -- Barbed Shot
    {19574},  -- Bestial Wrath
    {321530}, -- Bloodshed
    {407412}, -- Bloody Frenzy
    {359844}, -- Call of the Wild
    {193455}, -- Cobra Shot
    {120679}, -- Dire Beast
    {2643},   -- Multi-Shot
    {430703}, -- Black Arrow
    {53351},  -- Kill Shot
    {56641},  -- Steady Shot
    {19434,392060},  -- Aimed Shot
    {186387}, -- Bursting Shot
    {342049}, -- Chimaera Shot
    {260402}, -- Double Tap
    {257620}, -- Multi-Shot
    {257044}, -- Rapid Fire
    {400456}, -- Salvo
    {288613}, -- Trueshot
    {260243}, -- Volley
    {259495}, -- Wildfire Bomb
    {360952}, -- Coordinated Assult
    {212436}, -- Butchery
    {186270}, -- Raptor Bite
    {190925}, -- Harpoon
    {186289}, -- Aspect of the Eagle
    {272651,388035,264667,53271},
    {120679}, -- Dire Beast
    {19801}, -- Tranquilizing Shot

    --ROUGE
    {703},    -- Garrote
    {51723},  -- Fan of Knives
    {185565}, -- Poisoned Knife
    {1943},   -- Rupture
    {385627}, -- Kingsbane
    {196819,32645,2098},  -- Envenom Dispatch Eviscerate
    {121471}, -- Shadow Blades
    {360194}, -- Deathmark
    {121411}, -- Crimson Tempest
    {5938},   -- Shiv
    {315496}, -- Slice and Dice
    {1856},   -- Vanish
    {36554},  -- Shadowstep
    {185311}, -- Crimson Vial
    {115191,1784}, -- Stealth
    {408},    -- Kidney Shot
    {8676,185438},   -- Ambush
    {2094},   -- Blind
    {1833},   -- Cheap Shot
    {5277},   -- Evasion
    {1966},   -- Feint
    {1766},   -- Kick
    {31224},  -- Cloak of Shadow
    {1776},   -- Gouge
    {385616}, -- Echoing Reprimand
    {382245}, -- Cold Blood
    {381623}, -- Thistle Tea
    {13750},  -- Adrenaline Rush
    {51690},  -- Killing Spree
    {271877}, -- Blade Rush
    {381989}, -- Keep it Rolling
    {196937}, -- Ghostly Strike
    {315341}, -- Between the Eyes
    {13877},  -- Blade Flurry
    {185763}, -- Pistol Shot
    {315508}, -- Roll the Bones
    {1752,193315,1329,53}, -- Sinister Strike Mutilate Backstab
    {197835}, -- Shuriken Storm
    {212283}, -- Symbols of Death
    {280719}, -- Secret Technique
    {185313}, -- Shadow Dance
    {381664}, -- Amplifying Poison
    {381637}, -- Atrophic Poison
    {5761}, -- Numbing Poison
    {315584}, -- Instant Poison
    --END ROUGE

    --MONK
    {205523,100784}, -- Blackout Kick
    {116841}, -- Tiger's Lust
    {390255}, -- Crackling Jade Lightning
    {107428}, -- Rising Sun Kick
    {322109}, -- Touch of Death
    {116670}, -- Vivify
    {322101}, -- Expel Harm
    {119381}, -- Leg Sweep
    {116705}, -- Spear Hand Strike
    {322729,101546}, -- Spinning Crane Kick
    {100780}, -- Tiger Palm
    {418359}, -- Press the Advantage
    {121253}, -- Keg Smash
    {119582}, -- Purifying Brew
    {115176}, -- Zen Meditation
    {322507}, -- Celestial Brew
    {115181}, -- Breath of Fire
    {116847}, -- Rushing Jade Wind
    {115399}, -- Black Ox Brew
    {123986}, -- Chi Burst
    {116844}, -- Ring of Peace
    {198898}, -- Song of Chi-Ji
    {175395}, -- Dampen Harm
    {122783}, -- Diffuse Magic
    {115315}, -- Summon Black Ox Statue
    {324312}, -- Clash
    {325153}, -- Exploding Keg
    {310454}, -- Weapons of Order
    {115078}, -- Paralysis
    {115203}, -- Fortifying Brew
    {387184}, -- Weapons of Order
    {116841}, -- Tiger's Lust
    {390255}, -- Crackling Jade Lightning
    {107428}, -- Rising Sun Kick
    {322109}, -- Touch of Death
    {116670}, -- Vivify
    {116844}, -- Ring of Peace
    {198898}, -- Song of Chi-Ji
    {119381}, -- Leg Sweep
    {116705}, -- Spear Hand Strike
    {100780}, -- Tiger Palm
    {122470}, -- Touch of Karma
    {123904}, -- Invoke Xuen, the White Tiger
    {392983}, -- Strike of the Windlord
    {101545}, -- Flying Serpent Kick
    {152175}, -- Whirling Dragon Punch
    {137639}, -- Storm, Earth, and Fire
    {113656}, -- Fists of Fury
    {388193}, -- Jadefire Stomp
    {324312}, -- Clash
    {122783}, -- Diffuse Magic
    {115175}, -- Soothing Mist
    {218164}, -- Detox
    {115078}, -- Paralysis
    {115203}, -- Fortifying Brew
    {132578}, -- Invoke Niuzao, the Black Ox
    --MONK END

    --DEATHKNIGHT
    {47528},    -- Mind Freeze
    {48707},    -- Anti-Magic Shell
    {51052},    -- Anti-Magic Zone
    {49576},    -- Death Grip
    {46585},    -- Raise Dead
    {49998},    -- Death Strike
    {45524},    -- Chains of Ice
    {43265,152280}, -- Death and Decay
    {48792},    -- Icebound Fortitude
    {343294},    -- Soul Reaper
    {49039},    -- Lichborne
    {47541},    -- Death Coil
    {47568},    -- Empower Rune Weapon
    {49143},    -- Frost Strike
    {279302},   -- Frostwyrm's Fury
    {49184},    -- Howling Blast
    {51271},    -- Pillar of Frost
    {49020},    -- Obliterate
    {196770},   -- Remorseless Winter
    {152279},   -- Breath of Sindragosa
    {305392},   -- Chill Streak
    {57330},    -- Horn of Winter
    {194913},   -- Glacial Advance
    {207230},   -- Frostscthe
    {383269},   -- Abomination Limb
    {221562},   -- Asphyxiate
    {327574},   -- Sacrificial Pact
    {207167},   -- Blinding Sleet
    {439843},   -- Reaper's Mark
    {48743},    -- Death Pact
    {316239,206930,433895,49020,85948},     -- Heart Strike & Vampiric Strike & Obliterate & Runestrike & Festering Strike
    {195182},   -- Marrowrend
    {50842},    -- Blood Boil
    {55233},    -- Vampiric Blood
    {49028},    -- Dancing Rune Weapon
    {108199},   -- Gorefiend's Grasp
    {194679},   -- Rune Tap
    {221699},   -- Blood Tap
    {206940},   -- Mark of Blood
    {219809},   -- Tombstone
    {206931},   -- Blooddrinker
    {274156},   -- Consumption
    {194844},   -- Bonestorm
    {195292},   -- Death's Caress
    {42650},    -- Army of the Dead
    {455395},   -- Raise Abomination
    {207289},   -- Unholy Assault
    {77575},    -- Outbreak
    {207317},   -- Epidemic
    {212552},   -- Wraith Walk
    {85948},    -- Festering Strike
    {458128},   -- Festering Scythe
    {55090},    -- Scourge Strike
    {207311},   -- Clawing Shadows
    {63560},    -- Dark Transformation
    {275699},   -- Apocalypse
    {390279},   -- Vile Contagion
    {49206},    -- Summon Gargoyle
    {274156},   -- Consumption
    --END DEATHKNIGHT

    --MAGE
    {1449},    -- Arcane Explosion
    {2139},    -- Counterspell
    {319836,108853},  -- Fire Blast
    {122},     -- Frost Nova
    {116,431044}, -- Frostbolt
    {120},     -- Cone of Cold
    {45438},   -- Ice Block
    {475},     -- Remove Curse
    {382440},  -- Shifting Power
    {55342},   -- Mirror Image
    {157981},  -- Blast Wave
    {212653},  -- Shimmer
    {108839},  -- Ice Floes
    {30451},   -- Arcane Blast
    {153626},  -- Arcane Orb
    {235450},  -- Prismatic Barrier
    {44425},   -- Arcane Barrage
    {414664},  -- Mass Invisibility
    {414660},  -- Mass Barrier
    {5143},    -- Arcane Missiles
    {365350},  -- Arcane Surge
    {205025},  -- Presence of Mind xxxxx helt fucked
    {66},      -- Invisibility
    {110959},  -- Greater Invisibility
    {31661},   -- Dragon's Breath
    {157980},  -- Supernova
    {113724},  -- Ring of Frost
    {157997},  -- Ice Nova
    {321507},  -- Touch of the Magi
    {12051},   -- Evocation
    {1459},    -- Arcane Intellect
    {363653},  -- Stop AM
    {11366},   -- Pyroblast
    {257541},  -- Phoenix Flames
    {2948},    -- Scorch
    {190319},  -- Combustion
    {153561},  -- Meteor
    {235313},  -- Blazing Barrier
    {133},     -- Fireball
    {2120},    -- Flamestrike
    {30455},   -- Ice Lance
    {84714},   -- Frozen Orb
    {44614},   -- Flurry
    {153595},  -- Comet Storm
    {12472},   -- Icy Veins
    {199786},  -- Glacial Spike
    {205021},  -- Ray of Frost
    {11426},   -- Ice Barrier
    {235219},  -- Cold Snap
    {190356},  -- Blizzard
    {108553},  -- Ice Block
    {12051},   -- Evocation

    --MAGE END

    --WARRIOR
    {6674,6673},    -- Battle Shout
    {1715},    -- Hamstring
    {1464},    -- Slam
    {57755},   -- Heroic Throw
    {100},     -- Charge
    {6552},    -- Pummel
    {34428},   -- Victory Rush
    {386208},  -- Defensive Stance
    {2565},    -- Shield Block
    {23922},   -- Shield Slam
    {18499},   -- Berserker Rage
    {3411},    -- Intervene
    {107570},  -- Storm Bolt
    {6544},    -- Heroic Leap
    {202168},  -- Impending Victory
    {5246},    -- Intimidating Shout
    {6343,435608,435222},  -- Thunder Blast
    {46968},   -- Shockwave
    {97462},   -- Rallying Cry
    {23920},   -- Spell Reflection
    {383762},  -- Bitter Immunity
    {384110},  -- Wrecking Throw
    {64382},   -- Shattering Throw
    {384100},  -- Berserker Shout
    {12323},   -- Piercing Howl
    {384318},  -- Thunderous Roar
    {376079},  -- Champions Spear
    {12294},   -- Mortal Strike
    {7384},    -- Overpower
    {118038},  -- Die by the Sword
    {190456},  -- Ignore Pain
    {167105},  -- Colossus Smash
    {260643},  -- Skullsplitter
    {772,394062},     -- Rend
    {228920},  -- Ravager
    {262161},  -- Warbreaker
    {436358},  -- Demolish
    {107574,401150},  -- Avatar
    {23881},   -- Bloodthirst
    {85288},   -- Raging Blow
    {184364},  -- Enraged Regeneration
    {184367},  -- Rampage
    {1719},    -- Recklessness
    {385059},  -- Odyn's Fury
    {315720},  -- Onslaught
    {446035,227847},  -- Bladestorm
    {355},     -- Taunt
    {1680,190411,845}, -- Whirlwind & Cleave
    {163201,280735},  -- Execute
    {6572},    -- Revenge
    {1160},    -- Demoralizing Shout
    {20243},   -- Devastate
    {12975},   -- Last Stand
    {1161},    -- Challenging Shout
    {386071},  -- Disuptive Shout
    {871},     -- Shield Wall
    {392966,385952},  -- Shield Charge
    --END WARRIOR

    --PRIEST
    {17},      -- Power Word: Shield
    {19236},   -- Desperate Prayer
    {8092,450983},    -- Mind Blast
    {8122},    -- Psychic Scream
    {528},     -- Dispel Magic
    {453},     -- Mind Soothe
    {586},     -- Fade
    {32379},   -- Shadow Word: Death
    {2061},    -- Flash Heal
    {10060},   -- Power Infusion
    {589},     -- Shadow Word: Pain
    {120644},  -- Halo
    {122121},  -- Divine Star
    {21562},   -- Power Word: Fortitude
    {139},     -- Renew
    {213634},  -- Purify Disease
    {33076},   -- Prayer of Mending
    {132157},  -- Holy Nova
    {108920},  -- Void Tendrils
    {15286},   -- Vampiric Embrace
    {32375},   -- Mass Dispel
    {108968},  -- Void Shift
    {373481},  -- Power Word: Life
    {335467},  -- Devouring Plague
    {47585},   -- Dispersion
    {15487},   -- Silence
    {64044},   -- Psychic Horror
    {457042,205385},  -- Shadow Crash
    {391109},  -- Dark Ascension
    {228260,205448,231688},  -- Void Eruption & Void Bolt
    {263165},  -- Void Torrent
    {200174},  -- Mindbender
    {34433,451235},   -- Shadowfiend
    {585,15407,391403,73510},   -- Mind Flay & Mind Flay: insanity
    {34914},   -- Vampiric Touch
    --END PRIEST

    --SHAMAN
    {188196,452201}, -- Lightning Bolt Tempest
    {305483}, -- Lightning Lasso
    {188389}, -- Flame Shock
    {370},    -- Purge
    {318038}, -- Flametongue Weapon
    {196840,210714}, -- Frost Shock
    {462854}, -- Skyfury
    {51886},  -- Cleanse Spirit
    {51490},  -- Thunderstrom
    {32182},  -- Heroism
    {198103}, -- Earth Elemental
    {57994},  -- Wind Shear
    {51505},  -- Lava Burst
    {188443}, -- Chain Lightning 
    {974},    -- Earth Shield
    {108281}, -- Ancestral Guidance
    {378081}, -- Nature's Swiftness
    {73899,17364,115356},  -- Stormstrike
    {33757},  -- Windfury Weapon
    {60103},  -- Lava Lash
    {117014}, -- Elemental Blast
    {342240}, -- Ice Strike
    {333974}, -- Fire Nova
    {197214}, -- Sundering
    {384352}, -- Doom Winds
    {187874}, -- Crash Lightning
    {375982}, -- Primordial Wave
    {51533},  -- Feral Spirit
    {114051}, -- Ascendance
    {192106}, -- Lightning Shield
    {974},    -- Earth Shield
    {191634}, -- Stormkeeper
    {198067,192249}, -- Storm Elemental
    {443454}, -- Elemental Blast: Overload
    {8042},   -- Earth Shock
    {79206},    -- Spiritwalker's Grace
    {61882,462620}, -- Earthquake
    {470411}, -- Chain Harvest
    {114050}, -- Ascendance
    {470194},

    --END SHAMAN

    -- DEMON HUNTER
    {228477,344862,162794,201427,452436}, -- Chaos Strike, Annihilation
    {198013}, -- Eye Beam
    {188499,210152}, -- Blade Dance
    {191427}, -- Metamorphosis (Havoc)
    {185123,442294}, -- Throw Glaive
    {258920}, -- Immolation Aura
    {196718}, -- Darkness
    {198589}, -- Blur
    {198793}, -- Vengeful Retreat
    {196555}, -- Netherwalk
    {211053}, -- Fel Barrage
    {232893}, -- Felblade
    {203555}, -- Demon Blades
    {206491}, -- Nemesis
    {179057}, -- Chaos Nova
    {342817}, -- Glaive Tempest
    {258860}, -- Essence Break
    {275144}, -- Unbound Chaos
    {323639}, -- The Hunt
    {263642,344859,203782}, -- Fracture
    {212084,452486}, -- Fel Devastation Fel Desolation
    {189110,344865,195072}, -- Infernal Strike Fel Rush
    {204596,452490}, -- Sigil of Flame Sigil of Doom
    {202137}, -- Sigil of Silence
    {202138}, -- Sigil of Chains
    {207684}, -- Sigil of Misery
    {203720}, -- Demon Spikes
    {204021}, -- Fiery Brand
    {187827,191427}, -- Metamorphosis (Vengeance)
    {178740}, -- Immolation Aura
    {232893}, -- Felblade
    {263648}, -- Soul Barrier
    {247454,452437}, -- Spirit Bomb
    {320341}, -- Bulk Extraction
    {306830}, -- Elysian Decree
    {211881}, -- Fel Eruption
    {202137}, -- Sigil of Silence
    {370965}, -- The Hunt
    {210152}, -- Death Sweep
    {390163}, -- Sigil of Spite
    {207407}, -- Soul Carver
    {258860}, -- Essence Break
    --452486
    -- END DEMON HUNTER

    -- WARLOCK
    {172,348},     -- Corruption Immolate
    {686,29722},     -- Shadow Bolt Incinerate
    {689},     -- Drain Life 
    {698},     -- Ritual of Summoning
    {702},     -- Curse of Weakness
    {710},     -- Banish
    {755},     -- Health Funnel
    {980},     -- Agony
    {1120},    -- Drain Soul
    {1454},    -- Life Tap
    {30108},   -- Unstable Affliction
    {30283},   -- Shadowfury
    {48181},   -- Haunt
    {324536},  -- Malefic Rapture
    {333889},  -- Fel Domination
    {17962},   -- Conflagrate
    {116858},  -- Chaos Bolt
    {80240,200546},  -- Havoc Bane of Havoc
    {5740},  -- Rain of Fire
    {152108},  -- Cataclysm
    {366222},  -- Summon Sayaad
    {196447},  -- Channel Demonfire
    {105174},  -- Hand of Gul'dan
    {30146,112870},  -- Summon Felguard Summon Wrathguard
    {264178},  -- Demonbolt
    {196277},  -- Implosion
    {267171}, -- Demonic Strength
    {104316},  -- Call Dreadstalkers
    {267211},  -- Bilescourge Bombers
    {111898}, -- Grimoire: Felguard
    {267217}, -- Nether Portal
    {264130}, -- Power Siphon
    {265187}, -- Summon Demonic Tyrant
    {264119,455476,455449}, -- Summon Vilefiend
    {386833}, -- Guillotine
    {264130},   -- Power Siphon
    {385899},    -- Soulburn
    {89766,347008,119914,119898}, -- Axe Toss
    {17877}, -- Shadowburn
    --WARLOCK END

    --DRUID
{5487},    -- Bear Form
{22812},   -- Barkskin
{5221},    -- Shred
{33917},   -- Mangle
{213764,106785,213771},  -- Swipe
{1126},    -- Mark of the Wild
{106832,77758,106830},   -- Thrash
{8921},    -- Moonfire
{22842},   -- Frenzied Regeneration
{6807,441605},    -- Maul
{192081},  -- Ironfur
{50334,102558},   -- Berserk Incarnation
{106839}, -- Skull Bash 
{61336 },  -- Survival Instincts
{2908},  -- Soothe
{204066}, -- Lunar Beam
{200851}, -- Rage of the sleeper
{319454}, -- Heart of the Wild
{8936}, -- Regrowth
{93402},    --
{5176,190984},  --
{205636},   --
{191034},   --
{383410,194223},    --
{194153},   --
{391528},   --
{441605}, -- Ravage
{108238}, -- Renewal 
{400254},   --
{80313},    --
--DRUID END

    --EVOKER
    {361469},  -- Living Flame
    {355936},  -- Emerald Blossom
    {357208},  -- Fire Breath
    {359073},  -- Dream Flight
    {368432},  -- Hover
    {357210,403631},  -- Deep Breath Breath of Eons
    {374251},  -- Cauterizing Flame
    {374227},  -- Zephyr
    {374348},  -- Renewing Blaze
    {370665},  -- Rescue
    {375087},  -- Dragonrage
    {375443},  -- Eternity Surge
    {375982},  -- Time Spiral
    {376788},  -- Dream Projection
    {377509},  -- Rewind
    {378441},  -- Time Dilation
    {378464},  -- Verdant Embrace
    {409311},  -- Prescience
    {395152},  -- Ebon Might
    {356995,395160},  -- Disintegrate Eruption
    {403265},  -- Bronze Attunement
    {361021},  -- Sense Power
    {404977},  -- Time Skip
    {396286},  -- Upheaval
    {360827},  -- Blistering Scales
    {403264},  -- Black Attunement
    {370553},  -- Tip the Scales
    {362969},  -- Azure Strike
    {370452}, -- Shattering Star
    {355913}, -- Emerald Blossom
    {351338}, -- Quell
    {357221}, -- Fire Breath
    {357211}, -- Living Flame
    {390386}, -- Hover
    {364342}, -- Deep Breath
    {358385}, -- Eternity Surge
    {369459}, -- Blessing of the Bronze
    {406732}, -- Time Spiral
    {374251}, -- Cauterizing Flame
    {363916}, -- Rescue
    {412710}, -- Zephyr
    {408233}, -- Dream Projection
    {365585}, -- Rewind
    {360995}, -- Dream Flight
    {360806}, -- Spiritbloom
    {372048}, -- Oppressing Roar
    {374968}, -- Time Spiral
    {368847}, -- Firestorm

    --EVOKER END



}



-- Hooker.lua

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")

-- Table to store spell colors by ID
local spellIDColors = {}

-- Function to normalize spell names
local function NormalizeSpellName(spellName)
    return spellName:lower():gsub("%s+", "_")
end

-- Function to bind spells to keys and colors dynamically
local function BindSpellsToKeysAndColors()
    local keyIndex = 1

    -- Ensure spellIDList is not nil
    if not spellIDList then
        print("Error: Spellist not found. Contact support!!")
        return
    end

    -- Iterate over the list of spell IDs
    for _, spellIDs in ipairs(spellIDList) do
        local primarySpellID = spellIDs[1]
        local spellInfo = C_Spell.GetSpellInfo(primarySpellID)
        local spellName = spellInfo and spellInfo.name

        -- Check if the primary spell or any secondary spell is known
        local isSpellKnown = IsSpellKnown(primarySpellID)
        if not isSpellKnown then
            for i = 2, #spellIDs do
                if IsSpellKnown(spellIDs[i]) then
                    isSpellKnown = true
                    primarySpellID = spellIDs[i]
                    spellInfo = C_Spell.GetSpellInfo(primarySpellID)
                    spellName = spellInfo and spellInfo.name
                    break
                end
            end
        end

        if spellName and isSpellKnown then
            if keyIndex <= #keyColorList then
                local keyColor = keyColorList[keyIndex]
                local bindingSet = SetBindingSpell(keyColor.key, spellName)
                if bindingSet then
                    for _, spellID in ipairs(spellIDs) do
                        spellIDColors[spellID] = keyColor.color
                        dprint("|cff00ff00Stored color for spell ID:", spellID, "with color:", keyColor.color.r, keyColor.color.g, keyColor.color.b)
                    end
                    dprint("|cff00ff00Successfully bound " .. keyColor.key .. " to spell: " .. spellName .. " (ID: " .. primarySpellID .. ") with color: " .. table.concat({keyColor.color.r, keyColor.color.g, keyColor.color.b}, ", "))
                    keyIndex = keyIndex + 1
                else
                    dprint("|cffff0000Failed to bind " .. keyColor.key .. " to spell: " .. spellName)
                end
            else
                for _, spellID in ipairs(spellIDs) do
                    spellIDColors[spellID] = keyColorList[keyIndex - 1].color
                    dprint("Stored color for spell ID:", spellID, "with color:", keyColorList[keyIndex - 1].color.r, keyColorList[keyIndex - 1].color.g, keyColorList[keyIndex - 1].color.b)
                end
                dprint("|cffff0000No more keys available for binding. Assigned color to spell: " .. spellName .. " with color: " .. table.concat({keyColorList[keyIndex - 1].color.r, keyColorList[keyIndex - 1].color.g, keyColorList[keyIndex - 1].color.b}, ", "))
            end

        end
    end
end

-- Create a frame to represent the square
local squareFrame = CreateFrame("Frame", "SpellColorSquare", UIParent)
squareFrame:SetSize(2, 2)  -- Set the size of the square
squareFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 2, 0)  -- Position the square at (2, 0)
squareFrame.texture = squareFrame:CreateTexture(nil, "BACKGROUND")
squareFrame.texture:SetAllPoints(squareFrame)
squareFrame.texture:SetColorTexture(0, 0, 0)  -- Default color (black)

local function UpdateSquareColor(spellID)
    -- Check if the player is channeling a spell
    local isChanneling = UnitChannelInfo("player") ~= nil

    -- Check if the player is empowering a spell
    local name, _, _, _, _, _, _, _, _, isEmpowering = UnitCastingInfo("player")
    local isEmpoweringSpell = isEmpowering == true

    if isChanneling or isEmpoweringSpell then
        dprint("|cff008080Player is channeling or empowering a spell. Square color will be set to black.")
        squareFrame.texture:SetColorTexture(0, 0, 0)  -- Set color to black
        return
    end

    local color = spellIDColors[spellID]
    if color then
        squareFrame.texture:SetColorTexture(color.r, color.g, color.b)
    else
        dprint("|cffff0000No color found for spell ID:", spellID)  -- Debug print
        squareFrame.texture:SetColorTexture(0, 0, 0)  -- Default color (black)
    end
end

local lastActionID = nil

local function PrintSpellID(action, wait, depth, slot)
    if action and slot.actionID ~= lastActionID then
        dprint("|cff00ff00Next spell ID: " .. action .. " (ID: " .. slot.actionID .. ")")
        UpdateSquareColor(slot.actionID)
        lastActionID = slot.actionID
    elseif not action then
        dprint("|cffff0000No action predicted.")
        UpdateSquareColor(nil)
        lastActionID = nil
    end
end

local function HookHekili()
    if not Hekili then
        print("|cffff0000Hekili addon not found.")
        return
    end

    -- Enable Hekili debug mode
    Hekili.DB.profile.Debug = true

    local originalGetNextPrediction = Hekili.GetNextPrediction

    function Hekili:GetNextPrediction(dispName, packName, slot)
        local action, wait, depth = originalGetNextPrediction(self, dispName, packName, slot)
        if slot.index == 1 then  -- Check if the slot index is 1 (first slot)
            PrintSpellID(action, wait, depth, slot)
        end
        return action, wait, depth
    end

    print("|cff00ff00Hekili hooked successfully.")
end

-- Register event listener for channeling and empowering spells
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
frame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")
frame:RegisterEvent("UNIT_SPELLCAST_EMPOWER_STOP")
frame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
frame:RegisterEvent("UNIT_SPELLCAST_EMPOWER_START")
frame:SetScript("OnEvent", function(self, event, unit)
    if event == "PLAYER_LOGIN" or event == "PLAYER_SPECIALIZATION_CHANGED" then
        BindSpellsToKeysAndColors()
        HookHekili()
    end
    if (event == "UNIT_SPELLCAST_CHANNEL_STOP" or event == "UNIT_SPELLCAST_EMPOWER_STOP" or event == "UNIT_SPELLCAST_CHANNEL_START" or event == "UNIT_SPELLCAST_EMPOWER_START") and unit == "player" then
        UpdateSquareColor(lastActionID)
    end
end)
    HookHekili()