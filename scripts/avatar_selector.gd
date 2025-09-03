extends Control

signal avatar_selected(player_name, avatar, input_method)

@onready var input_method = $VBoxContainer2/VBoxContainer/InputMethod
@onready var avataar_sprite = $VBoxContainer2/HBoxContainer/Panel/AvatarTexture
@onready var default_avataar_idx = randi() % 3

var sprites = [
		"res://sprite frames/green idle.tres",
		"res://sprite frames/red idle.tres",
		"res://sprite frames/blue idle.tres"
]

func _ready() -> void:
	var avialable_input_methods = InitInput.keyboard_bindings.keys()
	
	avataar_sprite.sprite_frames = load(sprites[default_avataar_idx])
	avataar_sprite.play("idle")
	
	for method in avialable_input_methods:
		input_method.add_item(method)

func _on_select_btn_pressed() -> void:
	var _player_name = $VBoxContainer2/VBoxContainer/PlayerName.text
	var _input_method = input_method.get_item_text(input_method.get_selected_id())
	
	emit_signal("avatar_selected", _player_name, "default", _input_method)


func _on_next_btn_pressed() -> void:
	if default_avataar_idx+1 >= len(sprites):
		default_avataar_idx = 0
	else:
		default_avataar_idx += 1
	avataar_sprite.sprite_frames = load(sprites[default_avataar_idx])
	avataar_sprite.play("idle")


func _on_prev_btn_pressed() -> void:
	if default_avataar_idx - 1 <= len(sprites):
		default_avataar_idx = 0
	else:
		default_avataar_idx -= 1
	avataar_sprite.sprite_frames = load(sprites[default_avataar_idx])
	avataar_sprite.play("idle")
