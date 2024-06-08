extends Control

@export var menusoun: AudioStreamMP3

func _ready():
	SoundEffects.play_sound(menusoun, 1, 0, "bgm")

func _on_start_button_pressed() -> void:
	SoundEffects.fade_sound(menusoun)
	get_tree().change_scene_to_file("res://ui/rules_menu.tscn")

func _on_start_button_2_pressed() -> void:
	get_tree().quit()
