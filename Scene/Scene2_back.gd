extends Button

func _on_Scene2_back_pressed():
	get_tree().change_scene("res://Scene/Main_Menu.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Scene/Character.tscn")
