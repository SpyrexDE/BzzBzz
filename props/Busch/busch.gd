extends StaticBody2D
class_name Busch

func _on_area_2d_area_entered(area: Area2D):
	var zap = area.get_parent()
	if zap is Zap:
		zap.kill()
