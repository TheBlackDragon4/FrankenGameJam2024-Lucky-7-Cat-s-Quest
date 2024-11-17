extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func wait(t):
	await get_tree().create_timer(t).timeout
func time():
	Time.get_unix_time_from_system()
