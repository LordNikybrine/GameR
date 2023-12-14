extends Node2D

var a : int = 0

func _ready():
	Global.max_level = "1"
	$fade/AnimationPlayer.play("fade")
#	$player.change_weapon("res://Scenes/scene_object/sword2.tscn")


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		Global.player_health = 0;


func _on_chest_1_body_entered(body):
	if body.has_method("player") && a == 0:
		a +=1 
		$Chests/Chest_1/AnimatedSprite2D.play("open")


func _on_animated_sprite_2d_animation_finished():
	if $loot.get_child_count() != 0:
		var childs = $loot.get_child(0)
		$loot.remove_child(childs)
	
	var loot = load("res://Scenes/scene_object/sword2.tscn")
	loot = loot.instantiate()
	$loot.add_child(loot)
