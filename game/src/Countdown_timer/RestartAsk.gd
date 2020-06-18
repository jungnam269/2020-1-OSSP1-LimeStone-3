extends Control


func _ready():
	pass 

func _on_RestartAskbtY_button_up()-> void:
	get_tree().change_scene("res://src/Sceens/MainScreen.tscn")


func _on_RestartAskbtN_button_up() -> void:
	get_tree().change_scene("res://src/Levels/Stage1.tscn")
