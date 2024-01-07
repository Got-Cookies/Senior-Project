extends Node
class_name State 

#Abstract class for states to derive from and input custom logic
signal Transition

@export var entity : CharacterBody2D

func enter() -> void:
	pass

func tick(_input : InputState) -> void:
	pass

func physics_tick(_input : InputState) -> void:
	pass

func exit() -> void:
	pass

