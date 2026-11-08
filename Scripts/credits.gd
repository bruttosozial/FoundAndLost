extends MarginContainer

@onready var footageDeleted = $CenterContainer/VBoxContainer/HBoxContainer/FootageDeleted
@onready var timer = $Timer

# quake "FLUORESCENT FLICKER" pattern
var flicker_pattern = "mmamammmmammamamaaamammma"
var flicker_index = 0
var delta_passed = 0.0

func _process(delta: float) -> void:
	delta_passed += delta
	if delta_passed >= 0.1:
		flicker()
		delta_passed = 0.0

func flicker() -> void:
	if flicker_index >= len(flicker_pattern):
		flicker_index = 0
	if flicker_pattern[flicker_index] == "a":
		footageDeleted.offset_transform_scale = Vector2.ZERO
	elif flicker_pattern[flicker_index] == "m":
		footageDeleted.offset_transform_scale = Vector2(1.0, 1.0)
	flicker_index += 1
