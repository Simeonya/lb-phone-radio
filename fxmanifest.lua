fx_version("cerulean")
games({ "gta5" })

author("Simeonya")
description("Adding radio app for lb-phone")

version("1.0.0")

client_scripts({
	"@es_extended/imports.lua",
	"client.lua",
	"config.lua"
})
files({
	"ui/**/*",
})

ui_page({ "ui/index.html" })

dependencies({
	"pma-voice",
	"es_extended",
	"lb-phone",
})
