extends Control

@onready var audio_stream_player = $AudioStreamPlayer

var utils = Utils
var constants = Constants
var config_player_scene = "res://scenes/screens/ConfigPlayer.tscn"
var main_menu = "res://scenes/screens/MainMenu.tscn"

func _on_start_game_btn_pressed() -> void:
	utils.play_ui_sound(audio_stream_player, constants.UI_ACCEPT)
	get_tree().change_scene_to_file(config_player_scene)
	

func _on_options_btn_pressed() -> void:
	utils.play_ui_sound(audio_stream_player, constants.UI_ACCEPT)
	print("Options")
	

func _on_exit_btn_pressed() -> void:
	get_tree().quit()
