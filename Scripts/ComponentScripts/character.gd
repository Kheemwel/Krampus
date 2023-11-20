extends CharacterBody2D

@onready var joystick = %Joystick
#@onready var joystick_v_2 = $CanvasLayer/joystick_v2

@export var MAX_SPEED: int = 100
@export var ACCELERATION: int = 1500
@export var FRICTION: int = 1200
var originalMaxSpeed: int = MAX_SPEED  # Store the original MAX_SPEED

@onready var axis = Vector2.ZERO
@onready var animation_tree: AnimationTree = $AnimationTree	
@onready var anim_state = animation_tree.get("parameters/playback")


func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		$CanvasLayer/PausedMenu.show()

func _ready():
	originalMaxSpeed = MAX_SPEED  # Store the original MAX_SPEED at the beginning


#func _process(delta):
	
func _physics_process(delta):
#	print(axis)
	move()	
	update_animation_parameters()
	

func get_input_axis():
	axis = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return axis.normalized()
	

func move():
	# movement axis base on input key
	var x_axis = Input.get_axis("move_left", "move_right")
	var y_axis = Input.get_axis("move_up", "move_down")
	var input_axis = Vector2(x_axis, y_axis).normalized()
	
	# choose joystick axis if input is null
	axis = joystick.posVector.normalized() if input_axis == Vector2.ZERO else input_axis
	if axis != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", axis)
		animation_tree.set("parameters/Walk/blend_position", axis)
		velocity = axis * MAX_SPEED
	else:
		
		velocity = Vector2.ZERO
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

func update_animation_parameters():
	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/Idle"] = true
		animation_tree["parameters/conditions/Walk"] = false
	else:
		animation_tree["parameters/conditions/Idle"] = false
		animation_tree["parameters/conditions/Walk"] = true

	if(axis != Vector2.ZERO):
		animation_tree["parameters/Idle/blend_position"] = axis
		animation_tree["parameters/Walk/blend_position"] = axis
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


func _on_interact_button_pressed():
	execute_interaction()

func _on_menu_button_pressed():
	get_tree().paused = true
	$CanvasLayer/PausedMenu.show()


func _on_paused_menu_visibility_changed():
	if $CanvasLayer/PausedMenu.visible:
		set_process_input(false)
	else:
		set_process_input(true)
