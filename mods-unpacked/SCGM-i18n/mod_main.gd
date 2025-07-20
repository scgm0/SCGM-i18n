extends Node

const MOD_NAME = "i18n"
var dir = ""

func _init():
	dir = ModLoaderMod.get_unpacked_dir() + "SCGM-i18n/"
	ModLoaderLog.info("Init", MOD_NAME)
	ModLoaderMod.install_script_extension(dir + "extensions/ui/menus/pages/main_menu.gd")

func _ready():
	ModLoaderLog.info("Ready", MOD_NAME)
	var OverlayTranslation = load(dir + "overlay_translation.gd")
	OverlayTranslation.new("res://resources/translations/translations.zh_Hans_CN.translation", dir + "translations/zh.po")
	OverlayTranslation.new("res://resources/translations/translations.en.translation", dir + "translations/en.po")
