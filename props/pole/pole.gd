extends Node2D

@export var thundersound: AudioStreamMP3

func do_zap_animation():
	SoundEffects.play_sound(thundersound)
	%AnimationPlayer.play("zapppp")
