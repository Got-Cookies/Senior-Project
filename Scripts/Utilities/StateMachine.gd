class_name StateMachine extends Node

@export var initState : State

var currentState : State # Active State
var states : Dictionary  = {} # Transition to state, if conidtion are met

func _init():
	#Loop through all children to get a list of all possible states/transitions
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transition.connect(on_transition)
	#Check if initial State exist, then initialize state
	if initState:
		initState.enter()
		currentState = initState

func _process(delta):
	currentState.tick()

func _physics_process(delta):
	currentState.physics_tick()

func on_transition(from : State, to : State):
	pass
	
