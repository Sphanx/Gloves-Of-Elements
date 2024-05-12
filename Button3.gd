extends Button
@onready var sprite = $"../Sprite2D7"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	sprite.play("Idle3")
	get_tree().quit()
	 
