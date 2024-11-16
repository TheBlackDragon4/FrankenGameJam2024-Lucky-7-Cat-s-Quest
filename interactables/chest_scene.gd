extends StaticBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite_open: Sprite2D = $SpriteOpen
@onready var sprite_closed: Sprite2D = $SpriteClosed
@onready var event_collision: CollisionShape2D = $InteractionArea/CollisionShape2D


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	sprite_closed.visible = false
	sprite_open.visible = true
	event_collision.disabled = true
	
