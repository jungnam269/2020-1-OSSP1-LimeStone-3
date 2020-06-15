extends Control


func _ready():
	pass 



func _on_RestartAskbtN_pressed():
	get_tree().change_scene("res://src/Levels/Stage1.tscn")


func _on_RestartAskbtY_pressed() ->void:
	get_tree().change_scene("res://src/Levels/Stage1.tscn")
