extends Control

@onready var text_container = $MarginContainer/TextContainer

func _ready() -> void:
	play_subtitles()

func play_subtitles():
	var file = FileAccess.open(
		"res://Data/Subtitles/mock_subtitles.txt",
		FileAccess.READ)
	var line = file.get_line()
	while line != "":
		print(line)
		line = file.get_line()
