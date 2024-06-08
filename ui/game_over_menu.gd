extends Control

@export var meow: AudioStreamMP3

func _ready():
	SoundEffects.play_sound(meow)

func _on_back_button_pressed() -> void:
	
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
