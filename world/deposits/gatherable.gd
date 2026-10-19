class_name GatherableTree
extends StaticBody3D

@export var resource_data: ResourceData

var resources_left: int

func _ready() -> void:
	if resource_data == null:
		push_error("Missing ResourceData!")
		return
		
	resources_left = resource_data.max_amount
	
func gather(amount: int) -> int:
	var collected: int = mini(amount, resources_left)
	resources_left -= collected
	
	if resources_left <= 0:
		queue_free()
		
	return collected
