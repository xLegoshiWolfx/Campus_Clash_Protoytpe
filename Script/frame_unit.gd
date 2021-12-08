extends KinematicBody2D
class_name Unit

#Allowing us to have two types of unit
export var unit_owner := 0
export var unit_health = 100

# take control of the select and deselected function
var selected = false

#The position of the target that can be move
var movement_target = Vector2.ZERO
#The velocity
var velocity = Vector2.ZERO
# THe speed that the target is moving at
var speed = 150
var target_max = 1

var moving_unit = load("res://Unit/medievalUnit_01.png")


#Attacking
var attack_range = 25
var attack_target = null
var possible_targets = []
var health = 10
var damage_amount = 5

var facing_forward = true

#A constant to take care of the unit movement
const move_unit = 0.5
#The last position of the target
var last_position



onready var stop_timer = $StopTimer
onready var state_machine = $UnitSM
onready var sprite = $AnimatedSprite
onready var collision_shape = $CollisionShape2D

func _ready():
	movement_target = position


func move_to_target(delta, tar):
	velocity = Vector2.ZERO
	velocity = position.direction_to(tar) * speed
	if get_slide_count() and stop_timer.is_stopped():
		stop_timer.start()
		last_position = position
	velocity = move_and_slide(velocity)


func select():
	selected = true
	$Selected.visible = true
	
func deselect():
	selected = false
	$Selected.visible = false

func _on_VisionRange_body_entered(body):
	if body.is_in_group("unit"):
		if body.unit_owner != unit_owner:
			possible_targets.append(body)
			body.take_damage(damage_amount)
			
func _on_VisionRange_body_exited(body):
	if possible_targets.has(body):
		possible_targets.erase(body)
		
		
		
#sorting array in ascending order
func _compare_distance(target_a, target_b):
	if position.distance_to(target_a.position) < position.distance_to(target_b.position):
		return true
	else:
		return false
	
#		
func closest_enemy() -> Unit:
	if possible_targets.size() > 0:
		possible_targets.sort_custom(self, "_compare_distance")
		return possible_targets[0]
	else:
		return null
		
func closest_enemy_within_range() -> Unit:
	if closest_enemy():
		if closest_enemy().position.distance_to(position) < attack_range:
			return closest_enemy()
		else:
			return null
	else:
		return null
		
func target_within_range() -> bool:
	if attack_target.get_ref().position.distance_to(position) < attack_range:
		return true
	else:
		return false

#This will returm a boolean to let us know if it is still alive		
func take_damage(amount) -> bool:
	health -= amount
	if health <= 0:
		state_machine.died()
		queue_free()
		return false
	else:
		return true
		
		
func get_state():
	return state_machine.state		
