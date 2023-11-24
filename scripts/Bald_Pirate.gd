extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -350
var health = 80
var speed = 50
var player_chase = false
var player = null
var damage = 50
var player_in_range = false
var timeout = false
var attacking = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if player_chase:
		position += (player.position - position)/speed
	
	attack()
	animation()
	move_and_slide()
	_check_jump()
	check_for_life()
	$TextureProgressBar.value = health



func attack():
	if player_in_range:
		attacking = true
	elif !player_in_range:
		attacking = false

func animation():
	if player_chase:
		var direction = (player.position - position).normalized()
		if direction.x <= 0:
			$AnimatedSprite2D.scale.x = -1
		elif direction.x >= 0:
			$AnimatedSprite2D.scale.x = 1 
	if !player_chase:
		$AnimatedSprite2D.play("idle")
	
	if player_chase && velocity.y == 0 && !player_in_range:
		$AnimatedSprite2D.play("run")
	elif velocity.y != 0:
		$AnimatedSprite2D.play("jump")

func _check_jump():
	if player != null and player.position.y < position.y - 15 && is_on_floor():
		velocity.y = JUMP_VELOCITY

func check_for_life():
	if health <= 0:
		die()

func die():
	self.queue_free()

func enemy():
	pass

func get_damage(dmg):
	$AnimatedSprite2D.play("hit")
	health = health - dmg


func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false


func _on_hit_box_body_entered(body):
	if body.has_method("player"):
		player_in_range = true


func _on_hit_box_body_exited(body):
	if body.has_method("player"):
		player_in_range = false

func _on_timer_timeout():
	if attacking:
		attacke()

func attacke():
	$AnimatedSprite2D.play("attack")
	Global.player_health = Global.player_health - 20
	print(Global.player_health)
