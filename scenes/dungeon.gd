extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.hearts_container.update_hearts()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
