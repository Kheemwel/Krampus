extends CharacterBody2D

#@onready var joystick = $CanvasLayer/joystick
@onready var joystick_v_2 = $CanvasLayer/joystick_v2

@export var MAX_SPEED: int = 100
@export var ACCELERATION: int = 1500
@export var FRICTION: int = 1200
var originalMaxSpeed: int = MAX_SPEED  # Store the original MAX_SPEED

@onready var axis = Vector2.ZERO

func _ready():
	originalMaxSpeed = MAX_SPEED  # Store the original MAX_SPEED at the beginning

func _physics_process(delta):
	move(delta)

func get_input_axis():
	axis = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return axis.normalized()

func move(delta):
	var axis = joystick_v_2.get_velo()
	if axis:
		axis = axis.normalized()
		velocity = axis * MAX_SPEED
	else:
		velocity = Vector2(0,0)
#	axis = get_input_axis()
#
#	if Input.is_action_pressed("ui_accept"):
#		MAX_SPEED = originalMaxSpeed * 2  # Double the MAX_SPEED when Shift is pressed
#	else:
#		MAX_SPEED = originalMaxSpeed  # Reset MAX_SPEED to its original value
#
#	if axis == Vector2.ZERO:
#		apply_friction(FRICTION * delta)
#	else:
#		apply_movement(axis * ACCELERATION * delta)

	move_and_slide()

func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO

func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(MAX_SPEED)

func character():
	pass
