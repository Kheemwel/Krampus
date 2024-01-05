extends Control

@onready var options : Dictionary = GameData.gamedata.options

func _ready():
	%MuteBGM.button_pressed = options.bgm_mute
	%MuteSFX.button_pressed = options.sfx_mute
	pass

#func _on_option_pressed():
#	set_previous_scene(get_tree().get_current_scene())
#	get_tree().change_scene_to_file("res://Scenes/UI/option_menu.tscn")


# Replace with function body.


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")




func _on_tree_exiting():
	GameData.gamedata.options = options
	GameData.save_data()

func _on_mute_bgm_toggled(button_pressed):
	AudioServer.set_bus_mute(1, button_pressed)
	options.bgm_mute = button_pressed


func _on_mute_sfx_toggled(button_pressed):
	AudioServer.set_bus_mute(2, button_pressed)
	options.sfx_mute = button_pressed
