extends Node2D
class_name Level

@export
var midpoint: Node2D

@export var start_delay: float

func _ready() -> void:
	Globals.level = self

	var timer = Timer.new()
	timer.wait_time = start_delay
	timer.one_shot = true
	add_child(timer)
	timer.timeout.connect(_start_Zap)
	timer.start()

func _start_Zap():
	print("timers over")
	%Zap.activate()
	%Pole.do_zap_animation()

func game_over():
	pass