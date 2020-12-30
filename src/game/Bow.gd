extends AnimatedSprite

func _ready() -> void:
	connect("animation_finished", self, "_on_animation_finished")
	visible = false

func _on_animation_finished() -> void:
	visible = false
	stop()
	frame = 0

func shoot_bow() -> void:
	visible = true
	play("default")
