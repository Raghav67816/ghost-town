extends CharacterBody2D

@onready var animator = $AnimatedSprite2D
@onready var health_bar = $Health
@onready var ray = $RayCast2D

var patrol_speed = 1000
var run_speed = 2000

var can_see_player = false

# play idle animation by default
func _ready() -> void:
	animator.play("idle")
	
# roam around within a fixed range of cords
func patrol():
	var rand_x = self.position.x + randi_range(-5, 5)
	var rand_pos = Vector2(rand_x, 0)
	while !can_see_player and self.position != rand_pos:
		var dir = sign(rand_pos - position)
		velocity.x = dir*patrol_speed
		if dir < 0:
			animator.flip_h = true
		if dir >= 0:
			animator.flip_h = false
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
	if !can_see_player:
		patrol()
	move_and_slide()
