extends CanvasLayer

@onready var player_1hud = $Player1Info
@onready var player_2hud = $Player2Info

func init_stats(player_1name: String, player_2name: String):
	player_1hud.init_hud(player_1name)
	player_2hud.init_hud(player_2name)
	
