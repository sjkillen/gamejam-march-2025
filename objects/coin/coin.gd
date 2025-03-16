extends Node3D
class_name Coin

@onready var age = Time.get_ticks_usec()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is PlayerCollision:
		Globals.player_get_coin.emit(self)		



func _on_despawn_area_area_entered(area: Area3D) -> void:
	var p := area.get_parent()
	print(p)
	if p is Coin and p.age > age:
		p.queue_free()
		
