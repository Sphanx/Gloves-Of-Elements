extends Node2D
@onready var sprite_2d = $Sprite2D
@onready var sprite_2d_2 = $Sprite2D2

var isHit : bool = false
var isFrozen : bool = false

func _ready():
	sprite_2d_2.visible = false

func _process(delta):
	if isHit == true:
		sprite_2d.visible = false
		sprite_2d_2.visible = true
	


