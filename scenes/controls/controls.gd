extends TextureRect


func _input(event):
	if Input.is_action_pressed("up"):
		$w.visible = true
	if Input.is_action_just_released("up"):
		$w.visible = false
	
	if Input.is_action_pressed("left"):
		$a.visible = true
	if Input.is_action_just_released("left"):
		$a.visible = false
	
	if Input.is_action_pressed("down"):
		$s.visible = true
	if Input.is_action_just_released("down"):
		$s.visible = false
	
	if Input.is_action_pressed("right"):
		$d.visible = true
	if Input.is_action_just_released("right"):
		$d.visible = false
