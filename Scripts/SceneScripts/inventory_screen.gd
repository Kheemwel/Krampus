extends Control

var selected_item : int
var items : Array = [
	ItemKey.new(1),
	ItemBall.new(99),
	ItemCandle.new(3),
]
@onready var item_container : PackedScene = load("res://Scenes/UI/inventory_item_container.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_load_items()

func set_use_item(index : int):
	selected_item = index
	%UseItemName.text = items[index].item_name
	%UseItemWindow.show()


func _on_use_button_pressed():
	items[selected_item].use()
	items[selected_item].count -= 1
	if items[selected_item].count <= 0:
		items.pop_at(selected_item)
	_load_items()
	%UseItemWindow.hide()
	hide()


func _on_close_button_pressed():
	hide()


func _load_items():
	for node in %InventoryContainer.get_children():
		%InventoryContainer.remove_child(node)
	for i in items:
		var item = item_container.instantiate()
		item.set_item_name(i.item_name)
		item.set_item_count(i.count)
		%InventoryContainer.add_child(item)
