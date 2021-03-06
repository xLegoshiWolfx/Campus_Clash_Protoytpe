extends Node2D

# Preload the images.
var bar_red = preload("res://PNG/HealthBars/barHorizontal_red.png")
var bar_green = preload("res://PNG/HealthBars/barHorizontal_green.png")
var bar_yellow = preload("res://PNG/HealthBars/barHorizontal_yellow.png")

onready var healthbar = $BHealthBar

func _ready():
#	hide()
	if get_parent() and get_parent().get("building_health"):
		healthbar.max_value = get_parent().building_health
	update_healthbar()
	print(healthbar.value)

func _process(delta):
	global_rotation = 0
	
# Update the health bar to reflect the building's health.
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
