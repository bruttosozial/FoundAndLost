extends Node2D

var current_interactable : IInteractable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i : IInteractable in get_children():
		i.range_entered.connect(on_range_entered)
		i.range_exited.connect(on_range_left)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("interact") and current_interactable:
		current_interactable.interact()

func on_range_entered(item: IInteractable):
	print("in range!")
	current_interactable = item

func on_range_left():
	print("out of range!")
	current_interactable = null

func on_item_pickup():
	pass
