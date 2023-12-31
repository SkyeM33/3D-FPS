extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.001
const MOUSE_RANGE = 1.2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -MOUSE_RANGE, MOUSE_RANGE)
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

const Balloon = preload("res://Dialogue/Dialogue/balloon.tscn")


func _on_orb_area_body_entered(body):
	if body.name == "Player":
		$"../Orb".queue_free()
		Global.orb = true
		print("got orb")

func _on_cat_area_body_entered(body):
	if body.name == "Player":
		var balloon = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		if Global.orb == false:
			balloon.start(load("res://Dialogue/Dialogue/Cat_Quest.dialogue"), "Quest")
		elif Global.orb == true:
			balloon.start(load("res://Dialogue/Dialogue/Cat_Quest.dialogue"), "Delivery")
			

		



func _on_guard_area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://UI/death.tscn")


func _on_collectable_body_entered(body):
	var sound = get_node_or_null("/root/Game/Ting")
	$"../Collectable".queue_free()
	Global.points += 1
	get_node("/root/Game/Player/Pivot/Camera3D/Label").text = "Score: " + str(Global.points)
	sound.play()
	

func _on_collectable_2_body_entered(body):
	var sound = get_node_or_null("/root/Game/Ting")
	$"../Collectable2".queue_free()
	Global.points += 1
	get_node("/root/Game/Player/Pivot/Camera3D/Label").text = "Score: " + str(Global.points)
	sound.play()

func _on_collectable_3_body_entered(body):
	var sound = get_node_or_null("/root/Game/Ting")
	$"../Collectable3".queue_free()
	Global.points += 1
	get_node("/root/Game/Player/Pivot/Camera3D/Label").text = "Score: " + str(Global.points)
	sound.play()
