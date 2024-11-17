extends Area2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if has_overlapping_bodies() and get_overlapping_bodies()[0].get_class() == "CharacterBody2D":
	if has_overlapping_bodies():
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.get_class() == "CharacterBody2D":
				if Input.is_action_just_pressed("input_action"):
					self.visible = false
					#print(get_meta("postcard_index"))
					
					var tex : Texture2D
					var bigtex : Texture2D
					var name
					var index
					match get_meta("postcard_index"):
						0:
							index = 0
							tex = load("res://images/postcards/postcard_small.png")
							bigtex = load("res://images/icons/postcard.jpg")
							name = "Strand"
						1:
							index = 1
							tex = load("res://images/icons/postcard.png")
							bigtex = load("res://images/icons/postcard.jpg")
							name = "Strand"
						2:
							index = 2
							tex = load("res://images/postcards/postcard_small_3.png")
							bigtex = load("res://images/icons/postcard.jpg")
							name = "Strand"
						3:
							index = 3
							tex = load("res://images/icons/postcard.png")
							bigtex = load("res://images/icons/postcard.jpg")
							name = "Strand"
						4:
							index = 4
							tex = load("res://images/postcards/postcard_small_2.png")
							bigtex = load("res://images/postcards/postcard_dungeon_big.png")
							name = "Dungeon"
						5:
							index = 5
							tex = load("res://images/icons/postcard.png")
							bigtex = load("res://images/postcards/postcard_catchfish_big.png")
							name = "Strand"
						6:
							index = 6
							tex = load("res://images/postcards/postcard_small_4.png")
							bigtex = load("res://images/postcards/postcard_mountain_big.png")
							name = "Strand"
						_:
							index = 0
							tex = load("res://images/icons/postcard.png")
							bigtex = load("res://images/icons/postcard.jpg")
							name = "Strand"
							
						
					Global.inv.items[index] = InvItem.new(name, tex, bigtex)
			
			#selectedSlot.get_node("CenterContainer/Panel/Item_Display").texture = postcard
			#Global.inv.items[]
			#print(Global.inv.items)
			#Global.inv
		#print(get_overlapping_bodies()[0].get_class())# .has(CharacterBody2D))
		#print("Character is inside!")
	pass
