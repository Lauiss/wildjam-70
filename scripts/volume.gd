extends HSlider
@export var sfx_preview: AudioStreamPlayer
@export var bus_name: String

var bus_index: int

func _ready() -> void:
	value_changed.connect(_on_value_changed)

func _on_value_changed(value: float) -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, clamp(value, -5, 15))
	sfx_preview.play()
