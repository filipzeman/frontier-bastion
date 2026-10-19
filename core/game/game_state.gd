extends Node

signal resource_changed(resource_type: String, amount: int)
signal calendar_changed
signal initialized

# Seasons use IDs 1 through 4; day is the day within the current season.
enum Season {SPRING = 1, SUMMER, AUTUMN, WINTER}
const SEASON_NAMES = ["Spring", "Summer", "Autumn", "Winter"]

var start_of_day: int = 6
var start_day: int = 1
var start_season: int = Season.SPRING

var resources: Dictionary = {}
var time: float = float(start_of_day)
var day: int = start_day
var season: int = start_season
var day_length_seconds = 300
var days_per_season = 20
var village_name: String = ""
var is_initialized: bool = false


func _process(delta: float) -> void:
	if is_initialized:
		advance_time(delta)

func initialize(config) -> void:
	village_name = config.village["name"]
	resources = config.resources.duplicate(true)
	day = start_day
	time = float(start_of_day)
	season = start_season
	is_initialized = true
	initialized.emit()
	calendar_changed.emit()

func get_time() -> float:
	return time

func advance_time(delta: float) -> void:
	if delta <= 0.0 or day_length_seconds <= 0 or days_per_season <= 0:
		return
	var previous_day := day
	var previous_season := season
	var previous_phase := get_day_phase()
	time += delta * 24.0 / day_length_seconds
	check_day_transition()
	if day != previous_day or season != previous_season or get_day_phase() != previous_phase:
		calendar_changed.emit()

func get_day_phase() -> String:
	var day_phase = "morning"
	if time < 6 or time >= 21:
		day_phase = "night"
	elif time >= 6 and time < 12:
		day_phase = "morning"
	elif time >= 12 and time < 17:
		day_phase = "afternoon"
	elif time >= 17 and time < 21:
		day_phase = "evening"
	return day_phase

func check_day_transition() -> void:
	while time >= 24:
		time -= 24
		day += 1
		if day > days_per_season:
			day = 1
			season += 1
			if season > Season.WINTER:
				season = Season.SPRING

func get_season_name() -> String:
	return SEASON_NAMES[season - 1]

func get_current_day() -> int:
	return day

func get_current_season() -> int:
	return season

func get_current_time_of_day() -> float:
	return time

func get_resource_amount(resource_id: String) -> int:
	return resources.get(resource_id, 0)


func add_resource(resource_id: String, amount: int) -> void:
	if amount < 0:
		return
	resources[resource_id] = get_resource_amount(resource_id) + amount
	resource_changed.emit(resource_id, resources[resource_id])


func spend_resource(resource_id: String, amount: int) -> bool:
	if amount < 0 or get_resource_amount(resource_id) < amount:
		return false

	resources[resource_id] = get_resource_amount(resource_id) - amount
	resource_changed.emit(resource_id, resources[resource_id])
	return true
