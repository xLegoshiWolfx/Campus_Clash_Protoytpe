extends AudioStreamPlayer

func _process(delta):
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
