extends Button
@onready var sprite = $"ana menu tusu"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	sprite.play("goback")
	await sprite.animation_finished
	get_tree().change_scene_to_file("res://Menu/AnaMenu.tscn")
