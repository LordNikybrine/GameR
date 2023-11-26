extends AudioStreamPlayer2D

func _process(delta):
	self.volume_db = Global.music_vol / 2 - 40
	if Global.music_vol == 0:
		self.stream_paused = true
	elif Global.music_vol > 0:
		self.stream_paused = false
