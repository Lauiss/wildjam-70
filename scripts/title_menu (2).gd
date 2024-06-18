extends Control

var pause_menu
@onready var pause_screen = $pauseScreen
@onready var settings_screen = $settingsScreen
@onready var default = $settingsScreen/default
@onready var volume = $settingsScreen/volume
@onready var click = $"ButtonClick"
@onready var texts = $settingsScreen/Language/Texts
@onready var voices = $settingsScreen/Language/Voices
@onready var language = $settingsScreen/Language

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
	click.play()
	pause_screen.hide()
	volume.hide()
	language.hide()
	default.show()
	settings_screen.show()

func _on_play_pressed():
	click.play()
	get_tree().change_scene_to_file("res://scenes/character_selection.tscn")
	
func _on_exit_pressed():
	click.play()
	get_tree().quit()

func _on_back_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	click.play()
	pause_screen.show()
	settings_screen.hide()

func _on_volume_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	click.play()
	default.hide()
	volume.show()

func _on_language_pressed():
	click.play()
	default.hide()
	language.show()


func _on_fr_pressed():
	voices.text = "voice : French"
	click.play()
	Global.voice = "french"


func _on_en_pressed():
	voices.text = "voice : English"
	Global.voice = "english"
	click.play()


func _on_none_pressed():
	voices.text = "voice : none 😞"
	Global.voice = "none"
	click.play()


func _on_en_text_pressed():
	texts.text = "text : English"
	Global.language = "english"
	click.play()


func _on_fr_text_pressed():
	texts.text = "text : French"
	Global.language = "french"
	click.play()
