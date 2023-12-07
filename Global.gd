extends Node

var orb = false

var Orb = get_node_or_null("/root/Game/Orb")

func _on_area_3d_area_entered(area):
	Global.orb = true
	Orb.queue_free()


func _unhandled_input(event):
	if event.is_action_pressed("Quit"):
		get_tree().quit()
