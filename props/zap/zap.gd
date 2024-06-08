extends Node2D

@export var speed: float
var connector: Connector
var checkpoint_n: int

var dist_from_last: float
var last_checkpoint: Vector2

func _ready():
	connector = %Connector
	dist_from_last = 0
	checkpoint_n = 0
	position = connector.checkpoints[checkpoint_n]
	checkpoint_n += 1
	last_checkpoint = connector.checkpoints[0]

func _physics_process(_delta):
	dist_from_last += speed

	#is at checkpoint
	if len(connector.checkpoints) > checkpoint_n:
		if (position - connector.checkpoints[checkpoint_n]).length() < 10:
			last_checkpoint = connector.checkpoints[checkpoint_n]
			checkpoint_n += 1
			dist_from_last = 0
	
	#move along cable
	if len(connector.checkpoints) > checkpoint_n:
		var dir = (connector.checkpoints[checkpoint_n] - last_checkpoint).normalized()
		position = connector.checkpoints[checkpoint_n] + dir * dist_from_last
	else:
		if (position - connector.robot.position).length() > 10:
			var dir = (connector.robot.position - connector.checkpoints[- 1]).normalized()
			position = connector.checkpoints[- 1] + dir * dist_from_last
		else:
			print("dead")
			Globals.camera.add_stress(50.0)
