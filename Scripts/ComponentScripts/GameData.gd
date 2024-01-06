extends Node

const SAVE_FILE = "user://options.save"

var gamedata : Dictionary = {
	"options": {
		"bgm": 0.75,
		"sfx": 0.75,
		"bgm_mute": false,
		"sfx_mute": false
	},
	"player": {
		# for future
	}
}

func _ready():
	load_data()
	set_volume()

func save_data():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_var(gamedata)
	file.close()

func load_data():
	if not FileAccess.file_exists(SAVE_FILE):
		save_data()
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	gamedata = file.get_var()
	file.close()


func set_volume():
	var options = gamedata.options
	AudioServer.set_bus_mute(1, options.bgm_mute)
	AudioServer.set_bus_volume_db(1, linear_to_db(options.bgm))
