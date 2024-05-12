extends CharacterBody2D

func _physics_process(delta):
	velocity.x += delta * 60
	velocity.y += delta * 600

	
	move_and_slide()
