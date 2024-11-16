extends Node2D

@onready var hearts_container = $ui_layer/lifebar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Initlize player health
	hearts_container.set_max_hearts(7)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
