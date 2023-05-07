extends Control

@onready var game_controller = get_tree().get_current_scene()

func _ready():
	pause_game(true)

func _input(_event):
	if Input.is_action_just_pressed("pause") && game_controller.game_started:
		$button_menu/start.visible = false
		visible = !visible
		pause_game(visible)


func _on_start_button_down():
	pause_game(false)
	game_controller.start()


func pause_game( value : bool):
	get_tree().paused = value
