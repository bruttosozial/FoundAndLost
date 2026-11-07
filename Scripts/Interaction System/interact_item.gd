extends IInteractable
class_name InteractItem

@export var item_res : ItemResource
@export var player : PlayerController

@export var already_holding_text = "Can't carry more"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_text = "Pick up " + item_res.name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	if(player.current_item != null):
		player.show_feedback_help(already_holding_text)
	else:
		player.pickup_item(item_res)
		queue_free()
