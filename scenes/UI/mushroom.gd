extends StaticBody2D
#mushroom triggers chosen animations in the environment


@export var anim_player : AnimationPlayer = null
@export var anim_name : String = ""

@onready var collider = $CollisionShape2D


func _ready():
	add_to_group("INTERACTIVE")


func interact():
	visible = false
	collider.disabled = true
	if anim_player:
		anim_player.play(anim_name)
