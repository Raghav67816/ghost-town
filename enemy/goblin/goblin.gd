extends CharacterBody2D

@onready var animator = $AnimatedSprite2D
@onready var health_bar = $Health
@onready var ray = $RayCast2D

var patrol_speed = 4000
var run_speed = 2000

var can_see_player = false
var is_patrolling = false

var patrol_position = Vector2.ZERO
var initial_position = position

func patrol(delta):
	is_patrolling = true
	initial_position = position
	var rand_x = self.position.x + randi_range(-5, 5)
	var rand_pos = Vector2(rand_x, 0)
	print(rand_pos)
	patrol_position = rand_pos
	var dir = sign(rand_pos - position).x
	if dir < 0: animator.flip_h = true
	if dir >= 0: animator.flip_h = false
	velocity.x = patrol_speed * dir * delta
	animator.play("run")
	move_and_slide()

# function to check if player collides with raycast
func can_see_player_():
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider is RigidBody2D:
			return true
	else:
		return false

func _physics_process(delta: float) -> void:
	velocity.y += 800 * delta
	can_see_player = can_see_player_()
	if !can_see_player and !is_patrolling:
		patrol(delta)
		
	if is_patrolling and initial_position.distance_to(patrol_position) <= 5:
		is_patrolling = false
		animator.play("idle")
		# slight delay
		print("stop patrolling")
		pass
		
	move_and_slide()	
