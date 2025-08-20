extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -350.0

@onready var anim = $AnimatedSprite2D
var is_attacking = false
	
# handles player movement with animations
func handle_move(direction):
	if is_attacking:
		return
	
	if is_on_floor() and !is_attacking:
			
		if direction == -1: # left
			anim.flip_h = true
			anim.play("run")
		elif direction == 1: # right
			anim.flip_h = false
			anim.play("run")
			
		elif direction == 0:
			anim.play("idle")

		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
	else:
		if velocity.y < 0 and !is_attacking:
			anim.play("jump_start")
		else:
			anim.play("jump_end")



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("attack") and is_on_floor():
		is_attacking = true
		anim.play("attack")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis("move_left", "move_right")
	handle_move(direction)
			
	move_and_slide()


func _on_animation_finished() -> void:
	if anim.animation == "attack":
		print("attack finished")
		is_attacking = false
