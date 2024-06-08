extends Node2D

@export var speed: float
var connector: Connector
var checkpoint_n: int

var dist_from_last: float

func _ready():
	connector = %Connector
	dist_from_last = 0
	checkpoint_n = 0
	position = connector.checkpoints[checkpoint_n]
	checkpoint_n += 1

func _physics_process(_delta):
	if len(connector.checkpoints) > checkpoint_n:
		if (position - connector.checkpoints[checkpoint_n]).length() < 5:
				checkpoint_n += 1
	if len(connector.checkpoints) > checkpoint_n:
		dist_from_last = 0
		position += speed * (-position + connector.checkpoints[checkpoint_n]).normalized()
	else:
		if (position - connector.robot.position).length() > 5:
			var dir = (connector.robot.position - connector.checkpoints[- 1]).normalized()
			dist_from_last += speed;
			position = connector.checkpoints[- 1] + dir * dist_from_last
		else:
			print("dead")
			Globals.camera.add_stress(50.0)
