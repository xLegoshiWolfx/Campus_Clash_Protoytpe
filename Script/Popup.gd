extends Popup

# Resume and Back buttons become visible when Pause button is pressed
func _on_Pause_pressed():
	get_tree().paused = true
	visible = true

# Resume to the current scene
func _on_Resume_pressed():
	get_tree().paused = false
	visible = false
	
# Go back to the main menu
func _on_Back_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scene/Main_Menu.tscn")

# Mute the audio when the button is pressed
func _on_Volume_button_pressed():
	visible = true
	AudioServer.set_bus_mute(0,true)

# Unmute the audio when the mute button is pressed
func _on_Unmute_pressed():
	AudioServer.set_bus_mute(0,false)
	visible = false

# Volume slider visible when hover mouse (need to work on it)
func _on_VSlider_mouse_entered():
	visible = true

# Volume slider disappear when mouse not hover (need to work on it)	
func _on_VSlider_mouse_exited():
	visible = false
