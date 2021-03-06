extends Node2D


var dragging = false
var selected = []
var weakref_selected = []
var drag_start = Vector2.ZERO
var select_rectangle = RectangleShape2D.new()

onready var select_draw = $SelectedDraw


#Handle the different function of the game.
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			for unit in weakref_selected:
				if unit.get_ref():
					unit.get_ref().deselect()
			selected = []
			dragging = true
			drag_start = get_global_mouse_position()
		elif dragging:
			dragging = false
			select_draw.update_status(drag_start,get_global_mouse_position(), dragging)
			var drag_end = get_global_mouse_position()
			select_rectangle.extents = (drag_end - drag_start) / 2
			var space = get_world_2d().direct_space_state
			var query = Physics2DShapeQueryParameters.new()
			query.set_shape(select_rectangle)
			query.transform = Transform2D(0,(drag_end + drag_start) / 2)
			selected = space.intersect_shape(query)
			for unit in selected:
				if unit.collider.is_in_group("unit"):
					if unit.collider.unit_owner == 0:
						unit.collider.select()
						weakref_selected.append(weakref(unit.collider))	
	if dragging:
		if event is InputEventMouseMotion:
			select_draw.update_status(drag_start, get_global_mouse_position(), dragging)
