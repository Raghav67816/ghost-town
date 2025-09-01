extends RigidBody2D

const SPEED = 1500.0
const JUMP_FORCE = -900.0

@onready var anim = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var ray = $RayCast2D

var is_attacking = false

func _ready() -> void:
	anim.play("idle")

var player_actions = {
	"move_left": "",
	"move_right": "",
	"jump": "",
	"attack": ""
}
var player_bindings = {}

func set_binding(_bindings: Dictionary, player_name: String, binding_id: String):
	
	player_bindings[player_name] = _bindings
	
	var player_name_label = $PlayerName
	player_name_label.text = player_name
	
	for action in player_bindings[player_name].keys():
		var action_name = self.name + "_" + binding_id + "_" + action
		player_actions[action] = action_name
		
		if InputMap.has_action(action_name):
			InputMap.erase_action(action_name)
		
		if action == "attack" and player_bindings[player_name]['attack'] == MOUSE_BUTTON_LEFT:
			var mouse_attack_event = InputEventMouseButton.new()
			mouse_attack_event.button_index = MOUSE_BUTTON_LEFT
			InputMap.add_action(action_name)
			InputMap.action_add_event(action_name, mouse_attack_event)
			
		else:
			InputMap.add_action(action_name)
			var evkey = InputEventKey.new()
			evkey.physical_keycode = player_bindings[player_name][action]
			InputMap.action_add_event(action_name, evkey)
			
func _is_on_floor() -> bool:
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider and (collider is StaticBody2D or collider is TileMapLayer):
	
			return true
	return false

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var direction = Input.get_axis(player_actions['move_left'], player_actions['move_right'])
	apply_force(Vector2(SPEED * direction, 0), Vector2(0, 10))
	state.linear_velocity = state.linear_velocity.limit_length(200)
	
	if direction < 0: 
		anim.flip_h = true
		anim.play("run")
		
	elif direction > 0:
		anim.flip_h = false
		anim.play("run")
		
	elif direction == 0  and is_attacking == false:
		anim.play("idle")
		
			
	if Input.is_action_just_pressed(player_actions['jump']) and is_attacking == false:
		if _is_on_floor():
			print("Jumping")
			anim.play("jump_start")
			linear_velocity.y = -1500
			
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(player_actions['attack']) and is_attacking == false:
		is_attacking = true
		anim.play("attack")

func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "attack":
		is_attacking = false
		anim.play("idle")
