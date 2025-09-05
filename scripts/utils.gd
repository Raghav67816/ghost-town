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
