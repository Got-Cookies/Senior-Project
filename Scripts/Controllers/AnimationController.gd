extends AnimatedSprite2D

@onready var player = get_parent()

func _process(delta):
	if(player.is_on_floor()):
		if(player.velocity.x > 75 or player.velocity.x < -75):
			play("walk")
		else:
			play("idle")
	else: #We are in the air
		play("jump", 0)
		if(player.velocity.y < -6):
			set_frame_and_progress(0,0)
		if(player.velocity.y > 6):
			set_frame_and_progress(1,0)
	
	if(player.velocity.x < 0): 
		flip_h = true
	elif(player.velocity.x > 0):
		flip_h = false
