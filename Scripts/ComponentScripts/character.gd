extends CharacterBody2D

@onready var joystick = $"../CanvasLayer/joystick"

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
	var axis = joystick.posVector
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


#interaction to object

@onready var all_interaction = []
@onready var interactionLabel = $"Interaction/Interact label"

func _on_interaction_area_area_entered(area):
	all_interaction.insert(0, area)
	update_interactions()

func _on_interaction_area_area_exited(area):
	all_interaction.erase(area)
	update_interactions()
func update_interactions():
	if all_interaction:
		interactionLabel.text = all_interaction[0].Interact_label
	else:
		interactionLabel.text = ""

func execute_interaction():
	if all_interaction:
		
		var cur_interaction = all_interaction[0]
		match cur_interaction.Interact_type:
			"print_text" : $"../Interaction Chat"._add_text("there's nothing in the "+cur_interaction.Interact_value)
			"chair" : $"../Interaction Chat"._add_text("I don't have time to relax")
			"Item" : $"../Interaction Chat"._add_text("you take the "+cur_interaction.Interact_value)
			"book" : $"../Interaction Chat"._add_text("I don't have time to read")
			"bookshelf" : $"../Interaction Chat"._add_text("I don't have time to read")
			"picture" : $"../Interaction Chat"._add_text("what a beautiful paint")


func _on_button_pressed():
	execute_interaction()
	


func _on_reset_button_pressed():
	$"../Interaction Chat"._hide_textbox()
