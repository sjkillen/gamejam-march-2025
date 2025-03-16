extends CanvasLayer


func _ready() -> void:
	visible = false
	Globals.new_slots.connect(new_slots)
	Globals.close_slots.connect(close_slots)

var slots = null

func new_slots(lucky: bool):
	visible = true
	if slots != null:
		return
	slots = preload("res://ui/Shop/ShopUI.tscn").instantiate()
	%ShopHolder.add_child(slots)

func close_slots():
	visible = false
	if slots == null:
		return
	%ShopHolder.remove_child(slots)
	slots.queue_free()
	slots = null
