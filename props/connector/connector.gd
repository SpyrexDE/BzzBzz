extends Node2D

class_name Connector

var robot
var last_checkpoint: Vector2
var checkpoints: Array[Vector2]
var intersection_points: Array[Vector2]

func _ready():
	checkpoints.append(Vector2(0, 0))
	robot = %Robot

func add_checkpoint(new_checkpoint: Vector2) -> void:
	var last = checkpoints[0]
	for checkpoint in checkpoints:
		#get the point of intersection
		var intersection = Geometry2D.line_intersects_line(last, (checkpoint - last).normalized(),
		checkpoints[ - 1], (new_checkpoint - checkpoints[ - 1]).normalized())

		if intersection != null:
			#check if it is a self intersection
			if (intersection - checkpoints[- 1]).length() >= 1:
				#check if intersection is on the line segment
				var a = checkpoints[- 1]
				var b = new_checkpoint
				var c = intersection

				var aa = last
				var bb = checkpoint

				var ac = (c - a).normalized()
				var bc = (c - b).normalized()
				
				var aac = (c - aa).normalized()
				var bbc = (c - bb).normalized()

				var x = ac.dot(bc)
				var xx = aac.dot(bbc)

				if (x < 0&&xx < 0):
					intersection_points.append(intersection)

		last = checkpoint

	checkpoints.append(new_checkpoint)

func _physics_process(_delta):
	queue_redraw()

func _draw():
	var last = checkpoints[0]
	for checkpoint in checkpoints:
		draw_line(last, checkpoint, Color.GREEN, 10.0)
		last = checkpoint
	draw_line(checkpoints[ - 1], robot.position, Color.GREEN, 10.0)

	for debug_point in intersection_points:
		draw_circle(debug_point, 10, Color.RED)
