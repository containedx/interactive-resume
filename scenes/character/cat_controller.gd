extends AnimatedSprite2D

@onready var anim_tree = $AnimationTree


func _process(_delta):
	if Input.is_action_just_released("up"):
		if animation == "lie":
			idle()
		else:
			jump()
	if Input.is_action_just_released("right"):
		flip_h = false
		walk()
	if Input.is_action_just_released("left"):
		flip_h = true
		walk()
	if Input.is_action_just_released("down"):
		lie()

	if !is_playing():
		idle()


func jump():
	play("jump")

func idle():
	play("idle")

func walk():
	play("walk")

func lie():
	play("lie")
