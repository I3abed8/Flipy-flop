extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		if Global.minigames_done > 2:
			get_tree().change_scene_to_file("res://Scenes/done_scene.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
