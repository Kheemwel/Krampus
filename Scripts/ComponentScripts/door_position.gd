extends Node

# Called when the node enters the scene tree for the first time.
func _ready():$Tilemap
	if global.from_level != null:
		get_node("Character").set_position(get_node(global.from_level + "_pos").position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
