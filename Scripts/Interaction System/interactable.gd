extends Area2D
class_name IInteractable

var in_range = false
var interaction_text : String

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

func on_range_entered():
	pass

func on_range_exited():
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Skell":
		in_range = true
		on_range_entered()
		range_entered.emit(self)

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Skell":
		in_range = false
		on_range_exited()
		range_exited.emit()
