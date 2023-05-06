extends AnimatedSprite2D

@onready var environment = $"../environment"

func _process(_delta):
	handle_movement()


func handle_movement():
	if Input.is_action_just_pressed("up"):
		if animation == "lie":
			idle()
		else:
			jump()
	if Input.is_action_just_pressed("right"):
		flip_h = false
		walk()
	if Input.is_action_just_pressed("left"):
		flip_h = true
		walk()
	if Input.is_action_just_pressed("down"):
		lie()
		environment.stop()

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

func run():
	play("run")
