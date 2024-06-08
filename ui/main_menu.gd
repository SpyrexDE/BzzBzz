extends Control

@export var menusoun: AudioStreamMP3

func _ready():
	Globals.menumusic = menusoun
	SoundEffects.play_sound(menusoun, 1, 0, "bgm")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/rules_menu.tscn")

func _on_start_button_2_pressed() -> void:
	get_tree().quit()
