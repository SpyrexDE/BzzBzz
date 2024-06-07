extends Node

@export var movement_lerp_speed: float = 5.0

@onready var player: Player = get_parent()
@onready var base_zoom: Vector2 = %Cam.zoom

var extra_zoom := Vector2.ZERO

func _process(delta: float) -> void:
	if not Globals.level:
		return
	
	# Position
	var pos = %Cam.global_position.lerp((player.global_position + Globals.level.midpoint.global_position) / 2, delta * movement_lerp_speed)
	%Cam.global_position = pos
	
	# Zoom
	extra_zoom += Vector2(player.velocity.length(), player.velocity.length())/100000
	extra_zoom = extra_zoom / 1.5
	
	%Cam.zoom = base_zoom + extra_zoom 
