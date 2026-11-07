extends CharacterBody2D
class_name PlayerController

@onready var item_sprite = $ItemSprite2D
@onready var broken_item_sprite = $BrokenItemSprite2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var interaction_help = $InteractionHelp
@onready var interaction_label : RichTextLabel = $InteractionHelp/MarginContainer/RichTextLabel
@onready var feedback_help = $FeedbackHelp
@onready var feedback_label : RichTextLabel = $FeedbackHelp/MarginContainer/RichTextLabel

var speed = 300
var current_item : ItemResource
var paused = false

func _physics_process(delta: float) -> void:
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
		else:
			velocity = Vector2.ZERO
			animated_sprite.play("idle")
		
		move_and_slide() 

func playAnimation(flip: String):
	if flip == "right":
		animated_sprite.flip_h = true
		animated_sprite.play("run")
	elif  flip == "left":
		animated_sprite.flip_h = false
		animated_sprite.play("run")
	else:
		animated_sprite.play("run")
	
func pickup_item(item: ItemResource):
	current_item = item
	item_sprite.texture = item.texture
	broken_item_sprite.texture = item.broken_texture
	item_sprite.visible = true

func hide_item():
	item_sprite.visible = false
	
func remove_item():
	current_item = null
	item_sprite.texture = null
	item_sprite.visible = false
	broken_item_sprite = null
	broken_item_sprite = false

func show_interaction_help(text: String):
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
	
	item_sprite.visible = false
	broken_item_sprite.visible = true
	
	await get_tree().create_timer(1.0).timeout
	
	broken_item_sprite.visible = false
	broken_item_sprite.texture = null
	remove_item()
	paused = false

func play_destroy_animation():
	animated_sprite.play("destroy")

func on_detail_view_closed():
	paused = true
	show_interaction_help("Destroy")
	
	
