extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("input_action") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_h := Input.get_axis("input_left", "input_right")
	var direction_v := Input.get_axis("input_up", "input_down")
	if direction_h:
		velocity.x = direction_h * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction_v:
		velocity.y = direction_v * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
