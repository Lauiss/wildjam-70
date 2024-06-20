extends Control

var pause_menu
@onready var pause_screen = $pauseScreen
@onready var settings_screen = $settingsScreen
@onready var default = $settingsScreen/default
@onready var volume = $settingsScreen/volume
@onready var language = $settingsScreen/Language
@onready var click = $ButtonClick

@onready var texts = $settingsScreen/Language/Texts
@onready var voices = $settingsScreen/Language/Voices



func _ready():
	pause_screen.show()
	settings_screen.hide()

func _physics_process(_zddelta):
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
	if default.visible:
		pause_screen.show()
		settings_screen.hide()
	else:
		default.show()
		volume.hide()
		language.hide()


func _on_volume_pressed():
	click.play()
	default.hide()
	volume.show()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/character_selection.tscn")

func _on_exit_pressed():
	get_tree().quit()


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


@onready var sfx_preview = $settingsScreen/SFXPreview
@onready var master_preview = $settingsScreen/MasterPreview
@onready var music_preview = $settingsScreen/MusicPreview
@onready var voice_preview = $settingsScreen/VoicePreview

func _on_voice_value_changed(value):
	if value <= -15:
		value -= 100
	AudioServer.set_bus_volume_db(3, value)
	voice_preview.play()

func _on_music_value_changed(value):
	if value <= -15:
		value -= 100
	AudioServer.set_bus_volume_db(2, value)
	music_preview.play()


func _on_sfx_value_changed(value):
	if value <= -15:
		value -= 100
	AudioServer.set_bus_volume_db(1, value)
	sfx_preview.play()


func _on_master_value_changed(value):
	if value <= -15:
		value -= 100
	AudioServer.set_bus_volume_db(0, value)
	master_preview.play()
