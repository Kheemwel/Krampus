extends Control



	

func _on_check_button_toggled(button_pressed):
	if button_pressed:
		BgMusic.stop()
	else:
		BgMusic.play()

func _on_bgm_slider_value_changed(value):
	BgMusic.volume_db = value
#
#func _on_option_pressed():
#	set_previous_scene(get_tree().get_current_scene())
#	get_tree().change_scene_to_file("res://Scenes/UI/option_menu.tscn")


# Replace with function body.


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")
