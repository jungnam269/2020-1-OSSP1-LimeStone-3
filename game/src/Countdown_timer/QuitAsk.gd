extends Control


func _ready():
	pass 


func _on_QuitAskbtY_button_up():
	get_tree().quit()

func _on_QuitAskbtN_button_up():
	get_tree().paused= not get_tree().paused
	visible= not visible
	pass
