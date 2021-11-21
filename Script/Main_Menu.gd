extends Node2D

# Button to change scene to the main game
func _on_Start_game_button_pressed():
	get_tree().change_scene("res://Scene/Main_Game.tscn")

# Button to change to the menu option 
func _on_Menu_button_pressed():
	get_tree().change_scene("res://Scene/Instructions.tscn")

# Button to quit and terminate the game
func _on_Quit_button_pressed():
	get_tree().quit()

# Play the Music when the game started
func _ready():
	Audio1.play_music()

# Adjust the volume using a slider
func _on_VSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
