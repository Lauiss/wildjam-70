extends Control

var pause_menu
@onready var pause_screen = $pauseScreen
@onready var settings_screen = $settingsScreen
@onready var default = $settingsScreen/default
@onready var volume = $settingsScreen/volume
@onready var language = $settingsScreen/Language
@onready var click = $"ButtonClick"
@onready var texts = $settingsScreen/Language/Texts
@onready var voices = $settingsScreen/Language/Voices

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED;
	hide()
	settings_screen.hide()

func resume_game():
	click.play()
	hide()
	get_tree().paused = false
	pause_screen.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if settings_screen.visible:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE;
			volume.hide()
			language.hide()
			pause_screen.show()
			settings_screen.hide()
		else:
			if get_tree().paused:
				resume_game()
			else:
				pause_game()

func pause_game():
	click.play()
	show()
	get_tree().paused = true
	pause_screen.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_resume_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	get_tree().current_scene.resume_game()

func _on_settings_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	settings_screen.show()
	default.show()
	pause_screen.hide()
	click.play()

func _on_main_menu_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	get_tree().change_scene_to_file("res://scenes/title_menu.tscn")

func _on_back_pressed():
	click.play()
	if default.visible:
		pause_screen.show()
		settings_screen.hide()
	else:
		default.show()
		volume.hide()
		language.hide()
	
func _on_volume_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
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

