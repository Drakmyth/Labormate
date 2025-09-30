Labormate = {
    ADDON_NAME = "Labormate"
}

Labormate.Settings = {
    ShowMinimapButton = Labormate.ADDON_NAME .. "_ShowMinimapButton"
}

Labormate.Events = {
    ADDON_LOADED = "ADDON_LOADED",                   -- (addOnName)
    PLAYER_ENTERING_WORLD = "PLAYER_ENTERING_WORLD", -- (isInitialLogin, isReloadingUi)
    PLAYER_REGEN_DISABLED = "PLAYER_REGEN_DISABLED", -- no params
    PLAYER_REGEN_ENABLED = "PLAYER_REGEN_ENABLED",   -- no params
    SKILL_LINES_CHANGED = "SKILL_LINES_CHANGED",     -- no params
}

Labormate.Professions = {
    ALCHEMY = 171,
    BLACKSMITHING = 164,
    COOKING = 185,
    ENCHANTING = 333,
    ENGINEERING = 202,
    FISHING = 356,
    HERBALISM = 182,
    INSCRIPTION = 773,
    JEWELCRAFTING = 755,
    LEATHERWORKING = 165,
    MINING = 186,
    SKINNING = 393,
    TAILORING = 197,
    ARCHAEOLOGY = 794
}

Labormate.SkillLineIds = {
    [Labormate.Professions.ALCHEMY] = {
        [LE_EXPANSION_CLASSIC] = 2485,
        [LE_EXPANSION_BURNING_CRUSADE] = 2484,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2483,
        [LE_EXPANSION_CATACLYSM] = 2482,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2481,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2480,
        [LE_EXPANSION_LEGION] = 2479,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2478,
        [LE_EXPANSION_SHADOWLANDS] = 2750,
        [LE_EXPANSION_DRAGONFLIGHT] = 2823,
        [LE_EXPANSION_WAR_WITHIN] = 2871
    },
    [Labormate.Professions.BLACKSMITHING] = {
        [LE_EXPANSION_CLASSIC] = 2477,
        [LE_EXPANSION_BURNING_CRUSADE] = 2476,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2475,
        [LE_EXPANSION_CATACLYSM] = 2474,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2473,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2472,
        [LE_EXPANSION_LEGION] = 2454,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2437,
        [LE_EXPANSION_SHADOWLANDS] = 2751,
        [LE_EXPANSION_DRAGONFLIGHT] = 2822,
        [LE_EXPANSION_WAR_WITHIN] = 2872
    },
    [Labormate.Professions.COOKING] = {
        [LE_EXPANSION_CLASSIC] = 2548,
        [LE_EXPANSION_BURNING_CRUSADE] = 2547,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2546,
        [LE_EXPANSION_CATACLYSM] = 2545,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2544,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2543,
        [LE_EXPANSION_LEGION] = 2542,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2541,
        [LE_EXPANSION_SHADOWLANDS] = 2752,
        [LE_EXPANSION_DRAGONFLIGHT] = 2824,
        [LE_EXPANSION_WAR_WITHIN] = 2873
    },
    [Labormate.Professions.ENCHANTING] = {
        [LE_EXPANSION_CLASSIC] = 2494,
        [LE_EXPANSION_BURNING_CRUSADE] = 2493,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2492,
        [LE_EXPANSION_CATACLYSM] = 2491,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2489,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2488,
        [LE_EXPANSION_LEGION] = 2487,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2486,
        [LE_EXPANSION_SHADOWLANDS] = 2753,
        [LE_EXPANSION_DRAGONFLIGHT] = 2825,
        [LE_EXPANSION_WAR_WITHIN] = 2874
    },
    [Labormate.Professions.ENGINEERING] = {
        [LE_EXPANSION_CLASSIC] = 2506,
        [LE_EXPANSION_BURNING_CRUSADE] = 2505,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2504,
        [LE_EXPANSION_CATACLYSM] = 2503,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2502,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2501,
        [LE_EXPANSION_LEGION] = 2500,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2499,
        [LE_EXPANSION_SHADOWLANDS] = 2755,
        [LE_EXPANSION_DRAGONFLIGHT] = 2827,
        [LE_EXPANSION_WAR_WITHIN] = 2875
    },
    [Labormate.Professions.FISHING] = {
        [LE_EXPANSION_CLASSIC] = 2592,
        [LE_EXPANSION_BURNING_CRUSADE] = 2591,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2590,
        [LE_EXPANSION_CATACLYSM] = 2589,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2588,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2587,
        [LE_EXPANSION_LEGION] = 2586,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2585,
        [LE_EXPANSION_SHADOWLANDS] = 2754,
        [LE_EXPANSION_DRAGONFLIGHT] = 2826,
        [LE_EXPANSION_WAR_WITHIN] = 2876
    },
    [Labormate.Professions.HERBALISM] = {
        [LE_EXPANSION_CLASSIC] = 2556,
        [LE_EXPANSION_BURNING_CRUSADE] = 2555,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2554,
        [LE_EXPANSION_CATACLYSM] = 2553,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2552,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2551,
        [LE_EXPANSION_LEGION] = 2550,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2549,
        [LE_EXPANSION_SHADOWLANDS] = 2760,
        [LE_EXPANSION_DRAGONFLIGHT] = 2832,
        [LE_EXPANSION_WAR_WITHIN] = 2877
    },
    [Labormate.Professions.INSCRIPTION] = {
        [LE_EXPANSION_CLASSIC] = 2514,
        [LE_EXPANSION_BURNING_CRUSADE] = 2513,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2512,
        [LE_EXPANSION_CATACLYSM] = 2511,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2510,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2509,
        [LE_EXPANSION_LEGION] = 2508,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2507,
        [LE_EXPANSION_SHADOWLANDS] = 2756,
        [LE_EXPANSION_DRAGONFLIGHT] = 2828,
        [LE_EXPANSION_WAR_WITHIN] = 2878
    },
    [Labormate.Professions.JEWELCRAFTING] = {
        [LE_EXPANSION_CLASSIC] = 2524,
        [LE_EXPANSION_BURNING_CRUSADE] = 2523,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2522,
        [LE_EXPANSION_CATACLYSM] = 2521,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2520,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2519,
        [LE_EXPANSION_LEGION] = 2518,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2517,
        [LE_EXPANSION_SHADOWLANDS] = 2757,
        [LE_EXPANSION_DRAGONFLIGHT] = 2829,
        [LE_EXPANSION_WAR_WITHIN] = 2879
    },
    [Labormate.Professions.LEATHERWORKING] = {
        [LE_EXPANSION_CLASSIC] = 2532,
        [LE_EXPANSION_BURNING_CRUSADE] = 2531,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2530,
        [LE_EXPANSION_CATACLYSM] = 2529,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2528,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2527,
        [LE_EXPANSION_LEGION] = 2526,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2525,
        [LE_EXPANSION_SHADOWLANDS] = 2758,
        [LE_EXPANSION_DRAGONFLIGHT] = 2830,
        [LE_EXPANSION_WAR_WITHIN] = 2880
    },
    [Labormate.Professions.MINING] = {
        [LE_EXPANSION_CLASSIC] = 2572,
        [LE_EXPANSION_BURNING_CRUSADE] = 2571,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2570,
        [LE_EXPANSION_CATACLYSM] = 2569,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2568,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2567,
        [LE_EXPANSION_LEGION] = 2566,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2565,
        [LE_EXPANSION_SHADOWLANDS] = 2761,
        [LE_EXPANSION_DRAGONFLIGHT] = 2833,
        [LE_EXPANSION_WAR_WITHIN] = 2881
    },
    [Labormate.Professions.SKINNING] = {
        [LE_EXPANSION_CLASSIC] = 2564,
        [LE_EXPANSION_BURNING_CRUSADE] = 2563,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2562,
        [LE_EXPANSION_CATACLYSM] = 2561,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2560,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2559,
        [LE_EXPANSION_LEGION] = 2558,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2557,
        [LE_EXPANSION_SHADOWLANDS] = 2762,
        [LE_EXPANSION_DRAGONFLIGHT] = 2834,
        [LE_EXPANSION_WAR_WITHIN] = 2882
    },
    [Labormate.Professions.TAILORING] = {
        [LE_EXPANSION_CLASSIC] = 2540,
        [LE_EXPANSION_BURNING_CRUSADE] = 2539,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 2538,
        [LE_EXPANSION_CATACLYSM] = 2537,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 2536,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 2535,
        [LE_EXPANSION_LEGION] = 2534,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 2533,
        [LE_EXPANSION_SHADOWLANDS] = 2759,
        [LE_EXPANSION_DRAGONFLIGHT] = 2831,
        [LE_EXPANSION_WAR_WITHIN] = 2883
    },
    [Labormate.Professions.ARCHAEOLOGY] = {
        [LE_EXPANSION_CLASSIC] = 794,
        [LE_EXPANSION_BURNING_CRUSADE] = 794,
        [LE_EXPANSION_WRATH_OF_THE_LICH_KING] = 794,
        [LE_EXPANSION_CATACLYSM] = 794,
        [LE_EXPANSION_MISTS_OF_PANDARIA] = 794,
        [LE_EXPANSION_WARLORDS_OF_DRAENOR] = 794,
        [LE_EXPANSION_LEGION] = 794,
        [LE_EXPANSION_BATTLE_FOR_AZEROTH] = 794,
        [LE_EXPANSION_SHADOWLANDS] = 794,
        [LE_EXPANSION_DRAGONFLIGHT] = 794,
        [LE_EXPANSION_WAR_WITHIN] = 794
    }
}

function Labormate_OnAddonCompartmentClick(addOnName, button)
    -- print("testing: " .. button)
    Labormate.minimapButton:OnClick(button)
end

local function getDefaultDB()
    return {
        selectedExpansion = LE_EXPANSION_CLASSIC,
        isOpen = false,
        showMinimapButton = true,
    }
end

local function onSettingChanged(setting, value)
    if setting:GetVariable() == Labormate.Settings.ShowMinimapButton then
        Labormate.minimapButton:SetShown(value)
    end
end

local function initializeSettingsPanel()
    Labormate.SettingsCategory = Settings.RegisterVerticalLayoutCategory(Labormate.ADDON_NAME)

    do
        local name = "Show Minimap Button"
        local variable = Labormate.Settings.ShowMinimapButton
        local variableKey = "showMinimapButton"
        local variableTbl = LabormateDB
        local defaultValue = true

        local setting = Settings.RegisterAddOnSetting(Labormate.SettingsCategory, variable, variableKey, variableTbl,
            type(defaultValue), name, defaultValue)
        setting:SetValueChangedCallback(onSettingChanged)

        local tooltip = "Attach a button to the minimap to open and close the Labormate window."
        Settings.CreateCheckbox(Labormate.SettingsCategory, setting, tooltip)
    end

    Settings.RegisterAddOnCategory(Labormate.SettingsCategory)
end

local function registerSlashCommands()
    SLASH_LABORMATE1 = "/labormate"
    SlashCmdList[string.upper(Labormate.ADDON_NAME)] = function()
        Labormate.mainFrame:Toggle()
    end
end

local eventFrame = CreateFrame("Frame", "LabormateGlobalEventFrame", UIParent)
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addOnName = ...
        if addOnName == Labormate.ADDON_NAME then
            LabormateDB = LabormateDB or getDefaultDB()

            initializeSettingsPanel()
            registerSlashCommands()
        end
    end
end)
eventFrame:RegisterEvent(Labormate.Events.ADDON_LOADED)
