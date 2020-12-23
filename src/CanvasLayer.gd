extends CanvasLayer

func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func _on_Button_pressed():
	var url = $LineEdit.text
	$HTTPRequest.request(url)

func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var body_string := body.get_string_from_utf8()
	var json := JSON.parse(body_string)
	$RichTextLabel.text = body_string
	print(json.result)
