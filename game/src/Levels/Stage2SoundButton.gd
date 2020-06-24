extends Button

onready var stage2sound = $AudioStreamPlayer2D2

var c = 0

func _on_Stage2SoundButton_button_up():
	c += 1
	
	if c%2 != 0 :
		stage2sound.stop()
		
	elif c%2 == 0 :
		stage2sound.play()
