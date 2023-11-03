extends Control

func _ready():
	$HSlider.value = Global.music_vol

func _process(delta):
	set_volBar()

func set_volBar():
	$ProgressBar.value = $HSlider.value
	Global.music_vol = $HSlider.value


func _on_button_pressed():
	self.visible = false
