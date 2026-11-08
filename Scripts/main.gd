extends Node2D

@onready var transition_camera_4: Camera2D = $transitionCamera4
@onready var transition_camera_2: Camera2D = $transitionCamera2
@onready var transition_camera_3: Camera2D = $transitionCamera3
@onready var transition_camera: Camera2D = $transitionCamera
@onready var skell: PlayerController = $Skell
@onready var spawnPos = $camera2SpawnPos
@onready var camera_2_spawn_pos_1_1: Node2D = $camera2SpawnPos1_1
@onready var camera_2_spawn_pos_start: Node2D = $camera2SpawnPos2
@onready var camera_2_spawn_pos_end: Node2D = $camera2SpawnPos3
@onready var camera_2_spawn_pos_4: Node2D = $camera2SpawnPos4
@onready var camera_2_spawn_pos_5: Node2D = $camera2SpawnPos5
@onready var camera_2_spawn_pos_6: Node2D = $camera2SpawnPos6
@onready var camera_2_spawn_pos_6_6: Node2D = $camera2SpawnPos6_6
@onready var camera_2_spawn_pos_7: Node2D = $camera2SpawnPos7
@onready var camera_2_spawn_pos_8: Node2D = $camera2SpawnPos8
@onready var camera_2_spawn_pos_9: Node2D = $camera2SpawnPos9
@onready var camera_2_spawn_pos_10: Node2D = $camera2SpawnPos10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition_camera.make_current()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_perspective_change_body_entered(body: PlayerController) -> void:
		if not transition_camera_4.is_current():
			transition_camera_4.make_current()
			
			var tween = get_tree().create_tween()
			skell.pause_player()
			skell.position = spawnPos.position
			skell.playAnimation("right")
			tween.tween_property(skell, "position", camera_2_spawn_pos_1_1.position, 0.5)
			skell.resume_player()


func _on_perspective_change_2_body_entered(body: PlayerController) -> void:
	if not transition_camera.is_current():
		transition_camera.make_current()
		
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_start.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_end.position, 0.5)
		skell.resume_player()


func _on_perspectivechange_2_1_body_entered(body: PlayerController) -> void:
	if not transition_camera_2.is_current():
		transition_camera_2.make_current()
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_4.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_5.position, 0.5)
		skell.resume_player()


func _on_perspective_change_3_body_entered(body: PlayerController) -> void:
	if not transition_camera_4.is_current():
			transition_camera_4.make_current()
			var tween = get_tree().create_tween()
			skell.pause_player()
			skell.position = camera_2_spawn_pos_6.position
			skell.playAnimation("right")
			tween.tween_property(skell, "position", camera_2_spawn_pos_6_6.position, 0.5)
			skell.resume_player()


func _on_perspective_change_1_1_body_entered(body: PlayerController) -> void:
	if not transition_camera_3.is_current():
		transition_camera_3.make_current()
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_7.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_8.position, 0.5)
		skell.resume_player()





func _on_perspective_change_4_body_entered(body: PlayerController) -> void:
		if not transition_camera.is_current():
			transition_camera.make_current()
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_9.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_10.position, 0.5)
		skell.resume_player()
