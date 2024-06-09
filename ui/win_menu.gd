extends Control

@export var winsound: AudioStreamMP3

@export var score: int:
	set(val):
		score = val
		$Label.show()
		$Label.text = "Score: " + str(val)

func _ready():
	SoundEffects.play_sound(winsound)

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/level_select.tscn")
