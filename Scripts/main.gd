extends Node2D

@onready var transition_camera_4: Camera2D = $transitionCamera4
@onready var transition_camera_2: Camera2D = $transitionCamera2
@onready var transition_camera_3: Camera2D = $transitionCamera3
@onready var transition_camera: Camera2D = $transitionCamera
@onready var skell: PlayerController = $Skell
@onready var spawnPos = $camera2SpawnPos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_perspective_change_body_entered(body: Node2D) -> void:
	if not transition_camera_4.is_current():
		transition_camera_4.make_current()
		skell.position = spawnPos.position
