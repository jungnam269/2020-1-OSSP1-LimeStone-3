extends Actor

signal immunedamage(immunity)
signal infever
signal outfever

export var fevermode = false
var laser = preload("res://src/Attack/LaserBeam.tscn")
var laser2 = preload("res://src/Attack/LaserBeam2.tscn")
var facingRight = true
var isattack = false
var damage = 20

func _ready():
	emit_signal("immunedamage",immunity)

func _process(delta):	#스프라이트 적용과 버튼 입력에 따라 스프라이트를 좌우 반전 시킴
	normalphysics(delta)
	if isattack :
		Damaged(damage*delta)
	if immunity > 100 :
		fevermode = true
		get_node("Camera2D2/Interface/TextureProgress").set_modulate(Color.red)
		emit_signal("infever")
		
	else :
		fevermode = false
		emit_signal("outfever")
		get_node("Camera2D2/Interface/TextureProgress").set_modulate(Color.white)

func normalphysics(delta):
	if not facingRight:
		$Eyezone.position.x = -$Eyezone.position.x
	
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = false
		facingRight = true
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = true
		facingRight = false
	else:
		$AnimatedSprite.stop()
	
	if Input.is_action_pressed("attack") && get_node("LaserBeam") == null :
		if fevermode == false :
			var laser_shoot_instance = laser.instance()
			add_child(laser_shoot_instance)
			laser_shoot_instance.position = $Eyezone.position	
			$AudioStreamPlayer2D.play()
		if fevermode == true : #피버모드일
			var laser_shoot_instance = laser2.instance()
			add_child(laser_shoot_instance)
			laser_shoot_instance.position = $Eyezone.position	
			$AudioStreamPlayer2D.play()
		
	if Input.is_action_just_released("attack") && get_node("LaserBeam") != null:
		$AudioStreamPlayer2D.stop()
		get_node("LaserBeam").queue_free()

func _physics_process(delta: float) -> void: #움직이는 물리 구현
	var direction: = get_direction()
	velocity = speed * direction
	velocity = move_and_slide(velocity)
	
func get_direction() -> Vector2: #입력을 통한 방향이동
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 1.0
	)

func Damaged(damage): #적이 공격받을 때 hp감소 & 시각화
	immunity -= damage
	updateimmune()
	
func _on_Immune_area_entered(area):
	isattack = true
	$AnimatedSprite.set_modulate(Color.red)
	print("checking %s", immunity) #test
	emit_signal("immunedamage",immunity)


func _on_Immune_area_exited(area):
	isattack = false
	$AnimatedSprite.set_modulate(Color.white)

func _on_Enemy_enemykilled():
	print("ok?")
	immunity += 20
	updateimmune()
	
func updateimmune():
	get_node("Camera2D2/Interface/TextureProgress").value=int(immunity)
