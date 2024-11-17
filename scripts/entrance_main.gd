extends Area2D

var sceneChangePath = "res://"
var sceneChangeExtention = ".tscn"
@export var sceneChanger: String = ""
@export var activate_on_collision: bool = true
@export var hide_sprites: bool = false
@export var new_gamemode: int = 0

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite_open: Sprite2D = $SpriteOpen
@onready var sprite_closed: Sprite2D = $SpriteClosed
@onready var event_collision: CollisionShape2D = $InteractionArea/CollisionShape2D

func _ready():
	if hide_sprites:
		sprite_open.visible = false
		sprite_closed.visible = false
	if activate_on_collision:
		event_collision.disabled = true
	else:
		$CollisionShape2D.disabled = true
		interaction_area.interact = Callable(self, "_on_interact")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(body: CharacterBody2D) -> void:
	if activate_on_collision:
		call_deferred("_change_scene")
		# await get_tree().create_timer(0.1).timeout
		
		
func _on_interact():	
	call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file(sceneChangePath + sceneChanger + sceneChangeExtention)
	
