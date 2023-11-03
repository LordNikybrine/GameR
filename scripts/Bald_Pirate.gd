extends CharacterBody2D

var health = 80

func enemy():
	pass

func get_damage(dmg):
	$AnimatedSprite2D.play("hit")
	health = health - dmg
