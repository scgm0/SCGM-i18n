extends Node

const MOD_NAME = "i18n"

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MOD_NAME)
	modLoader.install_script_extension(modLoader.UNPACKED_DIR + "SCGM-i18n/extensions/ui/menus/pages/main_menu.gd")
	
func _ready():
	ModLoaderUtils.log_info("Ready", MOD_NAME)
	TranslationServer.remove_translation(load("res://resources/translations/translations.zh.translation"))
	ModLoader.add_translation_from_resource(ModLoader.UNPACKED_DIR + "SCGM-i18n/translations/i18n.zh.translation")
	ModLoader.add_translation_from_resource("res://resources/translations/translations.zh.translation")
