extends CharacterBody2D

const SPEED = 300.0

@onready var animator = $AnimatedSprite2D
@onready var health_bar = $Health
@onready var ray = $RayCast2D

enum State {idle, patrol, attack}

func _physics_process(delta: float) -> void:
	match State:
		State.idle:
			on_idle(delta)
		State.patrol:
			on_patrol(delta)
		State.attack:
			on_patrol(delta)


func on_idle(delta):
	animator.play("idle")
	
func on_patrol(delta):
	var rand_x = randf_range(-5, 5)
	
func on_attack(delta):
	pass
