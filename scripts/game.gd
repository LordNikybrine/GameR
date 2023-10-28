extends Node2D

var menu = null
var instance = null
var level = null

func _process(delta):
	set_volBar()
	check_input()

func _physics_process(delta):
	$Music_Player.volume_db = Global.music_vol / 2 - 40
	if Global.music_vol == 0:
		$Music_Player.stream_paused = true
	elif Global.music_vol > 0:
		$Music_Player.stream_paused = false

func _ready():
	start_men()

func start_men():
	$Start_menu.visible = true

func _on_tutorial_pressed():
	Global.lvl = "tut"
	add_level()

func add_level():
	$Start_menu.visible = false
	instance = load("res://Scenes/scene_level/level_" + str(Global.lvl) + ".tscn")
	level = instance.instantiate()
	$InGame.add_child(level)

func set_volBar():
	$Start_menu/Menu/ProgressBar.value = $Start_menu/Menu/HSlider.value
	Global.music_vol = $Start_menu/Menu/HSlider.value

func check_input():
	if Input.is_action_just_pressed("esc"):
		if $Start_menu/Menu.visible == false:
			$Start_menu/Menu.visible = true
		else:
			$Start_menu/Menu.visible = false

func _on_button_pressed():
	men()

func _on_menu_pressed():
	men()

func men():
	if $Start_menu/Menu.visible == false:
		$Start_menu/Menu.visible = true
	else:
		$Start_menu/Menu.visible = false

func _on_end_pressed():
	get_tree().quit()
