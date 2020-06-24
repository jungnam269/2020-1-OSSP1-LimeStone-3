extends Button

onready var stagesound = $AudioStreamPlayer2D2

var b = 0


func _on_StageSoundButton_button_up():
	b += 1
	
	if b%2 != 0 :
		stagesound.stop()
		
	elif b%2 == 0 :
		stagesound.play()
