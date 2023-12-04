extends Node

signal isDashing
signal finishedDashing

@onready var player = get_parent()

var dash_Speed : float
var dash_CoolDown : float

var dash_requested : bool

var canDash = false

func _input(event):
	if(event.is_action_pressed("Dash")):
		dash_requested = true
		isDashing
