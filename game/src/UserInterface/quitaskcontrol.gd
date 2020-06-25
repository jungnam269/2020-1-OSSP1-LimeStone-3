extends Control

func _ready():
	hide()


func _on_Exitbtn_button_up():
	visible = not visible


func _on_quitN_button_up():
	visible = not visible


func _on_quitY_button_up():
	get_tree().quit()
