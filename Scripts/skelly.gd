extends CharacterBody2D
class_name PlayerController

@onready var item_sprite = $ItemSprite2D
@onready var broken_item_sprite = $BrokenItemSprite2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var animated_sprite_arm = $AnimatedSprite2D/AnimatedSprite2DArm
@onready var interaction_help = $InteractionHelp
@onready var interaction_label : RichTextLabel = $InteractionHelp/MarginContainer/RichTextLabel
@onready var feedback_help = $FeedbackHelp
@onready var feedback_label : RichTextLabel = $FeedbackHelp/MarginContainer/RichTextLabel
@onready var audio_player = $AudioStreamPlayer2D
@onready var audio_length = 0.5
var footStepFrames = [1,3]

var speed = 300
var current_item : ItemResource
var paused = false

signal initiate_ending
signal ending_next_screen

enum State {
	GAMEPLAY,
	ENDING,
	NO
}

var seconds = 1.0
signal destroyed_item
var state: State = State.GAMEPLAY

func _process(_delta: float) -> void:
	if state == State.ENDING and Input.is_action_just_released("interact"):
		state = State.NO
		hide_interaction_help()
		play_shoot_animation()
		await get_tree().create_timer(0.5).timeout
		ending_next_screen.emit()
		

func _physics_process(_delta: float) -> void:
	if state == State.ENDING or state == State.NO: 
		audio_player.stop()
		return
	
	if Input.is_action_just_released("debug_ending"):
		initiate_ending_func()
	
	var direction := Input.get_vector("left", "right", "up", "down")	
	if paused:
		if Input.is_action_just_released("interact"):
			destroy_item()
	else:
		if direction != Vector2.ZERO:
			velocity = direction * speed
			if direction == Vector2.UP:	
				playAnimation("")
			if direction == Vector2.DOWN:
				playAnimation("")
			if direction == Vector2.LEFT:
				playAnimation("left")
				item_sprite.position.x = -25
			if direction == Vector2.RIGHT:
				playAnimation("right")
				item_sprite.position.x = 20
			print("checking here")
			print(audio_player.playing)
			if !audio_player.playing:
				print("Reaached")
				audio_player.play()
				print(audio_player.playing)
		else:
			velocity = Vector2.ZERO
			animated_sprite.play("idle")
			audio_player.stop()
		
		move_and_slide() 

	
func playAnimation(flip: String):
	audio_player.play()
	if flip == "right":
		animated_sprite.flip_h = true
		animated_sprite_arm.flip_h = true
		animated_sprite.play("run")
	elif  flip == "left":
		animated_sprite.flip_h = false
		animated_sprite_arm.flip_h = false
		animated_sprite.play("run")
	else:
		animated_sprite.play("run")
	
func pickup_item(item: ItemResource):
	#TODO add SFX
	current_item = item
	item_sprite.texture = item.texture
	broken_item_sprite.texture = item.broken_texture
	item_sprite.visible = true
	animated_sprite_arm.show()

func hide_item():
	item_sprite.visible = false
	animated_sprite_arm.hide()
	
func remove_item():
	current_item = null
	item_sprite.texture = null
	item_sprite.visible = false
	broken_item_sprite.texture = null
	broken_item_sprite.visible = false

func show_interaction_help(text: String):
	print("actual show function")
	interaction_label.text = "[E] to " + text
	interaction_help.visible = true

func hide_interaction_help():
	interaction_help.visible = false
	interaction_label.text = ""

func show_feedback_help(text: String):
	feedback_label.text = text
	feedback_help.visible = true
	
	await get_tree().create_timer(1.0).timeout
	
	hide_feedback_help()

func hide_feedback_help():
	feedback_label.text = ""
	feedback_help.visible = false

func pause_player():
	#set_physics_process(false)
	animated_sprite.stop()

func resume_player():
	pass
	#set_physics_process(true)

func destroy_item():
	hide_interaction_help()
	
	item_sprite.visible = true
	
	play_destroy_animation()
	await animated_sprite.animation_finished
	
	#TODO add sfx
	item_sprite.visible = false
	broken_item_sprite.visible = true
	
	await get_tree().create_timer(1.0).timeout
	
	broken_item_sprite.visible = false
	broken_item_sprite.texture = null
	remove_item()
	paused = false
	destroyed_item.emit()

func play_destroy_animation():
	animated_sprite.play("destroy")
	
func play_shoot_animation():
	animated_sprite.play("gun_front")

func play_idle_animation():
	animated_sprite.play("idle")

func on_detail_view_closed():
	paused = true
	show_interaction_help("Destroy")

func set_ending_state():
	state = State.ENDING
	show_interaction_help("SHOOT")

func initiate_ending_func():
	initiate_ending.emit()
	state = State.ENDING
	show_interaction_help("SHOOT")
	
