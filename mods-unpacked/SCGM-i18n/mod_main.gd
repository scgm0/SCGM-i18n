extends Node

const MOD_NAME = "i18n"

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MOD_NAME)
	modLoader.install_script_extension(modLoader.UNPACKED_DIR + "SCGM-i18n/extensions/ui/menus/pages/main_menu.gd")

func _ready():
	ModLoaderUtils.log_info("Ready", MOD_NAME)
	var OverlayTranslation = load(ModLoader.UNPACKED_DIR + "SCGM-i18n/overlay_translation.gd")
	OverlayTranslation.new("res://resources/translations/translations.zh.translation", ModLoader.UNPACKED_DIR + "SCGM-i18n/translations/zh.po")
	OverlayTranslation.new("res://resources/translations/translations.en.translation", ModLoader.UNPACKED_DIR + "SCGM-i18n/translations/en.po")
