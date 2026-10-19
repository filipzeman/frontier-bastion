class_name Building
extends StaticBody3D

@export var building_data: BuildingData


var current_task: VillagerTypes.Assignment
var is_transporting: bool
var transported_resource: String
var transported_resource_amount: int

func _ready() -> void:
	if building_data == null:
		push_error("Missing BuildingData!")
		return
	
	print(building_data.name)
