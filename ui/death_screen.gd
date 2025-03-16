extends Control

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level.tscn")
#
#func _input(event: InputEvent) -> void:
	#if event.is_action("ui_accept"):
		#_on_button_pressed()
