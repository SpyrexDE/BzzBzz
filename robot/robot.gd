extends CharacterBody2D

@export var speed: float

func _physics_process(delta):
	move_and_slide()
