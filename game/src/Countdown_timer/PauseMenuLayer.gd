extends Control


func _ready():

	hide()
	

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_Pausegameinbtn_pressed():
	print("Button Pressed")
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	

func _on_Resumebtn_pressed():
	print("Resume Button Pressed")
	get_tree().paused= not get_tree().paused
	visible= not visible
	pass



func _on_Exitbtn_button_up():
	get_tree().change_scene("res://src/Countdown_timer/QuitAsk.tscn")

func _on_Restartbtn_button_up():
	get_tree().change_scene("res://src/Countdown_timer/RestartAsk.tscn")

