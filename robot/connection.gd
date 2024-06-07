extends Node2D

func _physics_process(delta):
	queue_redraw()

func _draw():
	draw_line(get_parent().position, get_parent().position + Vector2(10, 10), Color.GREEN, 3.0)
