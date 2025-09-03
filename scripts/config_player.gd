extends Control

var config = PlayerconfigAutoload.player_config

func validate() -> String:
	if config['Player1']['name'] == config['Player2']['name']:
		return "Both players must have unique names."
	if config['Player1']['input_method'] == config['Player2']['input_method']:
		return "Please select unique input methods."
	if config['Player1']['avataar'] == config['Player2']['avataar']:
		return "Please select unique avatars."
	return ""


func is_configured() -> bool:
	for player in config.values():
		if player['name'] == "" or player['input_method'] == "" or player['avataar'] == "":
			return false
	return true


func try_start_game():
	if is_configured():
		var validation = validate()
		if validation == "":
			print("Config complete, starting game…")
			var error = get_tree().change_scene_to_file("res://scenes/levels/tutorial.tscn")
			if error != OK:
				push_error("Scene change failed: wrong path?")
		else:
			print("Validation failed:", validation)


func _on_avatar_selector_avatar_selected(player_name, avatar, input_method):
	config["Player1"]['name'] = player_name
	config['Player1']['input_method'] = input_method
	config['Player1']['avataar'] = avatar

	print("Player 1 configured")
	
	try_start_game()


func _on_avatar_selector_2_avatar_selected(player_name, avatar, input_method):
	config["Player2"]['name'] = player_name
	config['Player2']['input_method'] = input_method
	config['Player2']['avataar'] = avatar
	
	print("Player2 configured")
	
	try_start_game()
