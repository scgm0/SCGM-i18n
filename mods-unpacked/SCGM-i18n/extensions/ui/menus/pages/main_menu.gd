extends "res://ui/menus/pages/main_menu.gd"

var tran_i: int = 1

func init() -> void:
	.init()
	if tran_i == 1:
		var dir = Directory.new()
		for dir_name in ModLoaderStore.mod_data:
			var mod: ModData = ModLoaderStore.mod_data[dir_name]
			ModLoaderLog.info(mod, "i18n")
			var translation_path = ModLoaderMod.get_unpacked_dir() + "SCGM-i18n/translations/" + dir_name
			if dir.dir_exists(translation_path):
				prints("尝试加载翻译:", translation_path)
				_auto_load_translation(translation_path + "/")
	version_label.text += "\n" + tr("LOADED_NUMBER_TEXT") + str(tran_i)

func _auto_load_translation(trans_dir, recursion = true) -> void:
	var dir = Directory.new()
	if dir.open(trans_dir) == OK:
		dir.list_dir_begin()
		var file_name: String = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir() and file_name.get_extension() == "po":
				ModLoaderMod.add_translation_from_resource(trans_dir + file_name)
				tran_i += 1
			elif recursion == true:
				if file_name != "." and file_name != "..":
					_auto_load_translation(trans_dir + file_name + "/", true)
			file_name = dir.get_next()
