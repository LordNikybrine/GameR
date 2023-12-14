extends Node2D

var enemy_in_range : bool = false
var enemy_reference = null
var dmg : int = 20
var in_area : bool = false

func _process(delta):
	check_input()
	check_for_range()

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
	if Input.is_action_just_pressed("attack") && enemy_in_range:
		enemy_reference.get_damage(dmg)


func _on_area_to_collect_body_entered(body):
	if body.has_method("player"):
		in_area = true

func _on_area_to_collect_body_exited(body):
	if body.has_method("player"):
		in_area = false

func check_for_range():
	if in_area:
		$RichTextLabel.visible = true
		if Input.is_action_pressed("interact"):
			var player = get_parent().get_parent().get_node("player")
			player.change_weapon("res://Scenes/scene_object/sword2.tscn")
	else:
		$RichTextLabel.visible = false
