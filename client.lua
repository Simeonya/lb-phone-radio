local identifier = "radio_app_simeon"

CreateThread(function()
    while GetResourceState("lb-phone") ~= "started" do
        Wait(500)
    end

    local added, errorMessage = exports["lb-phone"]:AddCustomApp({
        identifier = identifier,
        name = Config.name,
        description = Config.description,
        developer = Config.developer,
        defaultApp = Config.defaultApp,
        size = Config.size,
        price = Config.price,
        images = Config.images,
        ui = Config.ui,
        icon = Config.icon,
    })

    if not added then
        print("Error adding app: " .. errorMessage)
    end

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-phone" then
            exports["lb-phone"]:AddCustomApp({
                identifier = identifier,
                name = Config.name,
                description = Config.description,
                developer = Config.developer,
                defaultApp = Config.defaultApp,
                size = Config.size,
                price = Config.price,
                images = Config.images,
                ui = Config.ui,
                icon = Config.icon,
            })
        end
    end)
end)

RegisterNUICallback("joinradio", function(data, cb)
    local channel = tonumber(data.channel)

    if channel then
        print("Entering channel: " .. channel)
        exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
        exports["pma-voice"]:setVoiceProperty("micClicks", true)
        exports["pma-voice"]:setRadioChannel(channel)
        cb({ "Successful" })
    else
        cb({ "Error: Invalid channel number" })
    end
end)

RegisterNUICallback("quitradio", function(data, cb)
    print("Leaving radio channel")
    exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
    exports["pma-voice"]:setVoiceProperty("micClicks", false)
    exports["pma-voice"]:setRadioChannel(0)
    cb({ "Successful" })
end)