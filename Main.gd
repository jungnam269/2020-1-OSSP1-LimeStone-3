extends Node2D

var DisplayValue =0

onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()

func TimeTimeout():
	DisplayValue+= 1
