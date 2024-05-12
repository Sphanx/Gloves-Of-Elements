extends Button
@onready var sprite = $tik2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	sprite.play("tik")
	AudioServer.set_bus_mute(2, false)
