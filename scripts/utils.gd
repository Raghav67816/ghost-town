extends Node

var constants = Constants

# generic util functions 
func play_ui_sound(audio_stream_player: AudioStreamPlayer, _type: String):
	if _type == constants.UI_ACCEPT:
		audio_stream_player.stream = load(constants.UI_ACCEPT_SOUND)
		audio_stream_player.play()
		
	elif _type == constants.UI_NAVIGATE:
		audio_stream_player.stream = load(constants.UI_NAVIGATE_SOUND)
		audio_stream_player.play()
		
func play_player_sound(audio_stream_player: AudioStreamPlayer2D, action: String, randomize_pitch: bool, rand_range: Vector2):
	var active_sound = ""
	if action == "attack":
		active_sound = "res://sounds/sword_swing.mp3"
	elif action == "jump":
		active_sound = "res://sounds/jump.wav"
		
	if active_sound != "":
		audio_stream_player.stream = load(active_sound)
		if randomize_pitch:
			audio_stream_player.pitch_scale = randf_range(rand_range.x, rand_range.y)
		audio_stream_player.play()
