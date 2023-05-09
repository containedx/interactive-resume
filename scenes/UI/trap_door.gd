extends StaticBody2D

@export var caption : String = "EXPERIENCE"

@onready var anim_player = $AnimationPlayer
@onready var collider = $CollisionShape2D


func _ready():
	add_to_group("INTERACTIVE")
	$sample_board/Label.text = caption


func interact():
	collider.disabled = true
	anim_player.play("fade")
