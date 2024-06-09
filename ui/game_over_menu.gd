extends Control

@export var meow: AudioStreamMP3
@export var pitch: float

func _ready():
	SoundEffects.play_sound(meow, pitch)

func _on_back_button_pressed() -> void:
	
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
