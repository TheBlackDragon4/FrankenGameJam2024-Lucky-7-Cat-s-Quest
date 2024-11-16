extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var hearts_container = $ui_layer/lifebar

var isFreezed = false

func _physics_process(delta):
	if not isFreezed:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		

		# Handle jump.
		#if Input.is_action_just_pressed("jump"):
		if Input.is_action_just_pressed("input_action") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			$AnimatedSprite2D.play("jump")
			
			#self.position += Vector2(0.0, -10.0)
		
		if Input.is_anything_pressed() == false and is_on_floor():
			$AnimatedSprite2D.play("idle")
			
		if Input.is_action_just_pressed("input_left"):
			$AnimatedSprite2D.play("walk_left")
			
		if Input.is_action_just_pressed("input_right"):
			$AnimatedSprite2D.play("walk_right")
			

		#if Input.is_action_just_pressed("crouch"):
			#self.position += Vector2(0.0, 10.0)

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("input_left", "input_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()



# Called when the node enters the scene tree for the first time.
func _ready():
	hearts_container.set_max_hearts(7)
	hearts_container.update_hearts(5)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
