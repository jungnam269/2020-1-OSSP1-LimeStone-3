extends Control


func _ready():
	pass 

func _on_RestartAskbtY_button_up():
	get_tree().change_scene("res://src/Sceens/MainScreen.tscn")


func _on_RestartAskbtN_button_up():
	get_tree().change("")##
