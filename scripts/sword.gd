extends Node2D

var enemy_in_range = false
var enemy_reference = null
var dmg = 20

func _process(delta):
	check_input()

func _on_area_2d_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_range = true
		enemy_reference = body

func _on_area_2d_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_range = false
		enemy_reference = null

func check_input():
	if Input.is_action_just_pressed("attack"):
		$AnimationPlayer.play("ht")
	if Input.is_action_just_pressed("attack") and enemy_in_range:
		enemy_reference.get_damage(dmg)
