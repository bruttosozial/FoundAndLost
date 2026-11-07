extends IInteractable
class_name InteractStation

@export var station_res : StationResource
@export var player : PlayerController

@export var incorrect_item_text = "This doesn't go here..."
@export var no_item_text = "I have nothing to put here..."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_text = "Use " + station_res.name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	if(player.current_item):
		if(player.current_item.type == station_res.type):
			player.remove_item()
			open_detail_window()
		else:
			player.show_feedback_help(incorrect_item_text)
	else:
		player.show_feedback_help(no_item_text)
		
 
func open_detail_window():
	player.pause_player()

	var instance = station_res.scene.instantiate()
	get_tree().root.add_child(instance)
	instance.closed.connect(close_detail_window)

func close_detail_window():
	player.resume_player()
