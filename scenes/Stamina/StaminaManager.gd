extends Node2D

var stamina = 0
var stamina_max = 10
var run_speed = 1
var climb_speed = -0.5
var running = 0 #false
var climbing = 0 #false
var constitution = 10    #determins the loss speed and regeneration speed
var drain_speed = 0
var regeneration_value = 0
var update_time = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	regeneration_value = constitution*0.1-0.1 * drain_speed
	pass # Replace with function body.

func _start_climb():
	if stamina > 1:
		climbing = 1 #true
func _stop_climb():
	climbing = 0 #false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stamina > 1 and Input.is_action_pressed("input_sprint"):
		running = 1
		print (running)
	var change = 1 - running*2 - climbing * 10
	stamina = stamina + delta * constitution * .1
	stamina = max(0, min(stamina_max, stamina))
	if stamina == 0:
		running = 0 #false
		climbing = 0 #false
	var current_timestamp = Time.get_unix_time_from_system()
	if ((current_timestamp - update_time) > 0.1):
		#update the UX
		pass
	
func get_speed():
	if (running+climbing) > 0:
		print((1 + run_speed*running) * (1 + climb_speed*climbing))
		return (1 + run_speed*running) * (1 + climb_speed*climbing)
	else:
		return 1
