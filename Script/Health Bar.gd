extends Node2D

var bar_red = preload("res://PNG/HealthBars/barHorizontal_red.png")
var bar_green = preload("res://PNG/HealthBars/barHorizontal_green.png")
var bar_yellow = preload("res://PNG/HealthBars/barHorizontal_yellow.png")

onready var healthbar = $HealthBar

func _ready():
	hide()
	if get_parent() and get_parent().get("max_health"):
		healthbar.max_value = get_parent().max_health
	update_healthbar()
	print(healthbar.value)

func _process(delta):
	global_rotation = 0
	
func update_healthbar(health_value=0):
	healthbar.texture_progress = bar_green
	if health_value != 0:
		if health_value < healthbar.max_value * 0.7:
			healthbar.texture_progress = bar_yellow
		if health_value < healthbar.max_value * 0.35:
			healthbar.texture_progress = bar_red
		if health_value < healthbar.max_value:
			show()
		healthbar.value += health_value
