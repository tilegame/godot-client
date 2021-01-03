extends Sprite
class_name Projectile

# Life Distance is number of pixels the projectile will move before it vanishes
var life_distance: int = 1000

# Velocity Vector, in pixels, of the projectile.
var velocity_vector: Vector2 = Vector2(25, 0)

# the number of pixels traveled by the projectile so far.
var _distance_traveled: int = 0


func init(_velocity_vector):
	velocity_vector = _velocity_vector
	rotation = velocity_vector.angle() + PI/2
	print(velocity_vector, "angle:", velocity_vector.angle(), "  rotation:", rotation)

func _physics_process(delta: float) -> void:
	position += velocity_vector
	_distance_traveled += velocity_vector.length()
	if _distance_traveled >= life_distance:
		queue_free()
