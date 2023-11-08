extends Control




func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/option_menu.tscn")

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")# Replace with function body.
