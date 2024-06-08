extends Node

@export var movement_lerp_speed: float = 5.0

@onready var player: Player = get_parent()
@onready var base_zoom: Vector2 = %Cam.zoom
@onready var min_zoom := Vector2(0.05, 0.05)
@onready var max_zoom := Vector2(0.3, 0.3)

# ScreenShake logic
@export var max_offset: float = 5.0
@export var max_roll: float = 10.0
@export var shakeReduction: float = 2.5

var stress: float = 0.0
var shake: float = 0.0


var extra_zoom := Vector2.ZERO
var zoom_accel := Vector2.ZERO

func _ready() -> void:
	Globals.camera = self

func _physics_process(delta: float) -> void:
	if not Globals.level:
		return
	
	# Position
	var pos = %Cam.global_position.lerp((player.global_position + Globals.level.midpoint.global_position) / 2, delta * movement_lerp_speed)
	%Cam.global_position = pos
	
	# Zoom
	zoom_accel = zoom_accel / 2.0
	zoom_accel += Vector2(player.velocity.length(), player.velocity.length()) / 1000000 - Vector2.ONE / 2000
	var distance = player.global_position.distance_to(Globals.level.midpoint.global_position)
	extra_zoom = -Vector2(distance, distance) / 80000
	extra_zoom = clamp(extra_zoom + zoom_accel, min_zoom - base_zoom, max_zoom - base_zoom)
	
	#print(extra_zoom, zoom_accel, distance, pos, %Cam.global_position)
	
	%Cam.zoom = base_zoom + extra_zoom

func _process_shake(delta) -> void:
	# Lerp to normal position/rotation
	%Cam.rotation_degrees = lerp(%Cam.rotation_degrees, 0.0, delta * 5.0)
	
	%Cam.position.x = lerp(%Cam.position.x, 0.0, delta * 5.0)
	%Cam.position.y = lerp(%Cam.position.y, 0.0, delta * 5.0)
	
	# Shake logic
	shake = stress * stress
	
	# Rotation
	%Cam.rotation_degrees += max_roll * shake *  _get_noise(randi(), delta) * 100
	
	# Position
	var offset_x = max_offset * shake * _get_noise(randi(), delta + 1.0)
	var offset_y = max_offset * shake * _get_noise(randi(), delta + 2.0)
	
	%Cam.position = Vector2(offset_x, offset_y) * 10
	
	# Shake reduction
	stress -= shakeReduction * delta
	stress = max(0, stress)


func _get_noise(noise_seed, time) -> float:
	var n = FastNoiseLite.new()
	n.seed = noise_seed
	
	return n.get_noise_1d(time)

func add_stress(amount: float) -> void:
	stress += amount
	stress = max(0, stress)
