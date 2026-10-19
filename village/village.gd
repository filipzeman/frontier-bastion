extends Node3D

@onready var village_center: PackedScene = preload("res://village/buildings/village_center.tscn")
@onready var alviss: PackedScene = preload("res://village/villagers/alviss.tscn")
@onready var borin: PackedScene = preload("res://village/villagers/borin.tscn")
@onready var sindri: PackedScene = preload("res://village/villagers/sindri.tscn")
	
func spawn_building(spawn_position: Vector3, scene: PackedScene = village_center):
	var building = scene.instantiate()
	add_child(building)
	building.global_position = spawn_position
	print('Construiction complete: ', building.name)
	
func spawn_villager(scene: PackedScene = borin) -> void:
	var villager := scene.instantiate() as Villager
	
	if villager.villager_data == null:
		push_error("Missing VillagerData!")
		villager.free()
		return
	
	add_child(villager)
	villager.global_position = villager.villager_data.spawn_location
	print('Welcome new villager: ', villager.name)

func initialize(game_config) -> void:
	print(game_config.village["name"])
	spawn_building(Vector3.ZERO)
	
	var villager_scenes: Dictionary = {
		"borin": borin,
		"alviss": alviss,
		"sindri": sindri,
	}

	for villager in game_config.villagers:
		spawn_villager(villager_scenes[villager]) 
