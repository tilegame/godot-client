extends Control

export(NodePath) var lineEditPath
export(NodePath) var richTextLabelPath
export(NodePath) var httpRequestPath

onready var lineEdit: LineEdit = get_node(lineEditPath)
onready var richTextLabel: RichTextLabel = get_node(richTextLabelPath)
onready var httpRequest: HTTPRequest = get_node(httpRequestPath)

func _on_Button_pressed():
	var url = lineEdit.text
	httpRequest.request(url)

func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var body_string := body.get_string_from_utf8()
	var json := JSON.parse(body_string)
	richTextLabel.text = body_string
	print(json.result)
