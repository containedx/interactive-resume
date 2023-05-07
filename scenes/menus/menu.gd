extends Control

@onready var game_controller = get_tree().get_current_scene()



func _on_start_button_down():
	game_controller.start()
