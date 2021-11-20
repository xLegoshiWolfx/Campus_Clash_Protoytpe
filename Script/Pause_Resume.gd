extends Node2D

func _on_Resume_Button_pressed():
	get_tree().paused = false

func _on_Restart_Game_Button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_Main_Menu_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scene/Main_Menu.tscn")
