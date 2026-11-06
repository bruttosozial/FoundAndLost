extends MarginContainer

@onready var footageDeleted = $CenterContainer/VBoxContainer/FootageDeleted
@onready var timer = $Timer


func _on_timer_timeout() -> void:
	if footageDeleted.offset_transform_scale == Vector2(1.0, 1.0):
		footageDeleted.offset_transform_scale = Vector2.ZERO
		timer.stop()
		timer.wait_time = 0.2
		timer.start()
	else:
		timer.stop()
		timer.wait_time = 0.5
		timer.start()
		footageDeleted.offset_transform_scale = Vector2(1.0, 1.0)
		
	pass # Replace with function body.
