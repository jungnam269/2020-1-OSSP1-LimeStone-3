# 세번째 엔딩 결과 화면
tool
extends Button


func _on_PlayAgainButton3_button_up() -> void:
	get_tree().change_scene("res://src/Screens/MainScreen.tscn")
