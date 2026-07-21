extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
