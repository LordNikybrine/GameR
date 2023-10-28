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


func _on_end_pressed():
	get_tree().quit()


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Scenes/scene_level/tutorial.tscn")


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/scene_ui/choose_storage.tscn")


func _on_load_pressed():
	pass # Speicherstand laden
