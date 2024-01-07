extends State
class_name PlayerIdle 

func enter() -> void:
	pass

func tick(_input : InputState) -> void:
	if(_input.WishDirection != 0):
		Transition.emit(self, "Walk")
		
	if(_input.WishJump and entity.is_on_floor()):
		Transition.emit(self, "Jump")

func physics_tick(_input : InputState) -> void:
	pass

func exit() -> void:
	pass
