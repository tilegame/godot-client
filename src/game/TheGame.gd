extends Node2D

onready var player: Player = $Player
onready var mouseClickAnimation: MouseClickAnimation = $MouseClickAnimation

var last_clicked_position: Vector2 = Vector2()
var new_click_has_occurred: bool = false
var counter = 0

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() == true:
		last_clicked_position = get_global_mouse_position()
		new_click_has_occurred = true

func _physics_process(delta: float) -> void:
	if new_click_has_occurred == true:
		print("click at ", last_clicked_position)
		mouseClickAnimation.global_position = last_clicked_position
		mouseClickAnimation.run_click_animation()
		new_click_has_occurred = false
		last_clicked_position = Vector2()
