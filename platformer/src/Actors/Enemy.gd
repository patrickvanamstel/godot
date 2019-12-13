extends "res://src/Actors/Actor.gd"

func _ready() -> void:
	_velocity.x = -speed.x
	set_physics_process(false)
	return

# Signals
func _on_StompDetector_body_entered(body : PhysicsBody2D):
	# Needed when dis function is triggered to soon
	# Second time around it is fine
	if body == null : 
		return
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()
	return


# Call backs on frame level 
func _physics_process(delta: float) -> void:
	_velocity.y = _velocity.y + gravity * delta
	if is_on_wall():
		_velocity.x *= -1
	_velocity.y = move_and_slide(_velocity , FLOOR_NORMAL).y

