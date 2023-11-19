extends Node2D

var min_energy = 0.0
var max_energy = 1.0
var blink_speed = 2.0
var time_passed = 0.0

func _process(delta):
	time_passed += delta

	for child in get_node("StaticBody2D/Sprite2D").get_children():
		if child is PointLight2D:
			var energy = (sin(time_passed * blink_speed) + 1.0) / 2.0
			energy = min_energy + energy * (max_energy - min_energy)
			energy = max(energy, 0.0)
			
			child.set_energy(energy)
