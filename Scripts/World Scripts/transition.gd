extends CanvasLayer

func change_scene_to_file(target: String) -> void:
	$AnimationPlayer.play('dissolve')
	get_tree().change_scene_to_file(target)
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play_backwards('dissolve')
