extends Node3D
class_name Coin


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is PlayerCollision:
		Globals.player_get_coin.emit(self)		
