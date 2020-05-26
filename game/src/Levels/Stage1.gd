extends Node2D

#타이머 구현
var DisplayValue = 100

onready var timer = get_node("Interface/TimerLabel/Timer")

func _ready():
	timer.set_wait_time(1)
	timer.start()


func _on_Timer_timeout() :
	DisplayValue -= 1
