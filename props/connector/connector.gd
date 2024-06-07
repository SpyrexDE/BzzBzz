extends Node2D

var robot
var last_checkpoint: Vector2
var checkpoints: Array[Vector2]

func _ready():
	checkpoints.append(Vector2(0, 0))
	robot = %Robot

func add_checkpoint(new_checkpoint: Vector2) -> bool:

	var last = checkpoints[0]
	for checkpoint in checkpoints:
		var intersection = Geometry2D.line_intersects_line(last, (checkpoint - last).normalized(),
		checkpoints[ - 1], (new_checkpoint - checkpoints[ - 1]).normalized())

		if intersection != null:
			print(intersection)
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
		draw_line(last, checkpoint, Color.GREEN, 3.0)
		last = checkpoint
	draw_line(checkpoints[ - 1], robot.position, Color.GREEN, 3.0)
