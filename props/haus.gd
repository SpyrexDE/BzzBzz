extends StaticBody2D

var strom := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_lightup()
	pass

func _on_area_2d_body_entered(body):
	if body is Player:
		%Robot.near_house = true
		%Robot.set_house_position(position)
	pass # Replace with function body.
	
func _lightup():
	if strom == true:
		$AnimationPlayer.play("haus_light_up")
	pass


func _on_area_2d_body_exited(body):
	if body is Player:
		%Robot.near_house = false
		%Robot.set_house_position(Vector2(0,0))
	pass # Replace with function body.
