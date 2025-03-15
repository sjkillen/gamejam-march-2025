@tool
extends EditorScenePostImport


func _post_import(scene: Node) -> Object:
	var slot_machines = scene.get_node("SlotMachines")
	var i := 0
	for child in slot_machines.get_children():
		var slot := preload("res://Models/pair_of_slots.tscn").instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
		slot.position = child.position
		child.queue_free()
		slot_machines.remove_child(child)
		slot_machines.add_child(slot)
		slot.owner = scene
		slot.name = "Slot" + str(i)
		i += 1
		
	return scene
