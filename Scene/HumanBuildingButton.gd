extends Button

onready var _human_add_coin = get_node("/root/TileMap/Currency/human_currency")


func _ready():
	pass 


func _on_Human_Timer_Node_timeout():
	if (HumanBuildingButton.pressed()):
		_human_add_coin += 3
