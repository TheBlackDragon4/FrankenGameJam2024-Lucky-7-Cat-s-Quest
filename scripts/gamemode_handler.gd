extends Node

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
		
func _on_player_damaged():
	print("player got damaged, process.")
	health = health - 1
	if health > 0:
		get_tree().reload_current_scene()
		
		#var player
		#player = get_node("Player")
		#player.find_child("ui_layer/lifebar").update_hearts()
		#var player
		#player = find_child("Player", true)  # Zuweisung separat
		#if player:
			#print("Player gefunden")
			#print(player.hearts_container)
		#var hearts_container = $ui_layer/lifebar
		#$Player.hearts_container.update_hearts()
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
