extends Node

var level: Level
var camera: Node
var connector: Connector
var robot: Player
var menumusic: AudioStreamMP3
var shock_speed: int = 8

var fulls = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_fullscreen"):
		fulls = !fulls
		if fulls:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
