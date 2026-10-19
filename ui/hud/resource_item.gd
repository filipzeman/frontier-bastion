@tool
extends HBoxContainer

@onready var icon: TextureRect = $Icon
@onready var amount: Label = $Amount

@export var resource_icon: Texture2D:
	set(value):
		resource_icon = value
		_update_display()
		
@export var resource_amount: int = 0:
	set(value):
		resource_amount = value
		_update_display()

func _ready() -> void:
	_update_display()


func _update_display() -> void:
	if not is_node_ready():
		return

	icon.texture = resource_icon
	amount.text = str(resource_amount)
