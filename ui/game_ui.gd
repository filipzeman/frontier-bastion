extends CanvasLayer

const BUILD_WINDOW = preload("res://ui/building/build_window.tscn")

@onready var hud = $Root/HUD
@onready var window_manager = $Root/WindowHost

func _ready() -> void:
	hud.build_menu_requested.connect(_on_build_menu_requested)
	
func _on_build_menu_requested() -> void:
	window_manager.open_window(BUILD_WINDOW)
