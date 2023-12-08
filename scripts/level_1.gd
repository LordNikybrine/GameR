extends Node2D

func _ready():
	Global.max_level = "1"


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		Global.player_health = 0;
