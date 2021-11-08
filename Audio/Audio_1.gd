extends Node2D

var background_music = load ("res://Audio/Keys Of Moon - Silhouette of War.mp3")

func play_music():
	$AudioStreamPlayer.stream = background_music
	$AudioStreamPlayer.play()
