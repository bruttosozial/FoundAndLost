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

func _process(delta) -> void:
	if state == GameState.TITLE:
		process_title()
	elif state == GameState.MAIN:
		process_main()
	elif state == GameState.CREDITS:
		process_credits()


func process_main():
	if  Input.is_action_just_pressed("debug_switchscene"):
		for child in scene_container.get_children():
			child.queue_free()
		scene_container.add_child(credits_scene.instantiate())
		state = GameState.CREDITS

func process_title():
	if Input.is_action_just_pressed("interact") || Input.is_action_just_pressed("debug_switchscene"):
		for child in scene_container.get_children():
			child.queue_free()
		scene_container.add_child(main_scene.instantiate())
		state = GameState.MAIN

func process_credits():
	if Input.is_action_just_pressed("debug_switchscene"):
		for child in scene_container.get_children():
			child.queue_free()
		scene_container.add_child(title_scene.instantiate())
		state = GameState.TITLE
