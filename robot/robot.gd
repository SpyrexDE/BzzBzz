extends CharacterBody2D
class_name Player

@export var speed: float
@export var friction: float
@export var steering_speed: float

var friction_multiplier: float

func _physics_process(_delta):
	var steering = Input.get_action_strength("steer_right") - Input.get_action_strength("steer_left")

	rotation += steering_speed * steering / friction_multiplier

	var input = Input.get_action_strength("go_forward") - Input.get_action_strength("go_backward")
	velocity += Vector2(0, -speed * input).rotated(rotation)
	
	var total_friction = friction * friction_multiplier
	velocity = velocity / total_friction

	move_and_slide()
