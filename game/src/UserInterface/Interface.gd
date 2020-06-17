extends Control

var count = 0

func _on_Player_immunedamage(immunity) -> void:
	get_node("TextureProgress").value = immunity

func _on_Enemy_changescore():
	count = count +1
	get_node("Score_counter/Score").text = str(count*19000)+" 점"
