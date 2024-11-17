extends Node

var gamemode = 1 # 1 = TopDown , 0 = Plattform
var isFreezed = false
var lives = 7
var health = 7

@export var respawn_scene_path: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_gamemode(changeMode: int):
	if (changeMode == 0):
		gamemode = 0
	else:
		gamemode = 1
		
func _on_player_damaged():
	print("player got damaged, process.")
	health = health - 1
	if health > 0:
		get_tree().reload_current_scene()
	else:
		death()
	print("remaining health: " + str(health))
	pass	

func death():
	print("player died.")
	lives = lives -1
	if lives == 0:
		finish()
	else:
		health = 7
		get_tree().change_scene_to_file("res://scenes/Main.tscn")
		#teleport to the next world
	
func finish():
	print("game over")
	get_tree().change_scene_to_file("res://addons/EasyMenus/Scenes/main_menu.tscn")
