extends KinematicBody2D

export (int) var speed = 100.0

func _physics_process(delta):
	var velocity = Vector2.ZERO
	velocity.x = 0
	
	if Input.is_action_pressed("command+right"):
		velocity.x += (speed * 3)
		get_node("Sprite").set_flip_h(false)
		$AnimationPlayer.play("Run")
	
	elif Input.is_action_pressed("command+left"):
		velocity.x -= (speed * 3)
		get_node("Sprite").set_flip_h(true)
		$AnimationPlayer.play("Run")
		
	elif Input.is_action_pressed("ui_right"):
		velocity.x += speed
		get_node("Sprite").set_flip_h(false)
		$AnimationPlayer.play("Walking_right")
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		get_node("Sprite").set_flip_h(true)
		$AnimationPlayer.play("Walking_right")
		
	
	
	else:
		$AnimationPlayer.play("Idle")
		
	move_and_slide(velocity)
