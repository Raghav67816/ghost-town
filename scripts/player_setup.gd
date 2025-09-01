extends Node2D

@onready var config = PlayerconfigAutoload.player_config
@onready var bindings = InitInput.keyboard_bindings

func _ready() -> void:
	var player1 = $Player1
	var player2 = $Player2
	
	var rope = $Rope
	
	rope.playero_joint = player1.get_path()
	rope.playert_joint = player2.get_path()
	
	player1.set_binding(bindings[config['Player1']['input_method']], config['Player1']['name'], config['Player1']['input_method'])
	player2.set_binding(bindings[config['Player2']['input_method']], config['Player2']['name'], config['Player2']['input_method'])
