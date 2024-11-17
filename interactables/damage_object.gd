extends StaticBody2D
signal player_damaged

@onready var interaction_area: InteractionArea = $InteractionArea


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	player_damaged.emit()
	print("player_damaged fired")
