extends Area2D

signal player_damaged

var sceneChangePath = "res://"
var sceneChangeExtention = ".tscn"
@export var sceneChanger: String = ""
@export var activate_on_collision: bool = true
@export var hide_sprites: bool = false
@export var new_gamemode: int = 0

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite_before: Sprite2D = $SpriteBefore
@onready var sprite_after: Sprite2D = $SpriteAfter
@onready var event_collision: CollisionShape2D = $InteractionArea/CollisionShape2D

func _ready():
	if hide_sprites:
		sprite_after.visible = false
		sprite_before.visible = false
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
		event()
		# await get_tree().create_timer(0.1).timeout	

func _on_interact():	
		event()
	#GamemodeHandler.isFreezed = true
func event():
	print("SHOOT EM TO THE SKYYY")
	player_damaged.emit()
