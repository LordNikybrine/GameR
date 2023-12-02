extends Node2D

@onready var previous_window = DisplayServer.window_get_mode()
@onready var current_window = DisplayServer.window_get_mode()

var menu = null
var instance = null
var level = null
var save_path = null

func _physics_process(delta):
	deathscreen()

func _ready():
	start_men()

func start_men():
	$Start_menu.visible = true

func _on_tutorial_pressed():
	Global.level = "tut"
	add_level()

func add_level():
	Global.player_health = Global.max_health
	if $InGame.get_child_count() != 0:
		$InGame.get_child(0).queue_free()
	$Start_menu.visible = false
	instance = load("res://Scenes/scene_level/level_" + str(Global.level) + ".tscn")
	level = instance.instantiate()
	$InGame.add_child(level)
	$Bg.visible = false

func _on_button_pressed():
	men()

func _on_menu_pressed():
	men()

func men():
	if $Menu.visible == false:
		$Menu.visible = true
	else:
		$Menu.visible = false

func _on_end_pressed():
	get_tree().quit()


func _on_fullscreen_pressed():
	current_window = DisplayServer.window_get_mode()
	if current_window != 4:
		previous_window = current_window
		DisplayServer.window_set_mode(4)
	else:
		if previous_window == 4:
			previous_window = 2
		DisplayServer.window_set_mode(previous_window)

func deathscreen():
	if Global.death:
		level.queue_free()
		Global.lvl = "death"
		add_level()
		Global.death = false


func _on_back_to_main_menu_pressed():
	if $InGame.get_child_count() != 0:
		level.queue_free()
	$Start_menu.visible = true
	$Menu.visible = false


func _on_load_pressed():
	$Start_menu.visible = false
	$Saves.visible = true


func _on_back_pressed():
	$Start_menu.visible = true
	$Saves.visible = false


func _on_save_1_pressed():
	save_path = "res://popel1.save"
	load_data()
	add_level()
	$Start_menu.visible = false
	$Saves.visible = false


func _on_save_2_pressed():
	save_path = "res://popel2.save"
	load_data()
	add_level()
	$Start_menu.visible = false
	$Saves.visible = false


func _on_save_3_pressed():
	save_path = "res://popel3.save"
	load_data()
	add_level()
	$Start_menu.visible = false
	$Saves.visible = false


func _on_save_4_pressed():
	save_path = "res://popel4.save"
	load_data()
	add_level()
	$Start_menu.visible = false
	$Saves.visible = false


func _on_save_5_pressed():
	save_path = "res://popel5.save"
	load_data()
	add_level()
	$Start_menu.visible = false
	$Saves.visible = false


func _on_save_6_pressed():
	save_path = "res://popel6.save"
	load_data()
	add_level()
	$Start_menu.visible = false
	$Saves.visible = false

func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Global.max_health)
	file.store_var(Global.level)
	print("saved")

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Global.max_health = file.get_var(Global.max_health)
		Global.level = file.get_var(Global.level)
		print(Global.max_health)
		print(Global.level)
	else:
		print("no data saved")
		new_game()
	
	if Global.level == null:
		print("error in level save")

func new_game():
	Global.level = 1
	Global.max_health = 100


func _on_new_game_pressed():
	new_game()
	add_level()
	$Start_menu.visible = false
	$Saves.visible = false

func back():
	if $InGame.get_child_count() != 0:
		level.queue_free()
	$Start_menu.visible = true
	$Bg.visible = true
	get_tree().paused = false
