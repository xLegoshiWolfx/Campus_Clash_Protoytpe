extends Node2D

var human_currency = 0

var AI_currency = 0

onready var _human_timer = get_node("Human Timer Node")

onready var _AI_timer = get_node("AI Timer Node")

onready var _Human_Birta_Building = get_node("/root/TileMap/Human Birta Building")

onready var _AI_Birta_Building = get_node("/root/TileMap/AI Birta Building")

func _ready():
	_human_timer.set_wait_time(1)
	_human_timer.start()
	_AI_timer.set_wait_time(1)
	_AI_timer.start()
	

func _on_Human_Timer_Node_timeout():
	human_currency += 1


func _on_AI_Timer_Node_timeout():
	AI_currency += 1


func _on_HumanBuildingButton_pressed():
	if (human_currency >= 5):
		human_currency -= 5
		_Human_Birta_Building.visible = true


func _on_AIBuildingButton_pressed():
	if (AI_currency >= 5):
		AI_currency -= 5
		_AI_Birta_Building.visible = true
