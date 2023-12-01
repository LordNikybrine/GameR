extends Node2D

func _ready():
	print("Level 1")
	Global.player_speed = 80
	Global.jump_speed = -500
	Global.gravity = 1600
