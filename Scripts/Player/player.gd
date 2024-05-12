extends CharacterBody2D

@onready var flip = $Flip
@onready var fireGlove = $Flip/AnimatedSprite2D
@onready var iceGlove = $Flip/AnimatedSprite2D2
@onready var animated_Sprite = [fireGlove, iceGlove]
@onready var hand = $Hand
@onready var footstep = $Footstep

@export var SPEED : int = 135
@export var GRAVITY : int = 900
@export var JUMP_FORCE : int = 900
var speedPlaceHolder

func _ready():
	speedPlaceHolder = SPEED

func _process(delta):
	var direction = Input.get_axis("move_left", "move_right") #assign direction 1 or -1
	
	if direction:
		if hand.gloveEffect == 1:
			velocity.x = direction * (SPEED +100)
		else:
			velocity.x = direction * SPEED
			
		if is_on_floor() and not hand.isAnimationAttacking:
			animated_Sprite[hand.gloveEffect].play("Run")

	else:
		velocity.x = 0
		
		if is_on_floor() and not hand.isAnimationAttacking:
			animated_Sprite[hand.gloveEffect].play("Idle")
			
	#Rotate
	if direction == 1:
		flip.scale.x = 1
	elif direction == -1:
		flip.scale.x = -1
	
	#Gravity
	if not is_on_floor() :
		velocity.y += GRAVITY * delta
		if velocity.y > 0 and not hand.isAnimationAttacking:
			animated_Sprite[hand.gloveEffect].play("Fall")
			
	
	#Jump
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		if hand.gloveEffect == 1:
			velocity.y -= JUMP_FORCE + 100
		else:
			velocity.y -= JUMP_FORCE
		if not hand.isAnimationAttacking:
			animated_Sprite[hand.gloveEffect].play("Jump")
	
	SwitchGloveAnim()
	move_and_slide()

func SwitchGloveAnim():
	#Fire glove
	if hand.gloveEffect == 0:
		iceGlove.visible = false
		fireGlove.visible = true
	#Ice glove
	elif hand.gloveEffect == 1:
		fireGlove.visible = false
		iceGlove.visible = true
