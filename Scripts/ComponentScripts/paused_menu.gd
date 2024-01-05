extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		unpause()

func _on_option_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/option_menu.tscn")


func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")# Replace with function body.


func _on_resume_button_pressed():
	unpause()


func unpause():
	hide()
	get_tree().paused = false


func _on_tree_exiting():
	get_tree().paused = false
