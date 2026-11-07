extends CharacterBody2D
class_name PlayerController

@onready var item_sprite = $ItemSprite2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var interaction_help = $InteractionHelp
@onready var interaction_label : RichTextLabel = $InteractionHelp/MarginContainer/RichTextLabel
@onready var feedback_help = $FeedbackHelp
@onready var feedback_label : RichTextLabel = $FeedbackHelp/MarginContainer/RichTextLabel

var speed = 300
var current_item : ItemResource

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		velocity = direction * speed
		if direction == Vector2.UP:
			animated_sprite.play("run")
		if direction == Vector2.DOWN:
			animated_sprite.play("run")
		if direction == Vector2.LEFT:
			animated_sprite.flip_h = false
			animated_sprite.play("run")
		if direction == Vector2.RIGHT:
			animated_sprite.flip_h = true
			animated_sprite.play("run")
	else:
		velocity = Vector2.ZERO
		animated_sprite.play("idle")
		
	move_and_slide() 

func pickup_item(item: ItemResource):
	current_item = item
	item_sprite.texture = item.texture
	item_sprite.visible = true

func remove_item():
	current_item = null
	item_sprite.texture = null
	item_sprite.visible = false

func show_interaction_help(text: String):
	interaction_label.text = "E to " + text
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
	set_physics_process(false)

func resume_player():
	set_physics_process(true)
