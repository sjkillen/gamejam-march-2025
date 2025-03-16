extends Node3D


func _ready() -> void:
	$SlotMachines.get_children().pick_random().pick()
