extends "res://src/Actors/Actor.gd"
 #적 구현 예시 1. 플레이어를 쫒아오는 

var hp = 100
signal mouseon
signal mouseoff

func _ready() -> void:	#적은 플레이어 시야에 출현하기 전에는 작동하지 않는다.
	set_physics_process(false)
	
func _physics_process(delta: float) -> void:	#화면에 출현한 적은 플레이어쪽으로 일정한 속도로 움직
	var direction = (get_node('../Player').position - position).normalized()
	var motion = direction * speed.x * delta
	if get_node('../Player').position.x - position.x > 10 || get_node('../Player').position.x - position.x < -10:
		position += motion

func _process(delta): #기본 상태에서는 stop 에 해당하는 스프라이트를 재생
	if get_node('../Player').position.x - position.x > 0: #플레이어보다 왼쪽일때
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = false	#스프라이트를 그대로 재생
	elif get_node('../Player').position.x - position.x < 0: #플레이어보다 오른쪽일대
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = true #스프라이트를 반대로 뒤집어 재생
		
	else:
		$AnimatedSprite.play("stand")
		
func _on_Area2D_area_entered(area):
	print("Oh!")
	set_process(false)
	set_physics_process(false)
	$AnimatedSprite.play("zapp")
	$AudioStreamPlayer2D.play()
	
func _on_Area2D_area_exited(area):
	print("Oh!2")
	set_process(true)
	set_physics_process(true)
	die()
	
func die():
	queue_free()
