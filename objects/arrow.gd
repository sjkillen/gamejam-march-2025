extends Node3D

func _ready() -> void:
	Globals.unpick_machine.connect(unpick)

func pick():
	visible = true

func unpick():
	visible = false
	Globals.new_slots.emit(true)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if visible and body is PlayerCollision:
		Globals.unpick_machine.emit()
		$FindMachine.play()
