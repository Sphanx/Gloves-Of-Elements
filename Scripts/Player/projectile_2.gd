extends Area2D

var SPEED = 360
var vel : Vector2
var velocity : Vector2
var isDestroying : bool = false

func _ready():
	$AnimatedSprite2D.look_at(get_global_mouse_position())
	velocity.x = vel.x
	velocity.y = vel.y

func _physics_process(delta):
	if !isDestroying:
		move_local_x(velocity.x * SPEED * delta)
		move_local_y(velocity.y * SPEED * delta)
	else:
		move_local_x(0)
		move_local_y(0)

func _on_body_entered(body):
	if body.is_in_group("Bird"):
		body.queue_free()
		queue_free()
	if body.is_in_group("Enemy"):
		queue_free()	
	if body.is_in_group("Goblin"):
		body.queue_free()
		queue_free()
	if body.is_in_group("Gavatar"):
		queue_free()		
	if !body.is_in_group("Player"):
		isDestroying = true
		$AnimatedSprite2D.play("Destroy")
		await $AnimatedSprite2D.animation_finished
		queue_free()
