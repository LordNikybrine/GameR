extends Node2D



func _on_exit_pressed():
	get_tree().quit()


func _on_try_again_pressed():
	Global.level = Global.max_level
	get_parent().get_parent().add_level()
