extends Control

signal closed

@onready var videoMC : MarginContainer = $PanelContainer/MarginContainer
@onready var container = $PanelContainer/VideoStreamMC
@onready var streamp : VideoStreamPlayer = $PanelContainer/VideoStreamMC/VideoStreamPlayer
@onready var subtitle_player = $SubtitlePlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	subtitle_player.play_subtitles()
	if get_tree().root.get_children()[0] is CCTV:
		get_tree().root.get_children()[0].pause_bgm()
	else:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("interact"):
		if get_tree().root.get_children()[0] is CCTV:
			get_tree().root.get_children()[0].resume_bgm()
		closed.emit()
		queue_free()
		

func _on_video_stream_player_finished() -> void:
	container.offset_transform_scale = Vector2.ZERO
	if get_tree().root.get_children()[0] is CCTV:
		get_tree().root.get_children()[0].resume_bgm()
	else:
		pass
		
