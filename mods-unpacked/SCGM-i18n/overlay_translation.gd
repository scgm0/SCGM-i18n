extends Translation

var old;
var new;

func _init(old_path, new_path):
	old = load(old_path)
	new = load(new_path)
	locale = old.locale
	TranslationServer.remove_translation(old)
	TranslationServer.add_translation(self)

func _get_message(src_message):
	var src = new.get_message(src_message)
	return src if src != "" else old.get_message(src_message)
