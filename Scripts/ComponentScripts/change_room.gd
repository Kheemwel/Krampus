extends Area2D

var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(body: PhysicsBody2D):
	entered = true

# Called when a physics body exits the area.
func _on_body_exited(body: PhysicsBody2D):
	entered = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if entered == true:
#		global.from_level = get_parent().name
#		Transition.change_scene_to_file("res://Scenes/MapScenes/Stage 1/" + self.name + ".tscn")

func _process(delta):
	if entered == true:
		global.from_level = get_parent().name
		var stage_folder = ""
		
		if global.from_level.begins_with("stage_1"):
			stage_folder = "Stage 1/"
		
		elif global.from_level.begins_with("stage_2"):
			stage_folder = "Stage 2/"
		
		Transition.change_scene_to_file("res://Scenes/MapScenes/" + stage_folder + self.name + ".tscn")
