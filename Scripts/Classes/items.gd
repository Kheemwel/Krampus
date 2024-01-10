extends Node
class_name Items

var item_name : String
var count : int = 1

func _init(amount : int):
	count = amount

func use():
	print(str("You used a ", item_name))
