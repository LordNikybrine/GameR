extends CharacterBody2D

var run_speed = 350
var jump_speed = -900
var gravity = 2000
var flip = null

func player():
	pass

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	move_and_slide()
	animations()
	check_flip()

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

func animations():
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_pressed("up")
	
	if left || right:
		$AnimatedSprite2D.play("run")
	if left:
		flip = true
	elif right: 
		flip = false
	
	if velocity.x == 0 && velocity.y == 0:
		$AnimatedSprite2D.play("idle")
	
	if jump:
		$AnimatedSprite2D.play("jump")


func check_flip():
	if flip:
		$AnimatedSprite2D.scale.x = -1
	elif !flip:
		$AnimatedSprite2D.scale.x = 1
