class_name State extends Node
#Abstract class for states to derive from and input custom logic
signal Transition

func enter() -> void:
	pass

func tick() -> void:
	pass

func physics_tick() -> void:
	pass

func exit() -> void:
	pass

