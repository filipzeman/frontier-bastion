class_name GameWindow
extends PanelContainer

signal close_requested

@onready var window_title: Label = $MarginContainer/VBoxContainer/Header/WindowTitle
@onready var close_button: Button = $MarginContainer/VBoxContainer/Header/CloseButton

func set_title(value: String) -> void:
	window_title.text = value
	
func _on_close_button_pressed() -> void:
	close_requested.emit()
