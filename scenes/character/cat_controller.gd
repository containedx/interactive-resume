extends CharacterBody2D

@onready var environment = $"../environment"
@onready var sprite : AnimatedSprite2D = $cat_animated_sprite

func _process(_delta):
	handle_movement()


func handle_movement():
	if Input.is_action_just_pressed("up"):
		if sprite.animation == "lie":
			idle()
		else:
			jump()
	if Input.is_action_just_pressed("right"):
		sprite.flip_h = false
		walk()
	if Input.is_action_just_pressed("left"):
		sprite.flip_h = true
		walk()
	if Input.is_action_just_pressed("down"):
		lie()
		environment.stop()

	if !sprite.is_playing():
		idle()


func jump():
	sprite.play("jump")

func idle():
	sprite.play("idle")

func walk():
	sprite.play("walk")

func lie():
	sprite.play("lie")

func run():
	sprite.play("run")
