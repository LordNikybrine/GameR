extends Control

@onready var previous_window = DisplayServer.window_get_mode()
@onready var current_window = DisplayServer.window_get_mode()

func _ready():
	$MarginContainer/VBoxContainer/TabContainer/Audio/HSlider.value = Global.music_vol

func _physics_process(delta):
	Global.music_vol = $MarginContainer/VBoxContainer/TabContainer/Audio/HSlider.value
	print($MarginContainer/VBoxContainer/TabContainer/Audio/HSlider.value)
	print(Global.music_vol)


func _on_button_pressed():
	current_window = DisplayServer.window_get_mode()
	if current_window != 4:
		previous_window = current_window
		DisplayServer.window_set_mode(4)
	else:
		if previous_window == 4:
			previous_window = 2
		DisplayServer.window_set_mode(previous_window)
