extends Button

onready var stage3sound = $AudioStreamPlayer2D2

var d = 0

func _on_Stage3SoundButton_button_up():
	d += 1
	
	if d%2 != 0 :
		stage3sound.stop()
		
	elif d%2 == 0 :
		stage3sound.play()
