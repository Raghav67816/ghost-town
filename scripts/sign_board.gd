extends Sprite2D

@export var sign_sprite: Texture2D:
	set(value):
		sign_sprite = value
		if $Sign:
			$Sign.texture = value
			
@export var _flip_h: bool:
	set(value):
		$Sign.flip_h = value
		
