extends "res://ui/menus/pages/main_menu.gd"

var tran_i: int = 0

func init():
	.init()
	if tran_i == 0:
		_auto_load_translation(ModLoader.UNPACKED_DIR + "SCGM-i18n/translations/")
	version_label.text += "\n" + tr("LOADED_NUMBER_TEXT") + String(tran_i)

func _auto_load_translation(trans_dir, recursion = true):
	var dir = Directory.new()
	if dir.open(trans_dir) == OK:
		dir.list_dir_begin()
		var file_name:String = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir() and file_name.get_extension() == "translation":
				ModLoader.add_translation_from_resource(trans_dir + file_name)
				tran_i += 1
			elif recursion == true:
				if file_name != "." and file_name != "..":
					_auto_load_translation(trans_dir + file_name + "/", true)
			file_name = dir.get_next()
