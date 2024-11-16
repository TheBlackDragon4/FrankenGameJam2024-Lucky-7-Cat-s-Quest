extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#hearts_container.set_max_hearts(7)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		$PauseMenu.open_pause_menu()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
