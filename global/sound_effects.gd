extends Node2D

var active_players: Array[AudioStreamPlayer]
var active_intervalls: Array[AudioStream]
var active_timers: Array[Timer]

func play_sound(sound: AudioStream, pitch: float=1, volume: float=0, bus: String="sfx") -> void:
	var instance = AudioStreamPlayer.new()
	instance.stream = sound
	instance.pitch_scale = pitch
	instance.volume_db = volume
	instance.bus = bus

	if sound is AudioStreamMP3 and !sound.loop:
		instance.finished.connect(_remove_node)
	else:
		active_players.append(instance)

	add_child(instance)
	instance.play()

func play_sound_invtervall(sound: AudioStream, interval: float, pitch: float=1, volume: float=0, bus: String="sfx") -> void:
	active_intervalls.append(sound)
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = interval
	timer.timeout.connect(play_sound.bind(sound, pitch, volume, bus))
	active_timers.append(timer)
	timer.start(interval)

func stop_sound(sound: AudioStream) -> void:
	for player in active_players:
		if player.stream == sound:
			active_players.erase(player)
			_remove_node(player)
			return

func stop_sound_intervall(sound) -> void:
	var index = active_intervalls.find(sound)
	var timer = active_timers[index]
	active_intervalls.remove_at(index)
	active_timers.remove_at(index)
	timer.queue_free()

func fade_sound(sound: AudioStream) -> void:
	print("fade")
	var audio_player: AudioStreamPlayer
	for p in active_players:
		if p.stream == sound:
			audio_player = p
			break
	
	print(audio_player)
	var t = get_tree().create_tween()
	t.tween_property(audio_player, "volume_db", -80, 3)
	t.finished.connect(stop_sound.bind(sound))

func _remove_node(instance: AudioStreamPlayer) -> void:
	instance.queue_free()
