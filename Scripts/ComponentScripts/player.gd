extends CharacterBody2D

@onready var joystick = %joystick

var direction = Vector2.ZERO
var speed = 70

func _physics_process(delta):
	move()

func move():
	var direction = joystick.posVector
	if direction:
		direction = direction.normalized()
		velocity = direction * speed
	else:
		velocity = Vector2(0,0)
		
	move_and_slide()
