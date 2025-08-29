extends Node2D

@onready var config = PlayerconfigAutoload.player_config
@onready var bindings = InitInput.keyboard_bindings

func _ready() -> void:
	var player1 = $Player1
	var player2 = $Player2
	
	print(bindings[config['Player1']['input_method']])
	
	player1.set_binding(bindings[config['Player1']['input_method']], config['Player1']['name'], config['Player1']['input_method'])
	player2.set_binding(bindings[config['Player2']['input_method']], config['Player2']['name'], config['Player2']['input_method'])
