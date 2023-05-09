extends TextureRect


func _input(event):
	hightlight($w, "up")
	hightlight($a, "left")
	hightlight($d, "right")
	hightlight($s, "down")
	hightlight($shift/cover, "run")


func hightlight( node, action : String):
	if Input.is_action_just_pressed(action):
		node.visible = true
	if Input.is_action_just_released(action):
		node.visible = false
	
