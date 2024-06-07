extends CharacterBody2D

@export var speed: float
@export var friction: float
@export var steering_speed: float
var _velocity: Vector2

func _physics_process(_delta):
	var steering = Input.get_action_strength("steer_right") - Input.get_action_strength("steer_left")

	rotation += steering_speed * steering

	velocity = Vector2(0, -speed * Input.get_action_strength("go_forward")).rotated(rotation)

	move_and_slide()
