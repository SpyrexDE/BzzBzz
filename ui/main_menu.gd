extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/testlvl1.tscn")

func _on_start_button_2_pressed() -> void:
	get_tree().quit()