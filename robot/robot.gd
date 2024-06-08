extends CharacterBody2D
class_name Player

@export var speed: float
@export var friction: float
@export var steering_speed: float
@export var push_force = 80.0

var friction_multiplier: float = 1.0

var haus: Haus

func _physics_process(_delta):
	var steering = Input.get_action_strength("steer_right") - Input.get_action_strength("steer_left")
	#var drift_factor = min(0.1, abs(steering))
	#var drift_vector = Vector2(drift_factor, drift_factor)

	rotation += steering_speed * steering / friction_multiplier

	var input = Input.get_action_strength("go_forward") - Input.get_action_strength("go_backward")
	velocity += Vector2(0, -speed * input).rotated(rotation)
	
	var total_friction = friction * friction_multiplier
	velocity = velocity / total_friction

	move_and_slide()
	do_physics()
	
	if haus != null:
		%Connector.add_checkpoint(haus.position)
		haus.is_connected_to_cable = true

	queue_redraw()

func do_physics() -> void:
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse( - c.get_normal() * push_force)

func set_house(new_haus: Haus) -> void:
	haus = new_haus

func _draw():
	draw_line(Vector2(0, 0), Vector2(0, -200), Color.BLUE, 20)
