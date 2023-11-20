extends HSlider

const bus_name : String = "BGM"
var bus_index : int

@onready var options : Dictionary = GameData.gamedata.options

# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = 1
	step = 0.001
	value = options.bgm
	bus_index = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_value_changed(value):
	options.bgm = value
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


func _on_tree_exiting():
	GameData.gamedata.options = options
	GameData.save_data()
