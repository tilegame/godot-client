extends LineEdit

func _ready() -> void:
	if OS.has_feature("JavaScript"):	
		connect("focus_entered", self, "js_text_entry")

func js_text_entry() -> void:
	text = JavaScript.eval("window.prompt('%s', '%s');" % ["Enter Text: ", text])
	release_focus()
