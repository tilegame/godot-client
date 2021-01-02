extends AnimatedSprite
class_name Player

const speed = 10


func _handle_bow() -> void:
	if $Bow.is_playing(): return
	$Bow.shoot_bow()


func _physics_process(delta: float) -> void:
	
	var d := Vector2()
	
	if Input.is_action_pressed('right'):
		d.x += 1
		flip_h = 0
		$Bow.flip_h = 0
		$Bow.position.x = abs($Bow.position.x)
	
	if Input.is_action_pressed('left'):
		d.x -= 1
		flip_h = 1
		$Bow.flip_h = 1
		$Bow.position.x = abs($Bow.position.x) * -1
	
	if Input.is_action_pressed('down'):
		d.y += 1
	
	if Input.is_action_pressed('up'):
		d.y -= 1
	
	if d != Vector2(0,0):
		play('walk')
	else:
		play('default')
	
	position += d.normalized() * speed

	if Input.is_key_pressed(KEY_SPACE): _handle_bow()


