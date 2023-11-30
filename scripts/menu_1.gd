extends Control

@onready var previous_window = DisplayServer.window_get_mode()
@onready var current_window = DisplayServer.window_get_mode()

func _ready():
	$MarginContainer/VBoxContainer/TabContainer/Audio/HSlider.value = Global.music_vol

func _physics_process(delta):
	Global.music_vol = $MarginContainer/VBoxContainer/TabContainer/Audio/HSlider.value
	check_input()


func _on_button_pressed():
	current_window = DisplayServer.window_get_mode()
	if current_window != 4:
		previous_window = current_window
		DisplayServer.window_set_mode(4)
	else:
		if previous_window == 4:
			previous_window = 2
		DisplayServer.window_set_mode(previous_window)


func check_input():
	if Input.is_action_just_pressed("esc"):
		if self.visible == false:
			self.visible = true
			get_tree().paused = true
		else:
			self.visible = false
			get_tree().paused = false


func _on_back_pressed():
	get_parent().get_parent().get_parent().back()
