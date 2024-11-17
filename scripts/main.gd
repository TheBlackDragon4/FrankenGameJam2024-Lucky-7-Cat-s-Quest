extends Node2D

@onready var hearts_container = $ui_layer/lifebar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#hearts_container.set_max_hearts(7)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		$PauseMenu.open_pause_menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
