class_name InputComponent extends Node

var state : InputState

var inputHandlers : Array

func _init():
	#Cache every possible Input Hanlder that could modify the Input State
	for child in get_children():
		if child is InputHandler:
			inputHandlers[child.get_index()] = child
			print_debug(child.get_index())
