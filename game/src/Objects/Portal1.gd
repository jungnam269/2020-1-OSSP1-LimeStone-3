tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene

func _on_body_entered(body: PhysicsBody2D) -> void:
	teleport()
	
func _get_configuration_warning() -> String:
	return "The next scene property can't be empty" if not next_scene else ""
	
func teleport() -> void :
	Score.updatestage()
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	var count = Score.getscore()
	var stage = Score.getstageno()
	if stage == 4:
		Score.resetstage()
	
	if count >= 29 && stage >= 3:
		get_tree().change_scene("res://src/Screens/EndingScreen3.tscn")
	else :
		get_tree().change_scene_to(next_scene)

