extends Node3D

@onready var world = $World
var new_game_config = preload("res://core/game/new_game.gd").new()

func _enter_tree() -> void:
	GameState.initialize(new_game_config)

func _ready() -> void:
	world.initialize(new_game_config)
