extends Node2D

@export var speed: float
var connector: Connector
var checkpoint_n: int

func _ready():
	connector = %Connector
	checkpoint_n = 0
	position = connector.checkpoints[checkpoint_n]
	checkpoint_n += 1

func _physics_process(_delta):
	if len(connector.checkpoints) > checkpoint_n:
		if (position - connector.checkpoints[checkpoint_n]).length() < 5:
				checkpoint_n += 1
	if len(connector.checkpoints) > checkpoint_n:
		position += speed * (-position + connector.checkpoints[checkpoint_n]).normalized()
