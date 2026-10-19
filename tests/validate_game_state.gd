extends SceneTree


func _initialize() -> void:
	call_deferred("_validate")


func _validate() -> void:
	var game = load("res://core/game/game.tscn").instantiate()
	root.add_child(game)
	var state = root.get_node("GameState")
	state.set_process(false)
	var hud = game.get_node("HUD")
	assert(hud.village_name_label.text == "Oakvale")
	for resource_id in ["wood", "stone", "iron"]:
		var item = hud.resource_items[resource_id]
		assert(item.get_node("Amount").text == str(state.get_resource_amount(resource_id)))
		state.add_resource(resource_id, 7)
		assert(item.get_node("Amount").text == str(state.get_resource_amount(resource_id)))
		assert(state.spend_resource(resource_id, 3))
		assert(item.get_node("Amount").text == str(state.get_resource_amount(resource_id)))
		var before: int = state.get_resource_amount(resource_id)
		assert(not state.spend_resource(resource_id, before + 1))
		assert(state.get_resource_amount(resource_id) == before)
	assert(hud.season_label.text == "Spring")
	assert(hud.day_label.text == "Day 1")
	assert(hud.phase_label.text == "Morning")
	# One real second is one game hour for these boundary checks.
	state.day_length_seconds = 24
	state.advance_time(6.0)
	assert(hud.phase_label.text == "Afternoon")
	state.advance_time(5.0)
	assert(hud.phase_label.text == "Evening")
	state.advance_time(4.0)
	assert(hud.phase_label.text == "Night")
	state.advance_time(3.0)
	assert(state.time == 0.0 and state.day == 2)
	assert(hud.day_label.text == "Day 2")
	state.advance_time(19.0 * 24.0)
	assert(state.day == 1 and hud.season_label.text == "Summer")
	state.advance_time(20.0 * 24.0)
	assert(hud.season_label.text == "Autumn")
	state.advance_time(20.0 * 24.0)
	assert(hud.season_label.text == "Winter")
	state.advance_time(20.0 * 24.0)
	assert(state.day == 1 and hud.season_label.text == "Spring")
	state.initialize(load("res://core/game/new_game.gd").new())
	assert(hud.day_label.text == "Day 1" and hud.phase_label.text == "Morning")
	assert(hud.resource_items["wood"].get_node("Amount").text == "20")
	print("PASS: initial HUD, resource signals, phases, day/season rollover, large deltas, reset")
	game.queue_free()
	quit()
