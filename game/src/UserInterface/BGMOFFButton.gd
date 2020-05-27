extends Button


onready var sound = $AudioStreamPlayer


func _on_BGMOFFButton_pressed() -> void:
	sound.stop()
