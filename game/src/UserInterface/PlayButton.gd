tool
extends Button

#2D 인스펙터에서 연결될 다음 씬 설정
export(String, FILE) var next_scene_path: = ""

func _on_button_up() -> void:
	get_tree().change_scene(next_scene_path)

func _get_configuration_warning() -> String:
	return "next_scene_path 설정해야함" if next_scene_path == "" else ""
