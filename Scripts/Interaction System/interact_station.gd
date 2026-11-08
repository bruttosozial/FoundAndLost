extends IInteractable
class_name InteractStation

@onready var audio_player = $AudioStreamPlayer2D

@export var station_res : StationResource
@export var player : PlayerController

@export var incorrect_item_text = "This doesn't go here..."
@export var no_item_text = "I have nothing to put here..."
@onready var detailed_view_camera: Camera2D = $"../../detailedViewCamera"

signal change_detail_cam
signal change_to_active_cam

var interacting = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_text = "Use " + station_res.name
	player.destroyed_item.connect(on_item_destroyed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	if(interacting or player.state == player.State.ENDING or player.state == player.State.NO):
		return
	if(player.current_item):
		if(player.current_item.type == station_res.type):
			player.hide_item()
			open_detail_window()
		else:
			#TODO add sfx
			player.show_feedback_help(incorrect_item_text)
	else:
		#TODO add sfx
		player.show_feedback_help(no_item_text)
		
 
func open_detail_window():
	player.pause_player()
	interacting = true
	
	audio_player.stream = station_res.slot_in_sfx
	audio_player.play()
	await get_tree().create_timer(station_res.slot_in_sfx.get_length()).timeout
	
	var instance = station_res.scene.instantiate()
	get_tree().root.add_child(instance)
	change_detail_cam.emit()
	
	instance.closed.connect(close_detail_window)

func close_detail_window():
	audio_player.stream = station_res.slot_out_sfx
	audio_player.play()
	change_to_active_cam.emit()
	
	player.resume_player()
	player.on_detail_view_closed()

func on_item_destroyed():
	interacting = false
