extends Control

@onready var text_container = $MarginContainer/TextContainer
@onready var timer = $Timer

var current_subtitles = []
var subtitle_index = 0

func _ready() -> void:
	text_container.offset_transform_scale = Vector2.ZERO
	load_subtitles("mock_subtitles")

func load_subtitles(file_name):
	var file = FileAccess.open(
		"res://Data/Subtitles/%s.txt" % file_name,
		FileAccess.READ)
	print(file)
	var line = file.get_line()
	while line != "":
		current_subtitles.append(line)
		line = file.get_line()
	subtitle_index = 0
	text_container.offset_transform_scale = Vector2(1.0, 1.0)
	play_subtitles()

func play_subtitles():
	timer.stop()
	if subtitle_index >= len(current_subtitles):
		text_container.offset_transform_scale = Vector2.ZERO
		return
	var title_parts = current_subtitles[subtitle_index].split(";")
	var text: String = title_parts[0]
	if text.contains("$BR$"):
		text = text.replace("$BR$", "\n")
	text_container.text = text
	print(title_parts[1])
	timer.wait_time = int(title_parts[1]) / 1000.0
	timer.start()
	subtitle_index += 1

func _on_timer_timeout() -> void:
	play_subtitles()
