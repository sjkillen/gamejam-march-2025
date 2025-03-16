extends Node3D

const num_machines = 10

func _ready() -> void:
	$SlotMachines.get_children().pick_random().pick()
	Globals.pick_new_machine.connect(pick_new_machine)
	
func pick_new_machine():
	for i in range(num_machines):
		$SlotMachines.get_children().pick_random().pick()
