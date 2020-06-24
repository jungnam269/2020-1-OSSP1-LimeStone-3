extends Button


onready var sound = $AudioStreamPlayer

var a = 0

func _on_BGMOFFButton_pressed() -> void:
	
	a += 1

	if a%2 != 0 :
		sound.stop()

	elif a%2 == 0 :
		sound.play()
