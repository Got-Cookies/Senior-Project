class_name State extends Node
#Abstract class for states to derive from and input custom logic
signal Transition

func enter() -> void:
	pass

func tick(_input : InputState) -> void:
	pass

func physics_tick(_input : InputState) -> void:
	pass

func exit() -> void:
	pass

