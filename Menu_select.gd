extends Node2D

export (NodePath) var dropdown_path
onready var dropdown_menu = get_node(dropdown_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_items()
	disable_item(2)
	
func add_items():
	dropdown_menu.add_item("Building 1")
	dropdown_menu.add_item("Building 2")
	dropdown_menu.add_item("Building 3")

func disable_item(id):
	dropdown_menu.set_item_disabled(id, true)
