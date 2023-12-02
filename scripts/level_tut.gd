extends Node2D

var next_levelr = false

func _ready():
	$fade/AnimationPlayer.play("fade")

func _physics_process(delta):
	next_level()

func next_level():
	if $Enemys.get_child_count() == 0:
		next_levelr = true



func _on_next_level_body_entered(body):
	if next_levelr && body.has_method("player"):
		Global.level = "1"
		get_parent().get_parent().add_level()
