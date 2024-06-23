extends MeshInstance3D
@onready var score = 0
@onready var label = $"../CanvasLayer/MarginContainer/HBoxContainer/Label"

func _on_area_3d_body_entered(body):
	score += 1
	label.text = score
	queue_free()
