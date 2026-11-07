extends Sprite2D
 
# Kecepatan gerak (pixel per detik).
# @export → bisa diubah dari Inspector.
@export var speed : float = 400.0
 
func _process(delta):
	# -1 (kiri), 0 (diam), 1 (kanan)
	var direction = Input.get_axis(
		"move_left", "move_right")
 
	# Gerak berbasis waktu.
	var view_size = get_viewport_rect().size
	position.x = clamp(position.x, 75, view_size.x -75)
	position.x += direction * speed * delta
