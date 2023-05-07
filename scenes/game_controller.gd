extends Node2D

@onready var anim_player = $AnimationPlayer
@onready var content = $environment/content

func _ready():
	content.visible = false

func start():
	anim_player.play("start")
