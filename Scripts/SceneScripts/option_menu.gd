extends Control

@onready var options : Dictionary = GameData.gamedata.options

func _ready():
	%BGMButton.button_pressed = options.bgm_mute
	%SFXButton.button_pressed = options.sfx_mute
	pass


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")


func _on_tree_exiting():
	GameData.gamedata.options = options
	GameData.save_data()


func _on_bgm_button_toggled(toggled_on):
	AudioServer.set_bus_mute(1, toggled_on)
	options.bgm_mute = toggled_on


func _on_sfx_button_toggled(toggled_on):
	AudioServer.set_bus_mute(2, toggled_on)
	options.sfx_mute = toggled_on
