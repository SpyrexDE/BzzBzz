extends Node

@export var movement_lerp_speed: float = 5.0

@onready var player: Player = get_parent()
@onready var base_zoom: Vector2 = %Cam.zoom
@onready var min_zoom := Vector2(0.05, 0.05)
@onready var max_zoom := Vector2(0.3, 0.3)


var extra_zoom := Vector2.ZERO
var zoom_accel := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if not Globals.level:
		return
	
	# Position
	var pos = %Cam.global_position.lerp((player.global_position + Globals.level.midpoint.global_position) / 2, delta * movement_lerp_speed)
	%Cam.global_position = pos
	
	# Zoom
	zoom_accel = zoom_accel / 2.0
	zoom_accel += Vector2(player.velocity.length(), player.velocity.length())/1000000 - Vector2.ONE / 2000
	var distance = player.global_position.distance_to(Globals.level.midpoint.global_position)
	extra_zoom = -Vector2(distance, distance) / 40000
	extra_zoom = clamp(extra_zoom + zoom_accel, min_zoom- base_zoom, max_zoom - base_zoom)
	
	print(extra_zoom, zoom_accel, distance, pos, %Cam.global_position)
	
	%Cam.zoom = base_zoom + extra_zoom 
