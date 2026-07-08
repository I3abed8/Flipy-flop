extends Node2D
@onready var themed_timer: Node2D = $"Themed Timer"

var buttons_pressed = 0
var timer_end = false

func _ready() -> void:
	await themed_timer.timer_start(7.0)
	#after this is completed...
	timer_end = true 


func _process(delta: float) -> void:
	if buttons_pressed == 4:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://Scenes/done_scene.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")


func _on_button_1_pressed() -> void:
	$button_1.hide()
	buttons_pressed += 1


func _on_button_2_pressed() -> void:
	$button_2.hide()
	buttons_pressed += 1


func _on_button_3_pressed() -> void:
	$button_3.hide()
	buttons_pressed += 1


func _on_button_4_pressed() -> void:
	$button_4.hide()
	buttons_pressed += 1.



	
