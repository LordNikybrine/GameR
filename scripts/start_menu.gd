extends Control

func _process(delta):
	set_volBar()
	check_input()

func set_volBar():
	$Menu/ProgressBar.value = $Menu/HSlider.value
	Global.music_vol = $Menu/HSlider.value

func check_input():
	if Input.is_action_just_pressed("esc"):
		if $Menu.visible == false:
			$Menu.visible = true
		else:
			$Menu.visible = false

func _on_menu_pressed():
	men()

func men():
	if $Menu.visible == false:
		$Menu.visible = true
	else:
		$Menu.visible = false


func _on_button_pressed():
	$Menu.visible = false
