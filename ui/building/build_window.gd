extends GameWindow

const BUILDING_CARD = preload("res://ui/building/building_card.tscn")

@export var building_catalog: BuildingCatalog
@onready var building_grid: GridContainer = $MarginContainer/VBoxContainer/Content/VBoxContainer/ScrollContainer/BuildingGrid


func _ready() -> void:
	set_title("Buildings")

	show_buildings(building_catalog.buildings)


func show_buildings(buildings: Array[BuildingData]) -> void:
	for child in building_grid.get_children():
		child.queue_free()

	for building in buildings:
		var card: BuildingCard = BUILDING_CARD.instantiate()

		building_grid.add_child(card)
		card.setup(building)

		card.build_requested.connect(_on_build_requested)


func _on_build_requested(building: BuildingData) -> void:
	print("Selected building: ", building.name)
	print("Wood cost: ", building.wood_cost)
	print("Stone cost: ", building.stone_cost)
