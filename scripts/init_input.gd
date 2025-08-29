# Input are as follows
# 0 -> move_left
# 1 -> move_right
# 2 -> wasd_jump
# 3 -> wasd_attack

extends Node

# give player option to select desired bindings from the same keyboard - mainly for development.
var keyboard_bindings = {
	"wasd": {
		"move_left": KEY_A,
		"move_right": KEY_D,
		"jump": KEY_W,
		"attack": KEY_SPACE
	},
	
	"arrows": {
		"move_left": KEY_LEFT,
		"move_right": KEY_RIGHT,
		"jump": KEY_UP,
		"attack": MOUSE_BUTTON_LEFT
	}
}
