extends Node

var orb = false

var Orb = get_node_or_null("/root/Game/Orb")

var cat = false

var points = 0

func _ready():
	pass #get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _unhandled_input(event):
	if event.is_action_pressed("Quit"):
		get_tree().quit()
