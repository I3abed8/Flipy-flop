extends CharacterBody2D

const GRAVITY = 900.0
const FLAP_STRENGTH = -300.0
const FORWARD_SPEED = 150.0

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.x = FORWARD_SPEED

	if Input.is_action_just_pressed("flap"):
		velocity.y = FLAP_STRENGTH

	move_and_slide()

	rotation = clamp(velocity.y / 600.0, -0.5, 1.2)


func _on_end_goal_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if Global.minigames_done > 2:
			get_tree().change_scene_to_file("res://Scenes/done_scene.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")


func _on_fall_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
