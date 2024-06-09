extends StaticBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		Globals.level.game_over_cat()

func _on_area_2d_area_entered(area: Area2D):
	var x = area.get_parent()
	if x is Zap:
		x.kill(true)
