extends Node2D

@onready var streamPlayer : AudioStreamPlayer2D = $AudioStreamPlayer2D

signal closed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	streamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("close_window"):
		closed.emit()
		queue_free()
