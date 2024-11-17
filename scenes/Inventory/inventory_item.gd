extends Resource

class_name InvItem

@export var name: String
@export var texture: Texture2D
@export var bigtexture: Texture2D
#@export var damage: int

#
#func _init(p_name = "null", p_texture = null):
	#name = p_name
	#texture = p_texture

func _init(p_name = "null", p_texture = null, p_bigtexture = null):
	name = p_name
	texture = p_texture
	bigtexture = p_bigtexture
	#damage = p_damage

func setTexture(p_texture = ""):
	texture = load(p_texture)

func setBigTexture(p_bigtexture = ""):
	bigtexture = load(p_bigtexture)
