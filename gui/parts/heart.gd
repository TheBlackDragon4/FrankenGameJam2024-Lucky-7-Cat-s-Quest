extends Panel

@onready var sprite = $heart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play("full")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# State:
# 0: Empty
# 1: Full
func update(animation: String):
	sprite.play(animation)
