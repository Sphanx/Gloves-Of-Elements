extends Area2D

@export var i : int = 0
@onready var goblin_army = preload("res://Scenes/goblin_army.tscn")
@export var army = [preload("res://Scenes/goblin_army.tscn"), preload("res://yeti.tscn")]


func _on_body_entered(body):
	if body.name == "Player":
		
		var army_instance = army[i].instantiate()
		army_instance.global_position = global_position
		if i == 1:
			army_instance.global_position.x -=350 
		else:
			army_instance.global_position.x -= 500
			army_instance.global_position.y += 600		
		get_parent().add_child(army_instance)
		queue_free()
