extends Area2D

@onready var ring = $ring
@onready var knob = $ring/knob

@onready var max_distance = $CollisionShape2D.shape.radius

var touched = false

func _input(event):
	if event is InputEventScreenTouch:
		var distance = event.position.distance_to(ring.global_position)
		if not touched:
			if distance<max_distance:
				touched = true
		else:
			knob.position = Vector2(0,0)
			touched = false

func _process(delta):
	if touched:
		knob.global_position = get_global_mouse_position()
		#clamp the knob
		knob.position = ring.position + (knob.position - ring.position).limit_length(max_distance)
		

func get_velo():
	var joystick_velo = Vector2(2,0)
	joystick_velo.x = knob.position.x / max_distance
	joystick_velo.y = knob.position.y / max_distance
	return joystick_velo
		
