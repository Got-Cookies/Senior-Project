extends Node
class_name StateMachine 

@export var initState : State
@export var _input : InputState

signal StateChange

@export var currentState : State # Active State
var states : Dictionary  = {} # Transition to state, if conidtion are met

func _ready():
	#Loop through all children to get a list of all possible states/transitions
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.Transition.connect(on_transition)

	#Check if initial State exist, then initialize state
	if initState:
		initState.enter()
		currentState = initState


func _process(delta):
	if currentState:
		currentState.tick(_input)

func _physics_process(delta):
	if currentState:
		currentState.physics_tick(_input)

func on_transition(from : State, to : State):
	#Check if the active state wants to transition out
	if(from != currentState):
		return
	
	var newState = states.get(to.name)
	if newState == null:
		return
	
	if currentState:
		currentState.exit()

	newState.enter()
	
	currentState = newState
	
