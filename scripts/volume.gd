extends HSlider

@onready var sfx_preview = $"../../../SFXPreview"
@onready var music_preview = $"../../../MusicPreview"
@onready var voice_preview = $"../../../VoicePreview"
@onready var master_preview = $"../../../MasterPreview"

@export var bus_name: String

var bus_index: int

func _ready():
	# Replace "NodeName" with the actual node name
	# that this script is attached to
	self.value_changed.connect(_on_NodeName_value_changed)
	var bus_index: int

func _on_NodeName_value_changed(value: float) -> void:
	if value <= -15:
		value -= 100
	bus_index = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, clamp(value, -100, 14))
	sfx_preview.play()
	print(bus_index, value)
	print(bus_name, value)
