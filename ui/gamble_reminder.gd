extends Control


func _on_timer_timeout() -> void:
	$Message.visible = true
	await get_tree().create_timer(0.1).timeout
	$Message.visible = false
