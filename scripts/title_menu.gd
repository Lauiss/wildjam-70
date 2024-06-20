extends Control

var pause_menu
@onready var pause_screen = $pauseScreen
@onready var settings_screen = $settingsScreen
@onready var default = $settingsScreen/default
@onready var volume = $settingsScreen/volume

func _ready():
	pause_screen.show()
	settings_screen.hide()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if settings_screen.visible:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			pause_screen.show()
			settings_screen.hide()

func _on_settings_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	pause_screen.hide()
	settings_screen.show()

func _on_main_menu_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")


func _on_back_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	pause_screen.show()
	settings_screen.hide()

func _on_volume_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	default.hide()
	volume.show()

func _on_language_pressed():
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/character_selection.tscn")

func _on_exit_pressed():
	get_tree().quit()
