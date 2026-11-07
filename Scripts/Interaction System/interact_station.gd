extends IInteractable
class_name InteractStation

@export var station_res : StationResource
@export var player : PlayerController

@export var incorrect_item_text = "This doesn't go here..."
@export var no_item_text = "I have nothing to put here..."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	if(player.current_item):
		if(player.current_item.name == station_res.name):
			player.remove_item()
			print("Slotted media in!")
			#TODO show detail view
		else:
			player.show_feedback_help(incorrect_item_text)
	else:
		player.show_feedback_help(no_item_text)
		
 
