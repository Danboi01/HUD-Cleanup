local HUD_ELEMENTS = {
    0,  -- HUD
    1,  -- HUD_WANTED_STARS
    2,  -- HUD_WEAPON_ICON
    3,  -- HUD_CASH
    4,  -- HUD_MP_CASH
    5,  -- HUD_MP_MESSAGE
    6,  -- HUD_VEHICLE_NAME
    7,  -- HUD_AREA_NAME
    8,  -- HUD_VEHICLE_CLASS
    9,  -- HUD_STREET_NAME
    10, -- HUD_HELP_TEXT
    11, -- HUD_FLOATING_HELP_TEXT_1
    12, -- HUD_FLOATING_HELP_TEXT_2
    13, -- HUD_CASH_CHANGE
    14, -- HUD_RETICLE
    15, -- HUD_SUBTITLE_TEXT
    17, -- HUD_SAVING_GAME
    18, -- HUD_GAME_STREAM
    141 -- MAX_SCRIPTED_HUD_COMPONENTS
}

local function UpdatePlayerData()
    local playerName = GetPlayerName(PlayerId())
    local playerId = GetPlayerServerId(PlayerId())
    local textEntry = string.format(
        "~b~[~w~Server #1~b~] ~w~| ~b~Player ID~w~: %d ~w~| ~b~Player Name~w~: %s",
        playerId, playerName
    )
    AddTextEntry('FE_THDR_GTAO', textEntry)
end

CreateThread(function()
    UpdatePlayerData()
end)

CreateThread(function()
    while true do
        Wait(0) 
        for _, hud in ipairs(HUD_ELEMENTS) do
            HideHudComponentThisFrame(hud)
        end
    end
end)
