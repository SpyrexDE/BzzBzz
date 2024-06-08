extends CharacterBody2D
class_name Player

@export var speed: float
@export var friction: float
@export var steering_speed: float

var friction_multiplier: float = 1.0

func _physics_process(_delta):
	var steering = Input.get_action_strength("steer_right") - Input.get_action_strength("steer_left")
	var drift_factor = min(0.1, abs(steering))
	var drift_vector = Vector2(drift_factor, drift_factor)

	rotation += steering_speed * steering / friction_multiplier

	var input = Input.get_action_strength("go_forward") - Input.get_action_strength("go_backward")
	velocity += Vector2(0, -speed * input - drift_factor * 500).rotated(rotation)
	
	var total_friction = friction * friction_multiplier - drift_factor
	velocity = velocity / total_friction

	move_and_slide()
