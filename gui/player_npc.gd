extends CharacterBody2D


var speed = 60.
const JUMP_VELOCITY = -400.0

@onready var hearts_container = $ui_layer/lifebar


var wait_time = 1.
var last_timestamp = Time.get_unix_time_from_system()
var is_moving: bool = false 
var l_r: bool = true
var u_d: bool = false

 
func _physics_process(delta):
	
	# Wait for next time
	var current_timestamp = Time.get_unix_time_from_system()
	if current_timestamp - last_timestamp > wait_time:
	
		# Calc next timestamp
		is_moving = !is_moving
		if is_moving:
			wait_time = randf_range(0.2, 1.0)
		else:
			wait_time = randf_range(1.5, 5.0)
		last_timestamp = current_timestamp 
		
		# Calc orientation
		l_r = randi() % 2 == 0
		u_d = randi() % 2 == 0
	
	if not is_moving:
		$AnimatedSprite2D.play("idle")
		return
	
	if u_d:
		$AnimatedSprite2D.play("walk_up")
	else:
		$AnimatedSprite2D.play("walk_down")
	
	if l_r:
		$AnimatedSprite2D.play("walk_left")
	else:
		$AnimatedSprite2D.play("walk_right")
	
	if l_r:
		velocity.x = -1 * speed
	else:
		velocity.x = speed
	
	if u_d:
		velocity.y = speed
	else:
		velocity.y = -1 * speed
	
	
	move_and_slide()


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()  # Ensure random values each time the game runs


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
