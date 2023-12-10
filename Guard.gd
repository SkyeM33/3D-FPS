extends Node3D

func _ready():
	$AnimationPlayer.play("Idle")


var Player = null

func _physics_process(delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		pass #look_at(Player.global_transform.origin, Vector3.UP)
