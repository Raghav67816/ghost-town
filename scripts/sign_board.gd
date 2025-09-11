extends Sprite2D

@export var sign_sprite: Texture2D:
	set(value):
		sign_sprite = value
		if $Sign:
			$Sign.texture = value
