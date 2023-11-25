extends Control

func _ready():
	$MarginContainer/VBoxContainer/TabContainer/Audio/General/HSlider.value = Global.music_vol

func _process(delta):
	set_volBar()

func set_volBar():
	$MarginContainer/VBoxContainer/TabContainer/Audio/ProgressBar.value = $MarginContainer/VBoxContainer/TabContainer/Audio/General/HSlider.value
	Global.music_vol = $MarginContainer/VBoxContainer/TabContainer/Audio/General/HSlider.value


func _on_button_pressed():
	self.visible = false
