# 두번째 엔딩 결과 화면
tool
extends Button



func _on_PlayAgainButton2_button_up() -> void:
	get_tree().change_scene("res://src/Sceens/MainScreen.tscn")
