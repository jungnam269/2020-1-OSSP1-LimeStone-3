extends Node

onready var time_label = get_node("time_label")
onready var game_timer = get_node("game_timer")

func _process(delta):
	time_label.set_text(str(int(game_timer.get_time_left())))

