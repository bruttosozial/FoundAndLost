extends IInteractable
class_name InteractItem

@export var item_res : ItemResource
@export var player : PlayerController


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	print("pick up object!!")
	player.pickup_item(item_res)
	queue_free()
