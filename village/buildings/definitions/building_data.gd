class_name BuildingData
extends Resource

@export var type: String
@export var name: String
@export var description: String
@export var max_workers: int
@export var assignment: VillagerTypes.Assignment

@export var construction_time: float
@export var wood_cost: int
@export var stone_cost: int
@export var iron_cost: int

@export var footprint: Vector2i = Vector2i(1,1)
