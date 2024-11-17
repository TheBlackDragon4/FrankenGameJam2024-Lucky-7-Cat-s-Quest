extends Control

@onready var slots: Array = $NinePatchRect.get_children()
#@onready var craft_slots: Array = $NinePatchCrafting/GridContainer.get_children()

var inv_open = false
@onready var selectedSlot = $NinePatchRect/Inv_UI_Slot1
#@onready var selectedSlotCrafting = $NinePatchCrafting/Craft_UI_Slot1
var slotArray = []
var currentPos = 0
var selectMode = "inv" # inv or craft

var firstRun = true

var invMovementAllowed = true

var postcard = load("res://images/icons/postcard.png")
var bigtexpath

#@onready var dialog = $DeleteDialog
#@onready var equipButton = $DeleteDialog/HBoxContainer/Equip
#@onready var deleteButton = $DeleteDialog/HBoxContainer/Delete
#@onready var cancelButton = $DeleteDialog/HBoxContainer/Cancel
#
#@onready var craftDialog = $CraftingDialog
#@onready var craftButton = $CraftingDialog/VBoxContainer/Craft
#@onready var removeButton = $CraftingDialog/VBoxContainer/Remove
#@onready var insertButton = $CraftingDialog/VBoxContainer/Insert

#@onready var weapon = slots[0]

# ---- Sprite gen
#@onready var equipSprite = get_parent().get_node("HandEquip").get_child(0)


# Anzahl der Texturen in horizontaler und vertikaler Richtung
var rows = 3
var cols = 3

# Liste der Texturen
#var textures = [load("res://icons/dummy/stick.png"),
#load("res://icons/dummy/stick2.png"),
#load("res://icons/dummy/stick3.png"),
#load("res://icons/dummy/stick5.png"),
#load("res://icons/dummy/stick9.png")]

#@onready var canvas_layer = get_parent().get_node("CanvasLayer")
# ----


func _ready():	
	update_slots()
	close()
	for slot in $NinePatchRect.get_children():
		slotArray.append(slot)
	bigtexpath = $TextureRect
	bigtexpath.visible = false
	#for slot in $NinePatchCrafting.get_children()u
	
	# ---- Sprite gen
	# Texturen laden (Hier fügen Sie Ihre Texturen hinzu)
	#for i in range(rows * cols):
		#var texture = load("res://icons/dummy/stick.png")
		#textures.append(texture)

#
func update_slots():
	for i in range(7):
		slots[i].update(Global.inv.items[i])
	#for i in range(9):
		#craft_slots[i].update(Global.craft.items[i])

func _process(_delta):
	#if Input.is_action_just_pressed("Inventory") and dialog.visible:
			#equipButton.emit_signal("pressed")
			#dialog.visible = false
	#if Input.is_action_just_pressed("menu_first") and dialog.visible:
			#deleteButton.emit_signal("pressed")
			#dialog.visible = false
	#if Input.is_action_just_pressed("menu_second") and dialog.visible:
			#cancelButton.emit_signal("pressed")
			#dialog.visible = false
	pass
	#print(equipSprite.offset)
	#print(equipSprite)


func _input(_event):
	#if Input.is_action_just_pressed("start_crafting") and craftDialog.visible:
			#craftButton.emit_signal("pressed")
			#craftDialog.visible = false
			#invMovementAllowed = true
	#if Input.is_action_just_pressed("crafting_insert") and craftDialog.visible:
			#insertButton.emit_signal("pressed")
			#craftDialog.visible = false
			#invMovementAllowed = true
	var visibility_changed = false
	if Input.is_action_just_pressed("input_action") and bigtexpath.visible == true:
		bigtexpath.visible = false
		invMovementAllowed = true
		visibility_changed = true
		
			#removeButton.emit_signal("pressed")
			#craftDialog.visible = false
			#invMovementAllowed = true

	#if Input.is_action_just_pressed("interact"):
		#update_slots()
		
	if Input.is_action_just_pressed("input_inventory"):
		if inv_open:
			close()
		else:
			open()
	if inv_open:
		var action = ""
		if Input.is_action_just_pressed("input_left"):
			action = "left"
		if Input.is_action_just_pressed("input_right"):
			action = "right"
		if Input.is_action_just_pressed("input_up"):
			action = "up"
		if Input.is_action_just_pressed("input_down"):
			action = "down"
		
		
		if currentPos > -1:
			selectedSlot.get_node("Sprite2D").animation = "default"
		#else:
			#selectedSlotCrafting.get_node("Sprite2D").animation = "default"
		
		if invMovementAllowed:
			match action:
				"left":
						match currentPos:
							0:
								currentPos = 1
								#selectMode = "craft"
							2:
								currentPos = 4
								#selectMode = "craft"
							5:
								currentPos = 6
							_:
								currentPos = currentPos-1
								
				"right":
						match currentPos:
							1:
								currentPos = 0
							4:
								currentPos = 2
							6:
								currentPos = 5
							_:
								currentPos = currentPos+1
								
				"up":
						match currentPos:
							0:
								currentPos = 5
							1:
								currentPos = 6
							2:
								currentPos = 0
							3:
								currentPos = 0
							4:
								currentPos = 1
							5:
								currentPos = 2
							6:
								currentPos = 4
							_:
								currentPos = 0
									
				"down":
						match currentPos:
							0:
								currentPos = 2
							1:
								currentPos = 4
							2:
								currentPos = 5
							3:
								currentPos = 5
							4:
								currentPos = 6
							5:
								currentPos = 0
							6:
								currentPos = 1
							_:
								currentPos = 0
						
		#if selectMode == "inv" and currentPos > -1:
			#selectedSlot = slotArray[currentPos]
			#selectedSlot.get_node("Sprite2D").animation = "selected"
		if currentPos > -1:
			selectedSlot = slotArray[currentPos]
			selectedSlot.get_node("Sprite2D").animation = "selected"
		#elif craftingPos > -1:
			#selectedSlotCrafting = craftArray[craftingPos]
			#selectedSlotCrafting.get_node("Sprite2D").animation = "selected"
		
		#if Input.is_action_just_pressed("delete_item"):
			#if Global.inv.items[currentPos] != null and currentPos != 0:
				#dialog.visible = true
		if Input.is_action_just_pressed("input_action") and bigtexpath.visible != true and visibility_changed == false:
			if Global.inv.items[currentPos] != null:
				bigtexpath.texture = Global.inv.items[currentPos].bigtexture 
				bigtexpath.visible = true
				invMovementAllowed = false
				
			#selectedSlot
			#if selectMode == "craft":
				##craftDialog.visible = true
				#invMovementAllowed = false

		# Siehe _on_insert_pressed()!
		#if Input.is_action_just_pressed("confirm_insert") and craftingPos == -1:
			##print("Pressed L")
			#var tempSlot = selectedSlot
			#var oldCurrentPos = currentPos
			#var usedCraftItem
			##craftingPos = oldCraftingPos
			##currentPos = -1
			##selectMode = "craft"
			#selectedSlotCrafting = tempSlot
			##if Global.craft.items[oldCraftingPos] != null:
				##usedCraftItem = Global.craft.items[oldCraftingPos]
			##Global.craft.items[oldCraftingPos] = Global.inv.items[oldCurrentPos]
			##Global.inv.items[oldCurrentPos] = usedCraftItem
			#update_slots()

func close():
	$"..".isFreezed = false
	inv_open = false
	visible = false
	#dialog.visible = false
	#craftDialog.visible = false
	invMovementAllowed = true

func open():
	update_slots()
	#print(Global.inv.items)
	get_parent().isFreezed = true
	inv_open = true
	visible = true
	#if currentPos > -1:
		#selectedSlot.get_node("Sprite2D").animation = "selected"

#func _on_delete_pressed():
	#Global.inv.items[currentPos] = null
	#update_slots()

#func _on_equip_pressed():
	#var prevEquipedItem = Global.inv.items[0]
	#Global.inv.items[0] = Global.inv.items[currentPos]
	#Global.inv.items[currentPos] = prevEquipedItem
	#Global.weapon = Global.inv.items[0]
	#update_slots()

#func _on_craft_pressed():
	#var flag = false
	#for i in range(len(Global.craft.items)):
		#if Global.craft.items[i] != null:
			#flag = true
			#break
	#update_slots()
	#if flag:
		#var output = []
		#var input = []
		#for i in range(9):
			#if Global.craft.items[i] == null:
				#input.append("empty")
			#else:
				#var txt = ""
				##var txt = "icons/dummy/"
				#txt = txt.insert(txt.length(), Global.craft.items[i].name)
				##txt = txt.insert(txt.length(), ".png")
				#input.append(txt)
				#
		#print("input: ", input)
		#OS.execute("python scripts/sprite-fuser.exe", input, output)
		#print("output: ", output)
		#for i in range(9):
			#Global.craft.items[i] = null
		#OS.execute("python scripts/sprite-fuser.exe", input, output)
		#var splitted_output = output[0].rsplit("\r\n", true)
		#print(splitted_output)
		#OS.delay_msec(100)
		##ResourceLoader.load(splitted_output[0])
		#var loaded_flag = false
		#while !loaded_flag:
			#Global.craft.items[4] = InvItem.new(splitted_output[0].to_lower(), load(splitted_output[0].to_lower()), 20)
			#if Global.craft.items[4].texture != null:
				#loaded_flag = true
			#else:
				#OS.delay_msec(300)
		#update_slots()

	
#func _on_remove_pressed():
	#selectedSlotCrafting.get_node("Sprite2D").animation = "default"
	#for array_item_index in range(1, Global.inv.items.size()):
		#if Global.inv.items[array_item_index] == null: 
			#Global.inv.items[array_item_index] = Global.craft.items[craftingPos]
			#Global.craft.items[craftingPos] = null
			#update_slots()
			#break


#func _on_insert_pressed():	
	#if firstRun:
		#firstRun = false
	#selectedSlotCrafting.get_node("Sprite2D").animation = "crafting"
	#oldCraftingPos = craftingPos
	#currentPos = 0
	#craftingPos = -1
	#selectMode = "inv"
	#selectedSlot = slotArray[currentPos]
	#selectedSlot.get_node("Sprite2D").animation = "selected"
	#update_slots()
#
##func importImage(path):    
	##var texFile = File.new()
	##texFile.open(path,File.READ)
	##var bytes = texFile.get_buffer(texFile.get_len())
	##var img = Image.new()
	##var _data = img.load_png_from_buffer(bytes)
	##var imgtex = ImageTexture.new()
	##imgtex.create_from_image(img)
	##texFile.close()
	##return imgtex
