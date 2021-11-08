extends VideoPlayer

func _process(delta):
	if self.is_playing() == false:
		play()
