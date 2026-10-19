extends Control

var current_window: GameWindow


func open_window(window_scene: PackedScene) -> void:
	close_window()

	current_window = window_scene.instantiate()
	add_child(current_window)

	# Nastavíme velikost okna.
	current_window.size = Vector2(900, 600)

	# Vycentrujeme okno.
	current_window.position = (
		get_viewport_rect().size - current_window.size
	) / 2.0

	# Připojíme zavírací tlačítko.
	current_window.close_requested.connect(close_window)


func close_window() -> void:
	if current_window:
		current_window.queue_free()
		current_window = null
