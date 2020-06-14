extends Control

func _on_Player_immunedamage(immunity) -> void:
	get_node("TextureProgress").value = immunity

func _on_Enemy_enemies_gohome(count) -> void:
	get_node("Score_counter/Score").text = str(count*19000)+" 점"
