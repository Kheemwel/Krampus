extends Control

@export var optionMenu : PackedScene



func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MapScenes/Stage 1/stage_1_living_dining_room.tscn")


func _on_options_button_pressed():
	%OptionMenu.show()


func _on_exit_button_pressed():
	get_tree().quit()
