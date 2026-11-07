extends Control

enum GameState {
	TITLE,
	MAIN,
	CREDITS
}

var state: GameState = GameState.TITLE

@onready var title_scene = preload("res://Scenes/title.tscn")
@onready var main_scene = preload("res://Scenes/main.tscn")
@onready var credits_scene = preload("res://Scenes/credits.tscn")

@onready var scene_container = $SceneContainer
@onready var bgm_player: AudioStreamPlayer2D = $BGMPlayer

func _process(delta) -> void:
	if state == GameState.TITLE:
		process_title()
	elif state == GameState.MAIN:
		process_main()
	elif state == GameState.CREDITS:
		process_credits()


func process_main():
	if  Input.is_action_just_pressed("debug_switchscene"):
		switch_main_credits()

func process_title():
	if Input.is_action_just_pressed("interact") || Input.is_action_just_pressed("debug_switchscene"):
		switch_title_main()

func process_credits():
	if Input.is_action_just_pressed("debug_switchscene"):
		for child in scene_container.get_children():
			child.queue_free()
		scene_container.add_child(title_scene.instantiate())
		state = GameState.TITLE
	current_stream_pos = 0.0

func switch_main_credits():
	for child in scene_container.get_children():
		child.queue_free()
	scene_container.add_child(credits_scene.instantiate())
	state = GameState.CREDITS
	bgm_player.stop()
	
func switch_title_main():
	for child in scene_container.get_children():
			child.queue_free()
	scene_container.add_child(main_scene.instantiate())
	bgm_player.play()
	state = GameState.MAIN

var current_stream_pos = 0.0
func pause_bgm():
	current_stream_pos = bgm_player.get_playback_position()
	bgm_player.stop()

func resume_bgm():
	bgm_player.play(current_stream_pos)
