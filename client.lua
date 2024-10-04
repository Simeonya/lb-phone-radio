local identifier = "radio_app_frankfurt"

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
		ui = GetCurrentResourceName() .. "/ui/index.html",
		icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/assets/icon.png",
	})

	AddApp()

	AddEventHandler("onResourceStart", function(resource)
		if resource == "lb-phone" then
			AddApp()
		end
	end)
end)

RegisterNUICallback("joinradio", function(data, cb)
	local channel = tonumber(data.channel)

	print("Entering channel: " .. channel)
	exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
	exports["pma-voice"]:setVoiceProperty("micClicks", true)
	exports["pma-voice"]:setRadioChannel(channel)
	cb({ "Successful" })
end)

RegisterNUICallback("quitradio", function(data, cb)
	print("quitradio")
	exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
	print("radioEnabled set")
	exports["pma-voice"]:setVoiceProperty("micClicks", false)
	print("micClicks set")
	exports["pma-voice"]:setRadioChannel(0)
	print("RadioChannel set to 0")
	cb({ "Successful" })
end)
