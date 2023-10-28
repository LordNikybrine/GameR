extends CharacterBody2D

var run_speed = 350
var jump_speed = -900

func _physics_process(delta):
	get_input()
	move_and_slide()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_pressed("up")
	
	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
