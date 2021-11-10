extends Node2D

export var human_building_mult = 1

export var AI_building_mult = 1

var human_currency = 0

var AI_currency = 0

onready var _human_timer = get_node("Human Timer Node")

onready var _AI_timer = get_node("AI Timer Node")

onready var _Human_Birta_Building = get_node("/root/TileMap/Human Birta Building")

onready var _Human_Birta_Building2 = get_node("/root/TileMap/Human Birta Building2")

onready var _Human_Birta_Building3 = get_node("/root/TileMap/Human Birta Building3")

onready var _AI_Birta_Building = get_node("/root/TileMap/AI Birta Building")

onready var _AI_Birta_Building2 = get_node("/root/TileMap/AI Birta Building2")

onready var _AI_Birta_Building3 = get_node("/root/TileMap/AI Birta Building3")

onready var _human_unit_visible = get_node("/root/TileMap/Moving_unit/YSort/Unit")

onready var _human_unit_visible2 = get_node("/root/TileMap/Moving_unit/YSort/Unit2")

onready var _AI_unit_visible = get_node("/root/TileMap/Moving_unit/YSort/Unit3")

onready var _AI_unit_visible2 = get_node("/root/TileMap/Moving_unit/YSort/Unit4")

onready var _human_win_message = get_node("/root/TileMap/Currency/Human Win")

onready var _AI_win_message = get_node("/root/TileMap/Currency/AI Win")

func _ready():
	_human_timer.set_wait_time(1)
	_human_timer.start()
	_AI_timer.set_wait_time(1)
	_AI_timer.start()
	

func _on_Human_Timer_Node_timeout():
	human_currency += 1 * human_building_mult


func _on_AI_Timer_Node_timeout():
	AI_currency += 1 * AI_building_mult


func _on_HumanBuildingButton_pressed():
	if (human_currency >= 5 and human_currency < 25 
		and human_building_mult != 0):
		human_currency -= 5
		_Human_Birta_Building.visible = true
		human_building_mult += 2
	if (human_currency >= 25 and human_currency < 100 
		and _Human_Birta_Building.visible == true and human_building_mult != 0):
		human_currency -= 25
		_Human_Birta_Building2.visible = true
		human_building_mult += 2
	if (human_currency >= 100 and _Human_Birta_Building.visible == true 
		and _Human_Birta_Building2.visible == true 
		and human_building_mult != 0):
		human_currency -= 100
		_Human_Birta_Building3.visible = true
		human_building_mult += 2
	if (_Human_Birta_Building.visible == true 
		and _Human_Birta_Building2.visible == true
		and _Human_Birta_Building3.visible == true):
			human_building_mult = 0
			AI_building_mult = 0
			_human_win_message.visible = true

func _on_AIBuildingButton_pressed():
	if (AI_currency >= 5 and AI_currency < 25 and AI_building_mult != 0):
		AI_currency -= 5
		_AI_Birta_Building.visible = true
		AI_building_mult += 2
	if (AI_currency >= 25 and AI_currency < 100 
		and _AI_Birta_Building.visible == true and AI_building_mult != 0):
		AI_currency -= 25
		_AI_Birta_Building2.visible = true
		AI_building_mult += 2
	if (AI_currency >= 100 and _AI_Birta_Building.visible == true 
		and _AI_Birta_Building2.visible == true and AI_building_mult != 0):
		AI_currency -= 100
		_AI_Birta_Building3.visible = true
		AI_building_mult += 2
	if (_AI_Birta_Building.visible == true 
		and _AI_Birta_Building2.visible == true
		and _AI_Birta_Building3.visible == true):
			human_building_mult = 0
			AI_building_mult = 0
			_AI_win_message.visible = true

func _on_HumanUnitButton_pressed():
	if (human_currency >= 20 and human_building_mult != 0):
		human_currency -= 20
		_human_unit_visible.visible = true
		_human_unit_visible2.visible = true


func _on_AIUnitButton_pressed():
	if (AI_currency >= 20 and AI_building_mult != 0):
		AI_currency -= 20
		_AI_unit_visible.visible = true
		_AI_unit_visible2.visible = true
