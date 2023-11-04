extends CanvasLayer

const char_read_rate = 0.05
@onready var textbox_container = $TextBoxContainer
@onready var start_symbol = $TextBoxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextBoxContainer/MarginContainer/HBoxContainer/End
@onready var label = $TextBoxContainer/MarginContainer/HBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	_hide_textbox()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()
	$"reset button".hide()
	$"../CanvasLayer".show()
func _show_textbox():
	start_symbol.text = "*"
	end_symbol.text = "v"
	textbox_container.show()
	$"../CanvasLayer".hide()
	$"reset button".show()

func _add_text(next_text):
	label.text = next_text
	_show_textbox()

