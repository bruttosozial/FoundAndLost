extends CharacterBody2D
class_name PlayerController

@onready var item_sprite = $ItemSprite2D
@onready var interaction_help = $InteractionHelp
@onready var feedback_help = $FeedbackHelp

var speed = 300
var current_item : ItemResource

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction != Vector2.ZERO:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
		
	move_and_slide() 

func pickup_item(item: ItemResource):
	current_item = item
	item_sprite.texture = item.texture
	item_sprite.visible = true

func remove_item():
	current_item = null
	item_sprite.texture = null
	item_sprite.visible = false

func show_interaction_help():
	interaction_help.visible = true

func hide_interaction_help():
	interaction_help.visible = false

func show_feedback_help(text: String):
	$FeedbackHelp/MarginContainer/RichTextLabel.text = text
	feedback_help.visible = true

func hide_feedback_help():
	$FeedbackHelp/MarginContainer/RichTextLabel.text = ""
	feedback_help.visible = false
