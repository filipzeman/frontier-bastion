extends Node3D

var tree_scene: PackedScene = preload("res://world/deposits/tree.tscn")
var stone_scene: PackedScene = preload("res://world/deposits/stone.tscn")
@onready var village = $Villages/Village

func spawn_gatherables(spawn_position: Vector3, scene: PackedScene = tree_scene) -> void:
	var gatherable = scene.instantiate()
	add_child(gatherable)
	gatherable.global_position = spawn_position

func initialize(game_config) -> void:
	spawn_gatherables(Vector3(10, 0, 10), tree_scene)
	spawn_gatherables(Vector3(25, 0, 0), tree_scene)
	spawn_gatherables(Vector3(15, 0, 30), tree_scene)
	spawn_gatherables(Vector3(-10, 0, 20), stone_scene)
	spawn_gatherables(Vector3(-25, 0, -10), stone_scene)
	spawn_gatherables(Vector3(-30, 0, 0), stone_scene)
	
	village.initialize(game_config)
