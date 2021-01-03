extends AnimatedSprite
class_name Player

const Projectile = preload("res://game/projectile/Projectile.tscn")

# Walking speed of the player
const speed = 10

# The direction that the player is facing
var direction: Vector2 = Vector2(1,0)



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
	
	if d.x == 0 and d.y == 0:
		play('default')
	else:
		play('walk')
		direction = d.normalized()
	
	position += d.normalized() * speed

	if Input.is_key_pressed(KEY_SPACE): _handle_bow()


func _handle_bow() -> void:
	if $Bow.is_playing(): return
	$Bow.shoot_bow()
	var projectile: Projectile = Projectile.instance()
	projectile.init(25 * direction)
	projectile.position = position
	get_parent().add_child(projectile)
