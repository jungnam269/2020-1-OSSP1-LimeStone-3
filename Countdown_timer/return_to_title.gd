extends Control

func _ready():
	
	hide()
func _on_Button_pressed():
	get_tree().change_scene("res://Continue.tscn")
