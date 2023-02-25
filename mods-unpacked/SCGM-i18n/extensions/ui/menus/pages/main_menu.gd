extends "res://ui/menus/pages/main_menu.gd"

var mod_dir
var trans_dir
var tran_i

func init():
	.init()
	mod_dir = ModLoader.UNPACKED_DIR + "SCGM-i18n/"
	trans_dir = mod_dir + "translations/"
	tran_i = 0
	_auto_load_translation(trans_dir)
	version_label.text += "\n已加载本地化文件数量: " + String(tran_i)

func _auto_load_translation(trans_dir, recursion = true):
	var dir = Directory.new()
	if dir.open(trans_dir) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir() and file_name.get_extension() == "translation":
				ModLoader.add_translation_from_resource(trans_dir + file_name)
				tran_i += 1
			elif recursion == true:
				_auto_load_translation(trans_dir + file_name + "/", true)
			file_name = dir.get_next()
