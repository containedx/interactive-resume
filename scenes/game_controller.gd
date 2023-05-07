extends Node2D

@onready var anim_player = $AnimationPlayer
@onready var content = $environment/content

var game_started : bool = false

func _ready():
	content.visible = false

func start():
	anim_player.play("start")
	game_started = true
