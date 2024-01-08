extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		unpause()

func _on_option_button_pressed():
	%OptionMenu.show()


func _on_quit_button_pressed():
	%QuitDialog.show()


func _on_resume_button_pressed():
	unpause()


func unpause():
	hide()
	get_tree().paused = false


func _on_tree_exiting():
	get_tree().paused = false


