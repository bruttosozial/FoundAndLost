extends Node2D

signal closed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().root.get_children()[0] is CCTV:
		get_tree().root.get_children()[0].pause_bgm()
	else:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("interact"):
		closed.emit()
		queue_free()


func _on_video_stream_player_finished() -> void:
	if get_tree().root.get_children()[0] is CCTV:
		get_tree().root.get_children()[0].resume_bgm()
	else:
		pass
