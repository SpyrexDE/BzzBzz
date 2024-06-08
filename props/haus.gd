extends StaticBody2D
class_name Haus

var strom := false
var is_connected_to_cable := false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_lightup()
	pass

func _on_area_2d_body_entered(body):
	if body is Player and !is_connected_to_cable:
		%Robot.set_house(self)
	
func _lightup():
	if strom == true:
		$AnimationPlayer.play("haus_light_up")
	pass

func _on_area_2d_body_exited(body):
	if body is Player:
		%Robot.set_house(null)
