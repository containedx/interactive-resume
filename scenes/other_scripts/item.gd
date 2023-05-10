extends TextureRect

@onready var description_box = $block3
@onready var button = $Button


func _ready():
	description_box.visible = false
	

func _process(_delta):
	reveal_description()


func reveal_description():
	if button.is_hovered():
		description_box.visible = true
	else :
		description_box.visible = false
