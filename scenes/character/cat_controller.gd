extends CharacterBody2D

@onready var environment = $"../environment"
@onready var sprite : AnimatedSprite2D = $cat_animated_sprite

var speed : float = 5000
var jump_speed : float = 400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(_delta):
	handle_animation()


func _physics_process(delta):
	handle_movement(delta)


func handle_movement(delta):
	velocity.y += gravity * delta 
	
	var input_vector = Input.get_vector("left", "right", "up", "down")
	velocity.x = input_vector.x * delta * speed
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = input_vector.y * jump_speed
	
	move_and_slide()
	print(input_vector, "     ", velocity)


func handle_animation():
	if !sprite.is_playing() or velocity == Vector2.ZERO:
		idle()
	
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
