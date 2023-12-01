extends CharacterBody2D

var run_speed : int = Global.player_speed
@export var  jump_speed : int = -900
@export var gravity : float= 2000
var flip : bool = false

func player():
	pass

func _physics_process(delta):
	velocity.y += gravity * delta
	run_speed = Global.player_speed
	jump_speed = Global.jump_speed
	gravity = Global.gravity
	get_input()
	move_and_slide()
	animations()
	check_flip()
	check_for_live()
	$self/ProgressBar.value = Global.player_health

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
		$self/AnimatedSprite2D.play("run")
	if left:
		flip = true
	elif right: 
		flip = false
	
	if velocity.x == 0 && velocity.y == 0:
		$self/AnimatedSprite2D.play("idle")
	
	if jump:
		$self/AnimatedSprite2D.play("jump")


func check_flip():
	if flip:
		$self.scale.x = -1
	elif !flip:
		$self.scale.x = 1

func check_for_live():
	if Global.player_health <= 0:
		die()

func die():
	Global.death = true
	self.queue_free()
