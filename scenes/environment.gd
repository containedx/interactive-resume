extends Node2D

@onready var cat = $"../cat"

var target_position : Vector2 = position
var moving : bool = false

var left_border : float = 0.0
var right_border : float = -100000.0

func _process(delta):
	handle_input()
	handle_movement(delta)
	

func handle_movement(delta):
	if moving:
		position = position.lerp(target_position, delta)
		
		if cat.sprite.animation != "jump":
			if position.distance_squared_to(target_position) > 100000:
				cat.run()
			else :
				cat.walk()
		
		if position.distance_squared_to(target_position) <= 5:
			moving = false
			cat.idle()

func handle_input():
	if Input.is_action_pressed("right"):
		target_position.x -= 10
		moving = true
	if Input.is_action_pressed("left"):
		target_position.x += 10
		moving = true
	target_position.x = clampf(target_position.x, right_border, left_border)
	print(target_position.x)

func stop():
	moving = false
	target_position = position
