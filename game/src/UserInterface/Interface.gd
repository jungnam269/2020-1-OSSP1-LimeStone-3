extends Control

signal immunity_changed(immunity)
signal enemies_gohome(count)

func _on_Player_immunedamage(immunity):
	get_node("TextureProgress").value = immunity

func _on_Enemy_enemies_gohome(count):
	get_node("Score_counter/Score").text = str(count*19000)+" 점"
