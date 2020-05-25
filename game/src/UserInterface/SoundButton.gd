extends Button

onready var sound = $AudioStreamPlayer 

func _on_Sound_Button_pressed() -> void:
	sound.stop()
