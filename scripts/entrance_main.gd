extends Area2D

var sceneChangePath = "res://"
var sceneChangeExtention = ".tscn"
@export var sceneChanger: String = ""

func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file(sceneChangePath + sceneChanger + sceneChangeExtention)
	GamemodeHandler._update_gamemode(1)
	
