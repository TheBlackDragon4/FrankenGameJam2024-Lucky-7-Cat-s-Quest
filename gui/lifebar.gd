extends HBoxContainer

@onready var heart_gui_class = preload("res://gui/parts/heart.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_max_hearts(max: int) -> void:
	for i in range(max):
		var heart = heart_gui_class.instantiate()
		add_child(heart)
		

func update_hearts(current_health: int):
	var hearts = get_children()
	
	for heart in hearts:
		heart.update("full")
		
	for i in range(current_health, hearts.size()):
		hearts[i].update("empty")
