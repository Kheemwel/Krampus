extends Node2D

var min_energy : float = 0.5
var max_energy : float = 1.0
var flicker_speed : float = 0.5
var flicker_interval : float = 1.0
var time_passed : float = 0.0

func _process(delta: float) -> void:
	time_passed += delta

	for child in get_node("StaticBody2D/Sprite2D").get_children():
		if child is PointLight2D:
			var random_factor : float = randf_range(0.8, 1.2)
			var energy : float = (sin(time_passed * flicker_speed * random_factor) + 1.0) / 2.0
			energy = clamp(min_energy + energy * (max_energy - min_energy), 0.0, 1.0)

			child.set_energy(energy)

	if time_passed > flicker_interval:
		_randomize_flicker()
		time_passed = 0.0

func _randomize_flicker() -> void:
	for child in get_node("StaticBody2D/Sprite2D").get_children():
		if child is PointLight2D:

			var random_intensity : float = randf_range(0.5, 1.0)
			child.set_energy(random_intensity)
