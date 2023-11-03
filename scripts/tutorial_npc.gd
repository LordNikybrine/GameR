extends Node2D

var count = 0

func _ready():
	$AnimatedSprite2D.play("idle")


func _on_area_2d_body_entered(body):
	if body.has_method("player") && count == 0:
		count += 1
		$AnimationPlayer.play("text")
