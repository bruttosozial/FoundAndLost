extends Resource
class_name StationResource

@export var name : String
@export_enum("MUSIC", "TEXT", "GAME", "VIDEO") var type
@export var scene : PackedScene
@export var slot_in_sfx : AudioStream
@export var slot_out_sfx : AudioStream
