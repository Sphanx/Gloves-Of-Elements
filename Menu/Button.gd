extends Button
@onready var sprite = $"../Sprite2D3"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	sprite.play("Idle")
	await sprite.animation_finished
	get_tree().change_scene_to_file("res://Sinematik.tscn")




