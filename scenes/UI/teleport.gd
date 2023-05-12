extends StaticBody2D

@export var target : Vector2

func _ready():
	add_to_group("TELEPORT")


func teleport( character ) -> void:
	character.set_global_position(target)


