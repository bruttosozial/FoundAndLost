extends Control

@onready var streamPlayer : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite = $AnimatedSprite2D
signal closed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	streamPlayer.play()
	get_tree().root.get_children()[0].pause_bgm()
	animated_sprite.play("ode_to_joy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("interact"):
		closed.emit()
		queue_free()

func show_static_boombox() -> void:
	animated_sprite.hide()
	$TextureRect.show()
	get_tree().root.get_children()[0].resume_bgm()
