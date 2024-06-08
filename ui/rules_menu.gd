extends Control

func _on_start_button_pressed() -> void:
	SoundEffects.fade_sound(Globals.menumusic)
	get_tree().change_scene_to_file("res://levels/level1.tscn")
