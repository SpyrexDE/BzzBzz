extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level2.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level3.tscn")


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level4.tscn")


func _on_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level5.tscn")


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
