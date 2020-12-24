extends HTTPRequest

export(NodePath) var urlLineEdit
export(NodePath) var outputRichTextLabel

onready var lineEdit := get_node(urlLineEdit)
onready var richTextLabel := get_node(outputRichTextLabel)

func _on_Button_pressed():
	var url = lineEdit.text
	request(url)

func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var body_string := body.get_string_from_utf8()
	var json := JSON.parse(body_string)
	richTextLabel.text = body_string
	print(json.result)
