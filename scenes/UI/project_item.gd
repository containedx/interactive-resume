extends Control

@onready var video_player = $VideoStreamPlayer
@onready var button = $Button

func _process(delta):
	loop_video()
	reveal_description()


func loop_video():
	if !video_player.is_playing():
		video_player.play()


func reveal_description():
	if button.is_hovered():
		print("hovered")
		video_player.visible = false
	else :
		video_player.visible = true
