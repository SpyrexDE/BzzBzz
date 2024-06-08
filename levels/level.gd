extends Node2D
class_name Level

@export
var midpoint: Node2D

@export var lvl_music: AudioStreamMP3

@export var start_delay: float = 5.0

func _ready() -> void:
	Globals.level = self
	SoundEffects.play_sound(lvl_music)

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

func game_over_cat():
	get_tree().change_scene_to_file("res://ui/game_over_menu_cat.tscn")

func win():
	get_tree().change_scene_to_file("res://ui/win_menu.tscn")

func _process(delta: float) -> void:
	for child in get_children():
		if child is Haus:
			if not child.strom:
				return
	win()
