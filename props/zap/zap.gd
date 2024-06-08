extends Node2D

class_name Zap

@export var speed: float
var connector: Connector
var checkpoint_n: int
var dead := false
var is_moving := false

var dist_from_last: float
var last_checkpoint: Vector2

func _ready():
	connector = Globals.connector
	dist_from_last = 0
	checkpoint_n = 0
	position = connector.checkpoints[checkpoint_n]
	checkpoint_n += 1
	last_checkpoint = connector.checkpoints[0]

func activate():
	%Sprite2D.visible = true
	is_moving = true

func kill():
	print("dead")
	dead = true
	Globals.camera.add_stress(2)

func _physics_process(_delta):
	if (dead):
		return

	if !is_moving:
		return
		
	for intersection in connector.intersection_points:
		if (position - intersection).length() < 20:
			kill()
			return
	
	dist_from_last += speed

	#is at checkpoint
	if len(connector.checkpoints) > checkpoint_n:
		if (position - connector.checkpoints[checkpoint_n]).length() < 20:
			last_checkpoint = connector.checkpoints[checkpoint_n]
			checkpoint_n += 1
			dist_from_last = 0
	
	#move along cable
	if len(connector.checkpoints) > checkpoint_n:
		var dir = (connector.checkpoints[checkpoint_n] - last_checkpoint).normalized()
		position = last_checkpoint + dir * dist_from_last
	else:
		if (position - connector.robot.position).length() > 20:
			var dir = (connector.robot.position - connector.checkpoints[- 1]).normalized()
			position = connector.checkpoints[- 1] + dir * dist_from_last
		else:
			kill()
