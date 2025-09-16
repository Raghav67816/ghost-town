extends CharacterBody2D

@onready var animator = $AnimatedSprite2D
@onready var health_bar = $Health

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
		var dir = rand_pos.sign()
		velocity = dir*patrol_speed
		if dir < 0:
			animator.flip_h = true
		if dir >= 0:
			animator.flip_h = false
		animator.play("run")
		
# function to check if player collides with raycast
func can_see_player_() ->  bool:
	return true
	
func _physics_process(delta: float) -> void:
	if !can_see_player:
		pass
