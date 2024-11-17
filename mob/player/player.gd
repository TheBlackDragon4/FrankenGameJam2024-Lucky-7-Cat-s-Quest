extends CharacterBody2D


var speed = 300.0
const JUMP_VELOCITY = -400.0

@onready var hearts_container = $ui_layer/lifebar

var isFreezed = false

func _physics_process(delta):
	if not GamemodeHandler.isFreezed:
		# Add the gravity.
		
		if not is_on_floor():
			velocity += get_gravity() * delta
		# Handle jump.
		#if Input.is_action_just_pressed("jump"):
		if GamemodeHandler.gamemode == 1:
			speed = 100 * StaminaManager.get_speed()
			
			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			var direction_h := Input.get_axis("input_left", "input_right")
			var direction_v := Input.get_axis("input_up", "input_down")
			
			if direction_v:
				velocity.y = direction_v * speed
			else:
				velocity.y = move_toward(velocity.y, 0, speed)
				
			if direction_h:
				velocity.x = direction_h * speed
			else:
				velocity.x = move_toward(velocity.x, 0, speed)
				
			
			if Input.is_action_pressed("input_right"):
				if StaminaManager.running == 0:
					$AnimatedSprite2D.play("walk_right")
				else:
					$AnimatedSprite2D.play("run_right")
			else:
				if Input.is_action_pressed("input_left"):
					if StaminaManager.running == 0:
						$AnimatedSprite2D.play("walk_left")
					else:
						$AnimatedSprite2D.play("run_left")
				else:
					if Input.is_action_pressed("input_up"):
						$AnimatedSprite2D.play("walk_up")
					else:
						if Input.is_action_pressed("input_down"):
							$AnimatedSprite2D.play("walk_down")
			
			if Input.is_anything_pressed() == false:
				$AnimatedSprite2D.play("idle")
				
				
		else:		
			speed = 150 * StaminaManager.get_speed()
			if Input.is_action_just_pressed("input_action") and is_on_floor():
				velocity.y = JUMP_VELOCITY
			if not is_on_floor():
				if velocity.y < 0:
					if velocity.x < 0: 
						$AnimatedSprite2D.play("jump_left")
					else:
						$AnimatedSprite2D.play("jump_right")
						
				else:
					if velocity.x < 0: 
						$AnimatedSprite2D.play("fall_left")
					else:
						$AnimatedSprite2D.play("fall_right")
							
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
				velocity.x = direction * speed
			else:
				velocity.x = move_toward(velocity.x, 0, speed)

		move_and_slide()



# Called when the node enters the scene tree for the first time.
func _ready():
	hearts_container.set_max_hearts(7)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
