extends AnimatedSprite2D

@onready var anim_tree = $AnimationTree


func _process(_delta):
	if Input.is_action_just_released("up"):
		jump()
	
	if Input.is_action_just_released("right"):
		walk()

	if !is_playing():
		play("idle")


func jump():
	play("jump")

func idle():
	play("idle")

func walk():
	play("walk")
