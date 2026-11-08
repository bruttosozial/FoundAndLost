extends IInteractable
class_name InteractItem

@onready var sprite : Sprite2D = $Sprite2D

@export var item_res : ItemResource
@export var player : PlayerController

@export var already_holding_text = "Can't carry more"
@onready var audio_player = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_text = "Pick up " + item_res.name
	sprite.texture = item_res.texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	if(player.current_item != null):
		player.show_feedback_help(already_holding_text)
	else:
		player.pickup_item(item_res)
		audio_player.stream = item_res.pickup_sfx
		audio_player.play()
		
		visible = false
		await get_tree().create_timer(item_res.pickup_sfx.get_length()).timeout
		queue_free()
