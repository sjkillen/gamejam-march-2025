extends Node3D


func pick():
	get_children().pick_random().pick()
