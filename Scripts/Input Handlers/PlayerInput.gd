extends InputHandler
class_name PlayerInput

func ProcessInput(state : InputState) -> void:
	state.WishDirection = Input.get_axis("left","right")
	
	state.GrappleDirection = get_viewport().get_mouse_position()
	
	state.WishGrapple = Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)
	state.WishJump = Input.is_action_just_pressed("jump")
