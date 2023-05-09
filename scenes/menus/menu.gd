extends Control

@onready var game_controller = get_tree().get_current_scene()

func _ready():
	$button_menu/start_again.visible = false
	$credits.visible = false
	pause_game(true)

func _input(_event):
	if Input.is_action_just_pressed("pause") && game_controller.game_started:
		$button_menu/start.visible = false
		$button_menu/start_again.visible = true
		visible = !visible
		pause_game(visible)


func _on_start_button_down():
	pause_game(false)
	game_controller.start()


func pause_game( value : bool):
	get_tree().paused = value
	if game_controller.game_started:
		game_controller.content.visible = !value


func _on_start_again_button_down():
	get_tree().reload_current_scene()


func _on_credits_button_down():
	$credits.visible = !$credits.visible
