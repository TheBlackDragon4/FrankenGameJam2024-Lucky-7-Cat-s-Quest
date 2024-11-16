extends Node2D

@export var MAX_HEALTH: int = 7
@onready var health: int = MAX_HEALTH

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_health(new_health: int) -> void:
	health = new_health
