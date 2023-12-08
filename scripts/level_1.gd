extends Node2D

func _ready():
	Global.max_level = "1"
	Global.player_speed = 200
	Global.jump_speed = -1000
	Global.gravity = 1600


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		Global.player_health = 0;
