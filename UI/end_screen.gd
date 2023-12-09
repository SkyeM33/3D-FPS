extends Node2D
	

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")
	



func _on_quit_pressed():
	get_tree().quit()

func _ready():
	if Global.cat == true:
		$CatEnd.visible = true
		$OrbEnd.visible = false
