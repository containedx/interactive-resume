extends StaticBody2D

@export var target : Vector2

func _ready():
	add_to_group("TELEPORT")


func teleport( character ) -> void:
	get_tree().reload_current_scene()


