extends Control

func _physics_process(delta):
	$MarginContainer/VBoxContainer/TabContainer/Audio/ProgressBar.value = $MarginContainer/VBoxContainer/TabContainer/Audio/General/HSlider.value
	Global.music_vol = $MarginContainer/VBoxContainer/TabContainer/Audio/ProgressBar.value
