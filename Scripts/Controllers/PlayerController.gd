extends CharacterBody2D

@onready var _animator = $AnimatedSprite2D

@export var ground_accel : float

@export var ground_deAccel : float

@export var max_ground_Speed : float

@export var JumpHeight : float
@export var low_jump_Multiplier : float
@export var fall_Multiplier : float

var _wishDir : float

var wishJump : bool
var jump_released : bool

const GRAVITY = 9.8

func _input(event):
	_wishDir = Input.get_axis("left", "right")

	wishJump = event.is_action_pressed("jump")
	jump_released = event.is_action_released("jump")

func _physics_process(delta):
	ApplyGravity(delta)
	
	if is_on_floor():
		if(wishJump):
			CalculateJump(delta)
			
		CalculateMovement(ground_accel, ground_deAccel, max_ground_Speed)
	
	move_and_slide()

func ApplyGravity(t):
	if is_on_floor():
		velocity.y = 0
		return
	
	velocity.y += GRAVITY
	
	if(velocity.y < 0 and jump_released):
		velocity.y += GRAVITY * (low_jump_Multiplier - 1) 

	if(velocity.y > 0): 
		velocity.y += GRAVITY * (fall_Multiplier - 1)

func CalculateJump(t):
	var Vy = (JumpHeight/t) - (velocity.y * pow(t,2)) / 2
	velocity.y -= Vy 

func CalculateMovement(accel, deaccel, max_speed = null):
	var cur_h_speed = velocity.x
	var new_h_speed = 0
	
	new_h_speed = cur_h_speed + accel * _wishDir 

	if(max_speed != null):
		new_h_speed = clamp(new_h_speed,-max_speed, max_speed)
		velocity.x = new_h_speed
	
	if(_wishDir == 0):
		velocity.x = lerp(velocity.x, 0.0, 0.125)
	
