extends Node2D

export (int) var speed = 80.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Walk_right");
	pass 

func _physics_process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_just_pressed("ui_right"):
		velocity.x += 1
		get_node("Sprite").set_flip_h(false)
		$AnimationPlayer.play("Walk_right");
	
	elif Input.is_action_just_pressed("ui_left"):
		velocity.x -= 1
		get_node("Sprite").set_flip_h(true)
		$AnimationPlayer.play("Walk_right");
		
	elif Input.is_action_just_pressed("ui_up"):
		$AnimationPlayer.play("Running_right");
	
