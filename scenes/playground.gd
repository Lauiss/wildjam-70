extends Node3D

@onready var score = 0
@onready var label = $CanvasLayer/SubViewportContainer2/SubViewport/MarginContainer/HBoxContainer/Label

func _physics_process(delta):
	if score >= 10:
		GlobalVariables.IS_WIN = true
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func star1(body):
	score += 1 
	label.text = str(score) + "/10"
	$star.queue_free()


func star9(body):
	score += 1
	label.text = str(score) + "/10"
	$star9.queue_free()


func star2(body):
	score += 1
	label.text = str(score) + "/10"
	$star2.queue_free()


func star3(body):
	score += 1
	label.text = str(score) + "/10"
	$star3.queue_free()


func star5(body):
	score += 1
	label.text = str(score) + "/10"
	$star5.queue_free()


func star4(body):
	score += 1
	label.text = str(score) + "/10"
	$star4.queue_free()


func star6(body):
	score += 1
	label.text = str(score) + "/10"
	$star6.queue_free()


func star7(body):
	score += 1
	label.text = str(score) + "/10"
	$star7.queue_free()


func star8(body):
	score += 1
	label.text = str(score) + "/10"
	$star8.queue_free()
