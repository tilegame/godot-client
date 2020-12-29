extends AnimatedSprite

const speed = 10

func _physics_process(delta: float) -> void:
	var d := Vector2()
	if Input.is_action_pressed('right'):
		d.x += 1
		flip_h = 0
	if Input.is_action_pressed('left'):
		d.x -= 1
		flip_h = 1
	if Input.is_action_pressed('down'):
		d.y += 1
	if Input.is_action_pressed('up'):
		d.y -= 1
	
	if d != Vector2(0,0):
		play('walk')
	else:
		play('default')
	position += d.normalized() * speed

