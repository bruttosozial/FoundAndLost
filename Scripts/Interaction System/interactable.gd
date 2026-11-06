extends Area2D
class_name IInteractable

var in_range = false

signal range_entered
signal range_exited

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	pass

func _on_body_entered(body: Node2D) -> void:
	in_range = true
	range_entered.emit(self)

func _on_body_exited(body: Node2D) -> void:
	in_range = false
	range_exited.emit()
