extends Button
@onready var sprite = $"çarpı"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	sprite.play("çarpı")
	AudioServer.set_bus_mute(1, true)
	
