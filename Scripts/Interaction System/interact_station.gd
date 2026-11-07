extends IInteractable
class_name InteractStation

@export var station_res : StationResource
@export var player : PlayerController

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
			print("Incorrect item for station")
			#TODO show UI feedback
	else:
		print("No item")
		#TODO show UI feedback
		
 
