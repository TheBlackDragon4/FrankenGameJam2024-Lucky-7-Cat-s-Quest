extends HBoxContainer

@onready var heart_gui_class = preload("res://gui/parts/heart.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func set_max_hearts(maxNum: int) -> void:
	for i in range(maxNum):
		var heart = heart_gui_class.instantiate()
		add_child(heart)
		

func update_hearts(current_health: int):
	var hearts = get_children()
	
	for heart in hearts:
		heart.update("full")
		
	for i in range(current_health, hearts.size()):
		hearts[i].update("empty")
	
func _on_player_damaged():
	print("Current Health: " + str(GamemodeHandler.health))
	print("Current Health: " + str(GamemodeHandler.health))
	update_hearts(GamemodeHandler.health)
	print("Current Health: " + str(GamemodeHandler.health))
	
