extends CharacterBody2D

@onready var environment = $"../environment"
@onready var sprite : AnimatedSprite2D = $cat_animated_sprite

@onready var audio_player : AudioStreamPlayer2D =$AudioStreamPlayer2D

var normal_speed : float = 5000
var run_speed : float = 25000

var speed : float = 5000
var jump_speed : float = 400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# sounds
var lie_sound = load("res://assets/sound/cat_por.wav")
var jump_sound = load("res://assets/sound/meow.wav")
var walk_sound = load("res://assets/sound/footsteps.wav")

func _process(_delta):
	handle_animation()


func _physics_process(delta):
	handle_movement(delta)
	detect_collissions()
	

func detect_collissions():
	for i in get_slide_collision_count():
		var collision_object = get_slide_collision(i).get_collider()
		if collision_object.is_in_group("INTERACTIVE"):
			show_info( true )
			if Input.is_action_just_pressed("select"):
				collision_object.interact()
		else:
			show_info(false)
		


func show_info( value ):
	$info.visible = value


func handle_movement(delta):
	velocity.y += gravity * delta 
	
	var input_vector = Input.get_vector("left", "right", "up", "down")
	velocity.x = input_vector.x * delta * speed
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = input_vector.y * jump_speed
	
	move_and_slide()


func handle_animation():
	if !sprite.is_playing() or ( velocity == Vector2.ZERO && sprite.animation != "lie"):
		idle()
	
	if Input.is_action_just_pressed("up"):
		if sprite.animation == "lie":
			idle()
		else:
			jump()
	
	if Input.is_action_just_released("run"):
		speed = normal_speed
	if Input.is_action_just_pressed("right"):
		sprite.flip_h = false
		walk()
	if Input.is_action_just_pressed("left"):
		sprite.flip_h = true
		walk()
	if Input.is_action_pressed("run")  && velocity != Vector2.ZERO:
		run()
		speed = run_speed
	
	if Input.is_action_just_pressed("down"):
		lie()


func play_sound( sound , volume = 0.0 ,loop := false ):
	audio_player.stream = sound
	audio_player.volume_db = volume
	audio_player.play()


func jump():
	sprite.play("jump")
	play_sound(jump_sound)

func idle():
	sprite.play("idle")
	audio_player.stop()

func walk():
	sprite.play("walk")
	play_sound(walk_sound)

func lie():
	sprite.play("lie")
	play_sound(lie_sound)

func run():
	sprite.play("run")
	play_sound(walk_sound)
