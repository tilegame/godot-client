extends TabContainer

onready var player := $Game/Viewport/Node2D/Player

func _ready() -> void:
	connect("tab_changed", self, "on_tab_change")
	
func on_tab_change(tab: int) -> void:
	var is_game_tab_selected := get_tab_title(tab) == "Game"
	player.set_physics_process(is_game_tab_selected)
	
	
