extends VideoPlayer

# Loop the video
func _process(delta):
	if self.is_playing() == false:
		play()
