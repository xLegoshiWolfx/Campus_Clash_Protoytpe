extends Popup


func _on_Pause_Button_pressed():
	get_tree().paused = true
	visible = true

func _on_Resume_Button_pressed():
	visible = false

func _on_Restart_Game_Button_pressed():
	visible = false

func _on_Main_Menu_Button_pressed():
	visible = false
