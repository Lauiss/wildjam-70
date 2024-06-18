extends Control

var pause_menu
@onready var pause_screen = $pauseScreen
@onready var settings_screen = $settingsScreen
@onready var default = $settingsScreen/default
@onready var volume = $settingsScreen/volume

func _ready():
	hide()
	pause_screen.hide()
	settings_screen.hide()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if settings_screen.visible:
			pause_screen.show()
			settings_screen.hide()
		else:
			if get_tree().paused:
				resume_game()
			else:
				pause_game()

func pause_game():
	show()
	get_tree().paused = true
	pause_screen.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func resume_game():
	hide()
	get_tree().paused = false
	pause_screen.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 


func _on_resume_pressed():
	hide()
	resume_game()

func _on_settings_pressed():
	pause_screen.hide()
	settings_screen.show()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/title_menu.tscn")

func _on_back_pressed():
	pause_screen.show()
	settings_screen.hide()

func _on_volume_pressed():
	default.hide()
	volume.show()

func _on_language_pressed():
	pass
