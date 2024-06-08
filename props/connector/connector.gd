extends Node2D

var robot
var last_checkpoint: Vector2
var checkpoints: Array[Vector2]
var debug_points: Array[Vector2]

func _ready():
	checkpoints.append(Vector2(0, 0))
	robot = %Robot

func add_checkpoint(new_checkpoint: Vector2) -> bool:

	var last = checkpoints[0]
	for checkpoint in checkpoints:
		#get the point of intersection
		var intersection = Geometry2D.line_intersects_line(last, (checkpoint - last).normalized(),
		checkpoints[ - 1], (new_checkpoint - checkpoints[ - 1]).normalized())

		if intersection != null:
			#check if it is a self intersection
			if (intersection - checkpoints[- 1]).length() >= 1:
				#check if intersection is on the line segment
				var a = last
				var b = checkpoint - last
				var c = intersection

				var ac = c - a
				var bc = b - c

				var x = ac.dot(bc)
				print("dot prod ", x)
				if (x > 0):
					print(intersection)
					debug_points.append(intersection)

		last = checkpoint

	checkpoints.append(new_checkpoint)
	return true

func _physics_process(_delta):
	if (Input.is_action_just_pressed("interact")):
		add_checkpoint(robot.position)

	queue_redraw()

func _draw():
	var last = checkpoints[0]
	for checkpoint in checkpoints:
		draw_line(last, checkpoint, Color.GREEN, 10.0)
		last = checkpoint
	draw_line(checkpoints[ - 1], robot.position, Color.GREEN, 10.0)

	for debug_point in debug_points:
		draw_circle(debug_point, 10, Color.RED)
