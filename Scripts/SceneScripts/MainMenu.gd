extends Control


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/MapScenes/Stage 1/stage_1_living_dining_room.tscn")


func _on_option_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/option_menu.tscn")
