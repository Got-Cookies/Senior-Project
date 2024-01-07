extends State
class_name Move 

@export var accel : float
@export var deAccel : float
@export var max_Speed : float

func enter() -> void:
	pass

func tick(_input : InputState) -> void:
	if(!entity.is_on_floor()):
		Transition.emit(self, "Jump")
	
	if(_input.WishDirection == 0):
		Transition.emit(self, "PlayerIdle")


func physics_tick(_input : InputState) -> void:
	var cur_h_speed = entity.velocity.x
	var new_h_speed = 0
	
	new_h_speed = cur_h_speed + accel * _input.WishDirection 

	if(max_Speed != null):
		new_h_speed = clamp(new_h_speed,-max_Speed, max_Speed)
		entity.velocity.x = new_h_speed
	
	entity.move_and_slide()

func exit() -> void:
	entity.velocity.x = lerp(entity.velocity.x, 0.0, 0.125)
