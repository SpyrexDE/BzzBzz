extends Node2D
class_name Level

@export
var midpoint: Node2D

func _ready() -> void:
	Globals.level = self
