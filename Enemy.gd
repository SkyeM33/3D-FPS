extends CharacterBody3D

var Player = null
const SPEED = 5.0

func _physics_process(delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		look_at(Player.global_transform.origin, Vector3.UP)
		print("player found")
