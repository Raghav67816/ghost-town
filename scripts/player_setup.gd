extends Node2D

@onready var config = PlayerconfigAutoload.player_config
@onready var bindings = InitInput.keyboard_bindings
@onready var hud = $Hud
@onready var camera = $Player1/Camera2D

# camera limiting points
@onready var limit_start = $Points/Start
@onready var limit_end = $Points/End


func _ready() -> void:
	set_camera_limits()
	var player1 = get_node("Player1")
	var player2 = get_node("Player2")
	
	player1.set_binding(bindings[config['Player1']['input_method']], config['Player1']['name'], config['Player1']['input_method'])
	player2.set_binding(bindings[config['Player2']['input_method']], config['Player2']['name'], config['Player2']['input_method'])
	
	player1.set_player_avataar(config['Player1']['avataar'])
	player2.set_player_avataar(config['Player2']['avataar'])
	
func set_camera_limits():
	camera.limit_left = limit_start.position.x
	camera.limit_right = limit_end.position.x
	camera.limit_bottom = limit_end.position.y
	camera.limit_top = limit_start.position.y
