extends StateMachine

enum Commands {
	NONE,
	MOVE,
	ATTACK_MOVE,
	HOLD
}
var command = Commands.NONE

enum CommandMods {
	NONE,
	ATTACK_MOVE
}
var command_mod = CommandMods.NONE


func _ready():
	add_state("idle")
	add_state("moving")
	add_state("engaging")
	add_state("attacking")
	add_state("dying")
	call_deferred("set_state", states.idle)

#this should be input inpleentation but we just going to use mouse click	
func _input(event):
	if parent.selected and state != states.dying:
		if Input.is_action_just_pressed("attack_move"):
			command_mod = CommandMods.ATTACK_MOVE
		if Input.is_action_just_pressed("hold"):
			command = Commands.HOLD
			set_state(states.idle)
		if Input.is_action_just_released("right_click"):
			parent.movement_target = event.position
			set_state(states.moving)
			match command_mod:
				CommandMods.NONE:
					command = Commands.MOVE
				CommandMods.ATTACK_MOVE:
					command = Commands.ATTACK_MOVE


func _state_logic(delta):
	match state:
		states.idle:
			pass
		states.moving:
			parent.move_to_target(delta, parent.movement_target)
		states.engaging:
			if parent.attack_target.get_ref():
				pass
				#et_state(states.idle)
		states.attacking:
			pass
		states.dying:
			pass
			

func _enter_state(new_state, old_state):
	pass
			

#Exit state
func _exit_state(old_state, new_state):
	match old_state:
		states.attacking:
			if new_state == states.idle:
				parent.attack_target = null
		states.moving:
			if new_state != states.moving and command != Commands.ATTACK_MOVE:
				parent.movement_target = parent.position

#Transitionning to different state
func _get_transition(delta):
	match state:
		states.idle:
			match command:
				Commands.HOLD:
					if parent.closest_enemy_within_range() != null:
						parent.attack_target = weakref(parent.closest_enemy_within_range())
						set_state(states.attacking)
				Commands.ATTACK_MOVE:
					set_state(states.moving)
				Commands.NONE:
					if parent.closest_enemy() != null:
						parent.attack_target = weakref(parent.closest_enemy())
						set_state(states.engaging)
		states.moving:
			if (command == Commands.ATTACK_MOVE):
				if parent.closest_enemy() != null:
					parent.attack_target = weakref(parent.closest_enemy())
					set_state(states.engaging)
			if parent.position.distance_to(parent.movement_target) < parent.target_max:
				parent.movement_target = parent.position
				set_state(states.idle)
				command = Commands.NONE
		states.engaging:
			if parent.closest_enemy_within_range() != null:
				parent.attack_target = weakref(parent.closest_enemy())
				set_state(states.attacking)
		states.attacking:
			if !parent.attack_target.get_ref():
				set_state(states.idle)
				parent.attack_target = null
		states.dying:
			#queue_free()
			pass

#Know when the unit will stop
func _on_StopTimer_timeout():
	if state != states.dying:
		if parent.get_slide_count():
			if (parent.last_position.distance_to(parent.movement_target) < 
				parent.position.distance_to(parent.movement_target) + parent.move_unit):
					parent.movement_target = parent.position
					set_state(states.idle)
					command = Commands.NONE

#Set the state to dying
func died():
	set_state(states.dying)
	
#Free the queue if the state is dying
func _on_AnimatedSprite_animation_finished():
	match state:
		states.attacking:
			if parent.attack_target.get_ref():
				if parent.attack_target.get_ref().take_damage(parent.damage_amount):
					if parent.target_within_range():
						pass
					else:
						set_state(states.engaging)
				else:
					set_state(states.idle)
			else:
				set_state(states.idle)
		states.dying:
			queue_free()



