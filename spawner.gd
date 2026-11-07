extends Timer
# ^ Timer: node untuk menghitung waktu mundur dan memicu event berulang.

# KONSEP: @export var dengan tipe PackedScene — menyimpan referensi ke scene file (.tscn).
#          Kita bisa drag & drop scene buah dari FileSystem ke Inspector.
@export var fruit_scene : PackedScene

# FUNGSI: _ready()
# APA:     Menghubungkan signal timeout milik Timer sendiri ke fungsi _on_timeout.
# PARAM:   Tidak ada.
# KEMBALI: Tidak ada.
# KONSEP:  Menghubungkan signal (timeout) dari node sendiri.
func _ready():
	timeout.connect(_on_timeout)

# FUNGSI: _on_timeout()
# APA:     Dipicu setiap kali Timer selesai menghitung. Membuat instance buah baru.
# PARAM:   Tidak ada.
# KEMBALI: Tidak ada.
# KONSEP:  preload() / instantiate() — membuat instance dari scene yang sudah di-load.
#          randf_range() — menghasilkan angka acak dalam rentang tertentu.
#          add_sibling() — menambahkan node sebagai sibling (saudara) di scene tree.
func _on_timeout():
	# Aman kalau fruit_scene belum di-assign di Inspector.
	if fruit_scene == null:
		return

	# instantiate() — membuat node baru dari PackedScene.
	var fruit = fruit_scene.instantiate()

	var view_size = get_viewport().get_visible_rect().size

	# Posisi X acak antara 50 piksel dari tepi kiri hingga 50 piksel dari tepi kanan.
	# randf_range(min, max) — float acak antara min dan max.
	fruit.position.x = randf_range(50, view_size.x - 50)

	# Mulai dari atas layar (Y = -50, sedikit di luar layar).
	fruit.position.y = -50

	# add_sibling() — menambahkan fruit sebagai saudara dari spawner di scene tree.
	add_sibling(fruit)
