extends CharacterBody3D

var SPEED = 3
const ACCEL = 10
const MAX = 100
@export var player : Node3D

func _ready():
	if player == null:
		player = get_parent().get_node("../Player")
		if player == null:
			pass
	else:
		print("Player assigned correctly:", player)

func _physics_process(_delta):
	if player != null:
		var direction = position.direction_to(player.position)
		velocity = direction * SPEED
		move_and_slide()

func _on_area_3d_body_entered(body):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
