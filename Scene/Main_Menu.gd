extends Node2D


func _on_Button_pressed():
	get_tree().change_scene("res://Scene/Main_Game.tscn")

func _on_Button2_pressed():
	get_tree().change_scene("res://Scene/Second_Scene.tscn")

func _on_Quit_button_pressed():
	get_tree().quit()

func _on_Volume_button_pressed():
	pass

func _ready():
	Audio1.play_music()


func _on_VSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
