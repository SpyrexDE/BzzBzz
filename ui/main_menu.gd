extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/rules_menu.tscn")

func _on_start_button_2_pressed() -> void:
	get_tree().quit()
