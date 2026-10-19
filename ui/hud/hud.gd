extends Control

@onready var top_bar = $Root/Layout/VBoxContainer/TopBar/HBoxContainer
@onready var resource_items: Dictionary = {
	"wood": top_bar.get_node("Resources/Wood"),
	"stone": top_bar.get_node("Resources/Stone"),
	"iron": top_bar.get_node("Resources/Iron"),
}
@onready var village_name_label: Label = top_bar.get_node("VillageInfo/VillageName")
@onready var season_label: Label = top_bar.get_node("TimeInfo/Season")
@onready var day_label: Label = top_bar.get_node("TimeInfo/VBoxContainer/Day")
@onready var phase_label: Label = top_bar.get_node("TimeInfo/VBoxContainer/Phase")

signal build_menu_requested


func _ready() -> void:
	GameState.resource_changed.connect(_on_resource_changed)
	GameState.calendar_changed.connect(_update_calendar)
	GameState.initialized.connect(_refresh)
	_refresh()


func _refresh() -> void:
	village_name_label.text = GameState.village_name
	for resource_id in resource_items:
		_on_resource_changed(resource_id, GameState.get_resource_amount(resource_id))
	_update_calendar()


func _on_resource_changed(resource_id: String, amount: int) -> void:
	if resource_items.has(resource_id):
		# Let the reusable component update its own Label.
		resource_items[resource_id].resource_amount = amount


func _update_calendar() -> void:
	season_label.text = GameState.get_season_name()
	day_label.text = "Day %d" % GameState.get_current_day()
	phase_label.text = GameState.get_day_phase().capitalize()
	
func _on_build_button_pressed() -> void:
	build_menu_requested.emit()
	print('clicked on build menu')
