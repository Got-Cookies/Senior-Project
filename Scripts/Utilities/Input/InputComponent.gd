class_name InputComponent extends InputState

var Ihandlers : Dictionary = {}

func _ready():
	#Cache every possible Input Hanlder that could modify the Input State
	for child in get_children():
		if child is InputHandler:
			Ihandlers[child.get_index()] = child

func _process(delta):
	for n in Ihandlers.size():
		Ihandlers[n].ProcessInput(self)
