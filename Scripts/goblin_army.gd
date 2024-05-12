extends Area2D
@onready var player = $Player

@export var speed : int = 200

func _process(delta):
	move_local_x(speed * delta)



func _on_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
