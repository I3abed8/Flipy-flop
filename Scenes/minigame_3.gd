extends Node2D

@export var level_time := 20.0 # seconds to reach the goal

@onready var bird: CharacterBody2D = $Bird
@onready var timer_label: Label = $TimerLabel
@onready var countdown_timer: Timer = $CountdownTimer
@onready var goal: Area2D = $Goal

var time_left: float

func _ready() -> void:
	time_left = level_time
	bird.died.connect(_on_bird_died)
	goal.reached.connect(_on_goal_reached)

	countdown_timer.wait_time = 1.0
	countdown_timer.timeout.connect(_tick)
	countdown_timer.start()

func _tick() -> void:
	time_left -= 1.0
	timer_label.text = str(int(time_left))

	if time_left <= 0:
		_on_bird_died() # ran out of time = lose

func _on_bird_died() -> void:
	get_tree().reload_current_scene() # restart the level

func _on_goal_reached() -> void:
	get_tree().change_scene_to_file("res://Scenes/done_scene.tscn")


func _on_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		reached.emit()
