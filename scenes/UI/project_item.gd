extends Control

@onready var source = $source
@onready var button = $Button

@export var video : bool = false

func _process(_delta):
	if true:
		loop_video()
	reveal_description()


func loop_video():
	if !source.is_playing():
		source.play()


func reveal_description():
	if button.is_hovered():
		print("hovered")
		source.visible = false
	else :
		source.visible = true
