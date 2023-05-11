extends Node2D

@onready var anim_player = $AnimationPlayer
@onready var content = $environment/content
@onready var menu = $cat/Camera2D/menu
@onready var audio_player = $AudioStreamPlayer
@onready var cat = $cat

var game_started : bool = false

func _ready():
	content.visible = false
	menu.visible = true

func _process(delta):
	loop_audio()
	play_if_is_on_porfolio_level()

func loop_audio():
	if !audio_player.playing:
		audio_player.play()

func start():
	anim_player.play("start")
	game_started = true

func play_if_is_on_porfolio_level():
	var cat_y = cat.get_global_position().y
	if  cat_y > 3500 and cat_y < 4000:
		for item in $environment/content/Portfolio/projects_grid.get_children():
			item.video = true

