extends Node2D


func _on_Button_pressed():
	get_tree().change_scene("res://Scene/TileMap.tscn")

func _on_Button2_pressed():
	get_tree().change_scene("res://Scene/Second_Scene.tscn")

func _on_Quit_button_pressed():
	get_tree().quit()
	
