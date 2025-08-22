# Input are as follows
# 0 -> move_left
# 1 -> move_right
# 2 -> wasd_jump
# 3 -> wasd_attack


extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -350.0

@onready var anim = $AnimatedSprite2D

var is_attacking = false

var player_actions = {
	"move_left": "",
	"move_right": "",
	"jump": "",
	"attack": ""
}
var player_bindings = {}
	
func set_binding(_bindings: Dictionary, player_name: String, binding_id: String):
	
	player_bindings[player_name] = _bindings
	
	for action in player_bindings[self.name].keys():
		var action_name = self.name + "_" + binding_id + "_" + action
		player_actions[action] = action_name
		
		if InputMap.has_action(action_name):
			InputMap.erase_action(action_name)
		
		InputMap.add_action(action_name)
		var evkey = InputEventKey.new()
		evkey.physical_keycode = player_bindings[self.name][action]
		InputMap.action_add_event(action_name, evkey)
		
	
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
	if Input.is_action_just_pressed(player_actions['attack']) and is_on_floor():
		is_attacking = true
		anim.play("attack")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(player_actions['jump']) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis(player_actions['move_left'], player_actions['move_right'])
	handle_move(direction)
			
	move_and_slide()


func _on_animation_finished() -> void:
	if anim.animation == "attack":
		print("attack finished")
		is_attacking = false
