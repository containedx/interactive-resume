extends Node2D

@onready var anim_player = $AnimationPlayer
@onready var content = $environment/content
@onready var menu = $menu

var game_started : bool = false

func _ready():
	content.visible = false
	menu.visible = true

func start():
	anim_player.play("start")
	game_started = true
