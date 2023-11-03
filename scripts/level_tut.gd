extends Node2D

func _ready():
	$fade/AnimationPlayer.play("fade")

func _physics_process(delta):
	check_input()

func check_input():
	var Menu = $Menu
	if Input.is_action_just_pressed("esc"):
		if Menu.visible == false:
			Menu.visible = true
		else:
			Menu.visible = false
