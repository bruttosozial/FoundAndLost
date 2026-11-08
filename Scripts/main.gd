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
@onready var camera_2_spawn_pos_11: Node2D = $camera2SpawnPos11
@onready var camera_2_spawn_pos_12: Node2D = $camera2SpawnPos12
@onready var camera_2_spawn_pos_13: Node2D = $camera2SpawnPos13
@onready var camera_2_spawn_pos_14: Node2D = $camera2SpawnPos14
@onready var camera_2_spawn_pos_15: Node2D = $camera2SpawnPos15

@onready var perspectiveChangeProjectorPC = $ComputerViewbackground/perspectiveChange3

@onready var camera_audio_player = $CameraAudioPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition_camera.make_current()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


enum Perspective {
	CONSOLE,
	PROJECTOR,
	COMPUTER,
	CASSETTE
}

var isEnding = false

var current_perspective: Perspective = Perspective.CONSOLE

var debug = false
func debug_print(string):
	if debug: print(string)

# Enter projector from above
func _on_perspective_change_body_entered(_body: PlayerController) -> void:
	debug_print("change: projector above")
	play_camera_sound()
	await get_tree().create_timer(0.1).timeout
	if not transition_camera_4.is_current():
		transition_camera_4.make_current()
		current_perspective = Perspective.PROJECTOR
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = spawnPos.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_1_1.position, 0.5)
		skell.resume_player()
		tween.finished.connect(skelly_finish_move)
		


# Enter console from the right
func _on_perspective_change_2_body_entered(_body: PlayerController) -> void:
	debug_print("change: console right")
	play_camera_sound()
	await get_tree().create_timer(0.1).timeout
	if not transition_camera.is_current():
		transition_camera.make_current()
		current_perspective = Perspective.CONSOLE
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_start.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_end.position, 0.5)
		skell.resume_player()
		skell.play_idle_animation()
		tween.finished.connect(skelly_finish_move)

# Enter computer
func _on_perspectivechange_2_1_body_entered(_body: PlayerController) -> void:
	debug_print("change: computer")
	play_camera_sound()
	await get_tree().create_timer(0.1).timeout
	if not transition_camera_2.is_current():
		transition_camera_2.make_current()
		current_perspective = Perspective.COMPUTER
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_4.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_5.position, 0.5)
		skell.resume_player()
		tween.finished.connect(skelly_finish_move)
		
func enter_computer_left(_body: PlayerController) -> void:
	debug_print("change: computer from left")
	play_camera_sound()
	await get_tree().create_timer(0.1).timeout
	if not transition_camera_2.is_current():
		transition_camera_2.make_current()
		current_perspective = Perspective.COMPUTER
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_13.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_14.position, 0.5)
		skell.resume_player()
		tween.finished.connect(skelly_finish_move)

# Enter projector
func _on_perspective_change_3_body_entered(_body: PlayerController) -> void:
	debug_print("change: projector")
	play_camera_sound()
	await get_tree().create_timer(0.1).timeout
	if not transition_camera_4.is_current():
		transition_camera_4.make_current()
		current_perspective = Perspective.PROJECTOR
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_6.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_6_6.position, 0.5)
		skell.resume_player()
		tween.finished.connect(skelly_finish_move)

# Enter cassette
func _on_perspective_change_1_1_body_entered(_body: PlayerController) -> void:
	debug_print("change: cassette")
	play_camera_sound()
	await get_tree().create_timer(0.1).timeout
	if not transition_camera_3.is_current():
		transition_camera_3.make_current()
		current_perspective = Perspective.CASSETTE
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_7.position
		skell.playAnimation("left")
		tween.tween_property(skell, "position", camera_2_spawn_pos_8.position, 0.5)
		skell.resume_player()
		tween.finished.connect(skelly_finish_move)

# Enter console from below(?)
func _on_perspective_change_4_body_entered(_body: PlayerController) -> void:
	debug_print("change: console below")
	play_camera_sound()
	await get_tree().create_timer(0.1).timeout
	if not transition_camera.is_current():
		transition_camera.make_current()
		current_perspective = Perspective.CONSOLE
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_12.position
		skell.playAnimation("left")
		tween.tween_property(skell, "position", camera_2_spawn_pos_10.position, 0.5)
		skell.resume_player()
		tween.finished.connect(skelly_finish_move)

func enter_cassette_from_left(_body: PlayerController):
	debug_print("change: cassette left")
	play_camera_sound()
	await get_tree().create_timer(0.1).timeout
	if not transition_camera_3.is_current():
		skell.paused = true
		transition_camera_3.make_current()
		current_perspective = Perspective.CASSETTE
		var tween = get_tree().create_tween()
		skell.pause_player()
		skell.position = camera_2_spawn_pos_11.position
		skell.playAnimation("right")
		tween.tween_property(skell, "position", camera_2_spawn_pos_15.position, 0.5)
		skell.resume_player()
		tween.finished.connect(skelly_finish_move)

func skelly_finish_move():
	skell.play_idle_animation()
	skell.paused = false
	if isEnding:
		skell.set_ending_state()

func play_camera_sound():
	camera_audio_player.play()

var ending_current_screen = 0
var ending_counter = 1

func initiate_ending():
	isEnding = true
	ending_current_screen = 0 + current_perspective
	ending_counter = 1

func ending_switch_to_next_screen():
	if ending_counter == 4:
		play_camera_sound()
		get_tree().root.get_children()[0].switch_main_credits()
	
	ending_current_screen += 1
	
	if ending_current_screen > 3:
		ending_current_screen = 0
	
	if ending_current_screen == Perspective.CONSOLE:
		_on_perspective_change_4_body_entered(null)
	elif ending_current_screen == Perspective.PROJECTOR:
		_on_perspective_change_body_entered(null)
	elif ending_current_screen == Perspective.COMPUTER:
		_on_perspectivechange_2_1_body_entered(null)
	elif ending_current_screen == Perspective.CASSETTE:
		_on_perspective_change_1_1_body_entered(null)

	ending_counter += 1
