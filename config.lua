Config({
	-- The name of the app
	name = "Funk",

	-- The description of the app
	description = "Eine simple Funk-App",

	-- The developer of the app
	developer = "Simeonya",

	-- If the app is a default app
	defaultApp = false,

	-- The size of the app
	size = 1000,

	-- The price of the app
	price = 100,

	-- The images of the app
	images = {},

	-- The UI of the app
	ui = GetCurrentResourceName() .. "/ui/index.html",

	-- The icon of the app
	icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/assets/icon.png",

	-- The version of the app
	version = "1.0.0",
})
