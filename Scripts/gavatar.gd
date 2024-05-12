extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var isDead : bool = false

func _process(delta):
	if isDead:
		get_tree().change_scene_to_file("res://bitissahne.tscn")

