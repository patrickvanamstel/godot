tool
extends Area2D

onready var anim_player : AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene

# Callbacks
func _on_Portal2D_body_entered(body):
	teleport()
	return


func _get_configuration_warning() -> String:
	return "The Next Scene property can't be empty" if not next_scene else ""


# Helper code
func teleport() -> void:
	anim_player.play("fade_to_black")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


