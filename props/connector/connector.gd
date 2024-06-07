extends Node2D

func _physics_process(delta):
	queue_redraw()

func _draw():
	draw_line(Vector2(0, 0), %Robot.position, Color.GREEN, 3.0)
