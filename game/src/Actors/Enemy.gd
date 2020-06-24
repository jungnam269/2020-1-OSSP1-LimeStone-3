extends "res://src/Actors/Actor.gd"
 #적 구현 예시 1. 플레이어를 쫒아오는 

onready var hpbar = get_node("HPbar") #클릭 시 hp바 출력

signal enemykilled
signal changescore
var hp = 100
var current_hp
var damage = 50
var isattack = false
export var movespeed = 3
export var enemymod = 0

onready var timer = get_node("DamageTimer")

func _ready():	#적은 플레이어 시야에 출현하기 전에는 작동하지 않는다.
	set_physics_process(false)
	current_hp=hp
	
func _physics_process(delta: float) -> void:	#화면에 출현한 적은 플레이어쪽으로 일정한 속도로 움직
	if isattack == false:
		if enemymod == 0:
			chase(delta)
		if enemymod == 1:
			passby(delta)

func _process(delta): #기본 상태에서는 stop 에 해당하는 스프라이트를 재생
	if isattack == false:
		if enemymod == 0:
			movement()
		if enemymod == 1:
			movement2()
	if isattack == true:
		Damaged(damage*delta)

func chase(delta):
	var direction = (get_node('../Player').position - position).normalized()
	var motion = direction * speed.x * delta * movespeed
	if get_node('../Player').position.x - position.x > 10 || get_node('../Player').position.x - position.x < -10:
		position += motion
		
func passby(delta):
	var direction = (get_node('../Player').position).normalized()
	var motion = direction * speed.x * delta
	position += motion
	
func movement():
	if get_node('../Player').position.x - position.x > 0: #플레이어보다 왼쪽일때
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = false	#스프라이트를 그대로 재생
	elif get_node('../Player').position.x - position.x < 0: #플레이어보다 오른쪽일대
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = true #스프라이트를 반대로 뒤집어 재생
		
	else:
		$AnimatedSprite.play("stand")
		
func movement2():
	$AnimatedSprite.play("move1")
	$AnimatedSprite.flip_h = false	#스프라이트를 그대로 재생

func _on_Area2D_area_entered(area):
	$HPbar.visible = true
	print("Oh!")
	isattack = true
	$AnimatedSprite.play("zapp")
	$AudioStreamPlayer2D.play()
	
func _on_Area2D_area_exited(area):
	$HPbar.visible = false
	isattack = false
	print("Oh!2")
	if current_hp <= 0: #마지막 공격을 받고나서 리소스 출력하고 죽음
		gohome()

func Damaged(damage): #적이 공격받을 때 hp감소 & 시각화
	current_hp -= damage
	get_node("HPbar").value=int(current_hp)
	
func gohome():
	hpbar.hide()
	emit_signal("enemykilled")
	emit_signal("changescore")
	timer.set_wait_time(1)
	timer.start()
	set_physics_process(false)
	set_process(false)
	$DamageArea/CollisionShape2D.disabled = true
	$AnimatedSprite.flip_h = false
	$AnimatedSprite.play("Dead")
	yield(timer, "timeout")
	queue_free()
	
func disapeared():
	hpbar.hide()
	queue_free()
	
	
func _on_Player_infever():
	damage = 150

func _on_Player_outfever():
	damage = 50


func _on_Enemy_enemykilled():
	pass # Replace with function body.
