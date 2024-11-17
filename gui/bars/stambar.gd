extends HBoxContainer

@onready var stam_gui_class = preload("res://gui/parts/StamFrame.tscn")
@onready var maxNum = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(maxNum):
		var heart = stam_gui_class.instantiate()
		add_child(heart)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var stam = StaminaManager.stamina
	var fishes = get_children()
	stam = floor(stam)
	for fish in fishes:
		fish.visible = true
	for i in range (stam, maxNum):
		fishes[i].visible = false

func set_max_stamina(maxNum: int) -> void:
	for i in range(maxNum):
		var heart = stam_gui_class.instantiate()
		add_child(heart)


func update_stamina(current_health: int):
	var hearts = get_children()
	
	for heart in hearts:
		heart.update("full")
