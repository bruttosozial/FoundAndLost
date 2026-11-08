extends Resource
class_name ItemResource

@export var name : String
@export var texture : Texture2D
@export_enum("MUSIC", "TEXT", "GAME", "VIDEO") var type
@export var pickup_sfx : AudioStream
