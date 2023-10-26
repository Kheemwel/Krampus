extends Control

@export var _move_to: PackedScene

var _splash_screens: Array[SplashScreen] = []

@onready var _splash_screen_container: CenterContainer = $SplashScreenContainer

func _ready() -> void:
	assert(_move_to)
	
	for splash_screen in _splash_screen_container.get_children():
		splash_screen.hide()
		_splash_screens.push_back(splash_screen)
		
	_start_splash_screen()
	
func _start_splash_screen() -> void:
	if _splash_screens.size() == 0:
		get_tree().change_scene_to_packed(_move_to)
	else:
		var splash_screen: SplashScreen = _splash_screens.pop_front()
		splash_screen.start()
		splash_screen.connect("finished", _start_splash_screen)
