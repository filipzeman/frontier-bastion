class_name BuildingCard
extends PanelContainer

signal build_requested(building: BuildingData)

const RESOURCE_ITEM = preload("res://ui/hud/resource_item.tscn")

@export var wood_icon: Texture2D
@export var stone_icon: Texture2D
@export var iron_icon: Texture2D

@onready var name_label: Label = $MarginContainer/VBoxContainer/NameLabel
@onready var description_label: Label = $MarginContainer/VBoxContainer/DescriptionLabel
@onready var costs: HBoxContainer = $MarginContainer/VBoxContainer/Costs
@onready var build_button: Button = $MarginContainer/VBoxContainer/BuildButton

var building_data: BuildingData

func setup(building: BuildingData) -> void:
	building_data = building

	name_label.text = building.name
	description_label.text = building.description
	
	update_costs()
	
func update_costs() -> void:

	# Odstraníme případné předchozí ceny.
	for child in costs.get_children():
		child.queue_free()

	# Dřevo
	if building_data.wood_cost > 0:
		add_cost(wood_icon, building_data.wood_cost)

	# Kámen
	if building_data.stone_cost > 0:
		add_cost(stone_icon, building_data.stone_cost)

	# Železo
	if building_data.iron_cost > 0:
		add_cost(iron_icon, building_data.iron_cost)


func add_cost(icon: Texture2D, amount: int) -> void:
	var resource_item: ResourceItem = RESOURCE_ITEM.instantiate()
	costs.add_child(resource_item)
	resource_item.resource_icon = icon
	resource_item.resource_amount = amount

func _on_build_button_pressed() -> void:
	build_requested.emit(building_data)
