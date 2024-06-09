extends Node2D
class_name Level

@export
var midpoint: Node2D

@export var lvl_music: AudioStreamMP3

@export var start_delay: float = 5.0

var timer: Timer

func _ready() -> void:
	Globals.level = self
	SoundEffects.play_sound(lvl_music, 1, 0, "bgm")

	timer = Timer.new()
	timer.wait_time = 1
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(_start_Zap)
	timer.start()
	
	if $Label:
		$Label.text = str(start_delay)

func _start_Zap():
	if not $Label:
		return
	if start_delay > 1:
		start_delay -= 1
		$Label.text = str(start_delay)
	else:
		$Label.hide()
		%Zap.activate()
		%Pole.do_zap_animation()
		timer.stop()

func game_over():
	SoundEffects.fade_sound(lvl_music)
	get_tree().change_scene_to_file("res://ui/game_over_menu.tscn")

func game_over_cat():
	SoundEffects.fade_sound(lvl_music)
	get_tree().change_scene_to_file("res://ui/game_over_menu_cat.tscn")

func win():
	SoundEffects.fade_sound(lvl_music)
	get_tree().change_scene_to_file("res://ui/win_menu.tscn")

func _process(delta: float) -> void:
	for child in get_children():
		if child is Haus:
			if not child.strom:
				return
	win()
