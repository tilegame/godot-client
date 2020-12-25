extends Control

export(NodePath) var lineEditPath
export(NodePath) var richTextLabelPath
export(NodePath) var httpRequestPath

onready var lineEdit: LineEdit = get_node(lineEditPath)
onready var richTextLabel: RichTextLabel = get_node(richTextLabelPath)
onready var httpRequest: HTTPRequest = get_node(httpRequestPath)


func _on_Button_pressed():
	var url = lineEdit.text
	var err := httpRequest.request(url)
	var txt: String
	
	match err:
		OK:
			txt = "Request Succesfully Created"
		ERR_BUSY:
			txt = "Client is still processing the previous request."
		ERR_INVALID_PARAMETER:
			txt = "The request must be in a valid URL format."
		ERR_CANT_CONNECT:
			txt = "Unable to connect to host."
		ERR_UNCONFIGURED:
			txt = "The Client had an internal error due to being improperly configured."
			push_error("HTTP Request failed due to ERR_UNCONFIGURED")
		_:
			txt = "The Client had an unknown internal error."
			push_error("HTTP Request had an unknown and undocumented error! Error Code:" + str(err))

	richTextLabel.clear()
	_addSectionToOutput("CLIENT STATUS", txt)


func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var outputs = {
		"RESULT": str(result),
		"RESPONSE CODE": str(response_code),
		"HEADERS": str(headers.join("\n")),
		"BODY": body.get_string_from_utf8()
	}
	for title in outputs:
		_addSectionToOutput(title, outputs[title])


func _addSectionToOutput(title: String, content: String):
	richTextLabel.append_bbcode("[u]" + title + "[/u]")
	richTextLabel.push_indent(1)
	richTextLabel.add_text("\n" + content + "\n\n")
	richTextLabel.pop()
