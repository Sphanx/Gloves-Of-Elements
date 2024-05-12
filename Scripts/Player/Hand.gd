extends Node2D

@onready var animated_sprite_2d = $"../Flip/AnimatedSprite2D"
@onready var player = $".."
@onready var spell = $"../Spell"

@onready var timer = $Timer
@onready var projectile = preload("res://Scenes/Player/Projectile.tscn")
const PROJECTILE_2 = preload("res://Scenes/Player/projectile_2.tscn")

var isAttacking : bool = false
var isAnimationAttacking : bool = false
var current_weapon = 1
var gloveEffect : int = 0



func _physics_process(delta):
#ranged attack
	if Input.is_action_just_pressed("ranged_attack") and not isAttacking:
		isAnimationAttacking = true
		isAttacking = true
		
		player.animated_Sprite[gloveEffect].play("Attack")
		spell.play()
		await player.animated_Sprite[gloveEffect].animation_finished
		isAnimationAttacking = false
		
		#fire glove
		if current_weapon ==1:
			var pro = projectile.instantiate()
			pro.global_position = player.global_position
			var dir : Vector2 = (get_global_mouse_position() - $ShotPos.global_position).normalized()
			pro.vel = dir
			get_parent().add_sibling(pro)
			

		#ice glove
		elif current_weapon ==2:
			var pro = PROJECTILE_2.instantiate()
			pro.global_position = player.global_position
			var dir : Vector2 = (get_global_mouse_position() - $ShotPos.global_position).normalized()
			pro.vel =  dir
			get_parent().add_sibling(pro)
		
		print("attack")
		timer.start()
	
	
	#weapon switch
		
	if Input.is_action_just_pressed("switch_weapon_E"):
		#play switch animation
		current_weapon = 1
		gloveEffect = 0
		print("WEAPON 1")
	elif Input.is_action_just_pressed("switch_weapon_Q"):
		#play switch animation
		current_weapon = 2
		gloveEffect = 1
		print("WEAPON2")

func _on_timer_timeout():
	isAttacking = false
	print("bitti")
	timer.stop()

