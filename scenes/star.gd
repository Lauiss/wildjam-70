extends MeshInstance3D
@onready var score = 0
@onready var label = $"../CanvasLayer/SubViewport/MarginContainer/HBoxContainer/Label"

func _on_area_3d_body_entered(body):
	score += 1
	label.text = str(score)
	queue_free()
