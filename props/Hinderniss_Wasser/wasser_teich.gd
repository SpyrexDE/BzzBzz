extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_area_2d_body_entered(body):
	if body is Player:
			body.friction_multiplier = 2
	pass # Replace with function body.
	
	
func _on_area_2d_body_exited(body):
	if body is Player:
		body.friction_multiplier = 1
	pass
