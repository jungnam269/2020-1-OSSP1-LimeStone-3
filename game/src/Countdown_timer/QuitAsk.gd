extends Control


func _ready():
	pass 


func _on_QuitAskbtY_button_up():
	get_tree().quit()

func _on_QuitAskbtN_button_up():
	get_tree().change_scene("")#원래씬이라 연결
