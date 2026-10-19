class_name Villager
extends CharacterBody3D

@export var villager_data: VillagerData

var current_task: VillagerTypes.Assignment
var is_transporting: bool
var transported_resource: String
var transported_resource_amount: int

func _ready() -> void:
	if villager_data == null:
		push_error("Missing ResourceData!")
		return
		
	current_task = VillagerTypes.Assignment.idle
