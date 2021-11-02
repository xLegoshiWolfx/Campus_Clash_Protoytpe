extends KinematicBody2D

var speed : int = 200
var velocity : Vector2 = Vector2()

onready var sprite : Sprite = get_node("res://PNG/Character_idle.png")

func _on_ready():
	get_node("res://Scene/Currency Scene.tscn")
	
func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
		
	move_and_slide(velocity, Vector2.UP)
	
func _on_Button_pressed():
	get_tree().change_scene("res://Scene/Main_Menu.tscn")
