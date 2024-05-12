extends CharacterBody2D
@onready var sprite = $AnimatedSprite2D

@onready var timer = $Timer

var isDead : bool = false
var hiz:int =1500
var vel:int = 300

func _ready():
	hiz = randi_range(120,250)
	velocity.x = hiz
func _physics_process(delta):
	if is_on_wall():
		vel = -hiz * sign(vel)
		velocity.x = vel
		
	if sign(velocity.x) == -1:
		sprite.flip_h=true
	else :
		sprite.flip_h = false
		
	move_and_slide()
	
func _process(delta):
	if isDead == true:
		isDead = false
		velocity.x = 0
		timer.start()
		sprite.play("Death")



func _on_timer_timeout():
	queue_free()
