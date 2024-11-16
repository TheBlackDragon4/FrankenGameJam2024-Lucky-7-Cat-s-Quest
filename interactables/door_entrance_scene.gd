extends StaticBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite_open: Sprite2D = $SpriteOpen
@onready var sprite_closed: Sprite2D = $SpriteClosed
@onready var collision: CollisionShape2D = $CollisionShape

var is_opened = false

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	sprite_closed.visible = is_opened
	is_opened = not is_opened
	sprite_open.visible = is_opened
	collision.disabled = is_opened
