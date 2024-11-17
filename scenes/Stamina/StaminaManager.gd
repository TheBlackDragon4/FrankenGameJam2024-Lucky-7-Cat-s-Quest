extends Node2D

var stamina = 0
var stamina_max = 10
var run_speed = 1
var climb_speed = -0.5
var running = 0 #false
var climbing = 0 #false
var constitution = 10    #determins the loss speed and regeneration speed
var recharging = false
var update_time = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _start_climb():
	if stamina > 1:
		climbing = 1 #true
func _stop_climb():
	climbing = 0 #false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if recharging:
		stamina = stamina + delta * constitution * .1
		stamina = max(0, min(stamina_max, stamina))
		return
		
	if Input.is_action_pressed("input_sprint"):
		running = 1
	else:
		running = 0
	var change = 0 - running*2 - climbing * 10
	stamina = stamina + delta * constitution * .1 + delta * change
	stamina = max(0, min(stamina_max, stamina))
	if stamina == 0:
		exhaust()
		running = 0 #false
		climbing = 0 #false
	var current_timestamp = Time.get_unix_time_from_system()
	if ((current_timestamp - update_time) > 0.1):
		#update the UX
		pass
	
func get_speed():
	if (running+climbing) > 0:
		return (1 + run_speed*running) * (1 + climb_speed*climbing)
	else:
		return 1

func exhaust():
	if recharging:
		return
	print("exhausted.")
	recharging = true
	await get_tree().create_timer(5).timeout
	recharging = false
	print("regained Energy")
