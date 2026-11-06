extends CharacterBody2D
class_name PlayerController

@onready var item_sprite = $ItemSprite2D

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
