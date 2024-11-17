extends Node2D

@export var text: String = ""
#@export var keybind: String = ""
@onready var textBubble = $"%Text"
@onready var bubble = $"%textbubble"

@onready var interaction_area: InteractionArea = $InteractionArea




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	textBubble.text = "[color=black]" + text + "[/color]"
	#interaction_area.interact = Callable(self, "_on_interact")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D) -> void:
	textBubble.visible = not textBubble.visible
	bubble.visible = not bubble.visible


func _on_body_exited(body: Node2D) -> void:
	textBubble.visible = not textBubble.visible
	bubble.visible = not bubble.visible
