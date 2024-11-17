extends Node

var inv: Inv = load("res://scenes/Inventory/player_inventory.tres")
var questsystem = QuestSystemManagerAPI.new()
var questsJSONFile = "res://quests/quests.json"

func _ready():
	var quest = Quest.new()
	quest.quest_description = "Daniel es geht"
	quest.quest_name = "Init"
	quest.id = 1
	#questsystem.mark_quest_as_available(quest)
	#questsToJSON()
	importQuestsFromJSON()
	for q in questsystem.get_available_quests():
		print(q)

func questsToJSON():
	var file = FileAccess.open(questsJSONFile,FileAccess.WRITE)
	file.store_string(JSON.stringify(questsystem.serialize_quests()))
	

func importQuestsFromJSON():
	var file = FileAccess.open(questsJSONFile,FileAccess.READ)
	questsystem.deserialize_quests(JSON.parse_string(file.get_file_as_string(questsJSONFile)))
	
