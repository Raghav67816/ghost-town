extends HBoxContainer

@onready var player_name = $"VBoxContainer/PlayerName"
@onready var player_health = $VBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer/Health
@onready var player_weight = $VBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer2/Weight
@onready var player_face = $Sprite2D

func init_hud(_player_name: String, health: float = 100.0, weight: float = 50.0):
	player_name.text = _player_name
	player_health.value = health
	player_weight.value = weight
	
func update_stats(health: float, weight: float):
	player_health.value = health
	player_weight.value = weight
	
func get_stats() -> Array:
	return [player_health.value, player_weight.value]
