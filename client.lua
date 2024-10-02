local identifier = "radio_app_frankfurt"

CreateThread(function()
	while GetResourceState("lb-phone") ~= "started" do
		Wait(500)
	end

	local function AddApp()
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

		if not added then
			print("Could not add app:", errorMessage)
		end
	end

	AddApp()

	AddEventHandler("onResourceStart", function(resource)
		if resource == "lb-phone" then
			AddApp()
		end
	end)
end)

RegisterNUICallback("joinRadio", function(data, cb)
	local channel = tonumber(data.channel)

	print("Entering channel: " .. channel)
	exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
	exports["pma-voice"]:setVoiceProperty("micClicks", true)
	exports["pma-voice"]:setRadioChannel(channel)
	cb({})
end)
