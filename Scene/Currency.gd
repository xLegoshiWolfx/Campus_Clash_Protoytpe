extends Node2D

var human_building_mult = 1
var AI_building_mult = 1
var human_currency = 0
var AI_currency = 0

onready var _human_timer = get_node("Human Timer Node")
onready var _AI_timer = get_node("AI Timer Node")
onready var _Human_Birta_Building5 = get_node("/root/TileMap/Human Birta Building")
onready var _Human_Birta_Building25 = get_node("/root/TileMap/Human Birta Building2")
onready var _Human_Birta_Building100 = get_node("/root/TileMap/Human Birta Building3")
onready var _Human_Birta_Building_Collision5 = get_node("/root/TileMap/Human Birta Building/BirtaCollision")
onready var _Human_Birta_Building_Collision25 = get_node("/root/TileMap/Human Birta Building2/BirtaCollision")
onready var _Human_Birta_Building_Collision100 = get_node("/root/TileMap/Human Birta Building3/BirtaCollision")
onready var _AI_Birta_Building5 = get_node("/root/TileMap/AI Birta Building")
onready var _AI_Birta_Building25 = get_node("/root/TileMap/AI Birta Building2")
onready var _AI_Birta_Building100 = get_node("/root/TileMap/AI Birta Building3")
onready var _AI_Birta_Building_Collision5 = get_node("/root/TileMap/AI Birta Building/BirtaCollision")
onready var _AI_Birta_Building_Collision25 = get_node("/root/TileMap/AI Birta Building2/BirtaCollision")
onready var _AI_Birta_Building_Collision100 = get_node("/root/TileMap/AI Birta Building3/BirtaCollision")
onready var _human_unit_visible = get_node("/root/TileMap/Moving_unit/YSort/Unit")
onready var _human_unit_visible2 = get_node("/root/TileMap/Moving_unit/YSort/Unit2")
onready var _human_unit_collision = get_node("/root/TileMap/Moving_unit/YSort/Unit/CollisionShape2D")
onready var _human_unit_vision_collision = get_node("/root/TileMap/Moving_unit/YSort/Unit/VisionRange/CollisionShape2D")
onready var _human_unit_collision2 = get_node("/root/TileMap/Moving_unit/YSort/Unit2/CollisionShape2D")
onready var _human_unit_vision_collision2 = get_node("/root/TileMap/Moving_unit/YSort/Unit2/VisionRange/CollisionShape2D")
onready var _AI_unit_visible = get_node("/root/TileMap/Moving_unit/YSort/Unit3")
onready var _AI_unit_visible2 = get_node("/root/TileMap/Moving_unit/YSort/Unit4")
onready var _AI_unit_collision = get_node("/root/TileMap/Moving_unit/YSort/Unit3/CollisionShape2D")
onready var _AI_unit_vision_collision = get_node("/root/TileMap/Moving_unit/YSort/Unit3/VisionRange/CollisionShape2D")
onready var _AI_unit_collision2 = get_node("/root/TileMap/Moving_unit/YSort/Unit4/CollisionShape2D")
onready var _AI_unit_vision_collision2 = get_node("/root/TileMap/Moving_unit/YSort/Unit4/VisionRange/CollisionShape2D")
onready var _human_win_message = get_node("/root/TileMap/Currency/Human Win")
onready var _AI_win_message = get_node("/root/TileMap/Currency/AI Win")

func _ready():
	_human_timer.set_wait_time(1)
	_human_timer.start()
	_AI_timer.set_wait_time(1)
	_AI_timer.start()


# Checks every second to see if a player has won. Prints a win message
# when a player has won.
func _process(delta):
	if (_Human_Birta_Building5.visible == true 
		and _Human_Birta_Building25.visible == true
		and _Human_Birta_Building100.visible == true):
			human_building_mult = 0
			AI_building_mult = 0
			_human_win_message.visible = true
	if (_AI_Birta_Building5.visible == true 
		and _AI_Birta_Building25.visible == true
		and _AI_Birta_Building100.visible == true):
			human_building_mult = 0
			AI_building_mult = 0
			_AI_win_message.visible = true


# Increments the human currency multiplied by the human building bonuses
func _on_Human_Timer_Node_timeout():
	human_currency += 1 * human_building_mult


# Increments the AI currency multiplied by the AI building bonuses
func _on_AI_Timer_Node_timeout():
	AI_currency += 1 * AI_building_mult


# Builds the human 5 coin building and gives a +2 currency bonus
func _on_HumanBuildingButton5_pressed():
	if (human_currency >= 5 and human_building_mult != 0):
		human_currency -= 5
		_Human_Birta_Building5.visible = true
		_Human_Birta_Building_Collision5.disabled = false
		human_building_mult += 2


# Builds the human 25 coin building and gives a +5 currency bonus
func _on_HumanBuildingButton25_pressed():
	if (human_currency >= 25 and human_building_mult != 0):
		human_currency -= 25
		_Human_Birta_Building25.visible = true
		_Human_Birta_Building_Collision25.disabled = false
		human_building_mult += 5


# Builds the human 100 coin building and gives a +10 currency bonus
func _on_HumanBuildingButton100_pressed():
	if (human_currency >= 100 and human_building_mult != 0):
		human_currency -= 100
		_Human_Birta_Building100.visible = true
		_Human_Birta_Building_Collision100.disabled = false
		human_building_mult += 10


# Builds the AI 5 coin building and gives a +2 currency bonus
func _on_AIBuildingButton5_pressed():
	if (AI_currency >= 5 and AI_building_mult != 0):
		AI_currency -= 5
		_AI_Birta_Building5.visible = true
		_AI_Birta_Building_Collision5.disabled = false
		AI_building_mult += 2


# Builds the AI 25 coin building and gives a +5 currency bonus
func _on_AIBuildingButton25_pressed():
	if (AI_currency >= 25 and AI_building_mult != 0):
		AI_currency -= 25
		_AI_Birta_Building25.visible = true
		_AI_Birta_Building_Collision25.disabled = false
		AI_building_mult += 5


# Builds the AI 100 coin building and gives a +10 currency bonus
func _on_AIBuildingButton100_pressed():
	if (AI_currency >= 100 and AI_building_mult != 0):
		AI_currency -= 100
		_AI_Birta_Building100.visible = true
		_AI_Birta_Building_Collision100.disabled = false
		AI_building_mult += 10


# Recruits the human units for 20 coins
func _on_HumanUnitButton_pressed():
	if (human_currency >= 20 and human_building_mult != 0):
		human_currency -= 20
		_human_unit_visible.visible = true
		_human_unit_visible2.visible = true
		_human_unit_collision.disabled = false
		_human_unit_vision_collision.disabled = false
		_human_unit_collision2.disabled = false
		_human_unit_vision_collision2.disabled = false


# Recruits the AI units for 20 coins
func _on_AIUnitButton_pressed():
	if (AI_currency >= 20 and AI_building_mult != 0):
		AI_currency -= 20
		_AI_unit_visible.visible = true
		_AI_unit_visible2.visible = true
		_AI_unit_collision.disabled = false
		_AI_unit_vision_collision.disabled = false
		_AI_unit_collision2.disabled = false
		_AI_unit_vision_collision2.disabled = false
