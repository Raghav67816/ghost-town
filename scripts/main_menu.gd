extends Control

var config_player_scene = "res://scenes/screens/ConfigPlayer.tscn"
var main_menu = "res://scenes/screens/MainMenu.tscn"

func _on_start_game_btn_pressed() -> void:
	get_tree().change_scene_to_file(config_player_scene)
	

func _on_options_btn_pressed() -> void:
	print("Options")
	

func _on_exit_btn_pressed() -> void:
	get_tree().quit()
