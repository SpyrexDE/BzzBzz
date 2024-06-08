extends StaticBody2D
class_name Haus

var strom := false
var is_connected_to_cable := false


func _on_area_2d_body_entered(body):
	if body is Player and !is_connected_to_cable:
		Globals.robot.set_house(self)
	
func lightup():
	print("lighup")
	$haus_gemeinsamkeiten/AnimationPlayer.play("haus_light_up")
	strom = true

func _on_area_2d_body_exited(body):
	if body is Player:
		Globals.robot.set_house(null)
