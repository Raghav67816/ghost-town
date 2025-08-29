extends Control

signal avatar_selected(player_name, avatar, input_method)

@onready var input_method = $VBoxContainer2/VBoxContainer/InputMethod


func _ready() -> void:
	var avialable_input_methods = InitInput.keyboard_bindings.keys()
	
	for method in avialable_input_methods:
		input_method.add_item(method)

func _on_select_btn_pressed() -> void:
	var _player_name = $VBoxContainer2/VBoxContainer/PlayerName.text
	var _input_method = input_method.get_item_text(input_method.get_selected_id())
	
	emit_signal("avatar_selected", _player_name, "default", _input_method)
