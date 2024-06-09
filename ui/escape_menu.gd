extends CanvasLayer


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		self.visible = !self.visible
		Engine.time_scale = 0 if self.visible else 1


func _on_stay_button_pressed() -> void:
	Engine.time_scale = 1
	self.hide()


func _on_back_button_pressed() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
