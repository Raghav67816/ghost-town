extends Control

@onready var audio_stream_player = $AudioStreamPlayer
@onready var main_menu_content = $MainMenuContent
@onready var config_player_content = $ConfigPlayerContent

var utils = Utils
var constants = Constants
var config_player_scene = "res://scenes/screens/ConfigPlayer.tscn"
var main_menu = "res://scenes/screens/MainMenu.tscn"


func _ready() -> void:
	config_player_content.visible = false
	$BGMPlayer.stream = load("res://sounds/bgm-menu.mp3")
	$BGMPlayer.play()

func _on_start_game_btn_pressed() -> void:
	utils.play_ui_sound(audio_stream_player, constants.UI_ACCEPT)
	main_menu_content.visible = false
	config_player_content.visible = true

func _on_options_btn_pressed() -> void:
	utils.play_ui_sound(audio_stream_player, constants.UI_ACCEPT)
	print("Options")
	

func _on_exit_btn_pressed() -> void:
	get_tree().quit()
