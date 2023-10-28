extends Node2D

var menu = null
var instance = null

func _physics_process(delta):
	$Music_Player.volume_db = Global.music_vol / 2 - 40
	if Global.music_vol == 0:
		$Music_Player.stream_paused = true
	elif Global.music_vol > 0:
		$Music_Player.stream_paused = false

func _ready():
	add_level()

func add_level():
	instance = preload("res://Scenes/scene_ui/start_menu.tscn")
	menu = instance.instantiate()
	$InGame.add_child(menu)
