extends Node2D

onready var player: Player = $Player

var last_clicked_position: Vector2 = Vector2()
var new_click_has_occurred: bool = false
var counter = 0

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() == true:
		last_clicked_position = event.position
		new_click_has_occurred = true

func _physics_process(delta: float) -> void:
	if new_click_has_occurred == true:
		print("click at ", last_clicked_position)
		counter += 1
		print("counter is at: ", counter)
		new_click_has_occurred = false
		last_clicked_position = Vector2()
