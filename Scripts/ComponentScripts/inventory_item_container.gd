extends Button

@onready var inventory = get_parent().get_parent().get_parent().get_parent().get_parent()

func set_item_name(name : String):
	%ItemName.text = name

func set_item_count(count : int):
	%ItemCount.text = str(count)


func _on_pressed():
	var index = get_parent().get_node(self.get_path()).get_index()
	inventory.set_use_item(index)
