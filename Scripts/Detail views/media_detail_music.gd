extends Control

@onready var streamPlayer : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite = $AnimatedSprite2D
signal closed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	streamPlayer.play()
	animated_sprite.play("ode_to_joy")	
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

func show_static_boombox() -> void:
	animated_sprite.hide()
	$TextureRect.show()
	if get_tree().root.get_children()[0] is CCTV:
		get_tree().root.get_children()[0].resume_bgm()
	else:
		pass
