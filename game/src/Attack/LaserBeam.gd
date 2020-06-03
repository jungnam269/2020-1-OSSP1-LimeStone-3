extends Node2D

const MAX_LENGTH = 200

signal attacked

onready var beam = $Beam
onready var end = $End
onready var rayCast2D = $RayCast2D
onready var Player = get_node('../../Player/Eyezone')

func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	var angle = get_angle_to(get_global_mouse_position())
	rayCast2D.cast_to = mouse_position
	if rayCast2D.is_colliding():
		end.global_position = rayCast2D.get_collision_point()
	else:
		end.global_position = rayCast2D.cast_to
	
	beam.rotation = angle
	beam.region_rect.end.x = end.position.length()
