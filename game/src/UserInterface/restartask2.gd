extends Control

func _ready():
	hide()



func _on_Restartbtn_button_up():
	visible = not visible


func _on_restartY_button_up():
	get_tree().change_scene("res://src/Screens/MainScreen.tscn")
	get_tree().paused = false

func _on_restartN_button_up():
	visible = not visible
	
