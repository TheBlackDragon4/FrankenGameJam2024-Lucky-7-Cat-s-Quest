extends Node

var gamemode = 1 # 1 = TopDown , 0 = Plattform
var isFreezed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_gamemode(changeMode: int):
	if (changeMode == 0):
		gamemode = 0
	else:
		gamemode = 1
