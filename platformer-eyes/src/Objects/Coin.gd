extends Area2D

onready var anim_player : AnimationPlayer = get_node("AnimationPlayer")

func _read() -> void :
	anim_player.play("bouncing")
	return

func _on_Coin_body_entered(body : PhysicsBody2D) -> void:
	anim_player.play("fade_out")
	return
