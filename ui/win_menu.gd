extends Control


@export var next_level: PackedScene
@export var score: int:
	set(val):
		score = val
		$Label.show()
		$Label.text = "Score: " + str(val)

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(next_level.resource_path)
