extends Actor

func _process(delta):	#스프라이트 적용과 버튼 입력에 따라 스프라이트를 좌우 반전 시킴
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.stop()
	
	

func _physics_process(delta: float) -> void: #움직이는 물리 구현
	var direction: = get_direction()
	velocity = speed * direction
	velocity = move_and_slide(velocity)
	
func get_direction() -> Vector2: #입력을 통한 방향이동
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 1.0
	)
